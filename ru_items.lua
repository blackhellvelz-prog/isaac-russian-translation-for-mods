-- localfixes: русские названия и короткие описания модовых предметов, брелоков, карт и пилюль (17.10, просьба
-- пользователя «Переведи все моды и игру на русский с таким же шрифтом, как в оригинале»).
-- Игра сама по-русски (options.ini Language=10). Mod Translator (Мастерская 2881743468) переводит часть модов
-- (Fiend Folio, Epiphany, Repentance Plus, Reshaken, The Future…); здесь — то, чего у него нет. Подключение — через его
-- API (ItemTranslate): тогда работают и его подсказки карт/пилюль, и выбор языка в его меню; без него — прямо в конфиг
-- игры (REPENTOGON позволяет), только при русском языке. С конфигом название при подборе выводит сама игра — её
-- шрифтом, как в оригинале; EID берёт то же название.
-- Таблицы — ru/*.lua: { mod = "<id Мастерской>", {вид, "English name", "Русское название", "Русское описание"}, … }
-- (описание nil — оставить как есть). Название → id — по английским названиям на MC_POST_MODS_LOADED (до подмен) с
-- проверкой мода-источника (XMLData): id модов зависят от порядка загрузки.
-- Файлы таблиц подключаются при загрузке мода: include во время игры ищет путь от последнего загруженного мода.
local FILES = {
	"ru.small",
	"ru.ipecac",
	"ru.heavenscall",
	"ru.lostandforgotten",
	"ru.furtherance",
	"ru.pst",
}

-- Описания EID (17.10, фото пользователя: название в EID русское, описание английское): ru/eid_*.lua —
-- { mod = "<id>", {вид, "English name", "Описание EID", n = номер среди одноимённых}, …; для «прочих» — {"other", "тип.вариант.подтип", "Имя", "Описание"} }.
-- Разметка EID сохраняется: # — новая строка, {{Иконка}}, ↑/↓. Стиль — как у русского EID («↑ {{Damage}} +1 к урону»,
-- «артефакт», «синих сердца»).
local EID_FILES = {
	"ru.eid_small",
	"ru.eid_ipecac",
	"ru.eid_lostandforgotten",
	"ru.eid_furtherance",
	"ru.eid_ff1",
	"ru.eid_ff2",
	"ru.eid_ff3",
	"ru.eid_ff4",
	"ru.eid_ff5",
	"ru.eid_ff6",
	"ru.eid_ff7",
	"ru.eid_extra",
	"ru.eid_golden",
}

-- «Живые» описания Furtherance — ru_dynamic.lua (обратные вызовы на "ru").
local dynOk, DYNAMIC = pcall(include, "ru_dynamic")

local EIDDATA = {}
for _, f in ipairs(EID_FILES) do
	local ok, data = pcall(include, f)
	if not ok then Isaac.DebugString("[localfixes] русский EID: не загружен " .. f .. ": " .. tostring(data)) end
	if ok and type(data) == "table" then
		if data.mods then
			for _, d in ipairs(data.mods) do EIDDATA[#EIDDATA + 1] = d end
		else
			EIDDATA[#EIDDATA + 1] = data
		end
	end
end

local DATA = {}
for _, f in ipairs(FILES) do
	local ok, data = pcall(include, f)
	if ok and type(data) == "table" then
		if data.mods then
			for _, d in ipairs(data.mods) do DATA[#DATA + 1] = d end
		else
			DATA[#DATA + 1] = data
		end
	end
end

local KINDS = {
	item = { node = "ITEM", get = "GetCollectible", list = "GetCollectibles", from = function() return CollectibleType.NUM_COLLECTIBLES end },
	trinket = { node = "TRINKET", get = "GetTrinket", list = "GetTrinkets", from = function() return TrinketType.NUM_TRINKETS end },
	card = { node = "CARD", get = "GetCard", list = "GetCards", from = function() return Card.NUM_CARDS end },
	pill = { node = "PILL", get = "GetPillEffect", list = "GetPillEffects", from = function() return PillEffect.NUM_PILL_EFFECTS end },
}

-- Два указателя: [вид][название] = { {id, мод}, … } — точное название без невидимых символов нулевой ширины
-- (U+200B…U+200D: у Runic Tablet и Heaven's Call их много) и оно же без крайних пробелов. Сначала ищется точное: у
-- IPECAC 8 состояний Demonic Talisman с разными описаниями и два разных Dad's Cigarette отличаются только числом
-- пробелов в конце; не нашлось — без пробелов (тогда перевод ложится на все состояния).
local byExact, byTrim = {}, {}

local function nozw(s)
	return (s:gsub("\226\128[\139-\141]", ""))
end
local function norm(s)
	return (nozw(s):gsub("^%s+", ""):gsub("%s+$", ""))
end

local function scan()
	local cfg = Isaac.GetItemConfig()
	for kind, k in pairs(KINDS) do
		local te, tt = {}, {}
		byExact[kind], byTrim[kind] = te, tt
		local size = cfg[k.list](cfg).Size
		for id = k.from(), size - 1 do
			local conf = cfg[k.get](cfg, id)
			if conf and conf.Name and conf.Name ~= "" then
				local src = "?"
				if XMLData and XMLNode and XMLNode[k.node] then
					local ok, e = pcall(XMLData.GetEntryById, XMLNode[k.node], id)
					if ok and type(e) == "table" and e.sourceid then src = tostring(e.sourceid) end
				end
				for t, key in pairs({ [te] = nozw(conf.Name), [tt] = norm(conf.Name) }) do
					local list = t[key]
					if not list then
						list = {}
						t[key] = list
					end
					list[#list + 1] = { id, src }
				end
			end
		end
	end
end

-- Все id с таким названием у этого мода (у некоторых модов одно название — у нескольких состояний предмета), иначе
-- первый попавшийся.
local function resolve(kind, name, mod)
	local list = byExact[kind] and byExact[kind][nozw(name)] or byTrim[kind] and byTrim[kind][norm(name)]
	if not list then return nil end
	local ids = {}
	for _, v in ipairs(list) do
		if v[2] == mod then ids[#ids + 1] = v[1] end
	end
	if #ids == 0 then ids[1] = list[1][1] end
	return ids
end

-- После переводов (наших и Mod Translator) в конфиге русские названия, а моды ищут свои брелоки и пилюли по
-- английским (PST: Isaac.GetTrinketIdByName("Azure Starcursed Jewel") во время игры). Поиск при промахе — по
-- английскому названию, запомненному в scan() до переименований. Карты моды ищут по hud-имени — их не трогаем;
-- предметы — указатель в main.lua (запоминает английские при загрузке), здесь — подстраховка.
local function englishFallback(fnName, kind)
	local raw = Isaac[fnName]
	if type(raw) ~= "function" then return end
	Isaac[fnName] = function(name, ...)
		local r = raw(name, ...)
		if (r == nil or r < 0) and type(name) == "string" then
			local list = byExact[kind] and byExact[kind][nozw(name)] or byTrim[kind] and byTrim[kind][norm(name)]
			if list then return list[1][1] end
		end
		return r
	end
end

local applied = false
local function apply()
	if applied then return end
	applied = true
	scan()
	-- id → английское название (для выгрузки и перевода описаний EID: в конфиге после переводов — русские)
	local eng = {}
	for kind, t in pairs(byExact) do
		local m = {}
		eng[kind] = m
		for name, list in pairs(t) do
			for _, v in ipairs(list) do m[v[1]] = name end
		end
	end
	LOCALFIXES.EnglishNames = eng
	englishFallback("GetItemIdByName", "item")
	englishFallback("GetTrinketIdByName", "trinket")
	englishFallback("GetPillEffectByName", "pill")
	local coll, trink, cards, pills = {}, {}, {}, {}
	local found, missing = 0, {}
	for _, data in ipairs(DATA) do
		for _, e in ipairs(data) do
			local kind, en, ruName, ruDesc = e[1], e[2], e[3], e[4]
			local ids = resolve(kind, en, data.mod)
			if ids then
				found = found + 1
				for _, id in ipairs(ids) do
					-- ItemId: Mod Translator берёт id карты/пилюли отсюда, а не ищет по точному имени (у модов бывают
					-- пробелы вокруг названия)
					local v = { ru = { ruName, ruDesc }, ItemId = id }
					if kind == "item" then coll[id] = v
					elseif kind == "trinket" then trink[id] = v
					elseif kind == "card" then cards[id] = v
					elseif kind == "pill" then pills[en .. "#" .. id] = v end
				end
			else
				missing[#missing + 1] = kind .. ":" .. en
			end
		end
	end
	local IT = ItemTranslate
	if IT and IT.AddCollectiblesTranslation then
		IT.AddCollectiblesTranslation(coll)
		IT.AddTrinketsTranslation(trink)
		IT.AddCardTranslation(cards)
		IT.AddPillsTranslation(pills)
	elseif Options and Options.Language == "ru" then
		local cfg = Isaac.GetItemConfig()
		local function set(conf, v)
			if conf and v.ru[1] then
				conf.Name = v.ru[1]
				if v.ru[2] then conf.Description = v.ru[2] end
			end
		end
		for id, v in pairs(coll) do set(cfg:GetCollectible(id), v) end
		for id, v in pairs(trink) do set(cfg:GetTrinket(id), v) end
		for id, v in pairs(cards) do set(cfg:GetCard(id), v) end
		for _, v in pairs(pills) do
			local conf = cfg:GetPillEffect(v.ItemId)
			if conf and v.ru[1] then conf.Name = v.ru[1] end
		end
	end
	Isaac.DebugString(string.format("[localfixes] русский: переводов %d, не найдено %d%s", found, #missing,
		#missing > 0 and (" (" .. table.concat(missing, ", ", 1, math.min(#missing, 12)) .. ")") or ""))

	-- Описания EID на русском: EID:add… с языком "ru" (название nil — EID берёт его из конфига, уже переведённое).
	if EID and EID.addCollectible then
		local ADD = { item = EID.addCollectible, trinket = EID.addTrinket, card = EID.addCard, pill = EID.addPill }
		local done, lost = 0, {}
		for _, data in ipairs(EIDDATA) do
			for _, e in ipairs(data) do
				local kind = e[1]
				if kind == "other" then
					local a, b, c = tostring(e[2]):match("^(-?%d+)%.(-?%d+)%.(-?%d+)$")
					if a and EID.addEntity then
						EID:addEntity(tonumber(a), tonumber(b), tonumber(c), e[3], e[4], "ru")
						done = done + 1
					end
				elseif kind == "character" or kind == "birthright" then
					-- {вид, "English name", порченый, "Русское имя", "Описание"}: персонаж — по имени (номера модов зависят от порядка)
					local t = Isaac.GetPlayerTypeByName(e[2], e[3] and true or false)
					if t and t >= 0 then
						if kind == "character" then EID:addCharacterInfo(t, e[5], e[4], "ru")
						else EID:addBirthright(t, e[5], e[4], "ru") end
						done = done + 1
					else
						lost[#lost + 1] = kind .. ":" .. e[2]
					end
				elseif kind == "wisp" or kind == "abyss" then
					-- огонёк Книги добродетелей / саранча Бездны артефакта: {вид, "English name", "Описание"}
					local tab = kind == "wisp" and "bookOfVirtuesWisps" or "abyssSynergies"
					local ids = resolve("item", e[2], data.mod)
					if ids then
						EID:CreateDescriptionTableIfMissing(tab, "ru")
						for _, id in ipairs(ids) do EID.descriptions.ru[tab][id] = e[3] end
						done = done + 1
					else
						lost[#lost + 1] = kind .. ":" .. e[2]
					end
				elseif kind == "golden" then
					-- золотой брелок / Мамина шкатулка: {"golden", "English name", {тексты}} — как у мода: append —
					-- дописываемый текст; findReplace — тройки «что искать в русском описании (шаблон Lua), ×2, ×3»
					local ids = resolve("trinket", e[2], data.mod)
					if ids then
						EID:CreateDescriptionTableIfMissing("goldenTrinketEffects", "ru")
						for _, id in ipairs(ids) do EID.descriptions.ru.goldenTrinketEffects[id] = e[3] end
						done = done + 1
					else
						lost[#lost + 1] = kind .. ":" .. e[2]
					end
				elseif kind == "conditional" then
					EID:CreateDescriptionTableIfMissing("ConditionalDescs", "ru")
					EID.descriptions.ru.ConditionalDescs[e[2]] = e[3]
					done = done + 1
				else
					local ids = resolve(kind, e[2], data.mod)
					-- n = номер среди одноимённых у мода (по возрастанию id): у Fiend Folio три карты «Dice Shard»
					if ids and e.n then
						table.sort(ids)
						ids = ids[e.n] and { ids[e.n] } or nil
					end
					if ids and ADD[kind] then
						for _, id in ipairs(ids) do ADD[kind](EID, id, e[3], nil, "ru") end
						done = done + 1
					else
						lost[#lost + 1] = kind .. ":" .. e[2]
					end
				end
			end
		end
		-- Ткань Таро: числа удвоения для модовых карт — без текста, переносятся как есть
		local en, ruD = EID.descriptions.en_us, EID.descriptions.ru
		if en and ruD and type(en.tarotClothBuffs) == "table" then
			EID:CreateDescriptionTableIfMissing("tarotClothBuffs", "ru")
			for k, v in pairs(en.tarotClothBuffs) do
				if ruD.tarotClothBuffs[k] == nil then ruD.tarotClothBuffs[k] = v end
			end
		end
		local dyn = 0
		if dynOk and type(DYNAMIC) == "function" then
			local ok, r = pcall(DYNAMIC)
			if ok then dyn = r or 0 else Isaac.DebugString("[localfixes] русский EID: ошибка живых описаний: " .. tostring(r)) end
		end
		Isaac.DebugString(string.format("[localfixes] русский EID: описаний %d, живых %d, не найдено %d%s", done, dyn, #lost,
			#lost > 0 and (" (" .. table.concat(lost, ", ", 1, math.min(#lost, 12)) .. ")") or ""))
	end
end

-- Модули Робота (Lost and Forgotten): мод при каждом старте забега собирает их описания в EID по-английски — префикс
-- модуля + название и описание предмета из EID на текущем языке (lnfscripts/characters/robot.lua, LoadModuleDesc).
-- После него (MC_POST_GAME_STARTED, в самом конце — после Mod Translator, когда названия уже русские) — то же на
-- русском, той же схемой. Тип модуля = подтип // 10000 для «Активного»/«Пассивного» (4, 5), иначе — сам подтип.
local MODULE_RU = {
	[1] = { "Модуль урона", "#↑{{DamageSmall}} Урон временно +0.7" },
	[2] = { "Модуль скорострельности", "#↑{{TearsSmall}} Скорострельность временно +0.3" },
	[3] = { "Модуль подвижности", "#↑ Временно: +0.2 к скорости, +2.5 к дальности и +0.1 к скорости слезы" },
	[4] = { "Активный модуль", "Активирует эффект следующего артефакта: #" },
	[5] = { "Пассивный модуль", "Даёт эффект следующего артефакта на эту комнату: #" },
	[6] = { "Модуль щита", "#{{HolyMantle}} Даёт щит Святой мантии на эту комнату" },
	[7] = { "Модуль бомбы", "Вызывает взрыв там, где стоит Исаак#Взрыв не ранит Исаака" },
	[8] = { "Грустный модуль", "Выпускает вокруг слёзы с большим уроном и даёт угасающие ↑+4 к скорострельности" },
	[9] = { "Модуль копирования", "Дважды активирует случайный имеющийся модуль" },
}
local function russianModules()
	if not (EID and EID.addEntity and LNF and LNF.Modules and LNF.PickupVariant and LNF.PickupVariant.PICKUP_MODULE) then return end
	if not (Options and Options.Language == "ru") then return end
	local variant = LNF.PickupVariant.PICKUP_MODULE
	local cfg = Isaac.GetItemConfig()
	local n = 0
	for _, modul in pairs(LNF.Modules) do
		local ru = MODULE_RU[modul.id]
		if ru then
			if modul.id ~= 4 and modul.id ~= 5 then
				EID:addEntity(5, variant, modul.id, ru[1], ru[2], "ru")
				n = n + 1
			else
				local size = cfg:GetCollectibles().Size
				for i = 1, size - 1 do
					local item = cfg:GetCollectible(i)
					local active = item and item.Type == ItemType.ITEM_ACTIVE
					local passive = item and (item.Type == ItemType.ITEM_PASSIVE or item.Type == ItemType.ITEM_FAMILIAR)
					if (modul.id == 4 and active) or (modul.id == 5 and passive) then
						local d = EID:getDescriptionData(5, 100, item.ID)
						if d then
							local name = d[2] or EID:getObjectName(5, 100, item.ID) or "артефакт"
							local desc = ru[2] .. (modul.id == 4 and "#{{Battery}} {{ColorObjName}}" .. name .. "{{CR}} #"
								or "#{{Collectible}} {{ColorObjName}}" .. name .. " {{CR}}#") .. (d[3] or "его эффект")
							EID:addEntity(5, variant, modul.id * 10000 + item.ID, ru[1], desc, "ru")
							n = n + 1
						end
					end
				end
			end
		end
	end
	Isaac.DebugString("[localfixes] русский EID: модулей Робота " .. n)
end

return { apply = apply, modules = russianModules }
