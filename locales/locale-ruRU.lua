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
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 779. You might want to edit this from the Blizzard Macro UI."] = "Название: Напечатайте \"boss\" для последнего загруженного босс модуля или \"zone\" для текущей зоны.\nЗначок: Номер с 1 до 779. Вероятно вы захотите использовать для этого Blizzard Macro UI." -- Иногда сбивается вывод, отчего и как лечить - не разобрался
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
/use Взрывчатка Стражи Небес]]
-- Огри'ла ------------------
L["Vortex Pinnacle"] = "Нагорье Смерчей"
L["m_vortexpinnacle"] = [[#showtooltip item:32698
/use Веревочный аркан
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = "Лагерь Легиона: Гнев"
L["Forge Camp: Terror"] = "Лагерь Легиона: Ужас"
L["m_forgecamp"] = [[#showtooltip [flying] item:32456; item:32696
/use [flying] Бомбы Стражи Небес
/use [noflying] Кристалл Изгнания]]
-- Крылья Пустоверти ---------------
L["Netherwing Ledge"] = "Кряж Крыльев Пустоты"
L["m_booterang"] = [[#showtooltip [flying] item:32680; item:32503
/use [noflying] Баранина Ярзилла
/stopmacro [noflying]
/targetexact Непокорный батрак клана Драконьей Пасти
/use Ботиранг
/cleartarget]]
-- Армия Расколотого Солнца --
L["Isle of Quel'Danas"] = "Остров Кель'Данас"
L["m_crystalcores"] = [[#showtooltip item:34368
/targetexact Блуждающий караульный
/use Настроенные кристаллы-сердечники]]
L["Sun's Reach Sanctum"] = "Святилище Солнечного Края"
L["m_manaremnants"] = [[#showtooltip item:34338
/use Клочки маны]]
L["Throne of Kil'jaeden"] = "Трон Кил'джедена"
L["m_blood4blood"] = [[#showtooltip item:34257
/use Отбор Скверны]]
L["Spirit Fields"] = "Поля Духов"
L["m_spectrogoggles"] = [[#showtooltip item:35233
/use Мультифазовые спектрографические очки
/equip Мультифазовые спектрографические очки]]
L["The Dead Scar"] = "Тропа Мертвых"
L["m_deadscar"] = [[#showtooltip item:34475
/use Волшебные сгустки]]
L["The Dawning Square"] = "Рассветная площадь"
L["m_ssbanner"] = [[#showtooltip [dead] item:34414; item:34533
/use [dead] Знамя Расколотого Солнца; Кристалл звездочета]]
L["Greengill Coast"] = "Залив Зеленожабрых"
L["m_greengil"] = [[#showtooltip [exists] item:34483; item:34533
/use [exists] Сфера контроля мурлока; Кристалл звездочета]]
L["Dawnstar Village"] = "Деревня Утренней Звезды"
L["m_dawnstar"] = [[#showtooltip [dead] item:34368; item:34533
/use [dead] Настроенные кристаллы-сердечники; Кристалл звездочета]]
L["Bash'ir Landing"] = "Лагерь Баш'ира"
L["m_bashir"] = [[#showtooltip item:34248
/use Синхронизатор Баш'ира]]
L["The Sin'loren"] = "Син'лорен"
L["The Dawnchaser"] = "Рассветный охотник"
L["The Bloodoath"] = "Кровавая Клятва"
L["m_flamingoil"] = [[#showtooltip item:34489
/use Горящее масло]]
L["Sun's Reach Armory"] = "Оружейная Солнечного Края"
L["m_atamal"] = [[#showtooltip item:34500
/use Оружие Ата'мала]]
L["Razorthorn Rise"] = "Уступ Острого Шипа"
L["m_razorthorn"] = [[#showtooltip [pet, harm, nodead] Накинуться; [pet] Вырывание корня острошипа; item:34255
/use [nopet] Железа острошипа-живодера
/cast [pet, harm, nodead] Накинуться; [pet] Вырывание корня острошипа]]
-- Кулинария ------------------
L["Ancestral Grounds"] = "Земли Предков"
L["m_soup4soul"] = [[#showtooltip item:33851
/use Котелок]]
-- Черные топи -------------
--L["The Black Morass"] = "Черные топи"
--L["m_blackmorass"] = [[#showtooltip item:24289
--/use Маяк времени]]
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
/use Слезы Богини]] -- НУЖНО подтверждение
-- Черный храм -------------
L["High Warlord Naj'entus"] = "Верховный Полководец Надж'ентус"
L["m_najentus"] = [[#showtooltip item:32408
/use Шип Наджентуса]] -- НУЖНО подтверждение
-- /Default macros --------------------
