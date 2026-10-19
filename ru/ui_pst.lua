-- localfixes: надписи Passive Skill Trees, вшитые в код мода (не в его файлы языков), — перевод на выводе (ru_draw.lua).
-- exact — строка целиком; patterns — {шаблон Lua, замена с %1..%3 или функция(захваты)}.
-- имя персонажа (ключ данных PST, «Isaac», «T. Isaac») — по-русски только на выводе; LOCALFIXES.RuCharName — из
-- ru_pst.lua (main.lua). Сам getCurrentCharName не подменять: мод ищет по нему деревья и сохранения.
local function charName(n)
	local f = LOCALFIXES and LOCALFIXES.RuCharName
	return f and f(n) or n
end
-- фразы вех прогресса (progUpdatesScreen.lua, progUpdatePhrases — по-английски в коде), выводятся как «> текст»
-- или «> [NEW] текст»; подстановки уже вставлены модом
local function uber(u) return u == "uber " and "убер-" or "" end -- без «uber » мод может оставить «{{uber}}»
local PROG = {
	{ "^A character has reached level 30: The Star Tree is now allocatable%.$", function()
		return "Персонаж достиг 30 уровня: в Звёздное дерево можно вкладывать очки." end },
	{ "^(.+) has reached level 60 and can now access the Sidereal Tree%.$", function(a)
		return charName(a) .. ": 60 уровень — открыто Сидерическое дерево." end },
	{ "^Unlocked the (.+) in the Sidereal Tree%.$", function(a)
		return "Открыт артефакт Сидерического дерева: " .. a .. "." end },
	{ "^(.+) has hatched into (.+)!$", function(a, b) return a .. ": вылупился спутник — " .. b .. "!" end },
	{ "^(.+) is ready to level up to (.+)%.$", function(a, b) return a .. ": можно повысить до уровня " .. b .. "." end },
	{ "^Lost attempt for (.-)expedition depth (%d+)%.$", function(u, d)
		return "Потеряна попытка: " .. uber(u) .. "экспедиция, глубина " .. d .. "." end },
	{ "^All attempts lost, (.-)expedition depth (%d+) has been reset!$", function(u, d)
		return "Все попытки потеряны: " .. uber(u) .. "экспедиция глубины " .. d .. " сброшена!" end },
	{ "^Uber expedition depth (%d+) has accrued enough entropy and gained a deep%-space distortion modifier!$",
		function(d) return "Убер-экспедиция глубины " .. d .. " набрала энтропии и получила искажение глубокого космоса!" end },
}
local function prog(s)
	for _, p in ipairs(PROG) do
		local a, b = s:match(p[1])
		if a then return p[2](a, b) end
	end
end

return {
	exact = {
		-- меню быстрого выбора (menuTabberScreen.lua): кнопки узкие — названия короче (снимок 17.10: полные наезжали)
		["Star Tree"] = "Звёзд. дерево",
		["Arcane Astrolabe"] = "Астролябия",
		["Sidereal Tree"] = "Сидер. дерево",
		["Astral Forge"] = "Кузня",
		["Weapon Bounties"] = "Награды",
		["Timeless Bazaar"] = "Вечный базар",
		["Obscure Bazaar"] = "Тёмный базар",
		["Astral Companions"] = "Спутники",
		["S. Artifacts"] = "Артефакты",
		-- справка (helpScreen.lua) — заголовки разделов (сами страницы — картинки)
		["Intro"] = "Введение",
		["Controls"] = "Управление",
		["Data Safety"] = "Сохранность",
		["Nodes/Respecs"] = "Узлы/сбросы",
		["Expeditions"] = "Экспедиции",
		["Menu Tabber"] = "Меню Tab",
		["Uber Exped"] = "Убер-экспед.",
		-- вехи прогресса (progUpdatesScreen.lua)
		["Progression Updates"] = "Вехи прогресса",
		["General"] = "Общее",
		["Sidereal"] = "Сидерическое",
		["Left/Right to switch tab, Up/Down to scroll through updates. Shift to scroll faster"] =
			"Влево/вправо — вкладка, вверх/вниз — листать вехи. Shift — быстрее",
		-- журнал изменений (changelogScreen.lua)
		["CHANGELOG (Press Menu Back or Shift + C to close)"] = "ЖУРНАЛ ИЗМЕНЕНИЙ (закрыть — «Назад» или Shift + C)",
		-- спутник без данных (ST_astralCompanions.lua)
		["Hmm... this is not quite right, this is supposed to be an egg."] = "Хм... что-то не так: здесь должно быть яйцо.",
		-- Астральная кузня (astralForgeRender.lua)
		["Ascension"] = "Вознесение",
		-- экспедиции
		["Exp. Run OFF"] = "Экспед. ВЫКЛ",
		-- вкладки экрана экспедиции (expeditionScreen.lua, кнопка 50 px): «Экспедиция» не влезала
		["Expedition"] = "Экспед.",
	},
	patterns = {
		{ "^> (.+) <$", function(a)
			local t = LOCALFIXES and LOCALFIXES.TranslateUI
			return "> " .. (t and t(a) or a) .. " <"
		end },
		{ "^> (.+)$", function(a)
			local isNew, body = a:match("^(%[NEW%] )(.+)$")
			local r = prog(body or a)
			if r then return "> " .. (isNew and "[НОВОЕ] " or "") .. r end
		end },
		{ "^Exp%. [Rr]un ON %(Reqs!%)$", "Экспед. ВКЛ (условия!)" },
		{ "^Exp%. [Rr]un ON(.*)$", "Экспед. ВКЛ%1" },
		-- награда узла экспедиции «   N EXP» (ST_expedition.lua)
		{ "^(%s*)(%d+) EXP$", "%1%2 опыта" },
		-- вкладки вех прогресса «[General]» (progUpdatesScreen.lua)
		-- мод ставит вкладки через 6 px на байт строки, у кириллицы 2 байта на букву, но LanaPixel шире —
		-- длинные названия наезжали (снимок 17.10): здесь короче
		{ "^%[(.+)%]$", function(a)
			local short = { General = "Общее", Sidereal = "Сидер.", Expeditions = "Экспед." }
			if short[a] then return "[" .. short[a] .. "]" end
		end },
		-- подпись ресурса с маленькой буквы «оболы: N» (ancientWepBountiesScreen.lua)
		{ "^оболы: (.*)$", "Оболы: %1" },
		-- подпись на экране выбора персонажа: «<имя> LV <уровень> (<клавиша — открыть дерево>)» (treescreenInit.lua) —
		-- спрятана: те же сведения в строке и карточке персонажа localfixes (charcard.lua)
		{ "^(.-) LV (%d+) (%(.+)$", function() return "" end },
		-- заголовок дерева: «<название> - LV <уровень>» (treescreenRender.lua)
		{ "^(.+) %- LV (%d+)$", "%1 — ур. %2" },
		-- полоса опыта PST внизу экрана (ST_rendering.lua): уровень персонажа и общий уровень
		{ "^LV (%d+)$", "Ур. %1" },
		{ "^G%.LV (%d+)$", "О.ур. %1" },
		-- имя комнаты от Fiend Folio («показывать названия комнат»): «<номер> <имя раскладки>»; имена раскладок —
		-- служебные заметки авторов комнат, переводится только общее «Start Room»
		-- (в шаблонах Lua нельзя сделать необязательной целую группу — два шаблона)
		{ "^(%d+) Start Room$", "%1 стартовая комната" },
		{ "^%(FF%) (%d+) Start Room$", "(FF) %1 стартовая комната" },
		{ "^Char: (.+)$", function(a) return "Перс.: " .. charName(a) end },
		-- имя персонажа, приклеенное к уже переведённой строке (astralForgeRender.lua, descriptionBoxes.lua,
		-- expeditionScreen.lua)
		{ "^Надетое оружие %((.+)%)$", function(a) return "Надетое оружие (" .. charName(a) .. ")" end },
		{ "^(.+) оболы: (%-?%d+)$", function(a, b)
			local n = charName(a)
			if n ~= a then return "Оболы (" .. n .. "): " .. b end -- только имя персонажа, не «Тайные оболы: N»
		end },
		{ "^Перс%.: (.+)$", function(a) return "Перс.: " .. charName(a) end },
	},
}
