-- localfixes: интерфейсы REPENTOGON по-русски (18.10, перевод). Страница «Game stats» в статистике (её рисует
-- REPENTOGON — repentogon_extras/stats_menu.lua, шрифтом TeamMeatEx10, по таблице REPENTOGON.Extras.StatsMenu.Stats):
-- названия разделов и строк переводятся в самой таблице, только при русском языке игры. Имена боссов — как в
-- официальной русской таблице строк игры (Молчание, Сумасшествие, Матерь, Сливка…). Строка шрифта узкая (числа стоят
-- на своём месте справа) — длинные названия в две строки, как это делает сам REPENTOGON ({ "строка 1", "строка 2" }).
-- «Total Runs» ежедневных и «Page» бестиария — локальные строки REPENTOGON, правит apply_fixes (EDITS).
local M = {}

local RU = {
	["GAME STATS"] = "СТАТИСТИКА ИГРЫ",
	["deaths"] = "смерти",
	["items"] = "предметы",
	["mom kills"] = "убийства мамы",
	["secrets"] = "секреты",
	["best streak"] = "лучшая серия",
	["best online streak"] = "рекорд онлайн",
	["eden tokens"] = "жетоны эдема",
	["dailys played"] = "ежедн. забегов",
	["dailys won"] = "ежедн. побед",
	["BOSS KILLS"] = "УБИТО БОССОВ",
	["isaac kills"] = "исаак",
	["satan kills"] = "сатана",
	["blue baby kills"] = "???",
	["lamb kills"] = "агнец",
	["hush kills"] = "молчание",
	["delirium kills"] = "сумасшествие",
	["mega satan kills"] = "мега сатана",
	["mother kills"] = "матерь",
	["beast kills"] = "зверь",
	["baby plum kills"] = "сливка",
	["boss rushs cleared"] = "босс-раш пройден",
	["SHOPPING"] = "ПОКУПКИ",
	["shopkeeper killed"] = "убито торговцев",
	["items bought"] = "куплено вещей",
	["angel deals taken"] = "сделки с ангелом",
	["devil deals taken"] = { "сделки", "с дьяволом" },
	["donation machine|coins"] = { "монет в автомат", "пожертвований" },
	["greed donation|machine coins"] = { "монет в автомат", "алчности" },
	["GAMBLING"] = "АЗАРТ",
	["arcades entered"] = "аркады",
	["shellgames played"] = "игры в напёрстки",
	["blood donation|machine used"] = { "донорский", "автомат" },
	["slot machines|broken"] = { "игровых автоматов", "сломано" },
	["golden chests|opened"] = { "золотых сундуков", "открыто" },
	["secret room|walls broken"] = { "стен секретных", "комнат взорвано" },
	["CHAOS"] = "ХАОС",
	["rocks destroyed"] = "камней разбито",
	["tinted rocks|destroyed"] = { "меченых камней", "разбито" },
	["super special|rocks destroyed"] = { "суперособых", "камней разбито" },
	["poop destroyed"] = "какашек разбито",
	["rainbow poop|destroyed"] = { "радужных какашек", "разбито" },
	["pills eaten"] = "пилюль съедено",
	["cards used"] = "карт сыграно",
	["batteries collected"] = "батареек собрано",
	["battery bums killed"] = "батар. бродяг убито",
	["MISC"] = "РАЗНОЕ",
	["beds used"] = "сон в кровати",
	["battery bum|collectible payouts"] = { "батар. бродяга", "выдал вещей" },
}

local function key(s)
	return type(s) == "table" and table.concat(s, "|") or s
end

function M.TranslateStats()
	local sm = REPENTOGON and REPENTOGON.Extras and REPENTOGON.Extras.StatsMenu
	if not (sm and type(sm.Stats) == "table") then return 0 end
	local n = 0
	for _, cat in ipairs(sm.Stats) do
		local t = RU[cat[1]]
		if type(t) == "string" then cat[1] = t; n = n + 1 end
		for _, st in ipairs(cat[2] or {}) do
			local r = RU[key(st[1])]
			if r then st[1] = r; n = n + 1 end
		end
	end
	return n
end

if Options and Options.Language == "ru" then
	local ok, n = pcall(M.TranslateStats)
	Isaac.DebugString("[localfixes] статистика REPENTOGON по-русски: " .. tostring(ok and n or n))
end

return M
