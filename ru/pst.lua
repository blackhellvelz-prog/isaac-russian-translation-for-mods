-- localfixes: русский — Passive Skill Trees (Мастерская 3305869734), 17.10. Формат — ru_items.lua.
-- Астральное оружие — брелоки-носители: виды × (обычное, магическое) и древние с собственными именами.
local KIND = {
	Longsword = "длинный меч", Estoc = "эсток", Dagger = "кинжал", Quickblade = "быстрый клинок", Spear = "копьё",
	Trident = "трезубец", Scythe = "коса", Axe = "топор", Greataxe = "двуручный топор", Shortbow = "короткий лук",
	Bow = "лук", Crossbow = "арбалет", Gauntlet = "боевая перчатка", ["Great Mace"] = "большая булава", Whip = "кнут",
}
local ANCIENT = {
	{ "Grey Wind", "Серый Ветер", "Longsword" }, { "Executioner", "Палач", "Longsword" },
	{ "Sword of Song", "Меч Песни", "Longsword" }, { "Redbeak", "Красный Клюв", "Longsword" },
	{ "Arcing Needle", "Дуговая Игла", "Estoc" }, { "Auric Persecutor", "Золотой Гонитель", "Estoc" },
	{ "The Scrambler", "Путаник", "Dagger" }, { "Adrift Blade", "Дрейфующий Клинок", "Dagger" },
	{ "Nimble Twins", "Проворные Близнецы", "Quickblade" }, { "Crimson Altruist", "Багровый Альтруист", "Quickblade" },
	{ "Beastbane", "Погибель Зверя", "Spear" }, { "Gravitas", "Гравитас", "Spear" },
	{ "Boreal Frostspear", "Северное Ледяное Копьё", "Spear" }, { "Consecrator", "Освятитель", "Trident" },
	{ "Verdant Green", "Цветущая Зелень", "Trident" }, { "Lost Coral Trident", "Потерянный Коралловый Трезубец", "Trident" },
	{ "Tale Ender", "Конец Сказки", "Scythe" }, { "Crimson Reaper", "Багровый Жнец", "Scythe" },
	{ "Mobripper", "Разрыватель Толп", "Scythe" }, { "Starsteel Broadaxe", "Секира из Звёздной Стали", "Axe" },
	{ "Ancient Runic Chopper", "Древний Рунный Тесак", "Axe" }, { "Berserker's Wrath", "Гнев Берсерка", "Greataxe" },
	{ "Frozen Terror", "Ледяной Ужас", "Greataxe" }, { "Storm's Advance", "Натиск Бури", "Shortbow" },
	{ "Quill Rain", "Дождь Перьев", "Shortbow" }, { "Gilded Seeker", "Позолоченный Искатель", "Bow" },
	{ "Twisted Oakstring", "Кривая Дубовая Тетива", "Bow" }, { "Brute's Onslaught", "Натиск Громилы", "Bow" },
	{ "Volatile Arbalest", "Неустойчивый Арбалет", "Crossbow" }, { "Avelyn", "Авелин", "Crossbow" },
	{ "Precise Seeker", "Точный Искатель", "Crossbow" }, { "Glowing Moonblade", "Сияющий Лунный Клинок", "Longsword" },
	{ "Maxwell's Thermic Engine", "Тепловой двигатель Максвелла", "Longsword" }, { "Viper Stinger", "Жало Гадюки", "Spear" },
	{ "Oceanic Might", "Мощь Океана", "Trident" }, { "Glowing Sunblade", "Сияющий Солнечный Клинок", "Longsword" },
	{ "Circuit Splitter", "Разделитель Цепей", "Axe" }, { "Magefist", "Кулак Мага", "Gauntlet" },
	{ "Ironhand", "Железная Рука", "Gauntlet" }, { "Ivory Vampire", "Костяной Вампир", "Dagger" },
	{ "Mighty Purifier", "Могучий Очиститель", "Great Mace" }, { "Chaotic Tumult", "Хаотичный Сумбур", "Great Mace" },
	{ "Firestarter", "Поджигатель", "Great Mace" }, { "Colossal Maul", "Колоссальный Молот", "Great Mace" },
	{ "Tolling Bell", "Погребальный Колокол", "Great Mace" }, { "Metamorphic Claw", "Метаморфический Коготь", "Gauntlet" },
	{ "Quicksilver", "Ртуть", "Quickblade" }, { "Snakebite", "Змеиный Укус", "Whip" },
	{ "Devil's Tongue", "Язык Дьявола", "Whip" }, { "Azurebinder", "Лазурный Вязатель", "Whip" },
	{ "Sacred Scourge", "Священный Бич", "Whip" }, { "Divine Interceptor", "Божественный Перехватчик", "Longsword" },
	{ "Divine Messenger", "Божественный Вестник", "Bow" }, { "Scintillant", "Мерцающий", "Estoc" },
}

local out = { mod = "3305869734",
	{ "item", "Shadowmeld", "Слияние с тенью", "Погрузись в тени" },
	{ "trinket", "Azure Starcursed Jewel", "Лазурный звёздно-проклятый самоцвет", "Древняя космическая энергия всё ещё здесь..." },
	{ "trinket", "Crimson Starcursed Jewel", "Багровый звёздно-проклятый самоцвет", "Древняя космическая энергия всё ещё здесь..." },
	{ "trinket", "Viridian Starcursed Jewel", "Изумрудный звёздно-проклятый самоцвет", "Древняя космическая энергия всё ещё здесь..." },
	{ "trinket", "Ancient Starcursed Jewel", "Древний звёздно-проклятый самоцвет", "Звёзды смотрят в ответ..." },
	{ "card", "Soul of the Siren", "Душа Сирены", "Все будут служить" },
}
for i = 1, 8 do
	out[#out + 1] = { "trinket", "Arcane Obols " .. i, "Тайные оболы " .. i, "Космически сверкающие монеты, пробуждающие амбиции" }
end
for en, ru in pairs(KIND) do
	out[#out + 1] = { "trinket", "Astral weapon: " .. en, "Астральное оружие: " .. ru, "Астральное оружие: " .. ru }
	out[#out + 1] = { "trinket", "Astral weapon: " .. en .. " (magic)", "Астральное оружие: " .. ru .. " (магическое)",
		"Астральное оружие: " .. ru .. " (магическое)" }
end
for _, a in ipairs(ANCIENT) do
	out[#out + 1] = { "trinket", "Astral weapon: " .. a[1], "Астральное оружие: " .. a[2],
		"Древнее астральное оружие: " .. a[2] .. " (" .. KIND[a[3]] .. ")" }
end
return out
