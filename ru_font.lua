-- localfixes: кириллица в Isaac.RenderText / RenderScaledText (17.10, перевод). Эти функции рисуют встроенным
-- шрифтом игры, в нём нет русских букв — строка выходит пустой (заголовок дерева PST «Очки навыков / Сбросы»,
-- надписи других модов). Обёртка: строку с не-ASCII байтами рисует шрифт с кириллицей (LanaPixel — тот же, что у
-- PST для не-английских языков; если PST уже загрузил его — тот же объект), остальное — как было.
-- Ставится при загрузке localfixes (функции берутся при каждом вызове, так что действует на все моды).
local origRT, origRST = Isaac.RenderText, Isaac.RenderScaledText
local font
local DY = -3 -- LanaPixel выше встроенного шрифта: подгонка базовой линии (по снимку окна дерева PST)

local function cyrFont()
	if font then return font end
	if PST and PST.miniFont and PST.miniFont.IsLoaded and PST.miniFont:IsLoaded() then
		font = PST.miniFont
	else
		font = Font()
		font:Load("font/cjk/lanapixel.fnt")
	end
	return font
end

local function nonAscii(s) return type(s) == "string" and s:find("[\128-\255]") ~= nil end
-- вшитые английские надписи — через словарь вывода (ru_draw.lua), если он подключён
local function tr(s)
	local t = LOCALFIXES and LOCALFIXES.TranslateUI
	return t and t(s) or s
end

if origRT then
	Isaac.RenderText = function(str, x, y, r, g, b, a, ...)
		str = tr(str)
		if nonAscii(str) then
			local f = cyrFont()
			if f and f:IsLoaded() then
				f:DrawStringUTF8(str, x, y + DY, KColor(r or 1, g or 1, b or 1, a or 1), 0, false)
				return
			end
		end
		return origRT(str, x, y, r, g, b, a, ...)
	end
end
if origRST then
	Isaac.RenderScaledText = function(str, x, y, sx, sy, r, g, b, a, ...)
		str = tr(str)
		if nonAscii(str) then
			local f = cyrFont()
			if f and f:IsLoaded() then
				f:DrawStringScaledUTF8(str, x, y + DY * (sy or 1), sx or 1, sy or 1, KColor(r or 1, g or 1, b or 1, a or 1), 0, false)
				return
			end
		end
		return origRST(str, x, y, sx, sy, r, g, b, a, ...)
	end
end
return true
