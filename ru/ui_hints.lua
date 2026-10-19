-- localfixes: подсказки модов на экране, нарисованные шрифтом прямо из кода (ru_draw.lua, перевод «на выводе»), 17.10.
-- Ключ — строка как в моде, значение — по-русски. Шаблоны — для строк с подстановками (клавиша и т. п.).
return {
	exact = {
		-- Dead Sea Scrolls: подсказка в первой комнате забега (dssmenucore.lua, шрифт pftempestasevencondensed)
		["(this hint can be turned off in the menu's settings!)"] = "(эту подсказку можно отключить в настройках меню!)",
	},
	patterns = {
		{ "^Press %[(.-)%] to open Dead Sea Scrolls Menu$", "Нажмите [%1], чтобы открыть меню свитков мёртвого моря" },
	},
}
