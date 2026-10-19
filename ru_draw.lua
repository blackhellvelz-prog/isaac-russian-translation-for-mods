-- localfixes: перевод «на выводе» (17.10, слова пользователя «Ты ТОЧНО все моды перевел?»; фото меню PST с
-- английскими названиями экранов). Моды рисуют часть надписей строками прямо из кода, мимо своих файлов языков.
-- Здесь — обёртки вывода текста: Font:DrawString / DrawStringScaled / *UTF8 (функции REPENTOGON в слое __index
-- класса Font, resources/scripts/main.lua; находим их через реестр слоёв __LOCALFIXES_INDEX_LAYERS) и ширины строки
-- (GetStringWidth / GetStringWidthUTF8 — для центровки по переведённому тексту). Строка ищется в словаре ru/ui_*.lua:
-- точное совпадение, иначе шаблоны (начало строки и т. п.). Только при языке игры "ru". Isaac.RenderText — в
-- ru_font.lua (тот же словарь через LOCALFIXES.TranslateUI).
local FILES = { "ru.ui_pst", "ru.ui_pst_cosmic", "ru.ui_hints" }

local EXACT, PATTERNS = {}, {}
for _, f in ipairs(FILES) do
	local ok, data = pcall(include, f)
	if ok and type(data) == "table" then
		for k, v in pairs(data.exact or {}) do EXACT[k] = v end
		for _, p in ipairs(data.patterns or {}) do PATTERNS[#PATTERNS + 1] = p end
	end
end

-- кэш результатов: одни и те же строки рисуются каждый кадр
local cache, cached = {}, 0
local function translate(s)
	if type(s) ~= "string" or Options.Language ~= "ru" then return s end
	local r = cache[s]
	if r then return r end
	r = EXACT[s]
	if not r then
		for _, p in ipairs(PATTERNS) do
			local a, b, c = s:match(p[1])
			if a then
				-- функция может вернуть nil («не мой случай») — тогда строка идёт дальше, к другим шаблонам
				if type(p[2]) == "function" then
					r = p[2](a, b, c)
				else
					r = p[2]:gsub("%%(%d)", function(i) return ({ a, b, c })[tonumber(i)] or "" end)
				end
				if r then break end
			end
		end
	end
	-- английский текст PST, взятый модом через getLocalized ещё при загрузке своих файлов (до русской обёртки):
	-- обратный словарь «английский → русский» по тем же ключам (LOCALFIXES.PstReverse, ru_pst.lua); и «Подпись: N»
	local rev = LOCALFIXES and LOCALFIXES.PstReverse
	if not r and rev then
		r = rev[s]
		if not r then
			local a, b = s:match("^(.-)(: .*)$")
			if a and rev[a] then r = rev[a] .. b end
		end
		if not r then
			local a, b = s:match("^(.-: )(.+)$")
			if a and rev[b] then r = a .. rev[b] end
		end
	end
	-- имя персонажа PST (ключ данных мода: «Isaac», «T. Isaac») — строкой целиком или в скобках «… (Isaac)»
	local nameOf = LOCALFIXES and LOCALFIXES.RuCharName
	if nameOf then
		local base = r or s
		local whole = nameOf(base)
		if whole ~= base then
			r = whole
		else
			local g, n = base:gsub("%((.-)%)", function(x)
				local y = nameOf(x)
				if y ~= x then return "(" .. y .. ")" end
			end)
			if n > 0 and g ~= base then r = g end
		end
	end
	-- Mod Config Menu: подписи пунктов «подпись: значение», категории (ru_mcm.lua) — последним шагом
	local mcm = not r and LOCALFIXES and LOCALFIXES.TranslateMCM
	if mcm then r = mcm(s) end
	r = r or s
	if cached > 4000 then cache, cached = {}, 0 end
	cache[s] = r
	cached = cached + 1
	return r
end

-- слой REPENTOGON с Lua-методами класса Font (его таблица проверяется раньше базового __index). В саму метатаблицу
-- класса не писать: базовый __index (C) ждёт там свои C-функции — Lua-функция в mt роняла игру (17.10, минидамп при
-- первом GetStringWidth из changelog.lua).
-- Реестр слоёв ставит правка REPENTOGON этого ПК (apply_fixes, EDITS 12–15). Без неё (мод из Мастерской, 19.10:
-- в чистой установке подсказка DSS «Press [C] to open…» и надписи PST шли по-английски) — свой слой поверх __index
-- класса тем же приёмом, каким REPENTOGON ставит свои Lua-методы (EndClass): сначала таблица-слой, остальное —
-- прежнему __index. В слой — Lua-методы вывода и ширины, взятые у прежнего __index (Load не берём: его обёртку
-- ставит код ниже, если в слое его нет).
local ownLayer
local function fontLayer()
	local mt = getmetatable(Font())
	for _, L in pairs(rawget(_G, "__LOCALFIXES_INDEX_LAYERS") or {}) do
		if L[3] == mt and type(L[1]) == "table" and L[1].DrawStringScaled then return L[1], mt end
	end
	if ownLayer == nil and type(mt) == "table" then
		ownLayer = false
		local oldIndex = rawget(mt, "__index")
		if type(oldIndex) == "function" then
			local probe = Font()
			local layer = {}
			for _, name in ipairs({ "DrawString", "DrawStringUTF8", "DrawStringScaled", "DrawStringScaledUTF8",
				"GetStringWidthUTF8" }) do
				local ok, f = pcall(oldIndex, probe, name)
				if ok and type(f) == "function" then layer[name] = f end
			end
			if layer.DrawStringScaled then
				rawset(mt, "__index", function(self, k)
					local v = layer[k]
					if v ~= nil then return v end
					return oldIndex(self, k)
				end)
				ownLayer = layer
			end
		end
	end
	return ownLayer or nil, mt
end

-- Запасной шрифт с кириллицей (17.10: вкладки «Вех прогресса» PST выходили пустыми «[]» — мод рисует их
-- terminus8, в нём нет русских букв). Замер в игре (tools/lua/font_width_probe.lua): ширина «Дж» = 0 у terminus8,
-- terminus, luamini, luaminioutlined, teammeatfont10/12/16; есть кириллица у lanapixel, pftempestasevencondensed,
-- upheaval, teammeatex10/12/16, teammeatfont16bold/20bold. Подмена — как в самой игре на русском: Team Meat →
-- TeamMeatEx того же размера, мелкие пиксельные (terminus, luamini) → LanaPixel (его же PST берёт для не-английского).
-- Путь шрифта запоминается в обёртке Font:Load (ставится при загрузке localfixes); шрифтам, загруженным раньше, —
-- по высоте строки.
local FONTPATH = setmetatable({}, { __mode = "k" })
local HASCYR = setmetatable({}, { __mode = "k" })
local FB = {}
local layer0 = fontLayer()
if layer0 then
	local mt = getmetatable(Font())
	local rawLoad = rawget(mt, "Load")
	if type(rawLoad) == "function" and layer0.Load == nil then
		layer0.Load = function(self, path, ...)
			if type(path) == "string" then FONTPATH[self] = path:lower():gsub("\\", "/") end
			return rawLoad(self, path, ...)
		end
	end
end

local function loadFB(path)
	local f = FB[path]
	if f == nil then
		f = Font()
		f:Load(path)
		if not f:IsLoaded() then f = false end
		FB[path] = f
	end
	return f or nil
end

local function cyr(s) return type(s) == "string" and s:find("[\208\209]") ~= nil end

local rawWidthUTF8 -- исходная ширина (до обёрток) — для проверки, есть ли в шрифте кириллица

-- Шрифт, загруженный раньше localfixes (17.10: Mod Config Menu — папка «!!…» грузится первой, его Team Meat 10/12
-- без пути), узнаётся по отпечатку: высота строки + ширина пробной строки, как у известных шрифтов без кириллицы.
-- Совпали отпечатки у двух шрифтов — не угадываем.
local KNOWN = { "font/teammeatfont10.fnt", "font/teammeatfont12.fnt", "font/teammeatfont16.fnt", "font/terminus.fnt",
	"font/terminus8.fnt", "font/luamini.fnt", "font/luaminioutlined.fnt" }
local PRINTS
local function fingerprint(f) return f:GetLineHeight() .. ":" .. rawWidthUTF8(f, "Wqj09MmIl") end
local function guessPath(self)
	if not rawWidthUTF8 then return "" end
	if not PRINTS then
		PRINTS = {}
		for _, p in ipairs(KNOWN) do
			local f = loadFB(p)
			if f then
				local k = fingerprint(f)
				PRINTS[k] = PRINTS[k] == nil and p or false
			end
		end
	end
	return PRINTS[fingerprint(self)] or ""
end

local function fallbackFor(self)
	local ok = HASCYR[self]
	if ok == nil then
		ok = not rawWidthUTF8 or rawWidthUTF8(self, "Дж") > 0
		HASCYR[self] = ok
	end
	if ok then return nil end
	local p = FONTPATH[self]
	if not p then
		p = guessPath(self)
		FONTPATH[self] = p
	end
	local h = self:GetLineHeight()
	local target = "font/cjk/lanapixel.fnt"
	if p:find("teammeat") then
		-- Team Meat → TeamMeatEx того же размера (как в русской игре)
		target = p:find("10") and "font/teammeatex/teammeatex10.fnt" or p:find("12") and "font/teammeatex/teammeatex12.fnt"
			or "font/teammeatex/teammeatex16.fnt"
	elseif p == "" and h >= 16 then
		target = h >= 21 and "font/teammeatex/teammeatex16.fnt" or "font/teammeatex/teammeatex12.fnt"
	end
	local f = loadFB(target)
	if f == self then return nil end
	return f
end

local installed = false
local function install()
	if installed then return 0 end
	installed = true
	local layer, mt = fontLayer()
	local n = 0
	if layer then
		rawWidthUTF8 = layer.GetStringWidthUTF8
		-- вывод: перевод строки; русская строка шрифтом без кириллицы — запасным шрифтом (низ строки — по исходному)
		-- НЕ перенаправлять русскую строку из DrawString / DrawStringScaled в *UTF8 (17.10, игра зависла: в REPENTOGON
		-- DrawStringUTF8 / DrawStringScaledUTF8 — старые обёртки, сами зовут self:DrawStringScaled → бесконечный круг;
		-- и не нужно: DrawString / DrawStringScaled REPENTOGON и так рисуют UTF-8, resources/scripts/main.lua)
		for name, scaled in pairs({ DrawString = false, DrawStringUTF8 = false, DrawStringScaled = true,
			DrawStringScaledUTF8 = true }) do
			local orig = layer[name]
			if type(orig) == "function" then
				layer[name] = function(self, str, x, y, a, b, ...)
					str = translate(str)
					if cyr(str) then
						local fb = fallbackFor(self)
						if fb then
							local sy = scaled and b or 1
							local dy = (self:GetLineHeight() - fb:GetLineHeight()) * (type(sy) == "number" and sy or 1)
							if scaled then return fb:DrawStringScaledUTF8(str, x, y + dy, a, b, ...) end
							return fb:DrawStringUTF8(str, x, y + dy, a, b, ...)
						end
					end
					return orig(self, str, x, y, a, b, ...)
				end
				n = n + 1
			end
		end
		-- ширина строки — по тому шрифту, которым строка будет нарисована (центровка, рамки)
		local function widthWrap(orig)
			return function(self, str, ...)
				str = translate(str)
				if cyr(str) then
					local fb = fallbackFor(self)
					if fb and rawWidthUTF8 then return rawWidthUTF8(fb, str, ...) end
				end
				return orig(self, str, ...)
			end
		end
		if type(layer.GetStringWidthUTF8) == "function" then
			layer.GetStringWidthUTF8 = widthWrap(layer.GetStringWidthUTF8)
			n = n + 1
		end
		local rawWidth = rawget(mt, "GetStringWidth")
		if type(rawWidth) == "function" then
			layer.GetStringWidth = widthWrap(rawWidth)
			n = n + 1
		end
	end
	Isaac.DebugString("[localfixes] русский вывод: обёрток " .. n .. ", строк " .. (function()
		local c = 0
		for _ in pairs(EXACT) do c = c + 1 end
		return c
	end)() .. ", шаблонов " .. #PATTERNS)
	return n
end

LOCALFIXES.TranslateUI = translate
return { install = install, translate = translate }
