-- localfixes: меню Dead Sea Scrolls по-русски (17.10, перевод). Ядра DSS модов правит apply_fixes (dss_cyrillic):
-- строки — по символам UTF-8, русские буквы — из шрифта menu_rfont (Mod Translator), и каждая строка меню перед
-- выводом проходит через LOCALFIXES.TranslateDSS. Словарь — ru/ui_dss*.lua: английская строка, как её пишет мод
-- (в DSS — строчными) → русская строчными буквами (в шрифте DSS только строчные; заглавных русских кадров нет).
-- Шаблоны — для строк с числами и подстановками. Только при языке игры "ru".
-- Наборы строк (подсказки и многострочные пункты, strset) — целой фразой (apply_fixes: dss_strsets →
-- LOCALFIXES.TranslateDSSSet): ключ — английские строки набора через "\n", значение — русские строки, уже разбитые
-- по ширине панели (tools/dss_build.py из ru/dss_src/*.tsv → ru/ui_dss_mods.lua).
local FILES = { "ru.ui_dss", "ru.ui_dss_mods" }
local EXACT, PATTERNS, SETS = {}, {}, {}
for _, f in ipairs(FILES) do
	local ok, data = pcall(include, f)
	if ok and type(data) == "table" then
		for k, v in pairs(data.exact or {}) do EXACT[k] = v end
		for _, p in ipairs(data.patterns or {}) do PATTERNS[#PATTERNS + 1] = p end
		for k, v in pairs(data.sets or {}) do SETS[k] = v end
	else
		Isaac.DebugString("[localfixes] DSS: не загрузился " .. f .. ": " .. tostring(data))
	end
end

-- в шрифте DSS русские буквы только строчные (заглавная выходит «!»: «!ффект», «!илой !убик» — 17.10, снимок
-- энциклопедии): заглавные А-Я, Ё → строчные. UTF-8: А-П = D0 90-9F → D0 B0-BF, Р-Я = D0 A0-AF → D1 80-8F, Ё = D0 81 → D1 91
local function lowerCyr(s)
	return (s:gsub("\208([\129\144-\175])", function(c)
		local b = c:byte()
		if b == 129 then return "\209\145" end
		if b < 160 then return "\208" .. string.char(b + 32) end
		return "\209" .. string.char(b - 32)
	end))
end

-- знаки, которых нет в шрифте DSS (ядро на каждый такой знак каждый кадр пишет «Invalid character» в консоль и лог —
-- журналы изменений Epiphany со стрелками «→» давали сотни строк и рывки; 18.10, обход меню) → ближайшие из шрифта
local CHARS = { ["→"] = "->", ["←"] = "<-", ["—"] = "-", ["–"] = "-", ["…"] = "...", ["«"] = '"', ["»"] = '"',
	["“"] = '"', ["”"] = '"', ["„"] = '"', ["’"] = "'", ["‘"] = "'", ["×"] = "x", ["•"] = "-", ["№"] = "n" }
local function fixChars(s)
	if not s:find("[\194\226]") then return s end
	return (s:gsub("[\194-\226][\128-\191]+", function(c) return CHARS[c] end))
end

local cache, cached = {}, 0
local function translate(s)
	if type(s) ~= "string" then return s end
	if Options.Language ~= "ru" then return fixChars(s) end
	local r = cache[s]
	if r then return r end
	r = EXACT[s]
	if not r then
		for _, p in ipairs(PATTERNS) do
			local a, b, c = s:match(p[1])
			if a then
				if type(p[2]) == "function" then
					r = p[2](a, b, c)
				else
					r = p[2]:gsub("%%(%d)", function(i) return ({ a, b, c })[tonumber(i)] or "" end)
				end
				if r then break end
			end
		end
	end
	r = fixChars(lowerCyr(r or s))
	-- кэш: строки меню рисуются каждый кадр; энциклопедия ещё и меряет каждое слово статей — держим в пределах
	if cached > 20000 then cache, cached = {}, 0 end
	cache[s] = r
	cached = cached + 1
	return r
end

-- набор строк: кэш по самой таблице (рисуется каждый кадр); если мод поменял строки на месте — пересчёт
local setCache = setmetatable({}, { __mode = "k" })
local function translateSet(t)
	if type(t) ~= "table" or Options.Language ~= "ru" then return t end
	local n = #t
	local c = setCache[t]
	if c and c.n == n and c.first == t[1] and c.last == t[n] then return c.res end
	local parts = {}
	for i = 1, n do
		if type(t[i]) ~= "string" then
			parts = nil
			break
		end
		parts[i] = t[i]
	end
	local res = parts and SETS[table.concat(parts, "\n")] or t
	setCache[t] = { n = n, first = t[1], last = t[n], res = res }
	return res
end

local n, ns = 0, 0
for _ in pairs(EXACT) do n = n + 1 end
for _ in pairs(SETS) do ns = ns + 1 end
Isaac.DebugString("[localfixes] русский DSS: строк " .. n .. ", наборов " .. ns .. ", шаблонов " .. #PATTERNS)
return { translate = translate, translateSet = translateSet }
