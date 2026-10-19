-- localfixes: всплывающие надписи модов по-русски (17.10, «Ты ТОЧНО все моды перевел?»). Моды показывают их строками
-- из своего кода: HUD:ShowItemText(«Гнев!», «») — трансформации IPECAC, фразы FF, Epiphany, Heaven's Call и др.
-- Обёртки ShowItemText / ShowFortuneText ставятся в Lua-слой класса HUD (реестр __LOCALFIXES_INDEX_LAYERS, как у
-- Font в ru_draw.lua; в саму метатаблицу не писать). Словарь — ru/ui_popups.lua (свой: его шаблоны вроде «X vs Y»
-- не должны трогать остальной вывод), затем общий словарь вывода (LOCALFIXES.TranslateUI). Название предмета из
-- английского XML (Heaven's Call «Ладан» и т. п.) — по конфигу предмета, где уже русское.
-- ShowFortuneText (бумажка автомата предсказаний): сначала — предсказание FF целиком (ru_fortunes.lua: пользователь
-- 17.10 «Переведи все предсказания», «Адаптируй как нибудь»); иначе переводится, только если переводятся ВСЕ её
-- строки (чтобы не смешивать русское с английским в одном предсказании). Только при языке игры "ru".
local ok, data = pcall(include, "ru.ui_popups")
local EXACT = ok and type(data) == "table" and data.exact or {}
local PATTERNS = ok and type(data) == "table" and data.patterns or {}

local function cyr(s) return s:find("[\208\209]") ~= nil end

-- перевод строки или nil, если перевода нет
local function hit(s)
	local r = EXACT[s]
	if r then return r end
	for _, p in ipairs(PATTERNS) do
		local a, b, c = s:match(p[1])
		if a then
			if type(p[2]) == "function" then
				r = p[2](a, b, c)
			else
				r = p[2]:gsub("%%(%d)", function(i) return ({ a, b, c })[tonumber(i)] or "" end)
			end
			if r then return r end
		end
	end
	local t = LOCALFIXES and LOCALFIXES.TranslateUI
	r = t and t(s)
	if r and r ~= s then return r end
	return nil
end

-- английское название предмета/брелока → его конфиг (LOCALFIXES.EnglishNames — из ru_items.lua)
local byEn
local function itemConf(s)
	if not byEn then
		byEn = {}
		local eng = LOCALFIXES and LOCALFIXES.EnglishNames
		local cfg = Isaac.GetItemConfig()
		if eng and cfg then
			for id, name in pairs(eng.item or {}) do byEn[name] = byEn[name] or cfg:GetCollectible(id) end
			for id, name in pairs(eng.trinket or {}) do byEn[name] = byEn[name] or cfg:GetTrinket(id) end
		end
	end
	return byEn[s]
end

local installed = false
local function install()
	if installed then return true end
	local okHud, hud = pcall(function() return Game():GetHUD() end)
	if not okHud or not hud then return false end
	local mt = getmetatable(hud)
	local layer
	for _, L in pairs(rawget(_G, "__LOCALFIXES_INDEX_LAYERS") or {}) do
		if L[3] == mt and type(L[1]) == "table" then layer = L[1] end
	end
	local rawItem, rawFortune = rawget(mt, "ShowItemText"), rawget(mt, "ShowFortuneText")
	if not layer or type(rawItem) ~= "function" then return false end
	installed = true
	layer.ShowItemText = function(self, a, b, ...)
		if Options.Language == "ru" and type(a) == "string" then
			local conf = not cyr(a) and itemConf(a)
			if conf and conf.Name and cyr(conf.Name) then
				a = conf.Name
				if type(b) == "string" and b ~= "" and not cyr(b) and conf.Description then b = conf.Description end
			else
				a = hit(a) or a
				if type(b) == "string" and b ~= "" then b = hit(b) or b end
			end
		end
		return rawItem(self, a, b, ...)
	end
	if type(rawFortune) == "function" then
		layer.ShowFortuneText = function(self, ...)
			if Options.Language == "ru" then
				local args = table.pack(...)
				-- предсказания FF (ru_fortunes.lua): целиком, по хэшу английского текста
				local fort = LOCALFIXES and LOCALFIXES.RuFortuneLookup
				if fort then
					local lines = {}
					for i = 1, args.n do
						if type(args[i]) ~= "string" then break end
						lines[#lines + 1] = args[i]
					end
					local ru = #lines > 0 and fort(lines)
					if ru then return rawFortune(self, table.unpack(ru)) end
				end
				local out, all = {}, true
				for i = 1, args.n do
					local s = args[i]
					if type(s) == "string" and s ~= "" and not cyr(s) then
						local r = hit(s)
						if not r then all = false break end
						out[i] = r
					else
						out[i] = s
					end
				end
				if all then return rawFortune(self, table.unpack(out, 1, args.n)) end
			end
			return rawFortune(self, ...)
		end
	end
	local n = 0
	for _ in pairs(EXACT) do n = n + 1 end
	Isaac.DebugString("[localfixes] русские всплывающие надписи: строк " .. n .. ", шаблонов " .. #PATTERNS)
	return true
end

return { install = install, translate = hit }
