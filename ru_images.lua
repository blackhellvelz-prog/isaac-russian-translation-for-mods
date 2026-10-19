-- localfixes/ru_images.lua — русские картинки там, где игра и моды показывают английские (19.10, решение пользователя:
-- «Один мод, по языку игры»; «У игроков что поставят русский должен быть русский»; про картинки модов — «Две в версии
-- и русская и Английская»): в русской игре — русские, в английской — оригиналы. Игра не грузит свой русский архив
-- картинок (repentance_ru.a), а папок ресурсов по языку у модов нет (REPENTOGON: resources, resources-dlc3,
-- resources-repentogon) — поэтому русские картинки лежат в моде по отдельному пути gfx/localfixes_ru/… (ничего не
-- перекрывают; указатель ru_images_index.lua пишет apply_fixes) и в русской игре подставляются в спрайты, которые
-- видит Lua:
--   - экран «против босса» (RoomTransition.GetVersusScreenSprite: имена боссов и персонажей);
--   - «большая книга» (ItemOverlay.GetSprite: картинки книг и карт во весь экран);
--   - наш экран «Секреты» (картинки достижений — LOCALFIXES.RuImage);
--   - справка Passive Skill Trees (её SwitchPage ставит страницу — следом наша русская);
--   - рисунок управления на полу стартовой комнаты (у персонажей игры и модов — см. localizeControls).
-- Всплывающие при открытии достижения Lua не видит — там картинки игры (на этом ПК их кладёт поверх apply_fixes).
local mod = LOCALFIXES.Mod
local okI, IDX = pcall(include, "ru_images_index")
if not okI or type(IDX) ~= "table" then IDX = {} end
local GAME, MODS = IDX.game or {}, IDX.mods or {}

local function isRu()
	local H = LOCALFIXES.HandFont
	if H and H.IsRu then return H.IsRu() end
	local ok, l = pcall(function() return Options.Language end)
	return ok and l == "ru"
end

local function key(p)
	return (tostring(p):gsub("\\", "/"):gsub("^resources/", ""):lower())
end

-- путь картинки игры → русская копия в моде (или nil)
function LOCALFIXES.RuImage(path)
	if not path or not isRu() then return nil end
	return GAME[key(path)]
end
-- картинка мода (номер мода Workshop, путь в моде без resources/ и content/) → русская копия (или nil)
local function ruModImage(modId, path)
	local t = MODS[tostring(modId)]
	if not t or not path or not isRu() then return nil end
	local k = key(path):gsub("^content%-repentogon/", ""):gsub("^content/", "")
	if t[k] then return t[k] end
	for kk, v in pairs(t) do                          -- путь у мода бывает длиннее (полный путь к папке мода)
		if k:sub(-#kk) == kk then return v end
	end
end
LOCALFIXES.RuModImage = ruModImage

-- подставить русские листы в спрайт: lookup(путь листа) → русская копия или nil; лист уже русский — пропуск
local function replaceLayers(spr, lookup)
	local changed = false
	for l = 0, spr:GetLayerCount() - 1 do
		local L = spr:GetLayer(l)
		local p = L and L:GetSpritesheetPath()
		if p and p ~= "" and not p:find("localfixes_ru", 1, true) then
			local ru = lookup(p)
			if ru then
				spr:ReplaceSpritesheet(l, ru)
				changed = true
			end
		end
	end
	if changed then spr:LoadGraphics() end
	return changed
end
local function gameLookup(p) return GAME[key(p)] end
local function localize(spr)
	if spr then return replaceLayers(spr, gameLookup) end
end

if next(GAME) then
	mod:AddCallback(ModCallbacks.MC_POST_RENDER, function()
		if not isRu() then return end
		if RoomTransition and RoomTransition.IsRenderingBossIntro and RoomTransition.IsRenderingBossIntro() then
			pcall(localize, RoomTransition.GetVersusScreenSprite())
		end
		if ItemOverlay and ItemOverlay.GetSprite then
			pcall(localize, ItemOverlay.GetSprite())
		end
	end)
end

-- справка PST: после её SwitchPage — наша русская страница (PST грузится после нашего мода — подмена после загрузки всех)
local PST_ID = "3305869734"
local function hookPstHelp()
	if not MODS[PST_ID] then return false end
	local P = rawget(_G, "PST")
	local ms = P and P.treeScreen and P.treeScreen.modules and P.treeScreen.modules.menuScreensModule
	local hs = ms and ms.menus and PSTTreeScreenMenu and ms.menus[PSTTreeScreenMenu.HELP]
	if type(hs) ~= "table" or type(hs.SwitchPage) ~= "function" or hs.lfRuHooked then return false end
	-- лист страницы: русский — в русской игре; иначе — оригинал PST (если раньше ставили русский)
	local function applyPage(self)
		if not self.helpScreenSprite then return end
		local page = self.currentPage == 0 and "help_main" or (self.pages and self.pages[self.currentPage] and ("help" .. self.pages[self.currentPage]))
		if not page then return end
		local rel = "gfx/ui/skilltrees/helpmenu/screens/" .. page .. ".png"
		local ru = ruModImage(PST_ID, rel)
		if ru then
			self.helpScreenSprite:ReplaceSpritesheet(0, ru, true)
			self.lfRuShown = true
		elseif self.lfRuShown then
			self.helpScreenSprite:ReplaceSpritesheet(0, rel, true)
			self.lfRuShown = false
		end
	end
	local origSwitch, origOpen = hs.SwitchPage, hs.OnOpen
	hs.SwitchPage = function(self, ...)
		local r = origSwitch(self, ...)
		applyPage(self)
		return r
	end
	-- первая страница при открытии — лист из anm2 (help_main), без SwitchPage: её тоже
	hs.OnOpen = function(self, ...)
		local r = origOpen and origOpen(self, ...)
		applyPage(self)
		return r
	end
	hs.lfRuHooked = true
	return true
end

-- рисунок управления на полу стартовой комнаты (первый этаж): игра «запекает» его в пол при входе в комнату (Room::Init,
-- до MC_POST_NEW_ROOM), а спрайт фона с рисунком перечитывает при каждом новом этаже — подмена листа в колбэке уже
-- опаздывает. Поэтому (проверено 19.10 в игре): подменить листы — у фона игры (Backdrop:GetControlsANM2) и у персонажа
-- мода (EntityConfigPlayer:GetModdedControlsSprite, мод — по sourceid) — и пересобрать фон тем же типом
-- (Room:SetBackdropType): пол перерисовывается уже с русским рисунком, без перезахода в комнату. Только в стартовой
-- комнате первого этажа и только если лист был не русский (повторный вход — без пересборки).
local function localizeControls()
	if not isRu() then return end
	local game = Game()
	local level, room = game:GetLevel(), game:GetRoom()
	if level:GetStage() ~= LevelStage.STAGE1_1 or level:GetCurrentRoomIndex() ~= level:GetStartingRoomIndex() then return end
	local changed = false
	local bd = room.GetBackdrop and room:GetBackdrop()
	if bd and bd.GetControlsANM2 and next(GAME) then
		changed = replaceLayers(bd:GetControlsANM2(), gameLookup) or changed
	end
	if next(MODS) then
		for i = 0, game:GetNumPlayers() - 1 do
			local p = Isaac.GetPlayer(i)
			local cfg = p and EntityConfig.GetPlayer(p:GetPlayerType())
			local spr = cfg and cfg.GetModdedControlsSprite and cfg:GetModdedControlsSprite()
			if spr then
				local okX, x = pcall(XMLData.GetEntryById, XMLNode.PLAYER, p:GetPlayerType())
				local src = okX and type(x) == "table" and x.sourceid
				if src then
					changed = replaceLayers(spr, function(path) return ruModImage(src, path) end) or changed
				end
			end
		end
	end
	if changed then room:SetBackdropType(room:GetBackdropType(), 1) end
	return changed
end

local function afterMods()
	local ok, hooked = pcall(hookPstHelp)
	Isaac.DebugString(("[localfixes] русские картинки по языку: игра %d, справка PST: %s"):format(
		(function() local n = 0 for _ in pairs(GAME) do n = n + 1 end return n end)(), tostring(ok and hooked)))
end
if ModCallbacks.MC_POST_MODS_LOADED then
	mod:AddCallback(ModCallbacks.MC_POST_MODS_LOADED, afterMods)
end
mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, function() pcall(hookPstHelp) end)
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function() pcall(localizeControls) end)

LOCALFIXES.RuImages = { localize = localize, controls = localizeControls, hookPst = hookPstHelp }   -- и для проверок
return LOCALFIXES.RuImages
