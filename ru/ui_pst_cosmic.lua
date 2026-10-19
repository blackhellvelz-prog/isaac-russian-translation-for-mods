-- localfixes: Passive Skill Trees — условия узла «Космическое выравнивание» по персонажам (curseDesc в
-- ST_cosmicRData.lua мода: строки в таблице данных, мимо файлов языков) — перевод на выводе (ru_draw.lua), 17.10.
-- Строки переводятся по одной, как мод их делит (некоторые фразы — на две-три строки). Имена предметов и врагов —
-- как в официальной русской таблице строк игры.
return {
	exact = {
		["+2% all stats when killing a monster, up to 10%."] = "+2% ко всем характеристикам за убитого монстра, до 10%.",
		["-0.02 luck when picking up a soul or black heart."] = "-0.02 к удаче за подобранное синее или чёрное сердце.",
		["-0.04 to a random stat (except speed) when picking up a passive item."] =
			"-0.04 к случайной характеристике (кроме скорости) за подобранный пассивный артефакт.",
		["-0.1 all stats"] = "-0.1 ко всем характеристикам",
		["-0.1 to a random stat when entering a floor, from floor 2 onwards."] =
			"-0.1 к случайной характеристике при входе на этаж, начиная со 2-го.",
		["-0.15 damage when you are hit, up to -0.9. Resets every room."] =
			"-0.15 к урону, когда тебя ранят, до -0.9. Сбрасывается каждую комнату.",
		["-0.5 luck"] = "-0.5 к удаче",
		["-1 tears, range and shot speed."] = "-1 к скорострельности, дальности и скорости полёта слезы.",
		["-10% damage"] = "-10% к урону",
		["-15% damage, tears and speed if you don't have a bone heart."] =
			"-15% к урону, скорострельности и скорости, если нет костяного сердца.",
		["-15% range, shot speed and luck if you don't have a soul heart."] =
			"-15% к дальности, скорости полёта слезы и удаче, если нет синего сердца.",
		["-2 luck while not holding the Bag of Crafting."] = "-2 к удаче, пока не держишь Созидательный мешок.",
		["-20% range"] = "-20% к дальности",
		["-33% tears."] = "-33% к скорострельности.",
		["-4% all stats per item obtained after the 8th one, up to -40%."] =
			"-4% ко всем характеристикам за каждый артефакт после 8-го, до -40%.",
		["-4% damage, tears and luck per active locust."] =
			"-4% к урону, скорострельности и удаче за каждую действующую саранчу.",
		["-40% damage dealt to enemies far away from you, based on your range stat."] =
			"-40% урона по дальним врагам (дальность — по твоей характеристике дальности).",
		["-5% all stats when hit, up to -20%."] = "-5% ко всем характеристикам, когда тебя ранят, до -20%.",
		["-50% xp gain."] = "-50% к получаемому опыту.",
		["-8% all stats if you have 1 remaining red heart or less."] =
			"-8% ко всем характеристикам, если осталось 1 красное сердце или меньше.",
		["-8% all stats while no locusts are active."] = "-8% ко всем характеристикам, пока нет действующей саранчи.",
		["-8% all stats while you don't have a baby familiar."] =
			"-8% ко всем характеристикам, пока нет спутника-малыша.",
		["100% chance to be cursed with Curse of the Blind when entering a floor."] =
			"При входе на этаж всегда — Проклятие Слепоты.",
		["25% chance to take 1/2 heart damage when a coin vanishes."] =
			"25% шанс получить урон в 1/2 сердца, когда монета исчезает.",
		["All starting hearts are converted to soul hearts."] = "Все начальные сердца превращаются в синие.",
		["As Keeper: -4% all stats per active blue fly, up to -40%. This effect stays"] =
			"За Хранителя: -4% ко всем характеристикам за каждую синюю муху, до -40%. Эффект держится,",
		["As Keeper: 33% chance for coins to spawn a blue fly instead of healing you."] =
			"За Хранителя: 33% шанс, что монета создаст синюю муху вместо лечения.",
		["As Keeper: Coins have a 50% chance to grant 0.2 damage for the current room"] =
			"За Хранителя: монета с шансом 50% даёт +0.2 к урону до конца комнаты",
		["As Keeper: Permanent -0.01 luck whenever a blue fly spawns, up to -2."] =
			"За Хранителя: навсегда -0.01 к удаче за каждую появившуюся синюю муху, до -2.",
		["As Keeper: The first coin you pick up in a room can't heal you."] =
			"За Хранителя: первая подобранная в комнате монета не лечит.",
		["As Keeper: coins will only heal you up to 3 times per floor."] =
			"За Хранителя: монеты лечат не больше 3 раз за этаж.",
		["Baby familiar items have a 75% chance to be rerolled when spawned."] =
			"Артефакты-малыши при появлении с шансом 75% перебрасываются.",
		["Begin with Bag of Crafting if you have it unlocked."] = "Начинаешь с Созидательным мешком, если он открыт.",
		["Black hearts grant +0.4 damage on pickup for the current room, up to +1.2."] =
			"Подобранное чёрное сердце даёт +0.4 к урону до конца комнаты, до +1.2.",
		["Bosses drop an additional soul or bone heart on death."] =
			"Боссы при смерти роняют ещё синее или костяное сердце.",
		["Cannot have more than 1 soul/black heart or bone hearts."] =
			"Не больше 1 синего/чёрного сердца или костяного сердца.",
		["Coins have a 50% chance to vanish when collected."] = "Подобранная монета с шансом 50% исчезает.",
		["Coins, bombs, keys and chests have a 15% chance to be replaced with a half red heart."] =
			"Монеты, бомбы, ключи и сундуки с шансом 15% заменяются половинкой красного сердца.",
		["Contact with Dark Esau will deal 1.5 hearts of damage to you."] =
			"Касание Темного Исава наносит урон в 1.5 сердца.",
		["Convert all starting hearts to bone hearts."] = "Все начальные сердца превращаются в костяные.",
		["Convert one of your starting hearts to a bone heart."] = "Одно из начальных сердец превращается в костяное.",
		["Converts heart pickups, bombs, keys and chests into coins."] =
			"Сердца, бомбы, ключи и сундуки превращаются в монеты.",
		["Crafting an item with Bag of Crafting reduces this chance by 10%."] =
			"Каждый артефакт, созданный Созидательным мешком, снижает этот шанс на 10%.",
		["Eternal hearts can no longer show up."] = "Вечные сердца больше не встречаются.",
		["First floor's treasure room is guaranteed to have a poop item."] =
			"В сокровищнице первого этажа — всегда артефакт-какашка.",
		["First health bank is your character's starting health. Second bank starts at 2 soul hearts."] =
			"Первый запас здоровья — начальное здоровье персонажа. Второй начинается с 2 синих сердец.",
		["Fully heal wisps when entering a new floor."] = "На новом этаже огоньки полностью лечатся.",
		["Further floors' treasure room item has a 50% chance to be replaced with a poop item."] =
			"На следующих этажах артефакт сокровищницы с шансом 50% заменяется артефактом-какашкой.",
		["Halve these reductions when first obtaining an item, up to 8 times."] =
			"Первое получение артефакта вдвое уменьшает эти штрафы, до 8 раз.",
		["If Holy Mantle is unlocked with The Lost, start with Wafer."] =
			"Если у Потерянного открыта Святая мантия — начинаешь с Облаткой.",
		["Incubus can no longer show up."] = "Инкуб больше не встречается.",
		["Items are removed from the first treasure room you enter."] =
			"Из первой сокровищницы, в которую войдёшь, артефакты убираются.",
		["Items that grant extra lives no longer show up."] = "Артефакты с лишней жизнью больше не встречаются.",
		["Passive items you pick up become Lemegeton wisps."] = "Подобранные пассивные артефакты становятся огоньками Лемегетона.",
		["Permanent -4% all stats when a wisp dies, up to -20%."] =
			"Навсегда -4% ко всем характеристикам за каждый погибший огонёк, до -20%.",
		["Permanent health modifiers will only affect the current bank."] =
			"Постоянные изменения здоровья действуют только на текущий запас.",
		["Resets when clearing a room. If the final bonus was negative, take up to 1 heart damage"] =
			"Сбрасывается при зачистке комнаты. Если итоговая прибавка отрицательная — урон до 1 сердца,",
		["Soul and Black hearts are halved once collected."] = "Подобранные синие и чёрные сердца уменьшаются вдвое.",
		["Soul hearts are converted to black hearts when spawned."] = "Появляющиеся синие сердца становятся чёрными.",
		["Spawn a locust familiar when first picking up an item, up to 10."] =
			"Первый подбор артефакта создаёт спутника-саранчу, до 10.",
		["Start with -0.15 all stats."] = "В начале -0.15 ко всем характеристикам.",
		["Start with -25% damage and tears."] = "В начале -25% к урону и скорострельности.",
		["Start with Restock."] = "Начинаешь с Пополнением.",
		["Starting health is set to 2 black hearts."] = "Начальное здоровье — 2 чёрных сердца.",
		["Starting speed is set to 0.85."] = "Начальная скорость — 0.85.",
		["Take 1 heart of damage when picking up a black heart."] = "Подбор чёрного сердца наносит урон в 1 сердце.",
		["The first 2 non-soul heart pickups you collect vanish."] = "Первые 2 подобранных не синих сердца исчезают.",
		["These wisps receive 70% less damage from hits."] = "Эти огоньки получают на 70% меньше урона.",
		["This effect resets every floor."] = "Эффект сбрасывается каждый этаж.",
		["This reduction is halved for each baby familiar you have."] = "Штраф уменьшается вдвое за каждого спутника-малыша.",
		["Wafer and Holy Mantle can no longer show up."] = "Облатка и Святая мантия больше не встречаются.",
		["When entering a new floor, a locust will vanish."] = "На новом этаже исчезает одна саранча.",
		["When entering a new floor, convert a red/bone heart container into a full soul heart."] =
			"На новом этаже контейнер красного/костяного сердца превращается в полное синее сердце.",
		["When entering a new floor, if less than 5 coins were picked up in the previous"] =
			"На новом этаже, если на прошлом подобрано меньше 5 монет,",
		["When entering a new floor, if your coin count is less than 15, lose a heart"] =
			"На новом этаже, если монет меньше 15, теряешь контейнер",
		["When entering a room with monsters, if you are above 2 red hearts,"] =
			"При входе в комнату с монстрами, если красных сердец больше 2,",
		["When hit, shuffle the total reduction randomly across all stats. Additionally"] =
			"Когда тебя ранят, общий штраф случайно перераспределяется по характеристикам. Кроме того,",
		["You are chased by Dark Esau, who spawns once you first enter a room with monsters."] =
			"За тобой гонится Темный Исав — появляется при первом входе в комнату с монстрами.",
		["You may not have more than 1 heart of each type (soul and black count as the same type)."] =
			"Не больше 1 сердца каждого вида (синие и чёрные — один вид).",
		["You may not have more than 2 red/coin hearts, and non-red hearts vanish on pickup."] =
			"Не больше 2 красных/монетных сердец; не красные сердца исчезают при подборе.",
		["You now have 2 health banks, which switch when clearing a room."] =
			"Теперь у тебя 2 запаса здоровья; они меняются при зачистке комнаты.",
		["until clearing the room, even if blue flies are killed."] = "пока комната не зачищена, даже если синие мухи убиты.",
		["As Keeper: -8% all stats while you haven't picked up a coin. Resets each room."] =
			"За Хранителя: -8% ко всем характеристикам, пока не подобрана монета. Сбрасывается каждую комнату.",
		["As Keeper: Cannot heal while you have blue flies."] = "За Хранителя: пока есть синие мухи, лечиться нельзя.",
		["instead of healing, up to +1."] = "вместо лечения, до +1.",
		["container. Otherwise, halve your coin count."] = "сердца. Иначе монет становится вдвое меньше.",
		["floor, halve your coin count."] = "монет становится вдвое меньше.",
		["if you can survive it."] = "если он не смертелен.",
		["receive 0 ~ -25% to a random stat."] = "получаешь от 0 до -25% к случайной характеристике.",
		["take 1/2 heart damage."] = "получаешь урон в 1/2 сердца.",
	},
}
