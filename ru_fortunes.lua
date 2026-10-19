-- localfixes: предсказания Fiend Folio по-русски (17.10, слова пользователя «Переведи все предсказания»; «Адаптируй
-- как нибудь»). FF показывает их бумажкой автомата — HUD:ShowFortuneText(строка1, строка2, …): свои 80 978
-- предсказаний, «злые» печенья-пытки, подсказки «Сундука гибели», шутки хлопушки. Перевод — ru/fortunes/*.lua
-- (собирает tools/fortunes_build.py): «хэш английского текста → русский». Хэш — FNV-1a 64 от строк в нижнем регистре
-- ASCII через «\n» (как FF: string.lower). Русская строка длиннее ширины бумажки переносится по словам.
-- Части подключаются при загрузке мода и только при русском языке игры (include во время игры их не найдёт).
local FORT, count = {}, 0
if Options.Language == "ru" then
	local ok, list = pcall(include, "ru.fortunes.index")
	if ok and type(list) == "table" then
		for _, m in ipairs(list) do
			local okm, part = pcall(include, m)
			if okm and type(part) == "table" then
				for k, v in pairs(part) do
					FORT[k] = v
					count = count + 1
				end
			end
		end
	end
end

local function fnv64(s)
	local h = -3750763034362895579 -- 0xcbf29ce484222325
	for i = 1, #s do
		h = h ~ s:byte(i)
		h = h * 1099511628211 -- 0x100000001b3, переполнение — по модулю 2^64, как в tools/fortunes_build.py
	end
	return string.format("%016x", h)
end

local WIDTH = 24 -- знаков в строке бумажки (у английских предсказаний FF 99% строк ≤ 25)
local function ulen(s) return utf8 and utf8.len(s) or #s end

-- русский текст → строки бумажки (не больше 10 — столько принимает ShowFortuneText у FF)
local function wrap(text)
	local out = {}
	for line in (text .. "\n"):gmatch("(.-)\n") do
		if ulen(line) <= WIDTH or not line:find("[\208\209]") then -- латиницу (логи, код) не переносить
			out[#out + 1] = line
		else
			local cur = ""
			for word in line:gmatch("%S+") do
				if cur == "" then
					cur = word
				elseif ulen(cur) + 1 + ulen(word) <= WIDTH then
					cur = cur .. " " .. word
				else
					out[#out + 1] = cur
					cur = word
				end
			end
			if cur ~= "" then out[#out + 1] = cur end
		end
	end
	while #out > 10 do -- склеить хвост, если перенос дал больше 10 строк
		out[#out - 1] = out[#out - 1] .. " " .. out[#out]
		out[#out] = nil
	end
	return out
end

-- строки бумажки (как пришли в ShowFortuneText) → русские строки или nil
local function lookup(lines)
	if count == 0 then return nil end
	local s = table.concat(lines, "\n"):gsub("%u", string.lower)
	local ru = FORT[fnv64(s)]
	return ru and wrap(ru) or nil
end

if count > 0 then Isaac.DebugString("[localfixes] русские предсказания: " .. count) end
return { lookup = lookup, count = function() return count end, hash = fnv64 }
