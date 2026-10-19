-- localfixes: Passive Skill Trees по-русски — астральные спутники (en_astralCompanions.lua мода), 17.10.
-- Этажи, предметы и враги — как в официальной русской таблице строк игры (tools/ru_official.py): Womb — Матка,
-- Sheol — Преисподняя, Downpour — Водосток, Dross — Нечистоты, Mines — Шахты, Ashpit — Зольник, Host — Наблюдатель.
-- Словарь: scavenge — добывать, crawl space — лаз, tinted rock — помеченный камень.
return {
	["astralcomp_ui_allocEquipEgg"] = "Нажми «Вложить», чтобы положить это яйцо в инкубатор.",
	["astralcomp_ui_allocUnequipEgg"] = "Нажми «Вложить», чтобы вынуть это яйцо из инкубатора.",
	["astralcomp_ui_eggHatchReady"] = "Готово. Нажми «Вложить», чтобы вывести спутника из яйца!",
	["astralcomp_ui_allocEquipComp"] = "Нажми «Вложить», чтобы поставить этого спутника в это место.",
	["astralcomp_ui_allocUnequipComp"] = "Нажми «Вложить», чтобы убрать этого спутника из этого места.",
	["astralcomp_ui_compLevelReady"] = "Можно повысить уровень! Нажми «Вложить», чтобы повысить уровень спутника.",
	["astralcomp_ui_respecUnequip"] = "Нажми «Сброс», чтобы убрать этого спутника.",
	["astralcomp_ui_lvlupText"] = "{{compName}}: можно повысить уровень!",
	["astralcomp_ui_hatchText"] = "{{compName}}: можно выводить!",
	["astralcomp_ui_scavObolsSlotMaxed"] = "Место спутника {{slotNumber}}: добытые оболы заполнены!",
	["astralcomp_ui_equippedEgg"] = "Яйцо в инкубаторе",
	["astralcomp_ui_equippedComp"] = "Выбранный спутник",
	["astralcomp_ui_lv3effect"] = "Эффект 3 уровня",
	["astralcomp_ui_lv3rewards"] = "Награды за 3 уровень",
	["astralcomp_ui_eggHatchObj"] = "Цель для вылупления",
	["astralcomp_ui_hatchingPaused"] = "Вылупление на паузе. Положи яйцо в инкубатор, чтобы оно продолжилось.",
	["astralcomp_ui_currentlyHatching"] = "Вылупляется.",
	["astralcomp_ui_hatchComplete"] = "Вылупление завершено!",
	["astralcomp_ui_eggHatchInto"] = "Из яйца вылупился",
	["astralcomp_ui_hatchCompHint"] = "Теперь вылупившегося спутника можно поставить в одно из мест спутника справа.",
	["astralcomp_ui_eggNotFound"] = "Яйцо ещё не найдено.",
	["astralcomp_ui_locHint"] = "Где искать",
	["astralcomp_ui_scavengedObols"] = "Добытые оболы",
	["astralcomp_ui_cannotSwitchComp"] = "Во время забега спутников менять нельзя.",
	["astralcomp_foundEgg"] = "Найдено яйцо",
	["astralcomp_ui_slotActiveWarn1"] = "Это место добывает оболы только на этажах с 1 по 5.",
	["astralcomp_ui_slotActiveWarn2"] = "Это место добывает оболы только на этажах с 6 по 10.",
	["astralcomp_ui_slotActiveWarn3"] = "Это место добывает оболы всегда.",
	["astralcomp_ui_slotNotScavenging"] = "Сейчас не добывает",

	---- АСТРАЛЬНЫЕ СПУТНИКИ ----
	["astralcomp_rat_name"] = "Крыса",
	["astralcomp_rat_eggname"] = "Пугливое бурое яйцо",
	["astralcomp_rat_obj"] = "Подбирай монеты любого вида.",
	["astralcomp_rat_eggHint"] = "Боссы 1 или 2 этажа.",
	["astralcomp_rat_scavenge"] = "Добывает {{obolCount}} тайных оболов при подборе монет, до {{floorLimit}} раз за этаж.",
	["astralcomp_rat_maxeffects"] = {
		"7% шанс создать ещё одну монету за зачистку комнаты."
	},
	["astralcomp_riverrat_name"] = "Речная крыса",
	["astralcomp_riverrat_eggname"] = "Влажное зелёное яйцо",
	["astralcomp_riverrat_obj"] = "Подбирай необычные монеты (любые не простые: двойные, счастливые, пятаки и т. п.).",
	["astralcomp_riverrat_eggHint"] = "Боссы Водостока, Нечистот или Затопленных Пещер.",
	["astralcomp_riverrat_scavenge"] = "Добывает {{obolCount}} тайных оболов при подборе необычных монет, до {{floorLimit}} раз за этаж.",
	["astralcomp_riverrat_maxeffects"] = {
		"15% шанс, что появившийся пенни станет двойным."
	},
	["astralcomp_hellrat_name"] = "Адская крыса",
	["astralcomp_hellrat_eggname"] = "Серное пугливое яйцо",
	["astralcomp_hellrat_obj"] = "Подбирай монеты на Матке и дальше.",
	["astralcomp_hellrat_eggHint"] = "Мама.",
	["astralcomp_hellrat_scavenge"] = "Добывает {{obolCount}} тайных оболов при подборе монет на Матке и дальше, до {{floorLimit}} раз за этаж.",
	["astralcomp_hellrat_maxeffects"] = {
		"8% шанс, что чемпион при смерти уронит ещё монету; +1% за каждый пройденный этаж."
	},
	["astralcomp_quokka_name"] = "Квокка",
	["astralcomp_quokka_eggname"] = "Светлое простое яйцо",
	["astralcomp_quokka_obj"] = "Подбирай расходники.",
	["astralcomp_quokka_eggHint"] = "Боссы 1 или 2 этажа без урона.",
	["astralcomp_quokka_scavenge"] = "Добывает {{obolCount}} тайных оболов при подборе расходников, до {{floorLimit}} раз за этаж.",
	["astralcomp_quokka_maxeffects"] = {
		"7% шанс, что подобранная монета/ключ/бомба даст ещё одну."
	},
	["astralcomp_jackal_name"] = "Шакал",
	["astralcomp_jackal_eggname"] = "Хохочущее яйцо",
	["astralcomp_jackal_obj"] = "Открывай обычные сундуки.",
	["astralcomp_jackal_eggHint"] = "Обычные сундуки (доля: 10% общего шанса найти яйцо).",
	["astralcomp_jackal_scavenge"] = "Добывает {{obolCount}} тайных оболов при открытии обычных сундуков, до {{floorLimit}} раз за этаж.",
	["astralcomp_jackal_maxeffects"] = {
		"+10% шанс, что чемпион при смерти уронит обычный сундук."
	},
	["astralcomp_hound_name"] = "Гончая",
	["astralcomp_hound_eggname"] = "Верное яйцо",
	["astralcomp_hound_obj"] = "Открывай золотые сундуки.",
	["astralcomp_hound_eggHint"] = "Золотые сундуки (доля: 10% общего шанса найти яйцо).",
	["astralcomp_hound_scavenge"] = "Добывает {{obolCount}} тайных оболов при открытии золотых сундуков, до {{floorLimit}} раз за этаж.",
	["astralcomp_hound_maxeffects"] = {
		"+10% шанс создать ещё золотой сундук за зачистку комнаты, до 2 раз за этаж."
	},
	["astralcomp_wolf_name"] = "Волк",
	["astralcomp_wolf_eggname"] = "Воющее яйцо",
	["astralcomp_wolf_obj"] = "Открывай необычные сундуки.",
	["astralcomp_wolf_eggHint"] = "Каменные сундуки (доля: 10% общего шанса найти яйцо).",
	["astralcomp_wolf_scavenge"] = "Добывает {{obolCount}} тайных оболов при открытии необычных сундуков, до {{floorLimit}} раз за этаж.",
	["astralcomp_wolf_maxeffects"] = {
		"+7% шанс, что открытый сундук снова закроется."
	},
	["astralcomp_cosmichound_name"] = "Космическая гончая",
	["astralcomp_cosmichound_eggname"] = "Яйцо Тиндалоса",
	["astralcomp_cosmichound_obj"] = "Открывай сидерические тайники.",
	["astralcomp_cosmichound_eggHint"] = "Сидерические тайники (доля: 25% общего шанса найти яйцо).",
	["astralcomp_cosmichound_scavenge"] = "Добывает {{obolCount}} тайных оболов при открытии сидерических тайников, до {{floorLimit}} раз за этаж.",
	["astralcomp_cosmichound_maxeffects"] = {
		"+5% шанс создать ещё сидерический тайник за зачистку комнаты после первого этажа, до 2 раз за этаж."
	},
	["astralcomp_hellhound_name"] = "Адская гончая",
	["astralcomp_hellhound_eggname"] = "Серное яйцо",
	["astralcomp_hellhound_obj"] = "Убивай горящих врагов.",
	["astralcomp_hellhound_eggHint"] = "Убей горящего босса на Матке или дальше.",
	["astralcomp_hellhound_scavenge"] = "Добывает {{obolCount}} тайных оболов при убийстве горящих врагов, до {{floorLimit}} раз за этаж.",
	["astralcomp_hellhound_maxeffects"] = {
		"+0.5% урона до конца комнаты за каждого убитого горящего врага, до 8%."
	},
	["astralcomp_raiju_name"] = "Райдзю",
	["astralcomp_raiju_eggname"] = "Гальваническое яйцо",
	["astralcomp_raiju_obj"] = "Подбирай батарейки и используй артефакты на батарейках.",
	["astralcomp_raiju_eggHint"] = "Спрятано среди заряженных ключей (доля: 33% общего шанса найти яйцо).",
	["astralcomp_raiju_scavenge"] = "Добывает {{obolCount}} тайных оболов при подборе батареек или использовании артефактов на батарейках хотя бы с 1 зарядом, до {{floorLimit}} раз за этаж.",
	["astralcomp_raiju_maxeffects"] = {
		"В начале первого этажа появляется Старый конденсатор.",
		"Пока у тебя Старый конденсатор, чемпионы и боссы с шансом 20% роняют при смерти микробатарейку, которая исчезает через 7 секунд.",
		"7% шанс создать ещё маленькую батарейку за зачистку комнаты, до 3 раз за этаж."
	},
	["astralcomp_boulderbeetle_name"] = "Валунный жук",
	["astralcomp_boulderbeetle_eggname"] = "Каменистое яйцо",
	["astralcomp_boulderbeetle_obj"] = "Разбивай помеченные камни.",
	["astralcomp_boulderbeetle_eggHint"] = "Помеченные камни (доля: 25% общего шанса найти яйцо).",
	["astralcomp_boulderbeetle_scavenge"] = "Добывает {{obolCount}} тайных оболов при разрушении помеченных камней.",
	["astralcomp_boulderbeetle_maxeffects"] = {
		"При входе в комнату +7% шанс заменить случайный камень помеченным, до 5 раз за этаж."
	},
	["astralcomp_bombardierbeetle_name"] = "Жук-бомбардир",
	["astralcomp_bombardierbeetle_eggname"] = "Хитиновое пороховое яйцо",
	["astralcomp_bombardierbeetle_obj"] = "Разбивай урны.",
	["astralcomp_bombardierbeetle_eggHint"] = "Урны (доля: 10% общего шанса найти яйцо).",
	["astralcomp_bombardierbeetle_scavenge"] = "Добывает {{obolCount}} тайных оболов при разрушении урн, до {{floorLimit}} раз за этаж.",
	["astralcomp_bombardierbeetle_maxeffects"] = {
		"Начинаешь с ещё одной бомбой."
	},
	["astralcomp_deathscarab_name"] = "Скарабей смерти",
	["astralcomp_deathscarab_eggname"] = "Хитиновое смертное яйцо",
	["astralcomp_deathscarab_obj"] = "Разбивай черепа и Наблюдателей.",
	["astralcomp_deathscarab_eggHint"] = "Черепа и Наблюдатели (доля: 10% общего шанса найти яйцо).",
	["astralcomp_deathscarab_scavenge"] = "Добывает {{obolCount}} тайных оболов при разрушении черепов или убийстве Наблюдателей, до {{floorLimit}} раз за этаж.",
	["astralcomp_deathscarab_maxeffects"] = {
		"+7% урона по нежити.",
		"15% шанс создать синюю муху при убийстве нежити, до 10 раз за комнату."
	},
	["astralcomp_pharaohant_name"] = "Фараонов муравей",
	["astralcomp_pharaohant_eggname"] = "Хитиновое мумифицированное яйцо",
	["astralcomp_pharaohant_obj"] = "Убивай нежить.",
	["astralcomp_pharaohant_eggHint"] = "Боссы-нежить (доля: 40% общего шанса найти яйцо).",
	["astralcomp_pharaohant_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве нежити, до {{floorLimit}} раз за этаж.",
	["astralcomp_pharaohant_maxeffects"] = {
		"+15% шанс, что нежить станет чемпионом."
	},
	["astralcomp_clockroach_name"] = "Часоракан",
	["astralcomp_clockroach_eggname"] = "Хитиновое несвоевременное яйцо",
	["astralcomp_clockroach_obj"] = "Убивай замедленных и замороженных врагов.",
	["astralcomp_clockroach_eggHint"] = "Замедленные чемпионы (доля: 10% общего шанса найти яйцо).",
	["astralcomp_clockroach_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве замедленных или замороженных врагов, до {{floorLimit}} раз за этаж.",
	["astralcomp_clockroach_maxeffects"] = {
		"Первый враг, по которому попал в комнате, замедляется на 8 секунд. Не учитывает перезарядку эффектов у боссов."
	},
	["astralcomp_butterfly_name"] = "Бабочка",
	["astralcomp_butterfly_eggname"] = "Порхающее яйцо",
	["astralcomp_butterfly_obj"] = "Входи в необычные комнаты.",
	["astralcomp_butterfly_eggHint"] = "Секретные комнаты на Матке и дальше.",
	["astralcomp_butterfly_scavenge"] = "Добывает {{obolCount}} тайных оболов при первом входе в необычные комнаты.",
	["astralcomp_butterfly_maxeffects"] = {
		"+0.01 к скорости до конца этажа при первом входе в необычные комнаты."
	},
	["astralcomp_lunarmoth_name"] = "Лунный мотылёк",
	["astralcomp_lunarmoth_eggname"] = "Хитиновое лунное яйцо",
	["astralcomp_lunarmoth_obj"] = "Входи в секретные комнаты любого вида.",
	["astralcomp_lunarmoth_eggHint"] = "Суперсекретные комнаты (доля: 33% общего шанса найти яйцо).",
	["astralcomp_lunarmoth_scavenge"] = "Добывает {{obolCount}} тайных оболов при первом входе в секретную комнату любого вида.",
	["astralcomp_lunarmoth_maxeffects"] = {
		"+1% ко всем характеристикам при первом входе в секретную комнату, до 5%. На новом этаже прибавка уменьшается вдвое."
	},
	["astralcomp_crimsonmoth_name"] = "Багровый мотылёк",
	["astralcomp_crimsonmoth_eggname"] = "Хитиновое потустороннее яйцо",
	["astralcomp_crimsonmoth_obj"] = "Входи в красные комнаты.",
	["astralcomp_crimsonmoth_eggHint"] = "Красные комнаты (доля: 8% общего шанса найти яйцо).",
	["astralcomp_crimsonmoth_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при входе в красные комнаты с монстрами, до {{floorLimit}} раз за этаж.",
	["astralcomp_crimsonmoth_maxeffects"] = {
		"В красных комнатах — врождённый эффект Символа баланса, если его у тебя нет.",
		"+3% к скорости в красных комнатах."
	},
	["astralcomp_adder_name"] = "Гадюка",
	["astralcomp_adder_eggname"] = "Зелёное яйцо",
	["astralcomp_adder_obj"] = "Отравляй врагов.",
	["astralcomp_adder_eggHint"] = "Отравленные чемпионы (доля: 8% общего шанса найти яйцо).",
	["astralcomp_adder_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве отравленных врагов, до {{floorLimit}} раз за этаж.",
	["astralcomp_adder_maxeffects"] = {
		"Враги получают на 1% больше урона за каждую оставшуюся секунду отравления.",
		"Отравленные чемпионы на 7% чаще роняют оболы при смерти."
	},
	["astralcomp_watermoccasin_name"] = "Водяной щитомордник",
	["astralcomp_watermoccasin_eggname"] = "Влажное бурое яйцо",
	["astralcomp_watermoccasin_obj"] = "Отравляй врагов, у которых не меньше 40 здоровья.",
	["astralcomp_watermoccasin_eggHint"] = "Боссы Затопленных Пещер (доля: 50% общего шанса найти яйцо).",
	["astralcomp_watermoccasin_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве отравленных врагов, у которых не меньше 40 здоровья, до {{floorLimit}} раз за этаж.",
	["astralcomp_watermoccasin_maxeffects"] = {
		"+0.5% урона до конца комнаты за каждого убитого отравленного врага, до 10%.",
		"+0.05 к удаче до конца этажа за каждого убитого отравленного врага, до +3."
	},
	["astralcomp_blackmamba_name"] = "Чёрная мамба",
	["astralcomp_blackmamba_eggname"] = "Индиговое яйцо",
	["astralcomp_blackmamba_obj"] = "Убивай отравленных врагов.",
	["astralcomp_blackmamba_eggHint"] = "Отравленные боссы после 2 этажа (доля: 40% общего шанса найти яйцо).",
	["astralcomp_blackmamba_scavenge"] = "Добывает {{obolCount}} тайных оболов при убийстве отравленных чемпионов, до {{floorLimit}} раз за этаж.",
	["astralcomp_blackmamba_maxeffects"] = {
		"+0.05 к удаче до конца этажа за каждого убитого отравленного врага, до +3.",
		"Отравленные чемпионы на 7% чаще роняют оболы при смерти."
	},
	["astralcomp_manaviper_name"] = "Мана-гадюка",
	["astralcomp_manaviper_eggname"] = "Яйцо маны",
	["astralcomp_manaviper_obj"] = "Используй активные артефакты. Каждый потраченный заряд — 1 очко прогресса.",
	["astralcomp_manaviper_eggHint"] = "Спрятано среди проданных в магазине расходников (доля: 10% общего шанса найти яйцо).",
	["astralcomp_manaviper_scavenge"] = "Добывает {{obolCount}} тайных оболов при использовании активных артефактов, до {{floorLimit}} раз за этаж.",
	["astralcomp_manaviper_maxeffects"] = {
		"7% шанс создать микробатарейку при использовании активного артефакта хотя бы с 2 зарядами."
	},
	["astralcomp_anaconda_name"] = "Анаконда",
	["astralcomp_anaconda_eggname"] = "Сдавливающее яйцо",
	["astralcomp_anaconda_obj"] = "Окаменяй врагов.",
	["astralcomp_anaconda_eggHint"] = "Окаменевшие чемпионы (доля: 7% общего шанса найти яйцо).",
	["astralcomp_anaconda_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов, впервые окаменив врага, до {{floorLimit}} раз за этаж.",
	["astralcomp_anaconda_maxeffects"] = {
		"+0.5% урона до конца комнаты за каждого убитого окаменевшего врага, до 8%.",
		"Враги получают на 1% больше урона за каждую оставшуюся секунду окаменения."
	},
	["astralcomp_snappingturtle_name"] = "Каймановая черепаха",
	["astralcomp_snappingturtle_eggname"] = "Кусачее яйцо",
	["astralcomp_snappingturtle_obj"] = "Убивай боссов вне комнат босса.",
	["astralcomp_snappingturtle_eggHint"] = "Боссы вне комнат босса на Матке и дальше (доля: 10% общего шанса найти яйцо).",
	["astralcomp_snappingturtle_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве боссов вне комнат босса, до {{floorLimit}} раз за этаж.",
	["astralcomp_snappingturtle_maxeffects"] = {
		"50% шанс заблокировать урон от боссов вне комнат босса. Сработав, шанс до конца забега уменьшается вдвое."
	},
	["astralcomp_alligatorsnappingturtle_name"] = "Грифовая черепаха",
	["astralcomp_alligatorsnappingturtle_eggname"] = "Большое кусачее яйцо",
	["astralcomp_alligatorsnappingturtle_obj"] = "Зачищай комнаты босса.",
	["astralcomp_alligatorsnappingturtle_eggHint"] = "Зачищенные комнаты босса после 1 этажа (доля: 5% общего шанса найти яйцо).",
	["astralcomp_alligatorsnappingturtle_scavenge"] = "Добывает {{obolCount}} тайных оболов за зачистку комнат босса.",
	["astralcomp_alligatorsnappingturtle_maxeffects"] = {
		"25% шанс заблокировать урон в комнатах босса, раз за комнату."
	},
	["astralcomp_mountainshell_name"] = "Горный панцирь",
	["astralcomp_mountainshell_eggname"] = "Горное яйцо",
	["astralcomp_mountainshell_obj"] = "Зачищай комнаты босса без урона.",
	["astralcomp_mountainshell_eggHint"] = "Комнаты босса, зачищенные без урона после 2 этажа (доля: 33% общего шанса найти яйцо).",
	["astralcomp_mountainshell_scavenge"] = "Добывает {{obolCount}} тайных оболов за зачистку комнат босса без урона.",
	["astralcomp_mountainshell_maxeffects"] = {
		"Блокирует первые два удара финальных боссов."
	},
	["astralcomp_culicivora_name"] = "Кулицивора",
	["astralcomp_culicivora_eggname"] = "Снующее тёмное яйцо",
	["astralcomp_culicivora_obj"] = "Убивай кровоточащих врагов.",
	["astralcomp_culicivora_eggHint"] = "Кровоточащие чемпионы после 2 этажа (доля: 8% общего шанса найти яйцо).",
	["astralcomp_culicivora_scavenge"] = "Добывает {{obolCount}} тайных оболов при убийстве кровоточащих врагов, до {{floorLimit}} раз за этаж.",
	["astralcomp_culicivora_maxeffects"] = {
		"+0.5% урона до конца комнаты за каждого убитого кровоточащего врага, до 8%.",
		"Враги получают на 1% больше урона за каждую оставшуюся секунду кровотечения."
	},
	["astralcomp_abyssaltarantula_name"] = "Тарантул бездны",
	["astralcomp_abyssaltarantula_eggname"] = "Снующее яйцо бездны",
	["astralcomp_abyssaltarantula_obj"] = "Пугай врагов.",
	["astralcomp_abyssaltarantula_eggHint"] = "Испуганные чемпионы после 2 этажа (доля: 8% общего шанса найти яйцо).",
	["astralcomp_abyssaltarantula_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве испуганных врагов, до {{floorLimit}} раз за этаж.",
	["astralcomp_abyssaltarantula_maxeffects"] = {
		"+0.5% урона до конца комнаты за каждого убитого испуганного врага, до 8%.",
		"Враги получают на 1% больше урона за каждую оставшуюся секунду страха."
	},
	["astralcomp_jumpingspider_name"] = "Паук-скакун",
	["astralcomp_jumpingspider_eggname"] = "Снующее прыгучее яйцо",
	["astralcomp_jumpingspider_obj"] = "Замедляй врагов дальше 3 клеток от тебя.",
	["astralcomp_jumpingspider_eggHint"] = "Боссы-пауки (доля: 40% общего шанса найти яйцо).",
	["astralcomp_jumpingspider_scavenge"] = "Добывает {{obolCount}} тайных оболов при убийстве замедленных чемпионов и боссов, до {{floorLimit}} раз за этаж.",
	["astralcomp_jumpingspider_maxeffects"] = {
		"+0.5% урона до конца комнаты за каждого убитого замедленного врага, до 8%.",
		"Враги получают на 1% больше урона за каждую оставшуюся секунду замедления."
	},
	["astralcomp_scorpion_name"] = "Скорпион",
	["astralcomp_scorpion_eggname"] = "Хитиновое бурое яйцо",
	["astralcomp_scorpion_obj"] = "Убивай врагов, у которых базового здоровья 6 или меньше.",
	["astralcomp_scorpion_eggHint"] = "Боссы-смертные грехи (доля: 40% общего шанса найти яйцо).",
	["astralcomp_scorpion_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве врагов, у которых базового здоровья 6 или меньше, до {{floorLimit}} раз за этаж.",
	["astralcomp_scorpion_maxeffects"] = {
		"1% шанс уронить 1/2 сердца при убийстве врага, у которого базового здоровья 6 или меньше, до 3 раз за этаж."
	},
	["astralcomp_emperorscorpion_name"] = "Императорский скорпион",
	["astralcomp_emperorscorpion_eggname"] = "Царственное хитиновое яйцо",
	["astralcomp_emperorscorpion_obj"] = "Убивай врагов, у которых базового здоровья от 10 до 30.",
	["astralcomp_emperorscorpion_eggHint"] = "Боссы — супер-грехи (доля: 33% общего шанса найти яйцо).",
	["astralcomp_emperorscorpion_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве врагов, у которых базового здоровья от 10 до 30, до {{floorLimit}} раз за этаж.",
	["astralcomp_emperorscorpion_maxeffects"] = {
		"1% шанс уронить 1/2 синего сердца при убийстве врага, у которого базового здоровья от 10 до 30, до 2 раз за этаж."
	},
	["astralcomp_cosmicjellyfish_name"] = "Космическая медуза",
	["astralcomp_cosmicjellyfish_eggname"] = "Космическое изящное яйцо",
	["astralcomp_cosmicjellyfish_obj"] = "Проходи этажи после первого, сохранив хоть одно синее сердце.",
	["astralcomp_cosmicjellyfish_eggHint"] = "Спрятано среди синих пассивных артефактов (доля: 8% общего шанса найти яйцо).",
	["astralcomp_cosmicjellyfish_scavenge"] = "{{scavChance}}% шанс за каждые 1/2 синего сердца добыть {{obolCount}} тайных оболов, пройдя этаж после первого.",
	["astralcomp_cosmicjellyfish_maxeffects"] = {
		"Входя на этаж после первого, +1% к скорости и скорости полёта слезы на этот этаж за каждое целое синее сердце, до 7%."
	},
	["astralcomp_manticore_name"] = "Мантикора",
	["astralcomp_manticore_eggname"] = "Помесное яйцо",
	["astralcomp_manticore_obj"] = "Убивай врагов под любым эффектом состояния.",
	["astralcomp_manticore_eggHint"] = "Спрятано среди красных пассивных артефактов (доля: 8% общего шанса найти яйцо).",
	["astralcomp_manticore_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов, впервые наложив эффект состояния на босса, до {{floorLimit}} раз за этаж.",
	["astralcomp_manticore_maxeffects"] = {
		"Боссы получают на 2% больше урона за каждый разный эффект состояния, наложенный на них."
	},
	["astralcomp_catoblepas_name"] = "Катоблепас",
	["astralcomp_catoblepas_eggname"] = "Странное окаменевшее яйцо",
	["astralcomp_catoblepas_obj"] = "Окаменяй боссов.",
	["astralcomp_catoblepas_eggHint"] = "Обычные комнаты Преисподней с монстрами (доля: 5% общего шанса найти яйцо).",
	["astralcomp_catoblepas_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов, впервые окаменив босса, до {{floorLimit}} раз за этаж.",
	["astralcomp_catoblepas_maxeffects"] = {
		"Окаменевшие чемпионы на 15% чаще роняют оболы при смерти."
	},
	["astralcomp_skyshark_name"] = "Небесная акула",
	["astralcomp_skyshark_eggname"] = "Парящее острое яйцо",
	["astralcomp_skyshark_obj"] = "Убивай кровоточащих летающих врагов.",
	["astralcomp_skyshark_eggHint"] = "Кровоточащие летающие порченые враги (доля: 20% общего шанса найти яйцо).",
	["astralcomp_skyshark_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве кровоточащих летающих врагов, до {{floorLimit}} раз за этаж.",
	["astralcomp_skyshark_maxeffects"] = {
		"Убийство кровоточащего летающего врага даёт +1% урона на 7 секунд, копится до 8%.",
		"Кровоточащие чемпионы на 7% чаще роняют оболы при смерти."
	},
	["astralcomp_goldendragon_name"] = "Золотой дракон",
	["astralcomp_goldendragon_eggname"] = "Позолоченное яйцо",
	["astralcomp_goldendragon_obj"] = "Побеждай финальных боссов.",
	["astralcomp_goldendragon_eggHint"] = "Финальные боссы (доля: 50% общего шанса найти яйцо).",
	["astralcomp_goldendragon_scavenge"] = "Добывает {{obolCount}} тайных оболов за победу над финальным боссом, раз за забег.",
	["astralcomp_goldendragon_maxeffects"] = {
		"+7% урона по финальным боссам."
	},
	["astralcomp_shadowdragon_name"] = "Теневой дракон",
	["astralcomp_shadowdragon_eggname"] = "Теневое яйцо",
	["astralcomp_shadowdragon_obj"] = "Заключай сделки с Дьяволом.",
	["astralcomp_shadowdragon_eggHint"] = "Спрятано среди сделок с Дьяволом (доля: 10% общего шанса найти яйцо).",
	["astralcomp_shadowdragon_scavenge"] = "Добывает {{obolCount}} тайных оболов за сделки с Дьяволом.",
	["astralcomp_shadowdragon_maxeffects"] = {
		"+2% урона за каждую сделку с Дьяволом, до 16%."
	},
	["astralcomp_pearldragon_name"] = "Жемчужный дракон",
	["astralcomp_pearldragon_eggname"] = "Жемчужное яйцо",
	["astralcomp_pearldragon_obj"] = "Получай ангельские пассивные артефакты и побеждай боссов-Ангелов.",
	["astralcomp_pearldragon_eggHint"] = "Комнаты Ангела (доля: 20% общего шанса найти яйцо).",
	["astralcomp_pearldragon_scavenge"] = "Добывает {{obolCount}} тайных оболов, впервые получив ангельский пассивный артефакт или победив босса-Ангела.",
	["astralcomp_pearldragon_maxeffects"] = {
		"+2% урона при первом за этаж входе в комнату Ангела, до 10%."
	},
	["astralcomp_icebeast_name"] = "Ледяной зверь",
	["astralcomp_icebeast_eggname"] = "Ледяное яйцо",
	["astralcomp_icebeast_obj"] = "Разбивай замёрзших монстров.",
	["astralcomp_icebeast_eggHint"] = "Замёрзшие монстры, у которых не меньше 20 здоровья (доля: 10% общего шанса найти яйцо).",
	["astralcomp_icebeast_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов, разбив замёрзшего монстра, у которого не меньше 20 здоровья, до {{floorLimit}} раз за этаж.",
	["astralcomp_icebeast_maxeffects"] = {
		"+1% урона до конца этажа за каждые 8 разбитых замёрзших монстров, до 8%."
	},
	["astralcomp_gildedgolem_name"] = "Позолоченный голем",
	["astralcomp_gildedgolem_eggname"] = "Яйцо из чистого золота",
	["astralcomp_gildedgolem_obj"] = "Покупай товары в магазине.",
	["astralcomp_gildedgolem_eggHint"] = "Спрятано среди товаров магазина дороже 9 монет (доля: 10% общего шанса найти яйцо).",
	["astralcomp_gildedgolem_scavenge"] = "Добывает {{obolCount}} тайных обол(а) за каждую потраченную в магазине монету, до {{floorLimit}} за этаж.",
	["astralcomp_gildedgolem_maxeffects"] = {
		"+1% урона до конца этажа за каждую покупку в магазине, до 10%."
	},
	["astralcomp_salamander_name"] = "Саламандра",
	["astralcomp_salamander_eggname"] = "Сердечное яйцо",
	["astralcomp_salamander_obj"] = "Подбирай красные сердца.",
	["astralcomp_salamander_eggHint"] = "Спрятано среди красных сердец (доля: 2% общего шанса найти яйцо).",
	["astralcomp_salamander_scavenge"] = "Добывает {{obolCount}} тайных оболов при подборе красных сердец, до {{floorLimit}} раз за этаж.",
	["astralcomp_salamander_maxeffects"] = {
		"+1% к удаче до конца этажа при подборе красных сердец, до 20%."
	},
	["astralcomp_warg_name"] = "Варг",
	["astralcomp_warg_eggname"] = "Яйцо бросающего вызов",
	["astralcomp_warg_obj"] = "Зачищай комнаты испытаний.",
	["astralcomp_warg_eggHint"] = "Комнаты испытаний.",
	["astralcomp_warg_scavenge"] = "Добывает {{obolCount}} тайных оболов за зачистку комнат испытаний.",
	["astralcomp_warg_maxeffects"] = {
		"+1% ко всем характеристикам за зачистку комнаты испытаний, до 7% за забег."
	},
	["astralcomp_dreamsheep_name"] = "Овца снов",
	["astralcomp_dreamsheep_eggname"] = "Мечтательное яйцо",
	["astralcomp_dreamsheep_obj"] = "Получай опыт.",
	["astralcomp_dreamsheep_eggHint"] = "Чистая спальня.",
	["astralcomp_dreamsheep_scavenge"] = "Добывает ({{obolCount}} + этаж) тайных оболов за зачистку комнаты, пока на этом этаже ты не получал урона.",
	["astralcomp_dreamsheep_maxeffects"] = {
		"+15% к опыту и найденным оболам, пока на этом этаже ты не получал урона.",
		"Впервые за этаж получив урон, 15% шанс создать 1/2 синего сердца, если синих сердец меньше 2."
	},
	["astralcomp_bluecap_name"] = "Синешапка",
	["astralcomp_bluecap_eggname"] = "Синее грибное яйцо",
	["astralcomp_bluecap_obj"] = "Пей пилюли и разбивай грибы.",
	["astralcomp_bluecap_eggHint"] = "Грибы (доля: 10% общего шанса найти яйцо).",
	["astralcomp_bluecap_scavenge"] = "Добывает {{obolCount}} тайных оболов, когда пьёшь пилюли и разбиваешь грибы, до {{floorLimit}} раз за этаж.",
	["astralcomp_bluecap_maxeffects"] = {
		"+1% урона за каждую выпитую пилюлю, до 7%. Сбрасывается на новом этаже.",
		"Чемпионы с шансом 7% роняют при смерти ещё случайную пилюлю, раз за этаж."
	},
	["astralcomp_blastfiend_name"] = "Взрывобес",
	["astralcomp_blastfiend_eggname"] = "Взрывное яйцо",
	["astralcomp_blastfiend_obj"] = "Убивай врагов взрывами.",
	["astralcomp_blastfiend_eggHint"] = "Боссы Шахт или Зольника (доля: 20% общего шанса найти яйцо).",
	["astralcomp_blastfiend_scavenge"] = "Добывает {{obolCount}} тайных оболов при убийстве чемпионов и боссов взрывами.",
	["astralcomp_blastfiend_maxeffects"] = {
		"Чемпионы с шансом 12% роняют при смерти бомбу для броска, которая исчезает через 6 секунд, до 2 раз за комнату.",
		"Взрывы брошенных бомб больше не ранят тебя."
	},
	["astralcomp_brainworm_name"] = "Мозговой червь",
	["astralcomp_brainworm_eggname"] = "Синаптическое яйцо",
	["astralcomp_brainworm_obj"] = "Наноси урон спутниками.",
	["astralcomp_brainworm_eggHint"] = "Спрятано среди артефактов-малышей (доля: 40% общего шанса найти яйцо).",
	["astralcomp_brainworm_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов, когда твой спутник убивает врага, до {{floorLimit}} раз за этаж.",
	["astralcomp_brainworm_maxeffects"] = {
		"+0.5% к урону и удаче за каждый полученный артефакт-спутник, до 10%."
	},
	["astralcomp_lingeringshadow_name"] = "Затаившаяся тень",
	["astralcomp_lingeringshadow_eggname"] = "Сумрачное яйцо",
	["astralcomp_lingeringshadow_obj"] = "Подбирай чёрные сердца.",
	["astralcomp_lingeringshadow_eggHint"] = "Спрятано среди чёрных сердец (доля: 6% общего шанса найти яйцо).",
	["astralcomp_lingeringshadow_scavenge"] = "Добывает {{obolCount}} тайных оболов при подборе чёрных сердец, до {{floorLimit}} раз за этаж.",
	["astralcomp_lingeringshadow_maxeffects"] = {
		"+0.5% урона за каждые 1/2 чёрного сердца, до 6%. Получив урон, прибавка удваивается на 6 секунд.",
		"+2% к удаче, пока есть хоть одно чёрное сердце."
	},
	["astralcomp_trapdoorspider_name"] = "Паук-люкостроитель",
	["astralcomp_trapdoorspider_eggname"] = "Яйцо в земле",
	["astralcomp_trapdoorspider_obj"] = "Спускайся в лазы.",
	["astralcomp_trapdoorspider_eggHint"] = "Лазы после первого этажа (доля: 50% общего шанса найти яйцо).",
	["astralcomp_trapdoorspider_scavenge"] = "Добывает {{obolCount}} тайных оболов, когда спускаешься в лаз, раз за этаж.",
	["astralcomp_trapdoorspider_maxeffects"] = {
		"Входя на новый этаж, 10% шанс создать перевёрнутую карту XXI - Мир, до 2 раз за забег.",
		"Если на прошлом этаже ты не спускался в лаз, шанс вдвое выше."
	},
	["astralcomp_starcursedmass_name"] = "Звёздно-проклятая масса",
	["astralcomp_starcursedmass_eggname"] = "Звёздно-проклятое яйцо",
	["astralcomp_starcursedmass_obj"] = "Проходи этажи после первого хотя бы с 1 звёздной мощью. Каждая единица звёздной мощи — 1 очко прогресса.",
	["astralcomp_starcursedmass_eggHint"] = "Прохождение этажей после первого (доля: 1% за каждые 50 звёздной мощи).",
	["astralcomp_starcursedmass_scavenge"] = "Добывает {{obolCount}} тайных обол(а) за каждые 100 звёздной мощи, пройдя этаж после первого.",
	["astralcomp_starcursedmass_maxeffects"] = {
		"+1% к удаче и найденным оболам за каждые 100 звёздной мощи, до 12% (один раз в начале забега).",
		"+1% ко всем характеристикам за каждые 300 звёздной мощи."
	},
	["astralcomp_scintillatinggolem_name"] = "Мерцающий голем",
	["astralcomp_scintillatinggolem_eggname"] = "Мерцающее яйцо",
	["astralcomp_scintillatinggolem_obj"] = "Убивай врагов лазерами.",
	["astralcomp_scintillatinggolem_eggHint"] = "Чемпионы, убитые лазерами (доля: 7% общего шанса найти яйцо).",
	["astralcomp_scintillatinggolem_scavenge"] = "{{scavChance}}% шанс добыть {{obolCount}} тайных оболов при убийстве чемпионов и боссов лазерами, до {{floorLimit}} раз за этаж.",
	["astralcomp_scintillatinggolem_maxeffects"] = {
		"+10% урона лазерами при входе в комнату с монстрами; за 10 секунд прибавка спадает до 0%.",
		"Вход в новую комнату обновляет эффект."
	},
}
