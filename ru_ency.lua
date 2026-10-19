-- localfixes: энциклопедия (мод Encyclopedia) по-русски (17.10, перевод). Статьи — WikiDesc модов и вики игры —
-- при регистрации проходят через Encyclopedia.fitTextToWidth; apply_fixes (ency_patch) вставляет туда вызов
-- LOCALFIXES.TranslateEncy: строка статьи целиком (как в файле мода) → русская, разбивка по ширине — уже по ней.
-- Словарь — ru/ui_ency*.lua (собирает tools/ency_strings.py из ru/ency_src/*.tsv). Только при языке игры «ru».
local FILES = { "ru.ui_ency" }
local EXACT = {}
-- Шрифт DSS знает только a-z, цифры, ' " : / . , ! ? [ ] ( ) $ + - % _ = ^ < > и кириллицу — остальное выходит «!».
-- Стрелки ↑ ↓ (русские названия пилюль игры: «Здоровье ↑») — словами; тире, кавычки-ёлочки, многоточие, №, «;»
-- и «*» — близкими знаками шрифта.
local GLYPHS = {
	{ "\226\134\145", "вверх" }, { "\226\134\147", "вниз" },          -- ↑ ↓
	{ "\226\128\148", "-" }, { "\226\128\147", "-" },                -- — –
	{ "\194\171", '"' }, { "\194\187", '"' },                        -- « »
	{ "\226\128\166", "..." }, { "\226\132\150", "No." },            -- … №
	{ "\194\160", " " }, { ";", "," }, { "%*", "" },                  -- неразрывный пробел, ; *
}
-- заглавные русские → строчные (ядро DSS без правки рисует только строчные кириллицы; dss_scroll.lua installCyrRT)
local function lowerCyr(s)
	if type(s) ~= "string" then return s end
	return (s:gsub("\208([\129\144-\175])", function(c)
		local b = c:byte()
		if b == 129 then return "\209\145" end
		if b < 160 then return "\208" .. string.char(b + 32) end
		return "\209" .. string.char(b - 32)
	end))
end
local function noArrows(s)
	if type(s) ~= "string" or not s:find("[\194\226;%*]") then return s end
	for _, g in ipairs(GLYPHS) do s = s:gsub(g[1], g[2]) end
	return s
end
for _, f in ipairs(FILES) do
	local ok, data = pcall(include, f)
	if ok and type(data) == "table" then
		for k, v in pairs(data.exact or data) do EXACT[k] = noArrows(v) end
	else
		Isaac.DebugString("[localfixes] энциклопедия: не загрузился " .. f .. ": " .. tostring(data))
	end
end

local function translate(s)
	if type(s) ~= "string" or Options.Language ~= "ru" then return s end
	return EXACT[s] or s
end

-- Названия и подписи вещей в энциклопедии: Encyclopedia запоминает их при регистрации, раньше, чем Mod Translator
-- переводит предметы модов (MC_POST_GAME_STARTED), — английские. После старта забега берём их из конфига игры:
-- у модов там уже русское (Mod Translator), у игры — ключ «#…» → строка таблицы на языке игры (Isaac.GetString).
local function localized(s, category)
	if type(s) ~= "string" or s == "" then return nil end
	if s:sub(1, 1) == "#" and Isaac.GetString then
		local ok, r = pcall(Isaac.GetString, category, s:sub(2))
		if ok and type(r) == "string" and r ~= "" and r ~= s:sub(2) then s = r else return nil end
	end
	return s:find("[\208\209]") and noArrows(s) or nil
end

-- Только если ядро DSS умеет кириллицу (флаг ставит правка ядер этого ПК — apply_fixes dss_cyrillic): ядро без правки
-- (мод из Мастерской) рисует русские буквы восклицательными знаками и на каждую пишет «Invalid character» — там
-- энциклопедия остаётся английской (19.10, проверка чистой установки).
local function localizeNames()
	local patched = rawget(_G, "LOCALFIXES_DSS_CYR")
	local runtime = rawget(_G, "LOCALFIXES_DSS_CYR_RT")  -- кириллица у ядра без правки (dss_scroll.lua, installCyrRT)
	if Options.Language ~= "ru" or type(Encyclopedia) ~= "table" or not (patched or runtime) then return 0 end
	local cfg = Isaac.GetItemConfig()
	local n = 0
	-- предметы и брелоки — Encyclopedia.itemsTable / trinketsTable; карманные вещи — pocketitemsTable[вид]
	-- (cards, runes, souls, pills; 17.10: раньше искались в несуществующих cardsTable/pillsTable — оставались английскими)
	local card = function(id) return cfg:GetCard(id), "PocketItems" end
	local pocket = Encyclopedia.pocketitemsTable or {}
	local kinds = {
		{ Encyclopedia.itemsTable, function(id) return cfg:GetCollectible(id), "Items" end },
		{ Encyclopedia.trinketsTable, function(id) return cfg:GetTrinket(id), "Items" end },
		{ pocket.cards, card }, { pocket.runes, card }, { pocket.souls, card },
		{ pocket.essences, card }, { pocket.capsules, card },   -- Epiphany: эссенции и капсулы — тоже карты
		{ pocket.pills, function(id) return cfg:GetPillEffect(id), "PocketItems" end },
	}
	for _, k in ipairs(kinds) do
		local tab, get = k[1], k[2]
		for _, rec in pairs(tab and tab.allinternal or {}) do
			if type(rec) == "table" and type(rec.ItemId) == "number" then
				local ok, c, cat = pcall(get, rec.ItemId)
				if ok and c then
					local name, desc = localized(c.Name, cat), localized(c.Description, cat)
					if not patched then name, desc = lowerCyr(name), lowerCyr(desc) end   -- ядро без правки: строчные
					if name and rec.Name ~= name then
						rec.Name = name
						n = n + 1
					end
					if desc then rec.Desc = desc end
				end
			end
		end
	end
	-- персонажи (17.10): запись по типу игрока (GetCharacter: 'a' — обычный, 'b' — порченый), имя — из конфига
	-- игрока («#ISAAC_NAME» → строка таблицы «Players» на языке игры; у модов — их имя, если уже русское)
	local maxp = 60
	pcall(function() maxp = EntityConfig.GetMaxPlayerType() end)
	for id = 0, maxp do
		local okc, pc = pcall(EntityConfig.GetPlayer, id)
		local name = okc and pc and localized(pc:GetName(), "Players")
		if not patched then name = lowerCyr(name) end
		if name then
			for _, t in ipairs({ "a", "b" }) do
				local okr, rec = pcall(Encyclopedia.GetCharacter, id, t)
				if okr and type(rec) == "table" and rec.CharacterId == id and rec.Name ~= name then
					rec.Name = name
					n = n + 1
				end
			end
		end
	end
	return n
end

local n = 0
for _ in pairs(EXACT) do n = n + 1 end
Isaac.DebugString("[localfixes] русская энциклопедия: строк " .. n)
return { translate = translate, localizeNames = localizeNames }
