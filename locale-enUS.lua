local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "enUS", true)

-- See locale-exEX.lua for instructions in how to make a translation

-- Core -------------------------------
L["In combat! %s queued lol!"] = true -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = true -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = true -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = true -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space :("] = true
-- /core ------------------------------

-- Config -----------------------------
-- Options ------------------
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
-- Macros -------------------
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
-- /config ----------------------------

-- Default macros ---------------------
-- Skettis ------------------
L["Blackwind Lake"] = true
L["Lower Veil Shil'ak"] = true
L["Skettis"] = true
L["Terokk's Rest"] = true
L["Upper Veil Shil'ak"] = true
L["Veil Ala'rak"] = true
L["Veil Harr'ik"] = true
L["m_skettis"] = [[#showtooltip item:32406
/use Skyguard Blasting Charges]]
-- Ogri'La ------------------
L["Vortex Pinnacle"] = true
L["m_vortexpinnacle"] = [[#showtooltip item:32698
/use Wrangling Rope
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = true
L["Forge Camp: Terror"] = true
L["m_forgecamp"] = [[#showtooltip [flying] item:32456; item:32696
/use [flying] Skyguard Bombs
/use [noflying] Banishing Crystal]]
-- Netherwing ---------------
L["Netherwing Ledge"] = true
L["m_booterang"] = [[#showtooltip [flying] item:32680; item:32503
/use [noflying] Yarzill's Mutton
/stopmacro [noflying]
/targetexact Disobedient Dragonmaw Peon
/use Booterang
/cleartarget]]
-- Shattered Sun Offensive --
L["Isle of Quel'Danas"] = true
L["m_crystalcores"] = [[#showtooltip item:34368
/targetexact Erratic Sentry
/use Attuned Crystal Cores]]
L["Sun's Reach Sanctum"] = true
L["m_manaremnants"] = [[#showtooltip item:34338
/use Mana Remnants]]
L["Throne of Kil'jaeden"] = true
L["m_blood4blood"] = [[#showtooltip item:34257
/use Fel Siphon]]
L["Spirit Fields"] = true
L["m_spectrogoggles"] = [[#showtooltip item:35233
/use Multiphase Spectrographic Goggles
/equip Multiphase Spectrographic Goggles]]
L["The Dead Scar"] = true
L["m_deadscar"] = [[#showtooltip item:34475
/use Arcane Charges]]
L["The Dawning Square"] = true
L["m_ssbanner"] = [[#showtooltip [dead] item:34414; item:34533
/use [dead] Shattered Sun Banner; Astromancer's Crystal]]
L["Greengill Coast"] = true
L["m_greengil"] = [[#showtooltip [exists] item:34483; item:34533
/use [exists] Orb of Murloc Control; Astromancer's Crystal]]
L["Dawnstar Village"] = true
L["m_dawnstar"] = [[#showtooltip [dead] item:34368; item:34533
/use [dead] Attuned Crystal Cores; Astromancer's Crystal]]
L["Bash'ir Landing"] = true
L["m_bashir"] = [[#showtooltip item:34248
/use Bash'ir Phasing Device]]
L["The Sin'loren"] = true
L["The Dawnchaser"] = true
L["The Bloodoath"] = true
L["m_flamingoil"] = [[#showtooltip item:34489
/use Flaming Oil]]
L["Sun's Reach Armory"] = true
L["m_atamal"] = [[#showtooltip item:34500
/use Ata'mal Armament]]
L["Razorthorn Rise"] = true
L["m_razorthorn"] = [[#showtooltip [pet, harm, nodead] Ravage; [pet] Expose Razorthorn Root; item:34255
/use [nopet] Razorthorn Flayer Gland
/cast [pet, harm, nodead] Ravage; [pet] Expose Razorthorn Root]]
-- Cooking ------------------
L["Ancestral Grounds"] = true
L["m_soup4soul"] = [[#showtooltip item:33851
/use Cooking Pot]]
-- The Black Morass -------------
L["The Black Morass"] = true
L["m_blackmorass"] = [[#showtooltip item:24289
/use Chrono-beacon]]
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
/use Tears of the Goddess]]
-- Black Temple -------------
L["High Warlord Naj'entus"] = true
L["m_najentus"] = [[#showtooltip item:32408
/use Naj'entus Spine]]

-- WotLK
L["Coldarra"] = true
L["m_drakehunt"] = [[#showtooltip item:35506
/use Raelorasz's Spear]]
L["The Forlorn Mine"] = true
L["m_discipline"] = [[#showtooltip item:42837
/use Disciplining Rod]]
L["The Valley of Fallen Heroes"] = true
L["m_alliancebline"] = [[#showtooltip item:44212
/target Skybreaker Recon Fighter
/use SGM-3]]
L["Njorndar Village"] = true
L["m_leavemark"] = [[#showtooltip item:42480
/use [dead] Ebon Blade Banner]]
L["Onslaught Harbor"] = true
L["m_corpserise"] = [[#showtooltip item:40587
/use [dead] Darkmender's Tincture]]
L["The Stormwright's Shelf"] = true
L["m_windandwater"] = [[#showtooltip item:39571
/use Drums of the Tempest]]
-- /Default macros --------------------
