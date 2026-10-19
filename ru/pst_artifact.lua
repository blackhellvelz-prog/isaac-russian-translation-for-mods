-- localfixes: Passive Skill Trees по-русски — сидерические артефакты (en_siderealArtifact.lua мода), 17.10.
-- Цветные строки — {текст, "ИМЯ_ЦВЕТА"}, ru_pst.lua подставляет PST.kcolors. Имена предметов — как в русском EID.
return {
	["sideart_bloodSeptentrion"] = "Кровавый септентрион",
	["sideart_bloodSeptentrion_desc"] = {
		{"Условие: убить монстра", "BLUE1"},
		{"Даёт 3 энергии.", "TEAL1"}
	},
	["sideart_taintbloodSeptentrion"] = "Септентрион порченой крови",
	["sideart_taintbloodSeptentrion_desc"] = {
		{"Условие: убить монстра под любым эффектом состояния", "BLUE1"},
		{"Даёт 4 энергии.", "TEAL1"}
	},
	["sideart_taintbloodSeptentrion_obj"] = "Убей {{progress}}/100 монстров под любым эффектом состояния.",
	["sideart_icySeptentrion"] = "Ледяной септентрион",
	["sideart_icySeptentrion_desc"] = {
		{"Условие: разбить замёрзшего монстра.", "BLUE1"},
		{"Даёт 3 энергии.", "TEAL1"}
	},
	["sideart_icySeptentrion_obj"] = "Разбей {{progress}}/100 замёрзших монстров.",
	["sideart_beastseekerSeptentrion"] = "Септентрион охотника на зверей",
	["sideart_beastseekerSeptentrion_desc"] = {
		{"Условие: 3 раза попасть по боссу.", "BLUE1"},
		{"Даёт 1 энергию.", "TEAL1"}
	},
	["sideart_beastseekerSeptentrion_obj"] = "Победи 15 боссов за один забег.",
	["sideart_giantseekerSeptentrion"] = "Септентрион охотника на великанов",
	["sideart_giantseekerSeptentrion_desc"] = {
		{"Условие: 8 раз попасть по боссу.", "BLUE1"},
		{"Даёт 4 энергии.", "TEAL1"}
	},
	["sideart_giantseekerSeptentrion_obj"] = "Зачисти {{progress}}/7 комнат босса без урона.",
	["sideart_rotseekerSeptentrion"] = "Септентрион охотника на гниль",
	["sideart_rotseekerSeptentrion_desc"] = {
		{"Условие: попасть по боссу под любым эффектом состояния.", "BLUE1"},
		{"Даёт 3 энергии.", "TEAL1"}
	},
	["sideart_rotseekerSeptentrion_obj"] = "Наложи эффекты состояния на боссов {{progress}}/50 раз.",
	["sideart_titanseekerSeptentrion"] = "Септентрион охотника на титанов",
	["sideart_titanseekerSeptentrion_desc"] = {
		{"Условие: попасть по финальному боссу.", "BLUE1"},
		{"Даёт 2 энергии.", "TEAL1"}
	},
	["sideart_titanseekerSeptentrion_obj"] = "Победи любого финального босса, получив урон не больше одного раза.",
	["sideart_assassinSeptentrion"] = "Септентрион убийцы",
	["sideart_assassinSeptentrion_desc"] = {
		{"Условие: попасть по монстру (не боссу), у которого больше 90% или меньше 10% здоровья.", "BLUE1"},
		{"Даёт 2 энергии.", "TEAL1"}
	},
	["sideart_assassinSeptentrion_obj"] = "Убей {{progress}}/300 монстров, у которых не меньше 10 здоровья.",
	["sideart_deathseekerSeptentrion"] = "Септентрион ищущего смерти",
	["sideart_deathseekerSeptentrion_desc"] = {
		{"Условие: попасть по монстру-нежити.", "BLUE1"},
		{"Даёт 3 энергии.", "TEAL1"}
	},
	["sideart_deathseekerSeptentrion_obj"] = "Убей {{progress}}/100 монстров-нежити, у которых не меньше 10 здоровья.",
	["sideart_allianceSeptentrion"] = "Септентрион союза",
	["sideart_allianceSeptentrion_desc"] = {
		{"Условие: убить монстра уроном спутника.", "BLUE1"},
		{"Даёт 5 энергии.", "TEAL1"}
	},
	["sideart_allianceSeptentrion_obj"] = "Убей {{progress}}/50 монстров уроном спутников.",
	["sideart_slayerSeptentrion"] = "Септентрион истребителя",
	["sideart_slayerSeptentrion_desc"] = {
		{"Условие: убить монстра-чемпиона.", "BLUE1"},
		{"Даёт 7 энергии.", "TEAL1"}
	},
	["sideart_slayerSeptentrion_obj"] = "Убей {{progress}}/100 монстров-чемпионов.",
	["sideart_magicSeptentrion"] = "Магический септентрион",
	["sideart_magicSeptentrion_desc"] = {
		{"Условие: использовать активный артефакт.", "BLUE1"},
		{"Даёт 4 энергии за каждый потраченный заряд.", "TEAL1"}
	},
	["sideart_magicSeptentrion_obj"] = "Используй активный артефакт хотя бы с 1 зарядом в комнатах с монстрами {{progress}}/30 раз.",
	["sideart_solarSeptentrion"] = "Солнечный септентрион",
	["sideart_solarSeptentrion_desc"] = {
		{"Условие: впервые за этаж войти в сокровищницу.", "BLUE1"},
		{"Даёт 2 энергии в секунду 60 секунд.", "TEAL1"}
	},
	["sideart_solarSeptentrion_obj"] = "Войди в {{progress}}/30 разных сокровищниц.",
	["sideart_lunarSeptentrion"] = "Лунный септентрион",
	["sideart_lunarSeptentrion_desc"] = {
		{"Условие: впервые за этаж войти в секретную комнату.", "BLUE1"},
		{"Даёт 4 энергии в секунду 30 секунд.", "TEAL1"}
	},
	["sideart_lunarSeptentrion_obj"] = "Войди в {{progress}}/30 разных секретных комнат.",
	["sideart_superstitiousSeptentrion"] = "Суеверный септентрион",
	["sideart_superstitiousSeptentrion_desc"] = {
		{"Условие: использовать любой расходуемый карманный предмет.", "BLUE1"},
		{"Даёт 15 энергии.", "TEAL1"}
	},
	["sideart_superstitiousSeptentrion_obj"] = "Используй расходуемые карманные предметы {{progress}}/40 раз.",
	["sideart_galvanicMeridion"] = "Гальванический меридион",
	["sideart_galvanicMeridion_desc"] = {
		{"15 энергии: +3% ко всем характеристикам на 5 секунд.", "TEAL1"},
		"Артефакт без перезарядки.",
	},
	["sideart_glacialMeridion"] = "Ледниковый меридион",
	["sideart_glacialMeridion_desc"] = {
		{"25 энергии: срабатывает эффект Песочных часов.", "TEAL1"},
		"Перезарядка артефакта — 4 секунды."
	},
	["sideart_glacialMeridion_obj"] = "Убей {{progress}}/40 замедленных врагов.",
	["sideart_smitingMeridion"] = "Карающий меридион",
	["sideart_smitingMeridion_desc"] = {
		{"30 энергии: урон всем врагам в комнате — 5 + 7% их наибольшего здоровья, до 4 раз за комнату.", "TEAL1"},
		{"Постоянная часть урона растёт с каждым этажом.", "TEAL1"},
		"Перезарядка артефакта — 3 секунды."
	},
	["sideart_smitingMeridion_obj"] = "Зачисти {{progress}}/30 комнат, каждую быстрее 7 секунд.",
	["sideart_infectiousMeridion"] = "Заразный меридион",
	["sideart_infectiousMeridion_desc"] = {
		{"20 энергии: импульс ранит врагов рядом и накладывает на них эффект состояния", "TEAL1"},
		{"на 4 секунды.", "TEAL1"},
		"Перезарядка артефакта — 2 секунды"
	},
	["sideart_infectiousMeridion_obj"] = "Наложи эффекты состояния на врагов (не боссов) {{progress}}/200 раз.",
	["sideart_virtuousMeridion"] = "Добродетельный меридион",
	["sideart_virtuousMeridion_desc"] = {
		{"60 энергии: создаёт случайный огонёк на орбите в помощь, до 5 раз за этаж.", "TEAL1"},
		"Перезарядка артефакта — 7 секунд."
	},
	["sideart_virtuousMeridion_obj"] = "Убей {{progress}}/15 боссов уроном спутников.",
	["sideart_stoneMeridion"] = "Каменный меридион",
	["sideart_stoneMeridion_desc"] = {
		{"30 энергии: на 7 секунд окаменяет случайного врага в комнате, в первую очередь самых", "TEAL1"},
		{"здоровых.", "TEAL1"},
		"Перезарядка артефакта — 4 секунды."
	},
	["sideart_stoneMeridion_obj"] = "Убей {{progress}}/50 окаменевших врагов.",
	["sideart_infernalMeridion"] = "Адский меридион",
	["sideart_infernalMeridion_desc"] = {
		{"90 энергии:", "TEAL1"},
		{"   Поджигает всех врагов в комнате на 6 секунд.", "TEAL1"},
		{"   До конца комнаты горящие враги при смерти взрываются и ранят врагов рядом.", "TEAL1"},
		"Перезарядка артефакта — 6 секунд."
	},
	["sideart_infernalMeridion_obj"] = "Убей {{progress}}/50 горящих врагов",
	["sideart_deadSeaMeridion"] = "Меридион Мёртвого моря",
	["sideart_deadSeaMeridion_desc"] = {
		{"30 энергии: срабатывает эффект Свитков Мёртвого моря, до 4 раз за комнату.", "TEAL1"},
		"Перезарядка артефакта — 4 секунды."
	},
	["sideart_deadSeaMeridion_obj"] = "Используй активные артефакты хотя бы с 3 зарядами в комнатах босса {{progress}}/20 раз",
	["sideart_flowingMeridion"] = "Текучий меридион",
	["sideart_flowingMeridion_desc"] = {
		{"20 энергии: срабатывает эффект Слёз Исаака.", "TEAL1"},
		"Перезарядка артефакта — 3 секунды."
	},
	["sideart_flowingMeridion_obj"] = "Убей {{progress}}/300 монстров слезами.",
	["sideart_osseousMeridion"] = "Костяной меридион",
	["sideart_osseousMeridion_desc"] = {
		{"70 энергии:", "TEAL1"},
		{"   Этажи 1-3: 2 дружелюбные Костяшки, до 3 раз за этаж.", "TEAL1"},
		{"   Этажи 4-6: 3 дружелюбные Костяшки, до 3 раз за этаж.", "TEAL1"},
		{"   Этажи 7-9: 1 дружелюбный Святой костяшка, раз за этаж.", "TEAL1"},
		{"   Этажи 10+: 1 дружелюбный Святой костяшка, до 2 раз за этаж.", "TEAL1"},
		"Перезарядка артефакта — 5 секунд."
	},
	["sideart_osseousMeridion_obj"] = "Убей {{progress}}/100 Костяшек или их разновидностей.",
	["sideart_monstrousMeridion"] = "Чудовищный меридион",
	["sideart_monstrousMeridion_desc"] = {
		{"50 энергии: срабатывает эффект Справочника монстров, до 4 раз за этаж.", "TEAL1"},
		"Перезарядка артефакта — 3 секунды."
	},
	["sideart_monstrousMeridion_obj"] = "Зачисти {{progress}}/20 комнат босса, имея не меньше 6 спутников.",
	["sideart_brimMeridion"] = "Серный меридион",
	["sideart_brimMeridion_desc"] = {
		{"45 энергии: накладывает на всех монстров в комнате проклятие Кровохарканья на 7 секунд,", "TEAL1"},
		{"раз за комнату.", "TEAL1"},
		"Артефакт без перезарядки."
	},
	["sideart_brimMeridion_obj"] = "Убей {{progress}}/200 монстров лазерами.",
	["sideart_executionerMeridion"] = "Меридион палача",
	["sideart_executionerMeridion_desc"] = {
		{"60 энергии: 8 секунд твои удары добивают монстров, у которых меньше 15% здоровья.", "TEAL1"},
		"Перезарядка артефакта — 4 секунды."
	},
	["sideart_executionerMeridion_obj"] = "Победи 2 финальных боссов за один забег {{progress}}/3 раз.",
	["sideart_blastingMeridion"] = "Взрывной меридион",
	["sideart_blastingMeridion_desc"] = {
		{"60 энергии: срабатывает эффект XVI - Башни и 4 секунды невосприимчивости к взрывам,", "TEAL1"},
		{"до 2 раз за комнату.", "TEAL1"},
		"Перезарядка артефакта — 5 секунд."
	},
	["sideart_blastingMeridion_obj"] = "Выиграй забег с вставленным древним звёздно-проклятым самоцветом «Суточный разрушитель».",
	["sideart_gildedMeridion"] = "Позолоченный меридион",
	["sideart_gildedMeridion_desc"] = {
		{"50 энергии: 7 секунд убитые враги роняют двойные пенни, которые исчезают через 3 секунды, раз", "TEAL1"},
		{"за комнату.", "TEAL1"},
		"Перезарядка артефакта — 5 секунд."
	},
	["sideart_gildedMeridion_obj"] = "Купи 12 артефактов за один забег.",
	["sideart_smelterMeridion"] = "Плавильный меридион",
	["sideart_smelterMeridion_desc"] = {
		{"200 энергии: на текущий этаж переплавляет случайный брелок, которого у тебя нет, до 3 за этаж.", "TEAL1"},
		"Перезарядка артефакта — 3 секунды."
	},
	["sideart_smelterMeridion_obj"] = "Выиграй забег, переплавив не меньше 4 брелоков.",
	["sideart_siderealMeridion"] = "Сидерический меридион",
	["sideart_siderealMeridion_desc"] = {
		{"200 энергии: создаёт сидерический тайник, до 5 раз за этаж.", "TEAL1"},
		"Перезарядка артефакта — 3 секунды."
	},
	["sideart_siderealMeridion_obj"] = "Открой {{progress}}/40 сидерических тайников.",
	["sideart_snakeyeMeridion"] = "Меридион змеиного глаза",
	["sideart_snakeyeMeridion_desc"] = {
		{"250 энергии: создаёт Осколок кости, до 3 раз за этаж.", "TEAL1"},
		"Перезарядка артефакта — 5 секунд."
	},
	["sideart_snakeyeMeridion_obj"] = "Используй активные артефакты-кубики {{progress}}/40 раз.",
	["sideart_bloodmoonMeridion"] = "Меридион кровавой луны",
	["sideart_bloodmoonMeridion_desc"] = {
		{"350 энергии: создаёт Треснувший ключ. При срабатывании 6% шанс открыть Ультрасекретную комнату.", "TEAL1"},
		"Перезарядка артефакта — 5 секунд."
	},
	["sideart_bloodmoonMeridion_obj"] = "Войди в Ультрасекретную комнату {{progress}}/5 раз.",
	["sideart_soulMeridion"] = "Меридион души",
	["sideart_soulMeridion_desc"] = {
		{"500 энергии: создаёт Камень души текущего персонажа. Если его нет — случайный Камень души.", "TEAL1"},
		"Перезарядка артефакта — 30 секунд."
	},
	["sideart_soulMeridion_obj"] = "Используй осколки рун, руны или камни души {{progress}}/50 раз. Камень души идёт за 5.",
}
