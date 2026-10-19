-- localfixes: Passive Skill Trees по-русски — интерфейс и всплывающий текст (17.10, слова пользователя «Нет нет нет ты
-- не все перевел»; «Player Skill tree»). Ключи — как в scripts/locale/en/en_ui.lua мода; подстановки {{…}} не трогать.
-- Подключение — ru_pst.lua. Словарь: Skill Points — очки навыков (ОН), Respec — сброс, Allocate — «Вложить»,
-- Global Tree — Общее дерево, Starmight — звёздная мощь, Obols — оболы, Starcursed Jewel — звёздно-проклятый самоцвет.
return {
	---- ИНТЕРФЕЙС ----
	["ui_cosmicR_unlocksPlayingAs"] = "Теперь можно получать открытия, как будто играешь за {{tmpCharName}}.",
	["ui_cosmicR_respecDeselect"] = "Нажми кнопку «Сброс узла», чтобы снять выбор с этого персонажа.",
	["ui_cosmicR_EtoPick"] = "(E — выбрать персонажа)",
	["ui_cosmicR_unlockChar"] = "Открой персонажа {{charName}}, чтобы включить эту возможность.",

	["ui_globalTree"] = "Общее дерево",
	["ui_charTreeName"] = "Дерево: {{charName}}",
	["ui_charTreeAccessHint"] = "Q — открыть дерево: {{charName}}.",

	["ui_starTree"] = "Звёздное дерево",
	["ui_starTree_EtoView"] = "(E — открыть Звёздное дерево)",
	["ui_totalStarmight"] = "Звёздная мощь: всего {{starmight}}",
	["ui_starmightBonuses"] = "Бонусы звёздной мощи",
	["ui_starTree_levelReqWarn"] = "Достигни уровня {{levelReq}} хотя бы одним персонажем, чтобы открыть.",
	["ui_starmight"] = "Звёздная мощь",

	["ui_arcaneAstrolabe"] = "Тайная астролябия",
	["ui_siderealTree"] = "Сидерическое дерево",
	["ui_timelessBazaar"] = "Вечный базар",
	["ui_selScreenToSwitch"] = "Выбери дерево или экран для перехода",
	["ui_locked"] = "закрыто",
	["ui_Locked"] = "Закрыто",
	["ui_cost"] = "Цена",

	["ui_treeEffectsDisabled"] = "Эффекты дерева отключены",
	["ui_treeReenableHint"] = "Shift + Q — включить снова",

	["ui_helpToggleHint1"] = "H / Select: справка",
	["ui_helpToggleHint2"] = "Tab: быстрый выбор меню",

	["ui_inRunNonDynamic"] = "В ЗАБЕГЕ — изменения дерева вступят в силу в следующем забеге",

	["ui_cosmicRealignment"] = "Космическое смещение",

	["ui_crimsonConvergence"] = "Багровое схождение",
	["ui_Universal Crimson Node"] = "Всеобщий багровый узел",
	["ui_Core Crimson Node"] = "Основной багровый узел",
	["ui_Divergent Crimson Node"] = "Расходящийся багровый узел",

	["ui_edenHairdo"] = "Причёска Эдема",

	["ui_infectiousMeridion"] = "Заразный меридион",

	["ui_poison"] = "яд",
	["ui_fear"] = "страх",
	["ui_charm"] = "очарование",
	["ui_slow"] = "замедление",
	["ui_burn"] = "горение",

	["ui_obscureBazaar"] = "Тёмный базар",

	["ui_ancJewelsFound"] = "Найдено древних самоцветов",

	["ui_bazaarRefresh"] = "Обновление базара",
	["ui_allocBazaarRefresh"] = "Вложи очко в узел «Обновление базара», чтобы открыть.",
	["ui_bazaarRefreshSpent"] = "Обновление в этом цикле базара уже потрачено.",
	["ui_bazaarHoldPurchase"] = "Удерживай «Вложить» 1 секунду, чтобы купить этот предмет.",
	["ui_bazaarPurchaseOptionRem"] = "Покупка этого предмета уберёт остальные варианты!",
	["ui_bazaarHoldRefresh"] = "Удерживай «Сброс» 1 секунду, чтобы обновить выбор предметов.",
	["ui_bazaarHoldRefresh2"] = "Это уберёт все купленные предметы!",
	["ui_bazaarrefreshCost"] = "Обновление стоит {{SP}} общих ОН, {{obols}} оболов и {{respecs}} сбросов.",
	["ui_offeredItems"] = "Предложенные предметы",
	["ui_leftRightSelItem"] = "Влево/вправо — выбор предмета.",
	["ui_freezeItems"] = "Q — заморозить/разморозить предложенные предметы.",
	["ui_bazaarChanceToKeepItems"] = "{{chance}}% шанс сохранить остальные варианты при покупке.",

	["ui_frozen"] = "заморожено",

	["ui_goldenTrinketsUnlocked"] = "Золотые брелоки открыты.",
	["ui_goldenTrinketsNotUnlocked"] = "Золотые брелоки не открыты.",

	["ui_grandIngredientWarn"] = "Вложено больше 2 узлов «Великий ингредиент»!",

	["ui_tSirenBossRushWarn"] = "Нет прохождения Босс-раша за Порченую Сирену!",
	["ui_tSirenHushWarn"] = "Нет прохождения Хаша за Порченую Сирену!",
	["ui_tSirenSoulComp"] = "Босс-раш и Хаш пройдены.",

	["ui_jewels_respecUnsocket"] = "Нажми «Сброс узла», чтобы вынуть самоцвет из гнезда.",
	["ui_jewels_invKey"] = "(E — открыть/закрыть инвентарь)",
	["ui_jewels_respecDestroy"] = "Нажми «Сброс узла», чтобы уничтожить этот самоцвет.",
	["ui_jewels_respecRemBoss"] = "Нажми «Сброс узла», чтобы убрать обращённого босса.",
	["ui_starcursedJewel"] = "Звёздно-проклятый самоцвет",
	["ui_AzureJewel"] = "Лазурный звёздно-проклятый самоцвет",
	["ui_AzureJewels"] = "Лазурные звёздно-проклятые самоцветы",
	["ui_CrimsonJewel"] = "Багровый звёздно-проклятый самоцвет",
	["ui_CrimsonJewels"] = "Багровые звёздно-проклятые самоцветы",
	["ui_ViridianJewel"] = "Изумрудный звёздно-проклятый самоцвет",
	["ui_ViridianJewels"] = "Изумрудные звёздно-проклятые самоцветы",
	["ui_AncientJewel"] = "Древний звёздно-проклятый самоцвет",
	["ui_AncientJewels"] = "Древние звёздно-проклятые самоцветы",

	["ui_jewelLoadout"] = "Набор самоцветов",
	["ui_jewelInLoadout"] = "Самоцвет есть в одном или нескольких наборах!",
	["ui_allocSaveLoadout"] = "Нажми «Вложить», чтобы сохранить текущую раскладку самоцветов в этот набор.",
	["ui_shiftAllocLoadout"] = "Shift + «Вложить» — переключиться на этот набор.",
	["ui_loadoutSwitchEmptyWarn"] = "Набор пуст — это снимет все самоцветы!",
	["ui_respecDeleteLoadout"] = "Удерживай «Сброс» 1 секунду, чтобы удалить этот набор.",
	["ui_ctrlLoadoutDesc"] = "Ctrl — листать показанные бонусы.",

	["ui_astralForgeKey"] = "Нажми «Вложить», чтобы открыть меню Астральной кузни.",

	["ui_purchItems"] = "Купленные предметы:",

	["ui_currentChar"] = "Текущий персонаж",
	["ui_skillPoints"] = "очки навыков",
	["ui_SkillPoints"] = "Очки навыков",

	["ui_globalSPConvDesc1"] = "После вложения нажми «Вложить», чтобы обменять тайные оболы на общее очко навыков.",
	["ui_globalSPConvDesc2"] = "Чем чаще обмениваешь за текущего персонажа, тем дороже обмен в оболах.",
	["ui_globalSPConvKey"] = "Нажми «Вложить», чтобы обменять:",
	["ui_globalSPConvRate"] = "{{obols}} оболов на 1 общее очко навыков.",

	["ui_tabNumsToSwitch"] = "TAB или цифры 1 2 3 — переключение вкладок",

	["ui_charLoadError"] = "Не удалось загрузить данные текущего персонажа.",

	["ui_selSeptentrions"] = "Выбранные северные артефакты:",
	["ui_noSelSeptentrions"] = "Северные артефакты не выбраны",
	["ui_selMeridions"] = "Выбранные южные артефакты:",
	["ui_noSelMeridions"] = "Южные артефакты не выбраны",
	["ui_selArtifacts"] = "Выбирай артефакты, вкладываясь в них, — бесплатно.",
	["ui_infMeridionDesc"] = "После вложения нажми «Вложить», чтобы выбрать эффект импульса. По умолчанию — яд.",
	["ui_maxSeptentrionsWarn"] = "Выбрано максимум северных артефактов! Сбрось другой артефакт, чтобы выбрать этот.",
	["ui_maxMeridionsWarn"] = "Выбрано максимум южных артефактов! Сбрось другой артефакт, чтобы выбрать этот.",
	["ui_pulseInflict"] = "Импульс накладывает",

	["ui_siderealNodeWarning"] = "ВАЖНО: узлы Сидерического дерева не действуют вне экспедиций, пока не вложено «Сидерическая универсализация».",

	["ui_selected"] = "Выбрано",
	["ui_selNode"] = "Выбранный узел",
	["ui_unlock"] = "Открытие",
	["ui_defUnlock"] = "Открытие по умолчанию",
	["ui_obols"] = "оболы",
	["ui_arcaneObols"] = "Тайные оболы",
	["ui_mighty"] = "Могучий",
	["ui_globalSP"] = "Общие ОН",
	["ui_characterSkillPoint"] = "Очко навыка персонажа",
	["ui_crimsonCore"] = "Багровое звёздное ядро",
	["ui_crimsonCores"] = "Багровые звёздные ядра",
	["ui_none"] = "Нет",
	["ui_uber"] = "Убер",
	["ui_items"] = "Предметы",
	["ui_respecs"] = "сбросы",
	["ui_Respecs"] = "Сбросы",
	["ui_upgraded"] = "Улучшено",
	["ui_attempts"] = "Попытки",
	["ui_compNodes"] = "Пройденные узлы",
	["ui_compNode"] = "Пройденный узел",
	["ui_depth"] = "Глубина",
	["ui_char"] = "Перс.",
	["ui_unkItem"] = "Неизвестный предмет",
	["ui_expedition"] = "Экспедиция",
	["ui_effects"] = "Эффекты",
	["ui_objective"] = "Цель",
	["ui_unkCurse"] = "Неизвестное проклятие",
	["ui_unkReward"] = "Неизвестная награда",
	["ui_shrouded"] = "Сокрыто",
	["ui_reward"] = "Награда",
	["ui_gain"] = "Получить",
	["ui_globalSkillPoints"] = "Общие очки навыков",
	["ui_globalSkillPointsPL"] = "Общие очки навыков",
	["ui_done"] = "Готово",
	["ui_inventory"] = "Инвентарь",
	["ui_socket"] = "Гнездо",
	["ui_Rarity"] = "Редкость",

	["ui_normal"] = "обычный",
	["ui_Normal"] = "Обычный",
	["ui_magic"] = "магический",
	["ui_Magic"] = "Магический",
	["ui_ancient"] = "древний",
	["ui_Ancient"] = "Древний",

	["ui_Implicit"] = "Врождённое",
	["ui_Implicits"] = "Врождённые",

	["ui_Tier"] = "Ступень",

	["ui_prev"] = "Назад",
	["ui_next"] = "Далее",
	["ui_back"] = "Назад",

	["ui_Level"] = "Уровень",
	["ui_Progress"] = "Прогресс",

	["ui_convBoss"] = "Обращённый босс",

	["ui_crackedKey"] = "Треснувший ключ",
	["ui_runeShard"] = "Осколок руны",
	["ui_holyCard"] = "Святая карта",

	["ui_ephBond"] = "Мимолётная связь",

	["ui_sparkStardust"] = "Искристая звёздная пыль",
	["ui_ancStardust"] = "Древняя звёздная пыль",

	["ui_ancStardustDesc"] = {
		"Древняя звёздная пыль нужна, чтобы улучшать древнее оружие в Астральной кузне."
	},

	["ui_charCrimsonCores"] = "Багровых звёздных ядер у {{charName}}: {{cores}}",
	["ui_crimConvCrimsonCores"] = "Действующих багровых ядер для схождения: {{cores}}/{{maxCores}}",
	["ui_crimConvEffCoreTip"] = "Предел растёт на 1 за каждые 2 открытые глубины обычных экспедиций и",
	["ui_crimConvEffCoreTip2"] = "на 2 за каждую открытую глубину убер-экспедиций.",

	["ui_nonDynamicWarn"] = "Этот узел не поддерживает живой режим дерева и применяется только в начале забега.",

	["ui_allocToSelNode"] = "Нажми «Вложить», чтобы выбрать этот узел.",

	["ui_theCurrentChar"] = "текущего персонажа",
	["ui_obsBazaarHoverDesc"] = "{{itemName}} для персонажа {{charName}}.",

	["ui_charObols"] = "Оболы ({{charName}}): {{obols}}",
	["ui_costsObols"] = "Стоит {{price}} тайных оболов.",
	["ui_allocPurchase"] = "Нажми «Вложить», чтобы купить.",

	["ui_wepCompendium"] = "Справочник оружия",
	["ui_wepCompendiumKey"] = "Нажми «Вложить», чтобы посмотреть доступное древнее оружие этого типа.",

	["ui_wepType"] = "Тип оружия",
	["ui_ancWep"] = "Древнее оружие",

	["ui_cantProgInRun"] = "В этом забеге продвинуться нельзя — начни новый",

	["ui_openTreeKey"] = "V / LB — открыть дерево",
	["ui_treeDisabled"] = "дерево отключено",

	["ui_dataLossDetected"] = "Обнаружена потеря данных",
	["ui_backupWarn1"] = "Похоже, данные могли потеряться, а резервные копии есть.",
	["ui_backupWarn2"] = "Вверх/вниз — выбрать копию, E — попробовать загрузить её.",
	["ui_backupWarn3"] = "ESC / Назад — закрыть окно.",
	["ui_backupWarn4"] = "Окно перестанет появляться, когда общий уровень станет выше 1",
	["ui_loadBackupHint"] = "E / кнопка действия — загрузить эту копию",

	["ui_activemods"] = "Действующие модификаторы",
	["ui_modcategory_stats"] = "Общие изменения характеристик",
	["ui_modcategory_condstats"] = "Изменения характеристик по условию",
	["ui_modcategory_xp"] = "Опыт и сбросы",
	["ui_modcategory_misc"] = "Разное",

	["ui_momheartproc_inactive"] = "Не действует, пока снова не побеждено Сердце Мамы",

	---- ВСПЛЫВАЮЩИЙ ТЕКСТ ----
	["ftxt_sinistralRunemaster"] = "Левый мастер рун",
	["ftxt_dextralRunemaster"] = "Правый мастер рун",
	["ftxt_chromDissonance"] = "Хроматический диссонанс",
	["ftxt_ancJewelObj"] = "Цель древнего самоцвета выполнена!",
	["ftxt_tBombDisarm"] = "Бомба-ловушка обезврежена",
	["ftxt_entanglement"] = "Запутанность!",
	["ftxt_blessedCrucifix"] = "Благословенное распятие",
	["ftxt_sanguinisProc"] = "-- Сангвинис --",
	["ftxt_itemsProt"] = "Предметы защищены",
	["ftxt_growingContrition"] = "Растущее раскаяние",
	["ftxt_bossConv"] = "Босс обращён!",
	["ftxt_darkBestowal"] = "Тёмный дар",
	["ftxt_gildedPennyTrinket"] = "Брелок-пенни позолочен",
	["ftxt_darkProt"] = "Тёмная защита!",
	["ftxt_bloodCrownedNoMore"] = "Больше не коронован кровью...",
	["ftxt_qualConv"] = "Качество {{oldQual}} -> {{newQual}}",
	["ftxt_rerollIntoFam"] = "Переброшено в фамильяра!",
	["ftxt_curseOfTIsaac"] = "Проклятие П. Исаака",
	["ftxt_deathTrial"] = "Испытание Смерти!",
	["ftxt_deathTrialComp"] = "Испытание Смерти пройдено!",
	["ftxt_respecGain"] = "+{{respecs}} сброс(ов)",
	["ftxt_smeltedPennyT"] = "Брелок-пенни переплавлен",
	["ftxt_deferAegis"] = "Отложенная эгида",
	["ftxt_stairwayBoon"] = "Дар Лестницы",
	["ftxt_expedBegin"] = "Начало экспедиции: глубина {{depth}}",
	["ftxt_uberExpedBegin"] = "Начало убер-экспедиции: глубина {{depth}}",
	["ftxt_natCurseCleanse"] = "Естественное проклятие снято!",
	["ftxt_spiritGambler"] = "Игрок с духами",
	["ftxt_mapReveal"] = "Карта открыта!",
	["ftxt_trinketSmelt"] = "Брелок переплавлен!",
	["ftxt_normalizedVit"] = "Выровненная живучесть",
	["ftxt_glassPiece"] = "Осколок стекла",
	["ftxt_plusQual"] = "+1 к качеству",
	["ftxt_jewelInvFull"] = "Инвентарь самоцветов полон!",
	["ftxt_trinketGilded"] = "Брелок позолочен!",
	["ftxt_keeperCurse"] = "Проклятие Хранителя",
	["ftxt_transmuted"] = "Преобразовано!",
	["ftxt_gainWispItem"] = "Получен артефакт-огонёк!",
	["ftxt_suddenDeath"] = "!!ВНЕЗАПНАЯ СМЕРТЬ!!",
	["ftxt_stolen"] = "Украдено!",
	["ftxt_freeUse"] = "Бесплатно!",
	["ftxt_couponToSale"] = "Купон -> Распродажа в Steam",
	["ftxt_levelUp"] = "Новый уровень!",
	["ftxt_globalLevelUp"] = "Новый общий уровень!",
	["ftxt_donoMachineRestore"] = "Автомат пожертвований восстановлен!",
	["ftxt_selQueueNode"] = "Выбран узел из очереди",
	["ftxt_bloodMoonRev"] = "Кровавая луна открывает...",
}
