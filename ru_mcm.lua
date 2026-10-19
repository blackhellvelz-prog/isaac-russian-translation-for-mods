-- localfixes: Mod Config Menu по-русски (17.10, перевод). Словарь — ru/ui_mcm.lua: exact (строка целиком: категории,
-- подкатегории, подписи, подсказки) и values (значения после «подпись: », например «On» → «вкл»).
-- Подписи пунктов MCM рисует шрифтом (Font:DrawString) — их переводит ru_draw.lua, последним шагом зовёт
-- LOCALFIXES.TranslateMCM: строка целиком или «подпись: значение» по частям (если не знает ни одной части — nil,
-- строка идёт дальше как есть). Подсказки MCM сам режет на строки (ConvertDisplayToTextTable: метки $newline и
-- ширина) — их переводим до разрезания, обёрткой этой функции (install, после загрузки модов). Только при «ru».
local FILES = { "ru.ui_mcm" }
local EXACT, VALUES = {}, {}
for _, f in ipairs(FILES) do
	local ok, data = pcall(include, f)
	if ok and type(data) == "table" then
		for k, v in pairs(data.exact or {}) do EXACT[k] = v end
		for k, v in pairs(data.values or {}) do VALUES[k] = v end
	else
		Isaac.DebugString("[localfixes] MCM: не загрузился " .. f .. ": " .. tostring(data))
	end
end

-- «текст (N/M)» — выбор из списка со счётчиком (Unique Items API: «Isaac (1/40)», Enhanced Boss Bars: «Default bar
-- visuals (6/39)»): текст — по словарю или имя персонажа (как в PST), счётчик — как есть
local function counted(s, dict)
	local base, sp, cnt = s:match("^(.-)(%s*)(%(%d+/%d+%))$")
	if not base then return nil end
	local rb = dict[base] or EXACT[base]
	if not rb and LOCALFIXES and LOCALFIXES.RuCharName then
		local n = LOCALFIXES.RuCharName(base)
		if n ~= base then rb = n end
	end
	return rb and (rb .. sp .. cnt) or nil
end

local cache = {}
local function translate(s)
	if type(s) ~= "string" or Options.Language ~= "ru" then return nil end
	local r = cache[s]
	if r ~= nil then return r or nil end
	r = EXACT[s] or counted(s, EXACT)
	if not r then
		-- разделитель — как в оригинале (у Crawlspaces Rebuilt «Lighting Effects :: Shader»: подпись «Lighting Effects »,
		-- значение «: Shader» — так же делит tools/mcm_strings.py)
		local label, sep, value = s:match("^(.-)(:%s*)(.*)$")
		if label and label ~= "" then
			local rl = EXACT[label]
			local rv = VALUES[value] or EXACT[value] or counted(value, VALUES)
			if not rv then
				-- ползунок с единицей: «$scroll5 5 Grids» → «$scroll5 5 клеток» (число меняется — единица по словарю)
				local pre, unit = value:match("^(%$scroll%d+ [%d%.]+ )(.+)$")
				if pre and VALUES[unit] then rv = pre .. VALUES[unit] end
			end
			if not rv then
				-- «L (keyboard)» / «RIGHT STICK (controller)»: клавиша — как есть, пояснение — по-русски
				local key, how = value:match("^(.-) %((%a+)%)$")
				if key and VALUES["(" .. how .. ")"] then rv = key .. " " .. VALUES["(" .. how .. ")"] end
			end
			if rl or rv then r = (rl or label) .. sep .. (rv or value) end
		end
	end
	cache[s] = r or false
	return r
end

-- подсказка: строка, таблица строк (одна фраза через пробел) или функция → русский текст целиком
local function translateInfo(v)
	if type(v) == "function" then
		local ok, r = pcall(v)
		if not ok then return v end
		v = r
	end
	if type(v) == "string" then
		return translate(v) or v
	end
	if type(v) == "table" then
		local parts = {}
		for i, x in ipairs(v) do parts[i] = tostring(x) end
		local whole = translate(table.concat(parts, " "))
		if whole then return whole end
		local out = {}
		for i, x in ipairs(parts) do out[i] = translate(x) or x end
		return out
	end
	return v
end

local installed = false
local function install()
	if installed or type(ModConfigMenu) ~= "table" or type(ModConfigMenu.ConvertDisplayToTextTable) ~= "function" then
		return false
	end
	installed = true
	local orig = ModConfigMenu.ConvertDisplayToTextTable
	ModConfigMenu.ConvertDisplayToTextTable = function(value, lineWidth, font, ...)
		if Options.Language == "ru" then value = translateInfo(value) end
		return orig(value, lineWidth, font, ...)
	end
	return true
end

local n, nv = 0, 0
for _ in pairs(EXACT) do n = n + 1 end
for _ in pairs(VALUES) do nv = nv + 1 end
Isaac.DebugString("[localfixes] русский MCM: строк " .. n .. ", значений " .. nv)
return { translate = translate, install = install }
