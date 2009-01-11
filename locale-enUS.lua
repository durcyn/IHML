--[[

locale-enUS.lua

enUS localization strings for Ackis Recipe List

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

Original translated by: Ackis
Currently maintained by: Snago

Please make sure you update the ToC file with any translations.

Please update http://www.wowace.com/projects/ihml/localization/enUS/ for any translation
additions or changes.

****************************************************************************************
]]--

local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "enUS", true)

if not L then return end

-- Core Options
L["In combat! %s queued lol!"] = true -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = true -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = true -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = true -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space :("] = true

-- Configuration
-- Options
L["Macros"] = true
L["Options"] = true
L["Auto Swap"] = true
L["Use Auto Swap"] = true
L["Silent"] = true
L["Don't print to chat when swapping."] = true
L["Auto Swap events"] = true
L["BigWigs"] = true
L["By BigWigs Boss Module"] = true
L["Instance type"] = true
L["By instance type. (arena, pvp, party or raid)"] = true -- Don't translate (arena, pvp, party or raid), those names won't change with locale
L["Zone"] = true
L["By Zone"] = true
L["Used Macro"] = true
L["Make Macro"] = true
L["Pickup Macro"] = true
L["Click to pickup the IHML macro so that you can place it on an action bar."] = true
L["Reinsert default macros"] = true
L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."] = true

-- Macros
L["Select Macro:"] = true
L["Select a macro."] = true
L["Swap!"] = true
L["Swap to the selected macro."] = true
L["Edit Macro"] = true
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 1044. You might want to edit this from the Blizzard Macro UI."] = true
L["Name:"] = true
L["This needs to match the boss module name or zone exactly for auto swap to work."] = true
L["Macros must have a name!"] = true
L["No boss module loaded!"] = true
L["%s already exists!"] = true -- %s gets replaced with the macro in question
L["Icon:"] = true
L["Icon"] = true
--L["Macro body:"] = true
L["The macro goes here. Still limited to 255 characters."] = true
L["Make a new macro."] = true
L["New macro"] = true
L["New macro %d"] = true -- %d gets replaced with a number
L["Remove!"] = true
L["Remove the macro."] = true
L["Are you sure you want to remove %s?"] = true -- %s gets replaced with the macro in question

-- Default macros
-- Skettis
L["Blackwind Lake"] = true
L["Lower Veil Shil'ak"] = true
L["Skettis"] = true
L["Terokk's Rest"] = true
L["Upper Veil Shil'ak"] = true
L["Veil Ala'rak"] = true
L["Veil Harr'ik"] = true
L["m_skettis"] = [[#showtooltip item:32406
/use item:32406]]
-- Ogri'La ------------------
L["Vortex Pinnacle"] = true
L["m_vortexpinnacle"] = [[#showtooltip item:32698
/use item:32698
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = true
L["Forge Camp: Terror"] = true
L["m_forgecamp"] = [[#showtooltip [flying] item:32456; item:32696
/use [flying] item:32456
/use [noflying] item:32696]]
-- Netherwing ---------------
L["Netherwing Ledge"] = true
L["m_booterang"] = [[#showtooltip [flying] item:32680; item:32503
/use [noflying] item:32503
/stopmacro [noflying]
/targetexact Disobedient Dragonmaw Peon
/use item:32680
/cleartarget]]
-- Shattered Sun Offensive --
L["Isle of Quel'Danas"] = true
L["m_crystalcores"] = [[#showtooltip item:34368
/targetexact Erratic Sentry
/use item:34368]]
L["Sun's Reach Sanctum"] = true
L["m_manaremnants"] = [[#showtooltip item:34338
/use item:34338]]
L["Throne of Kil'jaeden"] = true
L["m_blood4blood"] = [[#showtooltip item:34257
/use item:34257]]
L["Spirit Fields"] = true
L["m_spectrogoggles"] = [[#showtooltip item:35233
/use item:35233
/equip item:35233]]
L["The Dead Scar"] = true
L["m_deadscar"] = [[#showtooltip item:34475
/use item:34475]]
L["The Dawning Square"] = true
L["m_ssbanner"] = [[#showtooltip [dead] item:34414; item:34533
/use [dead] item:34414; item:34533]]
L["Greengill Coast"] = true
L["m_greengil"] = [[#showtooltip [exists] item:34483; item:34533
/use [exists] item:34483; item:34533]]
L["Dawnstar Village"] = true
L["m_dawnstar"] = [[#showtooltip [dead] item:34368; item:34533
/use [dead] item:34368; item:34533]]
L["Bash'ir Landing"] = true
L["m_bashir"] = [[#showtooltip item:34248
/use item:34248]]
L["The Sin'loren"] = true
L["The Dawnchaser"] = true
L["The Bloodoath"] = true
L["m_flamingoil"] = [[#showtooltip item:34489
/use item:34489]]
L["Sun's Reach Armory"] = true
L["m_atamal"] = [[#showtooltip item:34500
/use item:34500]]
L["Razorthorn Rise"] = true
L["m_razorthorn"] = [[#showtooltip [pet, harm, nodead] Ravage; [pet] Expose Razorthorn Root; item:34255
/use [nopet] item:34255
/cast [pet, harm, nodead] Ravage; [pet] Expose Razorthorn Root]]
-- Cooking ------------------
L["Ancestral Grounds"] = true
L["m_soup4soul"] = [[#showtooltip item:33851
/use item:33851]]
-- The Black Morass -------------
L["The Black Morass"] = true
L["m_blackmorass"] = [[#showtooltip item:24289
/use item:24289]]
-- Magisters' Terrace -------
L["Halls of Theory"] = true
L["m_vexallus"] = [[/targetexact Pure Energy
/startattack]]
-- Karazhan -----------------
L["The Curator"] = true
L["m_curator"] = [[/targetexact Astral Flare
/startattack]]
L["Terestian Illhoof"] = true
L["m_illhoof"] = [[/targetexact Demon Chains
/startattack]]
-- Zul'Aman -----------------
L["Halazzi"] = true
L["m_halazzi"] = [[/targetexact Corrupted Lightning Totem
/startattack]]
-- Serpentshrine Cavern -----
L["Fathom-Lord Karathress"] = true
L["m_flk"] = [[/targetexact Spitfire Totem
/startattack]]
L["Lady Vashj"] = true
L["m_vashj"] = [[/stopmacro[noexists][harm]
/run i=31088 t="target" if GetItemCount(i)>0 and HasFullControl() and IsItemInRange(i,t) then n=UnitName(t) s=SendChatMessage m="<-- TAINTED CORE TO --> " s(m..n.." !","RAID") s(m.."YOU !","WHISPER",nil,n) end
/use item:31088]]
-- Tempest Keep -------------
-- Mount Hyjal --------------
L["Archimonde"] = true
L["m_archimonde"] = [[#showtooltip item:24494
/use item:24494]]
-- Black Temple -------------
L["High Warlord Naj'entus"] = true
L["m_najentus"] = [[#showtooltip item:32408
/use item:32408]]

-- WotLK
L["Coldarra"] = true
L["m_drakehunt"] = [[#showtooltip item:35506
/use item:35506]]
-- Storm Peaks
L["The Forlorn Mine"] = true
L["m_discipline"] = [[#showtooltip item:42837
/use item:42837]]
L["Fjorn's Anvil"] = true
L["Frostfield Lake"] = true
L["m_essenceofice"] = [[#showtooltip item:42246
/use item:42246]]
L["Valkyrion"] = true
L["The Blighted Pool"] = true
L["m_aberations"] = [[#showtooltip item:41612
/use item:41612]]
L["Garm's Bane"] = true
L["m_landmine"] = [[#showtooltip item:40676
/use item:40676]]
L["Thunderfall"] = true
L["m_hodirhorn"] = [[#showtooltip item:42164
/use item:42164]]
L["Valley of Ancient Winters"] = true
L["m_hodirdaily"] = [[#showtooltip [dead] item:42479; item:42774
/use [dead] item:42479; item:42774]]
L["The Pit of the Fang"] = true
L["m_pitoffang"] = [[#showtooltip item:42499
/use item:42499]]
-- Ice Crown
L["The Valley of Fallen Heroes"] = true
L["m_alliancebline"] = [[#showtooltip item:44212
/targetexact Skybreaker Recon Fighter
/use item:44212]]
L["Njorndar Village"] = true
L["m_leavemark"] = [[#showtooltip [dead] item:42480
/use [dead] item:42480]]
L["Onslaught Harbor"] = true
L["m_corpserise"] = [[#showtooltip [dead] item:40587
/use [dead] item:40587]]
-- Basin
L["The Stormwright's Shelf"] = true
L["m_windandwater"] = [[#showtooltip item:39571
/use item:39571]]
-- Strand of the Ancients
L["Courtyard of the Ancients"] = true
L["m_strand"] = [[#showtooltip item:39213
/use item:39213]]
L["The Culling of Stratholme"] = true
L["m_cos"] = [[#showtooltip item:37888
/use item:37888]]
-- Howling Fjord
L["Howling Fjord"] = true
L["Ledge of Garvan"] = true
L["Twin Coast"] = true
L["m_fishyfish"] = [[#showtooltip item:40946
/use item:40946]]
L["m_lureit"] = [[#showtooltip item:34127
/target Reef Bull
/target Attracted Reef Bull
/use item:34127]]
L["Drak'Sotra"] = true
-- 38564 == torches
-- 38566 == Steel spade
-- 38574 == grenades
L["m_draksotra"] = [[#showtooltip [dead] item:38556;item:38544
/use [dead] item:38556;item:38544]]
L["Zul'Drak"] = true
L["m_zuldrak"] = [[#showtooltip item:38566
/use item:38566]]
