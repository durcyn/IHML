local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "ruRU")
if not L then return end


-- Core -------------------------------
L["In combat! %s queued lol!"] = "В бою! Макрос %s поставлен в очередь!" -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = "Используется макрос %s!" -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = "Для выбора макроса напечатайте: /ihml macroname <название макроса>" -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = "|cffff9999Внимание!|r Макрос %s не найден. Создайте его!" -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space :("] = "|cffff9999Внимание!|r Нет места для макроса :("
-- /core ------------------------------

-- Config -----------------------------
-- Options ------------------
L["Macros"] = "Макросы"
L["Options"] = "Опции"
L["Auto Swap"] = "Автосмена"
L["Use Auto Swap"] = "Включить автосмену"
L["Silent"] = "Тишина"
L["Don't print to chat when swapping."] = "Не сообщать в чате о смене макроса."
L["Auto Swap events"] = "События для автосмены"
L["BigWigs"] = "BigWigs"
L["By BigWigs Boss Module"] = "BigWigs босс модуль"
L["Instance type"] = "Тип инстанса"
L["By instance type. (arena, pvp, party or raid)"] = "Тип инстанса (arena, pvp, party или raid)" -- Don't translate (arena, pvp, party or raid), those names won't change with locale
L["Zone"] = "Зона"
L["By Zone"] = "Игровая зона"
L["Used Macro"] = "Используемый макрос"
L["Make Macro"] = "Создать макрос"
L["Pickup Macro"] = "\"Захватить\" макрос"
L["Click to pickup the IHML macro so that you can place it on an action bar."] = "Нажмите для \"захвата\" макроса IHML, чтобы вы могли поместить его на панели команд."
L["Reinsert default macros"] = "Восстановить стандартные макросы"
L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."] = "Используется для восстановления любых удалённых стандартных макросов. Не затрагивает изменённые варианты макросов. Сначала удалите изменённые макросы если вы хотите восстановить их в стандартные."
-- Macros -------------------
L["Select Macro:"] = "Выбор макроса:"
L["Select a macro."] = "Выбрать макрос."
L["Swap!"] = "Смена!"
L["Swap to the selected macro."] = "Сменить на выбранный макрос."
L["Edit Macro"] = "Редактировать макрос"
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 1044. You might want to edit this from the Blizzard Macro UI."] = "Название: Напечатайте \"boss\" для последнего загруженного босс модуля или \"zone\" для текущей зоны.\nЗначок: Номер с 1 до 1044. Вероятно вы захотите использовать для этого Blizzard Macro UI." -- Иногда сбивается вывод, отчего и как лечить - не разобрался
L["Name:"] = "Название:"
L["This needs to match the boss module name or zone exactly for auto swap to work."] = "Точное название босс модуля или зоны для правильной работы автосмены."
L["Macros must have a name!"] = "У макроса должно быть название!"
L["No boss module loaded!"] = "BigWigs босс модуль не загружен!"
L["%s already exists!"] = "Макрос %s уже существует!" -- %s gets replaced with the macro in question
L["Icon:"] = "Значок:"
L["Icon"] = "Значок"
--L["Macro body:"] = true
L["The macro goes here. Still limited to 255 characters."] = "Содержимое макроса. Ограничение на длину в 255 символов."
L["Make a new macro."] = "Создать новый макрос."
L["New macro"] = "Новый макрос"
L["New macro %d"] = "Новый макрос %d" -- %d gets replaced with a number
L["Remove!"] = "Удалить!"
L["Remove the macro."] = "Удалить макрос."
L["Are you sure you want to remove %s?"] = "Вы уверены что хотите удалить макрос %s?" -- %s gets replaced with the macro in question
-- /config ----------------------------

-- Стандартные макросы ---------------------
-- Стражи Небес Ша'тар ------------------
L["Blackwind Lake"] = "Озеро Черного Ветра"
L["Lower Veil Shil'ak"] = "Нижнее гнездовье Шил'ак"
L["Skettis"] = "Скеттис"
L["Terokk's Rest"] = "Покой Терокка"
L["Upper Veil Shil'ak"] = "Верхнее гнездовье Шил'ак"
L["Veil Ala'rak"] = "Гнездовье Ала'рак"
L["Veil Harr'ik"] = "Гнездовье Харр'ик"
L["m_skettis"] = [[#showtooltip item:32406
/use item:32406]]
-- Огри'ла ------------------
L["Vortex Pinnacle"] = "Нагорье Смерчей"
L["m_vortexpinnacle"] = [[#showtooltip item:32698
/use item:32698
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = "Лагерь Легиона: Гнев"
L["Forge Camp: Terror"] = "Лагерь Легиона: Ужас"
L["m_forgecamp"] = [[#showtooltip [flying] item:32456; item:32696
/use [flying] item:32456
/use [noflying] item:32696]]
-- Крылья Пустоверти ---------------
L["Netherwing Ledge"] = "Кряж Крыльев Пустоты"
L["m_booterang"] = [[#showtooltip [flying] item:32680; item:32503
/use [noflying] item:32503
/stopmacro [noflying]
/targetexact Непокорный батрак клана Драконьей Пасти
/use item:32680
/cleartarget]]
-- Армия Расколотого Солнца --
L["Isle of Quel'Danas"] = "Остров Кель'Данас"
L["m_crystalcores"] = [[#showtooltip item:34368
/targetexact Блуждающий караульный
/use item:34368]]
L["Sun's Reach Sanctum"] = "Святилище Солнечного Края"
L["m_manaremnants"] = [[#showtooltip item:34338
/use item:34338]]
L["Throne of Kil'jaeden"] = "Трон Кил'джедена"
L["m_blood4blood"] = [[#showtooltip item:34257
/use item:34257]]
L["Spirit Fields"] = "Поля Духов"
L["m_spectrogoggles"] = [[#showtooltip item:35233
/use item:35233
/equip item:35233]]
L["The Dead Scar"] = "Тропа Мертвых"
L["m_deadscar"] = [[#showtooltip item:34475
/use item:34475]]
L["The Dawning Square"] = "Рассветная площадь"
L["m_ssbanner"] = [[#showtooltip [dead] item:34414; item:34533
/use [dead] item:34414; item:34533]]
L["Greengill Coast"] = "Залив Зеленожабрых"
L["m_greengil"] = [[#showtooltip [exists] item:34483; item:34533
/use [exists] item:34483; item:34533]]
L["Dawnstar Village"] = "Деревня Утренней Звезды"
L["m_dawnstar"] = [[#showtooltip [dead] item:34368; item:34533
/use [dead] item:34368; item:34533]]
L["Bash'ir Landing"] = "Лагерь Баш'ира"
L["m_bashir"] = [[#showtooltip item:34248
/use item:34248]]
L["The Sin'loren"] = "Син'лорен"
L["The Dawnchaser"] = "Рассветный охотник"
L["The Bloodoath"] = "Кровавая Клятва"
L["m_flamingoil"] = [[#showtooltip item:34489
/use item:34489]]
L["Sun's Reach Armory"] = "Оружейная Солнечного Края"
L["m_atamal"] = [[#showtooltip item:34500
/use item:34500]]
L["Razorthorn Rise"] = "Уступ Острого Шипа"
L["m_razorthorn"] = [[#showtooltip [pet, harm, nodead] Накинуться; [pet] Вырывание корня острошипа; item:34255
/use [nopet] item:34255
/cast [pet, harm, nodead] Накинуться; [pet] Вырывание корня острошипа]]
-- Кулинария ------------------
L["Ancestral Grounds"] = "Земли Предков"
L["m_soup4soul"] = [[#showtooltip item:33851
/use item:33851]]
-- Черные топи -------------
L["The Black Morass"] = "Черные топи"
L["m_blackmorass"] = [[#showtooltip item:24289
/use item:24289]]
-- Терраса Магистров -------
L["Halls of Theory"] = "Залы Теории"
L["m_vexallus"] = [[/targetexact Чистая энергия
/startattack]]
-- Каражан -----------------
L["The Curator"] = "Смотритель"
L["m_curator"] = [[/targetexact Астральный огонь
/startattack]]
L["Terestian Illhoof"] = "Терестиан Больное Копыто"
L["m_illhoof"] = [[/targetexact Демонические цепи
/startattack]]
-- Зул'Аман -----------------
L["Halazzi"] = "Халаззи"
L["m_halazzi"] = [[/targetexact Оскверненный тотем молний
/startattack]]
-- Змеиное святилище -----
L["Fathom-Lord Karathress"] = "Повелитель глубин Каратресс"
L["m_flk"] = [[/targetexact Тотем огненного всполоха -- НУЖНО подтверждение
/startattack]]
L["Lady Vashj"] = "Леди Вайш"
L["m_vashj"] = [[/stopmacro[noexists][harm]
/run i=31088 t="target" if GetItemCount(i)>0 and HasFullControl() and IsItemInRange(i,t) then n=UnitName(t) s=SendChatMessage m="<-- Порченая магма --> " s(m..n.." !","RAID") s(m.."У ТЕБЯ !","WHISPER",nil,n) end
/use item:31088]]
-- Крепость Бурь -------------
-- Хиджал --------------
L["Archimonde"] = "Архимонд"
L["m_archimonde"] = [[#showtooltip item:24494
/use item:24494]]
-- Черный храм -------------
L["High Warlord Naj'entus"] = "Верховный Полководец Надж'ентус"
L["m_najentus"] = [[#showtooltip item:32408
/use item:32408]]

-- WotLK
L["Coldarra"] = "Хладарра"
L["m_drakehunt"] = [[#showtooltip item:35506
/use item:35506]]
-- Грозовая Гряда
L["The Forlorn Mine"] = "Заброшенный рудник"
L["m_discipline"] = [[#showtooltip item:42837
/use item:42837]]
L["Fjorn's Anvil"] = "Наковальня Фьорна"
L["Frostfield Lake"] = "Промерзшее озеро"
L["m_essenceofice"] = [[#showtooltip item:42246
/use item:42246]]
L["Valkyrion"] = "Валькирион"
L["The Blighted Pool"] = "Нечистый пруд"
L["m_aberations"] = [[#showtooltip item:41612
/use item:41612]]
L["Garm's Bane"] = "Бич Гарма"
L["m_landmine"] = [[#showtooltip item:40676
/use item:40676]]
L["Thunderfall"] = "Громовержье"
L["m_hodirhorn"] = [[#showtooltip item:42164
/use item:42164]]
L["Valley of Ancient Winters"] = "Долина Древних Зим"
L["m_hodirdaily"] = [[#showtooltip [dead] item:42479; item:42774
/use [dead] item:42479; item:42774]]
L["The Pit of the Fang"] = "Яма Клыка"
L["m_pitoffang"] = [[#showtooltip item:42499
/use item:42499]]
-- Ледяная Корона
L["The Valley of Fallen Heroes"] = "Долина павших героев"
L["m_alliancebline"] = [[#showtooltip item:44212
/targetexact Разведывательный истребитель "Усмирителя Небес"
/use item:44212]]
L["Njorndar Village"] = "Деревня Ньорндар"
L["m_leavemark"] = [[#showtooltip [dead] item:42480
/use [dead] item:42480]]
L["Onslaught Harbor"] = "Гавань Натиска"
L["m_corpserise"] = [[#showtooltip [dead] item:40587
/use [dead] item:40587]]
-- Низина Шолазар
L["The Stormwright's Shelf"] = "Уступ Ваятеля Бурь"
L["m_windandwater"] = [[#showtooltip item:39571
/use item:39571]]
-- Берег Древних
L["Courtyard of the Ancients"] = "Внутренний двор Древних" -- Нужно подтверждение
L["m_strand"] = [[#showtooltip item:39213
/use item:39213]]
L["The Culling of Stratholme"] = "Очищение Стратхольма" -- Нужно подтверждение
L["m_cos"] = [[#showtooltip item:37888
/use item:37888]]
-- Ревущий фьорд
L["Howling Fjord"] = "Ревущий фьорд"
L["Ledge of Garvan"] = "Риф Гарвана"
L["Twin Coast"] = "Два берега"
L["m_fishyfish"] = [[#showtooltip item:40946
/use item:40946]]
L["m_lureit"] = [[#showtooltip item:34127
/target Рифовый буйвол
/target Прикормленный рифовый буйвол
/use item:34127]]
-- Зул'Драк
L["Drak'Sotra"] = "Драк'Сотра"
-- 38564 == torches
L["m_draksotra"] = [[#showtooltip [dead] item:38556;item:38544
/use [dead] item:38556;item:38544]]
L["Zul'Drak"] = "Зул'Драк"
L["m_zuldrak"] = [[#showtooltip item:38566
/use item:38566]]
-- /Default macros --------------------
