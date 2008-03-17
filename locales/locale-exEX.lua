local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "exEX")
if not L then return end

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
L["In combat! %s queued lol!"] = "In combat! %s queued lol!" -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = "%s! I have that macro lol!" -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = "Please choose a macroname by typing: /ihml macroname <name here>" -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = "|cffff9999Warning!|r No macro named %s found. Make it plz!" -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space for a non character specific macro :("] = "|cffff9999Warning!|r No free macro space for a non character specific macro :("
L["%s is character specific. It is recomended to use a general macro if the profile is used with more than one character. (And to get rid of this nagging ;P)"] = "%s is character specific. It is recomended to use a general macro if the profile is used with more than one character. (And to get rid of this nagging ;P)" -- %s gets replaced with the macroname
-- /core ------------------------------

-- Config -----------------------------
-- Options ------------------
L["Macros"] = "Macros"
L["Options"] = "Options"
L["Auto Swap"] = "Auto Swap"
L["Use Auto Swap"] = "Use Auto Swap"
L["Silent"] = "Silent"
L["Don't print to chat when swapping."] = "Don't print to chat when swapping."
L["Auto Swap events"] = "Auto Swap events"
L["BigWigs"] = "BigWigs"
L["By BigWigs Boss Module"] = "By BigWigs Boss Module"
L["Instance type"] = "Instance type"
L["By instance type. (arena, pvp, party or raid)"] = "By instance type. (arena, pvp, party or raid)" -- Don't translate (arena, pvp, party or raid), those names won't change with locale
L["Zone"] = "Zone"
L["By Zone"] = "By Zone"
L["Used Macro"] = "Used Macro"
L["Make Macro"] = "Make Macro"
L["Reinsert default macros"] = "Reinsert default macros"
L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."] = "Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."
-- Macros -------------------
L["Select Macro:"] = "Select Macro:"
L["Select a macro."] = "Select a macro."
L["Swap!"] = "Swap!"
L["Swap to the selected macro."] = "Swap to the selected macro."
L["Edit Macro"] = "Edit Macro"
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 769. You might want to edit this from the Blizzard Macro UI."] = "Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 769. You might want to edit this from the Blizzard Macro UI."
L["Name:"] = "Name:"
L["This needs to match the boss module name or zone exactly for auto swap to work."] = "This needs to match the boss module name or zone exactly for auto swap to work."
L["Macros must have a name!"] = "Macros must have a name!"
L["No boss module loaded!"] = "No boss module loaded!"
L["%s already exists!"] = "%s already exists!" -- %s gets replaced with the macro in question
L["Icon:"] = "Icon:"
L["Icon"] = "Icon"
--L["Macro body:"] = true
L["The macro goes here. Still limited to 255 characters."] = "The macro goes here. Still limited to 255 characters."
L["Make a new macro."] = "Make a new macro."
L["New macro"] = "New macro"
L["New macro %d"] = "New macro %d" -- %d gets replaced with a number
L["Remove!"] = "Remove!"
L["Remove the macro."] = "Remove the macro."
L["Are you sure you want to remove %s?"] = "Are you sure you want to remove %s?" -- %s gets replaced with the macro in question
-- /config ----------------------------

-- Default macros ---------------------
-- Skettis ------------------
L["Blackwind Lake"] = "Blackwind Lake"
L["Lower Veil Shil'ak"] = "Lower Veil Shil'ak"
L["Skettis"] = "Skettis"
L["Terokk's Rest"] = "Terokk's Rest"
L["Upper Veil Shil'ak"] = "Upper Veil Shil'ak"
L["Veil Ala'rak"] = "Veil Ala'rak"
L["Veil Harr'ik"] = "Veil Harr'ik"
L["m_skettis"] = [[#showtooltip
/use Skyguard Blasting Charges]]
-- Ogri'La ------------------
L["Vortex Pinnacle"] = "Vortex Pinnacle"
L["m_vortexpinnacle"] = [[#showtooltip
/use Wrangling Rope
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = "Forge Camp: Wrath"
L["Forge Camp: Terror"] = "Forge Camp: Terror"
L["m_forgecamp"] = [[#showtooltip
/use [flying] Skyguard Bombs
/use [noflying] Banishing Crystal]]
-- Karazhan -----------------
L["The Curator"] = "The Curator"
L["m_curator"] = [[/target Astral Flare
/startattack]]
L["Terestian Illhoof"] = "Terestian Illhoof"
L["m_illhoof"] = [[/target Demon Chains
/startattack]]
-- Zul'Aman -----------------
L["Halazzi"] = "Halazzi"
L["m_halazzi"] = [[/target Corrupted Lightning Totem
/startattack]]
-- Serpentshrine Cavern -----
L["Fathom-Lord Karathress"] = "Fathom-Lord Karathress"
L["m_flk"] = [[/target Spitfire Totem
/startattack]]
L["Lady Vashj"] = "Lady Vashj"
L["m_vashj"] = [[#showtooltip
/use Tainted Core
/y <-- TAINTED CORE TO: %t !!
/s <-- TAINTED CORE TO: %t !!
/script SendChatMessage("!! YOU HAVE THE CORE !!", "WHISPER", nil, UnitName("target"));]]
-- Tempest Keep -------------
-- Mount Hyjal --------------
L["Archimonde"] = "Archimonde"
L["m_archimonde"] = [[#showtooltip
/use Tears of the Goddess]]
-- Black Temple -------------
L["High Warlord Naj'entus"] = "High Warlord Naj'entus"
L["m_najentus"] = [[#showtooltip
/use Naj'entus Spine]]
-- /Default macros --------------------
