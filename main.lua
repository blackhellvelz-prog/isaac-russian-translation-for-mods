-- Russian Translation for Mods — русский перевод модов поверх Mod Translator (автор blackhellvelz): названия и описания
-- предметов, брелоков, карт и пилюль модов, меню Dead Sea Scrolls, Passive Skill Trees, Mod Config Menu,
-- энциклопедия, всплывающие надписи, предсказания Fiend Folio, вшитые надписи модов, картинки по языку игры.
-- Работает только при русском языке игры. Мод Мастерской собирается tools/build_workshop.py из модулей src/localfixes.
LOCALFIXES = LOCALFIXES or {}
if LOCALFIXES.AllInOne then
	Isaac.DebugString("[Russian Translation] пропуск: стоит общая сборка localfixes")
	return
end
local mod = RegisterMod("Russian Translation for Mods", 1)
LOCALFIXES.Mod = mod

local function load(name)
	local ok, r = pcall(include, name)
	if not ok then Isaac.DebugString("[Russian Translation] " .. name .. ": " .. tostring(r)) end
	return ok and type(r) == "table" and r or nil
end

-- таблицы читаются сейчас (include находит файлы мода только при его загрузке), применяются после загрузки всех модов
local ru = load("ru_items")
LOCALFIXES.ApplyRussianItems = ru and ru.apply or nil
if ru and ru.modules then
	-- в самом конце старта забега: после Lost and Forgotten (собирает модули) и Mod Translator
	mod:AddPriorityCallback(ModCallbacks.MC_POST_GAME_STARTED, 100000, ru.modules)
end
local ruDraw = load("ru_draw")           -- вшитые надписи модов на выводе
LOCALFIXES.InstallRussianDraw = ruDraw and ruDraw.install or nil
load("ru_font")                          -- кириллица в Isaac.RenderText / RenderScaledText
local ruPst = load("ru_pst")             -- Passive Skill Trees
LOCALFIXES.InstallRussianPST = ruPst and ruPst.install or nil
LOCALFIXES.RuCharName = ruPst and ruPst.strictName or nil
local ruDss = load("ru_dss")             -- меню Dead Sea Scrolls
LOCALFIXES.TranslateDSS = ruDss and ruDss.translate or nil
LOCALFIXES.TranslateDSSSet = ruDss and ruDss.translateSet or nil
local ruFort = load("ru_fortunes")       -- предсказания Fiend Folio
LOCALFIXES.RuFortuneLookup = ruFort and ruFort.lookup or nil
LOCALFIXES.RuFortuneHash = ruFort and ruFort.hash or nil
local ruPop = load("ru_popup")           -- всплывающие надписи модов
LOCALFIXES.InstallRussianPopups = ruPop and ruPop.install or nil
LOCALFIXES.TranslatePopup = ruPop and ruPop.translate or nil
local ruMcm = load("ru_mcm")             -- Mod Config Menu
LOCALFIXES.TranslateMCM = ruMcm and ruMcm.translate or nil
LOCALFIXES.InstallRussianMCM = ruMcm and ruMcm.install or nil
load("ru_rgon")                          -- страница статистики REPENTOGON
LOCALFIXES.Mod = mod
load("ru_images")                        -- русские картинки игры и модов по языку игры
local ruEncy = load("ru_ency")           -- энциклопедия
LOCALFIXES.TranslateEncy = ruEncy and ruEncy.translate or nil
if ruEncy and ruEncy.localizeNames then
	-- названия вещей в энциклопедии — после Mod Translator (он переводит в MC_POST_GAME_STARTED)
	mod:AddPriorityCallback(ModCallbacks.MC_POST_GAME_STARTED, 100001, function()
		local ok, n = pcall(ruEncy.localizeNames)
		Isaac.DebugString("[Russian Translation] энциклопедия: русских названий " .. tostring(n) .. (ok and "" or " (ошибка)"))
	end)
end

local function install()
	if LOCALFIXES.ApplyRussianItems then pcall(LOCALFIXES.ApplyRussianItems) end
	if LOCALFIXES.InstallRussianPST then pcall(LOCALFIXES.InstallRussianPST) end
	if LOCALFIXES.InstallRussianDraw then pcall(LOCALFIXES.InstallRussianDraw) end
	if LOCALFIXES.InstallRussianPopups then pcall(LOCALFIXES.InstallRussianPopups) end
	if LOCALFIXES.InstallRussianMCM then pcall(LOCALFIXES.InstallRussianMCM) end
end
if ModCallbacks.MC_POST_MODS_LOADED then
	mod:AddCallback(ModCallbacks.MC_POST_MODS_LOADED, install)
end
mod:AddPriorityCallback(ModCallbacks.MC_POST_GAME_STARTED, CallbackPriority.IMPORTANT, function()
	-- всплывающие надписи и MCM: если при загрузке модов HUD ещё не был доступен — здесь (повторно не ставятся)
	if LOCALFIXES.InstallRussianPopups then pcall(LOCALFIXES.InstallRussianPopups) end
	if LOCALFIXES.InstallRussianMCM then pcall(LOCALFIXES.InstallRussianMCM) end
end)
