-- localfixes: русские «живые» описания EID у Furtherance (17.10, перевод). Мод собирает часть описаний на лету
-- (Furtherance.EID_Support.DynamicDescriptions): статичное описание пустое, а модификатор EID дописывает текст из
-- обратного вызова на языке EID, без перевода — английского (scripts/compatibility/patches/eid/eid_support.lua,
-- DD:GetCallback). Здесь — те же обратные вызовы на "ru", с той же логикой (Плоский камень, Пётр-Б, золотой брелок,
-- Левиафан, монетное здоровье, Луна, «Гадалка любви»). Caps Key / Book of Swiftness / Book of Leviticus мод берёт из
-- описаний карт EID — они в русском EID есть. Возвращает функцию: число добавленных описаний.
return function()
	local Mod = Furtherance
	local FR = Mod and Mod.EID_Support
	local DD = FR and FR.DynamicDescriptions
	if not (EID and DD and DD.SetCallback and DD.CreateCallback) then return 0 end
	local n = 0
	local function set(tab, t, v, s)
		if s == nil then return end
		if pcall(DD.SetCallback, DD, DD:CreateCallback(tab), t, v, s, "ru") then n = n + 1 end
	end
	local function closest(d) return FR:ClosestPlayerTo(d.Entity) end
	local function name(id)
		local ok, s = pcall(EID.getObjectName, EID, 5, 100, id)
		return ok and s or ""
	end
	local I, T, R, P = Mod.Item or {}, Mod.Trinket or {}, Mod.Rune or {}, Mod.Pickup or {}

	-- артефакты
	if I.PALLAS then
		set({
			"↑ {{Tearsize}}+20% к размеру слезы",
			"#{{Collectible529}} Слёзы Исаака, немного пролетев, отскакивают от пола",
			function(d)
				local p = closest(d)
				if p and p:HasCollectible(CollectibleType.COLLECTIBLE_FLAT_STONE) then
					return "#{{Collectible540}} + Плоский камень: {{Damage}} +16% к урону и {{Tearsize}} ×2 к размеру слезы"
				end
				return ""
			end,
		}, 5, 100, I.PALLAS.ID)
	end
	if I.MUDDLED_CROSS then
		set({
			function(d)
				local p = closest(d)
				local peterB = Mod.Character and Mod.Character.PETER_B
				if p and peterB and peterB:IsPeterB(p) then return "{{Battery}} Заряжается погружением врагов" end
				return "{{Battery}} Заряжается убийством врагов"
			end,
			"#У входа в некоторые особые комнаты появляется лужа, в которой видна другая комната",
			"#При использовании превращает текущую комнату в показанную",
			"#{{TreasureRoom}} <-> {{RedTreasureRoom}}",
			"#{{UltraSecretRoom}} <-> {{Planetarium}} Артефакты планетария дают сломанные сердца",
			"#{{Shop}} <-> {{Library}} Книги в библиотеке стоят денег",
			"#{{DevilRoom}} <-> {{AngelRoom}} Артефакты Ангела стоят денег. Артефакты Дьявола исчезают, когда взят один",
		}, 5, 100, I.MUDDLED_CROSS.ID)
	end

	-- брелоки (подтип — без флага золотого: так их ищет мод)
	local function multi(d) return FR:TrinketMulti(EID.player, d.ObjSubType) or 1 end
	if T.ALMAGEST_SCRAP then
		set({
			"{{Planetarium}} Сокровищницы заменяются планетариями",
			"#{{BrokenHeart}} Артефакты в них дают сломанные сердца",
			function(d)
				if Mod:HasBitFlags(d.ObjSubType, TrinketType.TRINKET_GOLDEN_FLAG) then
					return "#{{ColorGold}}Артефакты в них бесплатны{{CR}}"
				end
				return ""
			end,
		}, 5, 350, T.ALMAGEST_SCRAP.ID)
	end
	if T.LEAHS_LOCK then
		set({
			"25% шанс выстрелить слезой {{Charm}} очарования или {{Fear}} страха",
			"#{{Luck}} 50% шанс при 10 удачи",
			function(d)
				if multi(d) > 1 then return "#{{ColorGold}}Очарование и страх могут сработать одновременно{{CR}}" end
				return ""
			end,
		}, 5, 350, T.LEAHS_LOCK.ID)
	end
	if T.LEVIATHANS_TENDRIL then
		local L = T.LEVIATHANS_TENDRIL
		set({
			function(d)
				local c1 = tostring(math.floor((L.REFLECT_CHANCE or 0) * 100)) .. "%"
				local c2 = tostring(math.floor((L.FEAR_CHANCE or 0) * 100)) .. "%"
				if multi(d) > 1 then
					c1 = "{{ColorGold}}" .. c1 .. "{{CR}}"
					c2 = "{{ColorGold}}" .. c2 .. "{{CR}}"
				end
				local s = c1 .. " шанс отбить снаряды от Исаака: они становятся самонаводящимися и летят быстрее"
					.. "#{{Fear}} " .. c2 .. " шанс напугать врагов рядом"
				local p = closest(d)
				if p and p:HasPlayerForm(PlayerForm.PLAYERFORM_EVIL_ANGEL) then
					s = s .. "#{{Leviathan}} Ещё +5% к шансу каждого эффекта"
				end
				return s
			end,
		}, 5, 350, L.ID)
	end

	-- карты
	if R.SOUL_OF_LEAH then
		set({
			"↑ Максимум контейнеров сердца больше на 3",
			"#↓ {{BrokenHeart}} +3 сломанных сердца",
			"#!!! Выше 24 контейнеров максимум не растёт, но сломанные сердца даются",
			function(d)
				local p = closest(d)
				if p and p:GetHealthType() == HealthType.COIN then
					return "#{{Player" .. p:GetPlayerType() .. "}} Максимум здоровья растёт лишь на 1, и даётся +1 сломанное монетное сердце"
				end
				return ""
			end,
		}, 5, 300, R.SOUL_OF_LEAH.ID)
	end
	local cam = I.OLD_CAMERA
	if cam and cam.PHOTO_IDs then
		for _, id in ipairs(cam.PHOTO_IDs) do
			set({
				function()
					local k = cam.GHOST_AMOUNT and cam.GHOST_AMOUNT[id]
					return "{{Collectible634}} Призраков Чистилища: " .. tostring(k or "?") .. " — сразу нападают на врагов"
				end,
			}, 5, 300, id)
		end
	end

	-- лунное сердце (целое и половинка — одно описание, как у мода)
	local moon = P.MOON_HEART
	if moon then
		local tab = {
			"{{SoulHeart}} Работает как синее сердце",
			"#{{SecretRoom}} За каждое лунное сердце у любого игрока в Секретной и Суперсекретной комнатах будет луч света {{Collectible589}} Луны",
			"#Первый луч даёт Исааку +1 к скорострельности, каждый следующий — +0.5",
			"#Когда сердце кончается, показывает Секретную или Суперсекретную комнату",
			function(d)
				local p = closest(d)
				if p and p:HasCollectible(CollectibleType.COLLECTIBLE_LUNA) then
					return "#{{Collectible589}} Луч Луны даёт ещё {{Tears}} +0.5 к скорострельности за каждое лунное сердце Исаака"
				end
				return ""
			end,
		}
		set(tab, 5, 10, moon.ID)
		set(tab, 5, 10, moon.ID_HALF)
	end

	-- «Гадалка любви»: пара персонажа и награда «истинной любви» (как у мода, eid_entities_descriptions.lua)
	local LT = Mod.Slot and Mod.Slot.LOVE_TELLER
	if LT and LT.GetMatchMaker then
		local PT = PlayerType
		local function c(id) return "{{Collectible" .. id .. "}} " .. name(id) end
		local love = {
			[PT.PLAYER_ISAAC] = function() return "Иногда ненадолго даёт: " .. c(206) end,
			[PT.PLAYER_MAGDALENE] = function() return "Иногда срабатывает " .. c(45) end,
			[PT.PLAYER_CAIN] = function() return "Иногда возвращает ключи, потраченные на сундуки" end,
			[PT.PLAYER_JUDAS] = function() return "Иногда срабатывает " .. c(34) end,
			[PT.PLAYER_BLUEBABY] = function() return "Иногда ненадолго даёт: " .. c(248) end,
			[PT.PLAYER_EVE] = function() return "Иногда ненадолго даёт эффект: " .. c(122) end,
			[PT.PLAYER_SAMSON] = function() return "Иногда ненадолго даёт: " .. c(157) .. " с +3 ударами" end,
			[PT.PLAYER_AZAZEL] = function() return "Иногда ненадолго даёт эффект {{Trinket162}} брелока Азазеля" end,
			[PT.PLAYER_LAZARUS] = function() return "Иногда ненадолго даёт эффект: " .. c(214) end,
			[PT.PLAYER_EDEN] = function() return "Становится случайным малышом Гадалки любви; сработав, превращается в другого" end,
			[PT.PLAYER_THELOST] = function() return "Иногда ненадолго даёт щит {{Collectible313}} мантии; новый — только когда прежний разбит" end,
			[PT.PLAYER_LILITH] = function() return "Иногда срабатывает " .. c(357) end,
			[PT.PLAYER_KEEPER] = function() return "Иногда ненадолго даёт: " .. c(450) end,
			[PT.PLAYER_APOLLYON] = function() return "Иногда создаёт случайную саранчу" end,
			[PT.PLAYER_THEFORGOTTEN] = function() return "Иногда меняет облик — кость или душа, у каждого свои слёзы" end,
			[PT.PLAYER_BETHANY] = function() return "Иногда ненадолго даёт: " .. c(584) end,
			[PT.PLAYER_JACOB] = function() return "Иногда срабатывает " .. c(687) end,
			[PT.PLAYER_ESAU] = function() return "Иногда ненадолго даёт слабый эффект: " .. c(621) end,
		}
		local MP = Mod.PlayerType or {}
		if MP.LEAH and I.HEART_RENOVATOR then love[MP.LEAH] = function() return "Иногда срабатывает " .. c(I.HEART_RENOVATOR.ID) end end
		if MP.PETER and I.KEYS_TO_THE_KINGDOM then love[MP.PETER] = function() return "Иногда срабатывает " .. c(I.KEYS_TO_THE_KINGDOM.ID) .. " на одного врага, не босса" end end
		if MP.MIRIAM and I.TAMBOURINE then love[MP.MIRIAM] = function() return "Иногда срабатывает " .. c(I.TAMBOURINE.ID) end end
		set({
			"{{Coin}} Стоит 5 монет",
			"#Случайно сводит в пару сыгравшего персонажа с другим персонажем. Награда — по паре",
			"#{{EmptyHeart}} Создаёт муху",
			"#{{HalfHeart}} Создаёт два сердца",
			"#{{Heart}} Создаёт особого стреляющего фамильяра, связанного с «истинной любовью» персонажа",
			function()
				local done, desc = {}, "#"
				for _, player in ipairs(EID.coopAllPlayers or {}) do
					local pt = player:GetPlayerType()
					local iconPt = pt
					local parent = LT.ParentPlayerTypes and LT.ParentPlayerTypes[pt]
					if parent then pt = parent end
					if not done[pt] then
						local icon = EID:GetPlayerIcon(iconPt)
						local lover = LT:GetMatchMaker(pt, 2)
						local save = Mod:RunSave()
						if save and save.ModdedLoveTeller and save.ModdedLoveTeller[tostring(pt)] then
							local copy = save.ModdedLoveTeller[tostring(pt)]
							desc = desc .. icon .. " " .. EID:getPlayerName(pt) .. " до конца забега повторяет "
								.. EID:GetPlayerIcon(copy) .. EID:getPlayerName(copy) .. "#"
						end
						local text = FR.LoveTellerModded and FR.LoveTellerModded[lover] or (love[lover] and love[lover]()) or ""
						desc = desc .. icon .. " {{Heart}} " .. EID:GetPlayerIcon(lover) .. " - " .. text .. "#"
						done[pt] = true
					end
				end
				return string.sub(desc, 1, -2)
			end,
		}, EntityType.ENTITY_SLOT, LT.ID, 0)
	end
	return n
end
