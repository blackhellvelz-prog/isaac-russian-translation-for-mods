-- localfixes: Passive Skill Trees по-русски (17.10, слова пользователя «Player Skill tree»). У мода свои языки
-- (scripts/locale/en, es; locales — локальная таблица ST_textRender.lua), русского нет. Здесь — свой словарь из
-- ru/pst_*.lua и обёртки PST:getLocalized / PST:localeIDExists: при языке "ru" ключ берётся из словаря, иначе — как у
-- мода (нет перевода — английский). Файлы мода не правятся. Подключение — install() на MC_POST_MODS_LOADED.
-- Таблицы словаря подключаются при загрузке мода: include во время игры ищет путь от последнего загруженного мода.
local FILES = { "ru.pst_ui", "ru.pst_global", "ru.pst_char", "ru.pst_tainted", "ru.pst_star", "ru.pst_sidereal",
	"ru.pst_expeditions", "ru.pst_starcursed", "ru.pst_forge", "ru.pst_artifact", "ru.pst_companions" }

local RU = {}
local count = 0
for _, f in ipairs(FILES) do
	local ok, data = pcall(include, f)
	if ok and type(data) == "table" then
		for k, v in pairs(data) do
			RU[k] = v
			count = count + 1
		end
	else
		Isaac.DebugString("[localfixes] русский PST: не загрузился " .. f .. ": " .. tostring(data))
	end
end

-- Имена персонажей в подстановках ({{charName}}, {{tmpCharName}}): у PST — английские имена деревьев («Isaac»,
-- «T. Isaac», имена модовых персонажей из конфига). Ванильные — официальные из таблицы строк игры (Players, ru),
-- порченые — «П. …» (как в русском EID «Порченый Исаак»), модовые — как в ru/eid_extra.lua.
local NAMES = {
	["Isaac"] = "Исаак", ["Magdalene"] = "Магдалина", ["Cain"] = "Каин", ["Judas"] = "Иуда", ["???"] = "???",
	["Blue Baby"] = "???", ["Eve"] = "Ева", ["Samson"] = "Самсон", ["Azazel"] = "Азазель", ["Lazarus"] = "Лазарь",
	["Eden"] = "Эдем", ["The Lost"] = "Потерянный", ["Lost"] = "Потерянный", ["Lilith"] = "Лилит",
	["Keeper"] = "Хранитель", ["Apollyon"] = "Аполлион", ["The Forgotten"] = "Забытый", ["Forgotten"] = "Забытый",
	["The Soul"] = "Душа", ["Bethany"] = "Вифания", ["Jacob"] = "Иаков", ["Esau"] = "Исав",
	["Jacob & Esau"] = "Иаков и Исав", ["Siren"] = "Сирена", ["Dark Judas"] = "Тёмный Иуда",
	["Lazarus Risen"] = "Воскресший Лазарь",
	-- модовые — как в русском EID (ru/eid_extra.lua)
	["Fiend"] = "Изверг", ["Golem"] = "Голем", ["Friend"] = "Френд", ["Inaba"] = "Инаба", ["Slippy"] = "Слиппи",
	["China"] = "Чайна", ["Craig"] = "Крейг", ["Classic Fiend"] = "Классический Изверг", ["Image"] = "Имидж",
	["The Skeletal Fiend"] = "Скелетный Изверг", ["Fend"] = "Фенд", ["Frond"] = "Фронд", ["Fient"] = "Фиент",
	["Mi"] = "Ми", ["Freezer Jr."] = "Фризер-младшая", ["Peat"] = "Пит", ["Leah"] = "Лия", ["Peter"] = "Пётр",
	["Miriam"] = "Мириам", ["Robot"] = "Робот", ["Joseph"] = "Иосиф", ["Moses"] = "Моисей", ["Munitus"] = "Мунитус",
	-- потускневшие Epiphany: PST зовёт их «Tr. <имя>» (у Иуды все пять форм — «Tr. Judas»); по-русски — как в
	-- русской энциклопедии Epiphany
	["Tr. Isaac"] = "Потускневший Исаак", ["Tr. Magdalene"] = "Потускневшая Магдалина", ["Tr. Cain"] = "Потускневший Каин",
	["Tr. Judas"] = "Потускневший Иуда", ["Tr. ???"] = "Потускневший ???", ["Tr. Samson"] = "Потускневший Самсон",
	["Tr. Eden"] = "Потускневший Эдем", ["Tr. Lost"] = "Потускневший Потерянный", ["Tr. Keeper"] = "Потускневший Хранитель",
}
local function ruName(n)
	if type(n) ~= "string" then return n end
	if NAMES[n] then return NAMES[n] end
	local base = n:match("^T%. (.+)$") or n:match("^Tainted (.+)$")
	if base then return "П. " .. (NAMES[base] or base) end
	return n
end
-- для вывода на экран (ru_draw.lua): только известные имена, чтобы не трогать прочие строки «Tainted …»
local function ruNameStrict(n)
	if type(n) ~= "string" then return n end
	if NAMES[n] then return NAMES[n] end
	local base = n:match("^T%. (.+)$") or n:match("^Tainted (.+)$")
	if base and NAMES[base] then return "П. " .. NAMES[base] end
	return n
end

local installed = false
local function install()
	if installed or not (PST and PST.getLocalized) then return 0 end
	installed = true
	-- цветные строки словаря: {текст, "ИМЯ_ЦВЕТА"} → {текст, PST.kcolors.ИМЯ} (как в en-файлах мода)
	local colors = PST.kcolors or {}
	for _, v in pairs(RU) do
		if type(v) == "table" then
			for _, line in ipairs(v) do
				if type(line) == "table" and type(line[2]) == "string" then line[2] = colors[line[2]] or colors.WHITE end
			end
		end
	end
	local origGet, origExists = PST.getLocalized, PST.localeIDExists
	local function russian(lang)
		local l = lang or Options.Language
		if PST.config and PST.config.forceEnglishLocale then return false end
		return l == "ru"
	end
	function PST:getLocalized(text, lang)
		if russian(lang) and type(text) == "string" then
			local key = text:sub(1, 1) == "#" and text:sub(2) or text
			local s = RU[key]
			if s ~= nil then return s end
		end
		return origGet(self, text, lang)
	end
	local origFormat = PST.getLocalizedFormat
	if origFormat then
		function PST:getLocalizedFormat(text, vals, lang)
			if russian(lang) and type(vals) == "table" then
				local v = {}
				for k, x in pairs(vals) do v[k] = x end
				v.charName = ruName(v.charName)
				v.tmpCharName = ruName(v.tmpCharName)
				v.possessive = ""
				vals = v
			end
			return origFormat(self, text, vals, lang)
		end
	end
	if origExists then
		function PST:localeIDExists(id, lang)
			if russian(lang) and RU[id] ~= nil then return RU[id] end
			-- нет русского — как у английского (мод проверяет, есть ли текст вообще)
			return origExists(self, id, russian(lang) and "en" or lang)
		end
	end
	-- обратный словарь для вывода (ru_draw.lua): часть надписей мод берёт через getLocalized при загрузке своих
	-- файлов — таблицы вкладок экспедиции, ресурсов базара, — ещё до этой обёртки, и они остаются английскими
	local REV, nrev = {}, 0
	for k, v in pairs(RU) do
		if type(v) == "string" then
			local ok, en = pcall(origGet, PST, k, "en")
			if ok and type(en) == "string" and en ~= "" and en ~= k and REV[en] == nil then
				REV[en] = v
				nrev = nrev + 1
			end
		end
	end
	LOCALFIXES = LOCALFIXES or {}
	LOCALFIXES.PstReverse = REV
	Isaac.DebugString("[localfixes] русский PST: строк " .. count .. ", обратных " .. nrev)
	return count
end

return { install = install, strings = RU, name = ruName, strictName = ruNameStrict }
