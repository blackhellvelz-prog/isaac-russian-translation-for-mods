-- localfixes: всплывающие надписи модов в забеге (HUD:ShowItemText / ShowFortuneText со строками из кода модов) —
-- перевод на выводе (ru_popup.lua через словарь ru_draw.lua), 17.10. Названия проклятий, трансформаций, предметов —
-- как в официальной русской таблице строк игры и в переводе Mod Translator.
-- Не переводятся по слову пользователя («Не трогай тогда предсказания», 17.10): предсказания Fiend Folio (80 978),
-- «злые» предсказания печенья-пытки, подсказки «Сундука гибели» и шутки рождественской хлопушки — всё, что FF
-- выводит бумажкой автомата предсказаний. Не переводятся нарочно: французские и квебекские ругательства мима (так
-- задумано — мим француз), поддельное «сообщение об ошибке» IPECAC (это шутка-код).
local function charName(n)
	local f = LOCALFIXES and LOCALFIXES.RuCharName
	return f and f(n) or n
end

-- звания «Странного глаза» FF (как у странного оружия TF2), прилагательное — к слову «глаз»
local STRANGE = {
	["Strange"] = "Странный", ["Unremarkable"] = "Непримечательный", ["Scarcely Lethal"] = "Едва смертоносный",
	["Mildly Menacing"] = "Слегка угрожающий", ["Somewhat Threatening"] = "Довольно угрожающий",
	["Uncharitable"] = "Немилосердный", ["Notably Dangerous"] = "Заметно опасный",
	["Sufficiently Lethal"] = "Вполне смертоносный", ["Truly Feared"] = "Внушающий страх",
	["Spectacularly Lethal"] = "Феноменально смертоносный", ["Gore-Spattered"] = "Забрызганный кровью",
	["Wicked Nasty"] = "Чертовски злобный", ["Positively Inhumane"] = "Совершенно бесчеловечный",
	["Totally Ordinary"] = "Абсолютно заурядный", ["Face-Melting"] = "Плавящий лица",
	["Rage-Inducing"] = "Доводящий до бешенства", ["Room Clearing"] = "Зачищающий комнаты", ["Epic"] = "Эпический",
	["Legendary"] = "Легендарный", ["Australian"] = "Австралийский", ["Grandpa's Own"] = "Дедушкин",
}
-- казни IPECAC («Книга казней»): «Plague of <имя>»
local PLAGUE = { Boils = "язвы", Blood = "кровь", Locusts = "саранча", Gnats = "мошки", Pestilence = "мор",
	Hail = "град", Flies = "пёсьи мухи", Darkness = "тьма" }
-- противники «X vs Y» (FF, Epiphany, Repentance+)
local VERSUS = { ["gravedigger"] = "Гробокопателя", ["psion"] = "Псиона", ["The Vault"] = "Хранилища" }

return {
	exact = {
		-- IPECAC: трансформации
		["Eyesaac!"] = "Глазаак!", ["Shocking!"] = "Шокирующе!", ["Crybaby!"] = "Плакса!", ["I, Robot!"] = "Я, робот!",
		["Lust!"] = "Похоть!", ["Gluttony!"] = "Чревоугодие!", ["Envy!"] = "Зависть!", ["Wrath!"] = "Гнев!",
		["Cultist!"] = "Культист!", ["Greed!"] = "Жадность!", ["Not the bees!"] = "Только не пчёлы!", ["Pride!"] = "Гордыня!",
		-- IPECAC: «Пенни изнутри» — мемные «пенни» и их «богатство»
		["Bent Penny"] = "Гнутый пенни", ["Wealth of Odds"] = "Богатство странностей",
		["Butt Penny"] = "Попный пенни", ["Wealth of toots"] = "Богатство пуков",
		["Peptic Penny"] = "Пищеварительный пенни", ["Wealth of balance"] = "Богатство равновесия",
		["Smouldering Penny"] = "Тлеющий пенни", ["Wealth of hot hot hot"] = "Богатство жара-жара-жара",
		["Egg Penny"] = "Яичный пенни", ["Wealth of embarrassment"] = "Богатство позора",
		["Sticky Nickel Penny"] = "Липкий пятак-пенни", ["Wealth of sticky nickels"] = "Богатство липких пятаков",
		["SpOoKy Penny"] = "ЖуТкИй пенни", ["Wealth of OoOoOoOo"] = "Богатство У-у-у-у-у",
		["Haunted Penny"] = "Пенни с призраком", ["Wealth of Poltergeists"] = "Богатство полтергейстов",
		["Gamer Penny"] = "Пенни геймера", ["Wealth of Gamer"] = "Богатство геймера",
		["Funniest Penny"] = "Самый смешной пенни", ["Wealth of Trololololol"] = "Богатство трололололо",
		["Recursive Penny"] = "Рекурсивный пенни",
		["Vanishing Penny"] = "Исчезающий пенни", ["Wealth of "] = "Богатство ",
		["Sussy Penny"] = "Подозрительный пенни", ["Wealth of Suspiscion"] = "Богатство подозрений",
		["Penny"] = "Пенни", ["Wealth"] = "Богатство",
		["Deadly Penny"] = "Смертельный пенни", ["Wealth of Extinction"] = "Богатство вымирания",
		["Inverted Penny"] = "Перевёрнутый пенни", ["Wealth of Negatives"] = "Богатство минусов",
		["Damned Penny"] = "Проклятый пенни", ["Wealth of Esau"] = "Богатство Исава",
		["Dice Penny"] = "Пенни-кубик", ["Wealth of Random"] = "Богатство случая",
		["Final Penny"] = "Последний пенни", ["Wealth of Conclusions"] = "Богатство выводов",
		["Chaos Penny"] = "Пенни хаоса", ["Wealth of Debug 10"] = "Богатство отладки 10",
		["Rock Penny"] = "Каменный пенни", ["Wealth of Stone"] = "Богатство камня",
		["Bumbo Penny"] = "Пенни Бамбо", ["Wealth of Bumbo"] = "Богатство Бамбо",

		-- Fiend Folio
		["no softlock please"] = "только не зависание, пожалуйста",
		["Gunymede"] = "Пушимед", ["Heaven's call"] = "Зов небес",
		["#MyDogKalu!"] = "#МояСобакаКалу!",
		["A new floor!"] = "Новый этаж!", ["A new room!"] = "Новая комната!",
		["Choose a key!"] = "Выбери клавишу!", ["Choose a button!"] = "Выбери кнопку!",
		["Your free trial has expired"] = "Пробный период закончился",
		["Every step"] = "На каждом шагу", ["of the way!"] = "я рядом!", ["I'm with you!"] = "Я с тобой!",
		["Peat"] = "Пит", ["The horse is here"] = "Лошадь уже здесь", ["Peat's cake"] = "Торт Пита",
		["Hey Beter"] = "Привет, Бетер",
		["Whoops"] = "Упс", ["Looks like you dropped something!"] = "Кажется, ты что-то уронил!",
		["Rare!"] = "Редкая!", ["Epic!"] = "Эпическая!", ["Legendary!!!"] = "Легендарная!!!",
		["You can have"] = "Можешь взять", ["this one!"] = "вот эту!",
		["Cirno!"] = "Сырно!", ["9. Idiot."] = "9. Дурёха.",
		["Thanks doc!"] = "Спасибо, док!", ["Cure with a pill!"] = "Лечись пилюлей!",
		["Who's your daddy?"] = "Кто твой папочка?",
		["out of order!"] = "не работает!",
		["Chaos! Chaos!"] = "Хаос! Хаос!", ["There are multiple effects!"] = "Сразу несколько эффектов!",
		-- Хвост Джевила (Jevil's Tail) — фразы Джевила из Deltarune
		["Noisy!"] = "Шумно!", ["It's just foley!"] = "Это просто звуки!",
		["Your FOEs felt at ease."] = "ВРАГИ расслабились.", ["Their defense dropped!"] = "Их защита упала!",
		["Awkward!"] = "Неловко!", ["Your FOEs will hurt you rapidly!"] = "ВРАГИ будут бить тебя чаще!",
		["Tranquil!"] = "Спокойствие!", ["Your defense raised!"] = "Твоя защита выросла!",
		["What!"] = "Что!", ["It's just a useless fly!"] = "Это просто бесполезная муха!",
		["Warm!"] = "Тепло!", ["It felt comforting!"] = "Стало уютно!",
		["Dizzy!"] = "Голова кругом!", ["Your HP got jumbled up!"] = "Здоровье перемешалось!",
		["Careful!"] = "Осторожно!", ["Your FOEs got powered up!"] = "ВРАГИ усилились!",
		["Fiendish!"] = "Дьявольски!", ["A perfect 10!"] = "Идеальная десятка!",
		["Woman"] = "Женщина", ["This is a woman"] = "Это женщина",
		["The stars align"] = "Звёзды сошлись",
		["Oh No..."] = "О нет...",
		["Level up with kills"] = "Растёт с убийствами",
		["Projectile"] = "Снаряд", ["Should've dodged it!"] = "Надо было увернуться!",
		["You found every embryo!"] = "Ты нашёл все эмбрионы!",
		["Goby?!"] = "Гоби?!",
		["Time Fcuk'd!"] = "Время сломалось!",
		["no valid cluster"] = "нет подходящего", ["generation site."] = "места для появления.", ["sorry!"] = "извини!",
		["Your Fate is Sealed..."] = "Твоя судьба решена...",
		["Beat Floor II"] = "Пройди этаж II", ["Make dad proud!"] = "Порадуй папу!",
		["Ouch!"] = "Ой!", ["Oof!"] = "Уф!", ["Ow!"] = "Ай!",
		["F**k!"] = "Бл**!", ["S**t!"] = "Д*рьмо!", ["D*mn!"] = "Ч*рт!", ["Cr*p!"] = "Бл*н!", ["Gah!"] = "Гах!",
		["Grah!"] = "Грр!", ["Bah!"] = "Ба!",
		-- Чёрный канделябр: проклятия строчными
		["curse of darkness"] = "проклятие тьмы", ["curse of the labyrinth"] = "проклятие лабиринта",
		["curse of the lost"] = "проклятие потерянного", ["curse of the unknown"] = "проклятие неизвестности",
		["curse of the maze"] = "проклятие путаницы", ["curse of the blind"] = "проклятие слепоты",
		["curse of the veil"] = "проклятие завесы",
		-- Башня небес: «не войдёшь ты» + вид комнат
		["thou shalt not enter"] = "да не войдёшь ты", ["shops"] = "в магазины", ["secret rooms"] = "в секретные комнаты",
		["arcades"] = "в игровые залы", ["curse rooms"] = "в проклятые комнаты", ["challenge rooms"] = "в комнаты испытаний",
		["libraries"] = "в библиотеки", ["sacrifice rooms"] = "в жертвенные комнаты",
		["devil or angel rooms"] = "в комнаты Дьявола и Ангела", ["bedrooms"] = "в спальни",
		["chest rooms"] = "в сундучные комнаты", ["dice rooms"] = "в комнаты кубиков", ["planetariums"] = "в планетарии",

		-- Epiphany
		["the philistines are upon you"] = "филистимляне идут на тебя",
		["CURSE OF THE LOST"] = "ПРОКЛЯТИЕ ПОТЕРЯННОГО", ["CURSE OF DARKNESS"] = "ПРОКЛЯТИЕ ТЬМЫ",
		["CURSE OF THE UNKNOWN"] = "ПРОКЛЯТИЕ НЕИЗВЕСТНОСТИ", ["CURSE OF THE MAZE"] = "ПРОКЛЯТИЕ ПУТАНИЦЫ",
		["CURSE OF THE BLIND"] = "ПРОКЛЯТИЕ СЛЕПОТЫ", ["Has Been Lifted"] = "снято",
		["you feel blessed!"] = "ты чувствуешь благословение!",
		["CAIN VS ABEL"] = "КАИН ПРОТИВ АВЕЛЯ",
		["Door Broke for Rep+"] = "Дверь сломалась в Rep+", ["Thank you Nicalis"] = "Спасибо, Nicalis",
		-- Furtherance
		["Time knows no bounds"] = "Время не знает границ",
		-- Reshaken (Фингор)
		["You cannot"] = "Ты не сможешь", ["ignore me"] = "игнорировать меня",
		-- The Future
		["The Future"] = "Будущее",
		-- Repentance+
		["The Dead protect you"] = "Мёртвые защищают тебя", ["Night Soil protects you"] = "Ночное Золото защищает тебя",
		["Merry Christmas!"] = "С Рождеством!", ["(Ho-ho-ho!)"] = "(Хо-хо-хо!)",
		-- Heaven's Call
		["Climb the tower"] = "Поднимись на башню", ["reach the heavens"] = "достигни небес",
		["The world is ending!"] = "Конец света!", ["The black candle has extinguished"] = "Чёрная свеча погасла",
		["A terrible chill runs up your spine!"] = "По спине пробегает жуткий холод!",
		["The Everchanger has awakened"] = "Вечноменяющийся пробудился",
		["has awakened"] = "пробуждается", ["This is the end"] = "Это конец",
		["try ascended difficulty"] = "попробуй сложность «Вознесение»",
		["The heaven calls your name"] = "Небеса зовут тебя по имени",
		["Jupiter the Gargantuan"] = "Юпитер Громадный", ["Saturn the Intransigent"] = "Сатурн Непримиримый",
		["Uranus the Unpleasant"] = "Уран Неприятный", ["Neptune the Unfathomable"] = "Нептун Непостижимый",
		["Mercury the Unwary"] = "Меркурий Неосторожный", ["Venus the Termagant"] = "Венера Сварливая",
		["Terra the Fatalist"] = "Земля Обречённая", ["Mars the Vainglorious"] = "Марс Тщеславный",
		["Luna the Tainted"] = "Луна Порченая", ["Pluto the Frivolous"] = "Плутон Легкомысленный",
		["Charon the Benumbed"] = "Харон Оцепенелый", ["Eris the Vehement"] = "Эрида Неистовая",
		["Makemake the Phlegmatic"] = "Макемаке Флегматичный", ["Haumea the Diffident"] = "Хаумеа Робкая",
		["Ceres the Cauterized"] = "Церера Опалённая", ["The Errant"] = "Скиталец",
		["Sol the Absolute"] = "Солнце Абсолютное", ["Another Saturn"] = "Другой Сатурн",
		-- Bedroom Expanded (без REPENTOGON)
		["Needs REPENTOGON to work"] = "Нужен REPENTOGON",
	},
	patterns = {
		{ "^Plague of (.+)$", function(a) if PLAGUE[a] then return "Казнь: " .. PLAGUE[a] end end },
		{ "^Wealth of Wealth of .*$", "Богатство богатства богатства богатства богатства богатства…" },
		{ "^You chose: (.+)$", "Ты выбрал: %1" },
		{ "^Wave (%d+)$", "Волна %1" },
		{ "^forever, (.+)$", function(a) return "вечно, " .. charName(a) end },
		{ "^(.+) Eye$", function(a) if STRANGE[a] then return STRANGE[a] .. " глаз" end end },
		{ "^(.+) vs (.-)(%??)$", function(a, b, q)
			local who = VERSUS[b] or (LOCALFIXES and LOCALFIXES.TranslateUI and LOCALFIXES.TranslateUI(b)) or b
			return charName(a) .. " против " .. who .. q
		end },
	},
}
