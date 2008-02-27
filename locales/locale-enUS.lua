local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "enUS", true)


--[[
To make a translation, make a copy of the locale-exEX.lua 
file and rename it to match your language (for example: 
locale-frFR.lua for french). You must also replace "exEX" 
on the first line with the code for your language.

Translate the strings on the right side of the '='-sign
L["Example"] = "Examplé"
    |             \ Translate this part
    \ Don't translate this part

If the string contains any %s or %d, feel free to move them 
around to match the grammar of your language as long as you
keep them in the same order!

Don't insert any comments above or below a line, since that
will mess up the line numbers so they no longer match with 
the enUS file. Any comments about translation goes at the 
end of the line, before any comment that's already there.
L["Example %d"] = "Examplé No. %d" -- translators comment here -- %d will be replaced by a number

You must also add a line to the locales.xml for the game to
load your translation.
<Script file="locale-frFR.lua"/>
Make sure you put it after <Script file="locale-enUS.lua"/>
but before </Ui>

Thanks for your effort!
/Snago
--]]

-- Core -------------------------------
L["In combat! %s queued lol!"] = true -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = true -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = true -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = true -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space for a non character specific macro :("] = true
L["%s is character specific. It is recomended to use a general macro if the profile is used with more than one character. (And to get rid of this nagging ;P)"] = true -- %s gets replaced with the macroname
-- /core ------------------------------

-- Config -----------------------------
-- Options
L["Macros"] = true
L["Options"] = true
L["Auto Swap"] = true
L["Use Auto Swap"] = true
L["Auto Swap events"] = true
L["BigWigs"] = true
L["By BigWigs Boss Module"] = true
L["Zone"] = true
L["By Zone"] = true
L["Used Macro"] = true
L["Make Macro"] = true
L["Reinsert default macros"] = true
L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."] = true
-- Macros
L["Select Macro:"] = true
L["Select a macro."] = true
L["Swap!"] = true
L["Swap to the selected macro."] = true
L["Edit Macro"] = true
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 769. You might want to edit this from the Blizzard Macro UI."] = true
L["Name:"] = true
L["This needs to match the boss module name or zone exactly for auto swap to work."] = true
L["Macros must have a name!"] = true
L["No boss module loaded!"] = true
L["%s already exists!"] = true -- %s gets replaced with the macro in question
L["Icon:"] = true
L["Icon"] = true
--L["Macro body:"] = true
L["The macro goes here. Still limited to 255 characters."] = true
L["New macro"] = true
L["Make a new macro."] = true
L["New macro"] = true
L["New macro %d"] = true -- %d gets replaced with a number
L["Remove!"] = true
L["Remove the macro."] = true
L["Are you sure you want to remove %s?"] = true -- %s gets replaced with the macro in question
-- /config ----------------------------

-- Default macros ---------------------
-- Skettis ------------------
L["Skettis"] = true
L["m_skettis"] = [[/use Skyguard Blasting Charges]]
-- Ogri'La ------------------
L["Vortex Pinnacle"] = true
L["m_vortexpinnacle"] = [[/use Wrangling Rope
/stopattack]]
L["Forge Camp: Wrath"] = true
L["Forge Camp: Terror"] = true
L["m_forgecamp"] = [[/use [flying] Skyguard Bombs
/use [noflying] Banishing Crystal]]
-- Karazhan -----------------
L["The Curator"] = true
L["m_curator"] = [[/target Astral Flare
/startattack]]
L["Terestian Illhoof"] = true
L["m_illhoof"] = [[/target Demon Chains
/startattack]]
-- Zul'Aman -----------------
L["Halazzi"] = true
L["m_halazzi"] = [[/target Corrupted Lightning Totem
/startattack]]
-- Serpentshrine Cavern -----
L["Fathom-Lord Karathress"] = true
L["m_flk"] = [[/target Spitfire Totem
/startattack]]
L["Lady Vashj"] = true
L["m_vashj"] = [[/use Tainted Core
/y <-- TAINTED CORE TO: %t !!
/s <-- TAINTED CORE TO: %t !!
/script SendChatMessage("!! YOU HAVE THE CORE !!", "WHISPER", nil, UnitName("target"));]]
-- Tempest Keep -------------
-- Mount Hyjal --------------
L["Archimonde"] = true
L["m_archimonde"] = [[/use Tears of the Goddess]]
-- Black Temple -------------
L["High Warlord Naj'entus"] = true
L["m_najentus"] = [[/use Naj'entus Spine]]
-- /Default macros --------------------
