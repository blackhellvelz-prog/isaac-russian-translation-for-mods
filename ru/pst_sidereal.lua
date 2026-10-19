-- localfixes: Passive Skill Trees по-русски — Сидерическое дерево (en_siderealTreeNodes.lua мода), 17.10.
-- Словарь: Sidereal — сидерический, Arcane Obols — тайные оболы, Sidereal Cache — сидерический тайник, Astral Weapon —
-- астральное оружие, Septentrion — септентрион (северный артефакт), Meridion — меридион (южный артефакт),
-- Crimson Starcore — багровое звёздное ядро, Stardust — звёздная пыль.
return {
	["node_siderealvicinity_name"] = "Сидерическая окрестность",
	["node_siderealregion_name"] = "Сидерическая область",
	["node_siderealexpanse_name"] = "Сидерический простор",
	["node_siderealtravel"] = "Узел пути по Сидерическому дереву. Вложение не стоит общих ОН — вместо них тайные оболы.",
	["node_astralforge_name"] = "Астральная кузня",
	["node_astralforge"] = {
		"Открывает Астральную кузню и астральное оружие.",
		"После вложения нажми «Вложить», чтобы открыть меню кузни."
	},
	["node_bossastralweprate_name"] = "Астральное оружие с боссов",
	["node_bossastralweprate"] = {
		"+{{astralWepBossRate}}% шанс, что босс при смерти уронит астральное оружие, до 4 за комнату.",
		"Если общий шанс выше 100%, бросок на несколько штук."
	},
	["node_magicastralweps_name"] = "Магическое астральное оружие",
	["node_magicastralweps"] = "+{{astralWepMagicRate}}% шанс, что выпавшее астральное оружие будет магическим.",
	["node_ancientastralweps_name"] = "Древнее астральное оружие",
	["node_ancientastralweps"] = "+{{astralWepAncientRate}}% шанс, что выпавшее астральное оружие будет древним.",
	["node_wepdrop_longsword_name"] = "Выпадение оружия: длинные мечи",
	["node_wepdrop_longsword"] = "+{{astralWepRateLongsword}}% шанс, что выпавшее астральное оружие будет длинным мечом.",
	["node_wepdrop_estoc_name"] = "Выпадение оружия: эстоки",
	["node_wepdrop_estoc"] = "+{{astralWepRateEstoc}}% шанс, что выпавшее астральное оружие будет эстоком.",
	["node_wepdrop_dagger_name"] = "Выпадение оружия: кинжалы",
	["node_wepdrop_dagger"] = "+{{astralWepRateDagger}}% шанс, что выпавшее астральное оружие будет кинжалом.",
	["node_wepdrop_quickblade_name"] = "Выпадение оружия: быстрые клинки",
	["node_wepdrop_quickblade"] = "+{{astralWepRateQuickblade}}% шанс, что выпавшее астральное оружие будет быстрым клинком.",
	["node_wepdrop_spear_name"] = "Выпадение оружия: копья",
	["node_wepdrop_spear"] = "+{{astralWepRateSpear}}% шанс, что выпавшее астральное оружие будет копьём.",
	["node_wepdrop_trident_name"] = "Выпадение оружия: трезубцы",
	["node_wepdrop_trident"] = "+{{astralWepRateTrident}}% шанс, что выпавшее астральное оружие будет трезубцем.",
	["node_wepdrop_scythe_name"] = "Выпадение оружия: косы",
	["node_wepdrop_scythe"] = "+{{astralWepRateScythe}}% шанс, что выпавшее астральное оружие будет косой.",
	["node_wepdrop_axe_name"] = "Выпадение оружия: топоры",
	["node_wepdrop_axe"] = "+{{astralWepRateAxe}}% шанс, что выпавшее астральное оружие будет топором.",
	["node_wepdrop_greataxe_name"] = "Выпадение оружия: секиры",
	["node_wepdrop_greataxe"] = "+{{astralWepRateGreataxe}}% шанс, что выпавшее астральное оружие будет секирой.",
	["node_wepdrop_shortbow_name"] = "Выпадение оружия: короткие луки",
	["node_wepdrop_shortbow"] = "+{{astralWepRateShortbow}}% шанс, что выпавшее астральное оружие будет коротким луком.",
	["node_wepdrop_bow_name"] = "Выпадение оружия: луки",
	["node_wepdrop_bow"] = "+{{astralWepRateBow}}% шанс, что выпавшее астральное оружие будет луком.",
	["node_wepdrop_crossbow_name"] = "Выпадение оружия: арбалеты",
	["node_wepdrop_crossbow"] = "+{{astralWepRateCrossbow}}% шанс, что выпавшее астральное оружие будет арбалетом.",
	["node_wepdrop_gauntlet_name"] = "Выпадение оружия: латные перчатки",
	["node_wepdrop_gauntlet"] = "+{{astralWepRateGauntlet}}% шанс, что выпавшее астральное оружие будет латными перчатками.",
	["node_wepdrop_greatmace_name"] = "Выпадение оружия: большие булавы",
	["node_wepdrop_greatmace"] = "+{{astralWepRateGreatMace}}% шанс, что выпавшее астральное оружие будет большой булавой.",
	["node_wepdrop_whip_name"] = "Выпадение оружия: кнуты",
	["node_wepdrop_whip"] = "+{{astralWepRateWhip}}% шанс, что выпавшее астральное оружие будет кнутом.",
	["node_sidecachechanceboost_name"] = "Шанс сидерических тайников",
	["node_sidecachechanceboost"] = {
		"При входе на новый этаж +{{sideCacheFloorChance}}% ко всем источникам сидерических тайников из других узлов.",
		"Не действует во время Восхождения."
	},
	["node_sidecachechall_name"] = "Сидерические тайники: комнаты испытаний",
	["node_sidecachechall"] = "{{sideCacheChallenge}}% шанс, что за зачистку комнаты испытаний выпадет сидерический тайник.",
	["node_sidecachebossroom_name"] = "Сидерические тайники: комнаты босса",
	["node_sidecachebossroom"] = "{{sideCacheBoss}}% шанс, что за зачистку комнаты босса после первого этажа выпадет сидерический тайник.",
	["node_sidecacheregchest_name"] = "Сидерические тайники: обычные сундуки",
	["node_sidecacheregchest"] = {
		"{{sideCacheRegChest}}% шанс, что появившийся обычный сундук заменится сидерическим тайником.",
		"Действует на 2 сундука за комнату."
	},
	["node_sidecachekeycons_name"] = "Сидерические тайники без ключей",
	["node_sidecachekeycons"] = "{{sideCacheNoKey}}% шанс, что сидерический тайник откроется без ключа.",
	["node_sidecachereplica_name"] = "Размножение сидерических тайников",
	["node_sidecachereplica"] = "{{sideCacheReplica}}% шанс, что открытый сидерический тайник уронит ещё один тайник, раз за комнату.",
	["node_sidecachesacks_name"] = "Мешки из сидерических тайников",
	["node_sidecachesacks"] = "{{sideCacheSacks}}% шанс, что открытый сидерический тайник уронит ещё 1-2 мешка.",
	["node_sidecacheastralweps_name"] = "Астральное оружие из сидерических тайников",
	["node_sidecacheastralweps"] = {
		"{{sideCacheAstralWep}}% шанс, что сидерический тайник уронит ещё случайное астральное оружие.",
		"Если общий шанс выше 100%, бросок на несколько штук."
	},
	["node_sidecachejewels_name"] = "Самоцветы из сидерических тайников",
	["node_sidecachejewels"] = "{{sideCacheJewel}}% шанс, что открытый сидерический тайник уронит ещё звёздно-проклятый самоцвет.",
	["node_sidecachekeyret_name"] = "Возврат ключей сидерических тайников",
	["node_sidecachekeyret"] = "{{sideCacheKeyReturn}}% шанс, что открытый сидерический тайник вернёт 1-2 ключа.",
	["node_bosssparkdust_name"] = "Искристая звёздная пыль с боссов",
	["node_bosssparkdust"] = "+{{bossSparkStardust}}% шанс, что босс при смерти даст искристую звёздную пыль.",
	["node_finalbossdust_name"] = "Древняя звёздная пыль с финальных боссов",
	["node_finalbossdust"] = "+{{bossExtraAncientStardust}}% шанс, что финальный босс при смерти даст ещё древнюю звёздную пыль.",
	["node_prehonedweps_name"] = "Заточенное оружие",
	["node_prehonedweps"] = {
		"{{preHonedWeps}}% шанс, что выпавшее астральное оружие будет с заточкой +1.",
		"Шанс применяется отдельно за каждый вложенный узел этого вида."
	},
	["node_siderealuniv_name"] = "Сидерическая универсализация",
	["node_siderealuniv"] = {
		"Эффекты Сидерического дерева теперь действуют и в обычных забегах, не в экспедициях.",
		"Этот узел нельзя сбросить после вложения."
	},
	["node_timelessbazaar_name"] = "Вечный базар",
	["node_timelessbazaar"] = {
		"После вложения нажми «Вложить», чтобы открыть меню Вечного базара.",
		"На Вечном базаре за общие ОН и оболы покупаются разовые предметы,",
		"которые добавятся в следующий начатый забег."
	},
	["node_bazaarqual0to1_name"] = "Базар: качество 0 → 1",
	["node_bazaarqual0to1"] = "{{bazaarQual1}}% шанс при обновлении базара поднять артефакты качества 0 до качества 1.",
	["node_bazaarqual1to2_name"] = "Базар: качество 1 → 2",
	["node_bazaarqual1to2"] = "{{bazaarQual2}}% шанс при обновлении базара поднять артефакты качества 1 до качества 2.",
	["node_bazaarqual2to3_name"] = "Базар: качество 2 → 3",
	["node_bazaarqual2to3"] = "{{bazaarQual3}}% шанс при обновлении базара поднять артефакты качества 2 до качества 3.",
	["node_bazaaraddoffer_name"] = "Базар: лишнее предложение",
	["node_bazaaraddoffer"] = {
		"{{bazaarExtraItem}}% шанс при обновлении базара добавить ещё один артефакт на выбор.",
		"Если общий шанс выше 100%, бросок несколько раз."
	},
	["node_bazaarselkeep_name"] = "Базар: выбор остаётся",
	["node_bazaarselkeep"] = "{{bazaarSelKeep}}% шанс, что после покупки на базаре остальные артефакты на выбор останутся.",
	["node_bazaardevilitem_name"] = "Базар: артефакты Дьявола",
	["node_bazaardevilitem"] = "{{bazaarDevil}}% шанс при обновлении базара, что предложенные артефакты будут из пула Дьявола.",
	["node_bazaarangelitem_name"] = "Базар: артефакты Ангела",
	["node_bazaarangelitem"] = "{{bazaarAngel}}% шанс при обновлении базара, что предложенные артефакты будут из пула Ангела.",
	["node_bazaarrefresh_name"] = "Обновление базара",
	["node_bazaarrefresh"] = {
		"Включает кнопку «Обновить» на базаре: за общие ОН и оболы",
		"можно перебросить выбор артефактов."
	},
	["node_bazaarrefreshkeep_name"] = "Базар: обновление остаётся",
	["node_bazaarrefreshkeep"] = "{{bazaarRefreshKeep}}% шанс, что кнопка «Обновить» на базаре останется доступной после нажатия.",
	["node_charspconv_name"] = "Обмен ОН персонажа",
	["node_charspconv"] = "После вложения нажми «Вложить», чтобы обменять 1 ОН персонажа на 1 общее ОН.",
	["node_globalspexchange_name"] = "Обмен общих очков навыков",
	["node_obolexchange_name"] = "Обмен на оболы",
	["node_obolexchange"] = "После вложения нажми «Вложить», чтобы обменять 1 общее ОН на 10 тайных оболов.",
	["node_ancwepbounties_name"] = "Награды за древнее оружие",
	["node_ancwepbounties"] = {
		"Вложи, чтобы открыть награды за древнее оружие.",
		"За оболы можно взять заказ на выбранный вид оружия.",
		"Заказ — череда целей; выполнив их, получаешь случайное",
		"древнее оружие выбранного вида."
	},
	["node_crimsonconvergence_name"] = "Багровое схождение",
	["node_crimsonconvergence"] = {
		"После вложения нажми «Вложить», чтобы выбрать одно из нескольких усилений.",
		"Усиления сильнее, чем больше у этого персонажа багровых звёздных ядер."
	},
	["node_siderealartifact_name"] = "Сидерический артефакт",
	["node_siderealartifact"] = {
		"Открывает выбор артефактов: у каждого есть условие, дающее энергию, и",
		"эффект, который срабатывает, когда энергии набралось достаточно.",
		"По умолчанию можно вложить 1 северный (септентрион) и 1 южный (меридион) артефакт.",
		"Артефакты можно вкладывать и сбрасывать свободно."
	},
	["node_artifactenergy_name"] = "Ограничитель энергии артефактов",
	["node_artifactenergy"] = {
		"Пока вложен, сидерические артефакты не срабатывают в комнатах без монстров.",
		"Пока в комнате нет монстров, энергия артефакта не поднимается выше максимума - 1."
	},
	["node_bloodseptentrion_name"] = "Кровавый септентрион",
	["node_taintbloodseptentrion_name"] = "Септентрион порченой крови",
	["node_icyseptentrion_name"] = "Ледяной септентрион",
	["node_beastseekerseptentrion_name"] = "Септентрион охотника на зверей",
	["node_giantseekerseptentrion_name"] = "Септентрион охотника на великанов",
	["node_rotseekerseptentrion_name"] = "Септентрион охотника на гниль",
	["node_titanseekerseptentrion_name"] = "Септентрион охотника на титанов",
	["node_assassinseptentrion_name"] = "Септентрион убийцы",
	["node_deathseekerseptentrion_name"] = "Септентрион ищущего смерти",
	["node_allianceseptentrion_name"] = "Септентрион союза",
	["node_slayerseptentrion_name"] = "Септентрион истребителя",
	["node_magicseptentrion_name"] = "Магический септентрион",
	["node_solarseptentrion_name"] = "Солнечный септентрион",
	["node_lunarseptentrion_name"] = "Лунный септентрион",
	["node_superstitiousseptentrion_name"] = "Суеверный септентрион",
	["node_galvanicmeridion_name"] = "Гальванический меридион",
	["node_glacialmeridion_name"] = "Ледниковый меридион",
	["node_smitingmeridion_name"] = "Карающий меридион",
	["node_infectiousmeridion_name"] = "Заразный меридион",
	["node_virtuousmeridion_name"] = "Добродетельный меридион",
	["node_stonemeridion_name"] = "Каменный меридион",
	["node_infernalmeridion_name"] = "Адский меридион",
	["node_deadseameridion_name"] = "Меридион Мёртвого моря",
	["node_flowingmeridion_name"] = "Текучий меридион",
	["node_osseousmeridion_name"] = "Костяной меридион",
	["node_monstrousmeridion_name"] = "Чудовищный меридион",
	["node_brimmeridion_name"] = "Серный меридион",
	["node_executionermeridion_name"] = "Меридион палача",
	["node_blastingmeridion_name"] = "Взрывной меридион",
	["node_gildedmeridion_name"] = "Позолоченный меридион",
	["node_smeltermeridion_name"] = "Плавильный меридион",
	["node_siderealmeridion_name"] = "Сидерический меридион",
	["node_snakeeyemeridion_name"] = "Меридион змеиного глаза",
	["node_bloodmoonmeridion_name"] = "Меридион кровавой луны",
	["node_soulmeridion_name"] = "Меридион души",
	["node_addseptentrional_name"] = "Ещё один северный артефакт",
	["node_addseptentrional"] = "Позволяет вложить ещё один северный артефакт (септентрион).",
	["node_obolmagnetism_name"] = "Притяжение оболов",
	["node_obolmagnetism"] = "Выпавшие тайные оболы теперь медленно притягиваются к тебе.",
	["node_weaponmagnetism_name"] = "Притяжение оружия",
	["node_weaponmagnetism"] = "Выпавшее астральное оружие теперь медленно притягивается к тебе.",
	["node_ancwepcompendium_name"] = "Свод древнего оружия",
	["node_ancwepcompendium"] = {
		"После вложения нажми «Вложить», чтобы открыть список всего доступного древнего оружия",
		"по видам."
	},
	["node_astralcompanions_name"] = "Астральные спутники",
	["node_astralcompanions"] = {
		"После вложения в забегах могут попадаться яйца астральных спутников.",
		"Узлы-инкубаторы слева перечисляют, какие яйца можно найти, и подсказывают, как найти каждое.",
		"Прогресс яиц и спутников общий для всех персонажей.",
		"Шанс найти яйцо начинается со 100% и после находки вдвое снижается до конца забега."
	},
	["node_astralincubator_name"] = "Астральный инкубатор",
	["node_astralincubator"] = {
		"После вложения нажми «Вложить», чтобы открыть список яиц астральных спутников.",
		"Выбери любое полученное невылупившееся яйцо, чтобы начать его выводить.",
		"У каждого яйца своя цель, которая приближает вылупление."
	},
	["node_companionslot_name"] = "Место спутника",
	["node_companionslot"] = {
		"После вложения нажми «Вложить», чтобы выбрать вылупившегося спутника.",
		"Выбранный спутник добывает тайные оболы, когда выполнена его цель, до предела.",
		"Предел на этаж растёт, когда достигаешь более глубоких уровней экспедиций.",
		"Спутник растёт до 3 уровня, усиливая свой эффект в забеге. За 3 уровень спутника",
		"дают ещё и награды.",
		"Во время забега спутников менять нельзя. Продолжив забег, получишь тех спутников,",
		"с которыми этот забег начинался."
	},
	["node_compproc_name"] = "Показ срабатывания спутника",
	["node_compproc"] = {
		"Пока вложен, спутник ненадолго показывает свой значок над тобой, когда добывает оболы."
	},
	["node_scavengedobols_name"] = "Добытые оболы",
	["node_scavengedobols"] = {
		"После вложения нажми «Вложить», чтобы забрать оболы, добытые спутниками в соединённом месте."
	},

	---- БАГРОВОЕ СХОЖДЕНИЕ ----
	["ui_crimconv_mundaneSlaughter"] = "Обычная бойня",
	["ui_crimconv_mundaneSlaughter_desc"] = {"За каждое багровое звёздное ядро: +1% урона по обычным монстрам."},
	["ui_crimconv_giantSlaughter"] = "Бойня великанов",
	["ui_crimconv_giantSlaughter_desc"] = {"За каждое багровое звёздное ядро: +1% урона по чемпионам и нефинальным боссам."},
	["ui_crimconv_titanSlaughter"] = "Бойня титанов",
	["ui_crimconv_titanSlaughter_desc"] = {"За каждое багровое звёздное ядро: +2% урона по финальным боссам."},
	["ui_crimconv_blightseeking"] = "Охота на хворь",
	["ui_crimconv_blightseeking_desc"] = {"За каждое багровое звёздное ядро: +1% урона по врагам под любым эффектом состояния."},
	["ui_crimconv_celerity"] = "Проворство",
	["ui_crimconv_celerity_desc"] = {"Минимальная скорость в зачищенных комнатах — 1 + 0.04 за каждое багровое звёздное ядро."},
	["ui_crimconv_bloodshield"] = "Кровавый щит",
	["ui_crimconv_bloodshield_desc"] = {
		"При входе в комнату с монстрами 1.5 секунды неуязвимости.",
		"+0.05 секунды неуязвимости за каждое багровое звёздное ядро."
	},
	["ui_crimconv_abundanceGoods"] = "Изобилие: припасы",
	["ui_crimconv_abundanceGoods_desc"] = {
		"За каждое багровое звёздное ядро: при появлении монеты/ключа/бомбы 1% шанс её удвоить.",
		"Для исчезающих расходников шанс втрое выше."
	},
	["ui_crimconv_abundanceVitality"] = "Изобилие: жизнь",
	["ui_crimconv_abundanceVitality_desc"] = {
		"За каждое багровое звёздное ядро: при появлении сердца 1% шанс его удвоить.",
		"Для исчезающих сердец шанс вдвое выше."
	},
	["ui_crimconv_sanguineCharges"] = "Кровавые заряды",
	["ui_crimconv_sanguineCharges_desc"] = {
		"За каждое багровое звёздное ядро: при использовании активного артефакта от 2 зарядов 10% шанс",
		"вернуть 1 заряд. Если общий шанс выше 100%, бросок на несколько зарядов.",
		"Может перезарядить сверх полного."
	},
	["ui_crimconv_fortuna"] = "Фортуна",
	["ui_crimconv_fortuna_desc"] = {
		"За каждое багровое звёздное ядро: 1% удачи прибавляется к урону."
	},
	["ui_crimconv_starstruck"] = "Звёздный удар",
	["ui_crimconv_starstruck_desc"] = {"За каждое багровое звёздное ядро: +2% к найденным оболам."},
}
