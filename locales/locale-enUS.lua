--[[

locale-enUS.lua

enUS localization strings for IHML

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
L["Last Module"] = "Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 1044. You might want to edit this from the Blizzard Macro UI."
L["Edit Macro"] = true
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
L["PVP"] = true

-- Default macros
-- Most macros do not need to be localized.
-- Skettis
L["Blackwind Lake"] = true
L["Lower Veil Shil'ak"] = true
L["Skettis"] = true
L["Terokk's Rest"] = true
L["Upper Veil Shil'ak"] = true
L["Veil Ala'rak"] = true
L["Veil Harr'ik"] = true
-- Ogri'La
L["Vortex Pinnacle"] = true
L["Forge Camp: Wrath"] = true
L["Forge Camp: Terror"] = true
-- Halaa
L["Halaa"] = true
-- Netherwing
L["Netherwing Ledge"] = true
L["m_booterang"] = [[#showtooltip [flying] item:32680; item:32503
/use [noflying] item:32503
/stopmacro [noflying]
/targetexact Disobedient Dragonmaw Peon
/use item:32680
/cleartarget]]
-- Shattered Sun Offensive
L["Isle of Quel'Danas"] = true
L["m_crystalcores"] = [[#showtooltip item:34368
/targetexact Erratic Sentry
/use item:34368]]
L["Sun's Reach Sanctum"] = true
L["Throne of Kil'jaeden"] = true
L["Spirit Fields"] = true
L["The Dead Scar"] = true
L["The Dawning Square"] = true
L["Greengill Coast"] = true
L["Dawnstar Village"] = true
L["Bash'ir Landing"] = true
L["The Sin'loren"] = true
L["The Dawnchaser"] = true
L["The Bloodoath"] = true
L["Sun's Reach Armory"] = true
L["Razorthorn Rise"] = true
L["m_razorthorn"] = [[#showtooltip [pet, harm, nodead] Ravage; [pet] Expose Razorthorn Root; item:34255
/use [nopet] item:34255
/cast [pet, harm, nodead] Ravage; [pet] Expose Razorthorn Root]]
-- BC Cooking Daily
L["Ancestral Grounds"] = true
-- The Black Morass
L["The Black Morass"] = true
-- Magisters' Terrace
L["Halls of Theory"] = true
L["m_vexallus"] = [[/targetexact Pure Energy
/startattack]]
-- Karazhan
L["The Curator"] = true
L["m_curator"] = [[/targetexact Astral Flare
/startattack]]
L["Terestian Illhoof"] = true
L["m_illhoof"] = [[/targetexact Demon Chains
/startattack]]
-- Zul'Aman
L["Halazzi"] = true
L["m_halazzi"] = [[/targetexact Corrupted Lightning Totem
/startattack]]
-- Serpentshrine Cavern
L["Fathom-Lord Karathress"] = true
L["m_flk"] = [[/targetexact Spitfire Totem
/startattack]]
L["Lady Vashj"] = true
L["m_vashj"] = [[/stopmacro[noexists][harm]
/run i=31088 t="target" if GetItemCount(i)>0 and HasFullControl() and IsItemInRange(i,t) then n=UnitName(t) s=SendChatMessage m="<-- TAINTED CORE TO --> " s(m..n.." !","RAID") s(m.."YOU !","WHISPER",nil,n) end
/use item:31088]]
-- Tempest Keep
-- Mount Hyjal
L["Archimonde"] = true
-- Black Temple
L["High Warlord Naj'entus"] = true

-- WotLK
L["Coldarra"] = true
L["m_drakehunt"] = [[#showtooltip item:35506
/targetexact Nexus Drake Hatchling
/use item:35506]]
-- Storm Peaks
L["The Forlorn Mine"] = true
L["Fjorn's Anvil"] = true
L["Frostfield Lake"] = true
L["Valkyrion"] = true
L["The Blighted Pool"] = true
L["Garm's Bane"] = true
L["Thunderfall"] = true
L["Valley of Ancient Winters"] = true
L["The Pit of the Fang"] = true
-- Ice Crown
L["The Broken Front"] = true
L["m_brokenfront"] = [[#showtooltip item:43968
/targetexact Hulking Abomination
/use item:43968]]
L["The Valley of Fallen Heroes"] = true
L["m_alliancebline"] = [[#showtooltip item:44212
/targetexact Skybreaker Recon Fighter
/use item:44212]]
L["Njorndar Village"] = true
L["Onslaught Harbor"] = true
-- Basin
L["The Stormwright's Shelf"] = true
-- Strand of the Ancients
L["Courtyard of the Ancients"] = true
L["The Culling of Stratholme"] = true
-- Grizzly Hills
L["Grizzly Hills"] = true
-- Howling Fjord
L["Howling Fjord"] = true
L["Ledge of Garvan"] = true
L["Twin Coast"] = true
L["m_lureit"] = [[#showtooltip item:34127
/target Reef Bull
/target Attracted Reef Bull
/use item:34127]]
L["Drak'Sotra"] = true
L["Zul'Drak"] = true
L["Venture Bay"] = true
