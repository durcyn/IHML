local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "frFR")
if not L then return end


-- Core -------------------------------
L["In combat! %s queued lol!"] = "En combat! %s a été mis dans la file d'attente lol!" -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = "%s! j'ai cette macro lol!" -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = "Veuillez choisir une macro grace à la commande: /ihml macroname <name here>" -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = "|cffff9999Warning!|r Aucune macro du nom de %s n'a été trouvée. Veuillez la crééer!" -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space for a non character specific macro :("] = "|cffff9999Warning!|r Vous n'avez plus de place pour une nouvelle 'Macro Générale' :("
L["%s is character specific. It is recomended to use a general macro if the profile is used with more than one character. (And to get rid of this nagging ;P)"] = "%s est une macro liée à ce personnage. Si ce profile doit être utilisé par plus d'un personnage (reroll), il est préférable d'utiliser une macro 'Générale'. (dans le même temps, vous serrez débarassé de cette alerte ;P)" -- %s gets replaced with the macroname
-- /core ------------------------------

-- Config -----------------------------
-- Options ------------------
L["Macros"] = "Macros"
L["Options"] = "Options"
L["Auto Swap"] = "Auto Swap"
L["Use Auto Swap"] = "activer l'Auto Swap"
L["Silent"] = "Silentieux"
L["Don't print to chat when swapping."] = "Ne pas afficher les swap."
L["Auto Swap events"] = "Auto Swap events"
L["BigWigs"] = "BigWigs"
L["By BigWigs Boss Module"] = "par Boss Module BigWigs"
L["Instance type"] = "Type d'instance"
L["By instance type. (arena, pvp, party or raid)"] = "Par type d'instance. (arena, pvp, party ou raid)" -- Don't translate (arena, pvp, party or raid), those names won't change with locale
L["Zone"] = "Zone"
L["By Zone"] = "par Zone"
L["Used Macro"] = "Macros Utilisées"
L["Make Macro"] = "Générer la Macro"
L["Reinsert default macros"] = "Recréer les macros par Défaut"
L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."] = "Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."
-- Macros -------------------
L["Select Macro:"] = "Macro Sélectionée:"
L["Select a macro."] = "Choisissez une macro."
L["Swap!"] = "Swap!"
L["Swap to the selected macro."] = "Swap to the selected macro."
L["Edit Macro"] = "Editer la Macro"
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 769. You might want to edit this from the Blizzard Macro UI."] = "Nom: Tapez \"boss\" pour le dernier  Boss Module chargé ou \"zone\" pour la zone courante.\nIcon: Un nombre compris entre 1 et 769. Si vous le souhaitez, vous pouvez utiliser l'interface par défaut (Blizzard) pour modifier les macros."
L["Name:"] = "Nom:"
L["This needs to match the boss module name or zone exactly for auto swap to work."] = "Ce paramètre doit correspondre exactement au nom d'un Boss Module ou d'une Zone pour que l'Auto Swap fonctionne ."
L["Macros must have a name!"] = "Vous devez donner un nom à la macro!"
L["No boss module loaded!"] = "Aucun Boss Module n'a été chargé!"
L["%s already exists!"] = "Une macro %s existe déjà !" -- %s gets replaced with the macro in question
L["Icon:"] = "Icon:"
L["Icon"] = "Icon"
--L["Macro body:"] = "corp de la macro"
L["The macro goes here. Still limited to 255 characters."] = "The macro goes here. Still limited to 255 characters."
L["Make a new macro."] = "Créer un nouvelle macro."
L["New macro"] = "Nouvelle macro"
L["New macro %d"] = "Nouvelle macro %d" -- %d gets replaced with a number
L["Remove!"] = "Supprimer!"
L["Remove the macro."] = "Supprimer la macro."
L["Are you sure you want to remove %s?"] = "Voulez-vous vraiment supprimer la macro %s?" -- %s gets replaced with the macro in question
-- /config ----------------------------

-- Default macros ---------------------
-- Skettis ------------------
L["Blackwind Lake"] = "Lac Noirvent"
L["Lower Veil Shil'ak"] = "Voile Shil'ak inférieur"
L["Skettis"] = "Skettis"
L["Terokk's Rest"] = "Repos de Terokk"
L["Upper Veil Shil'ak"] = "Voile Shil'ak supérieur"
L["Veil Ala'rak"] = "Voile Ala'rak"
L["Veil Harr'ik"] = "Voile Harr'ik"
L["m_skettis"] = [[#showtooltip
/use Détonateur de la Garde-ciel]]
-- Ogri'La ------------------
L["Vortex Pinnacle"] = "Cime du vortex"
L["m_vortexpinnacle"] = [[#showtooltip
/use Lasso
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = "Camp de forge : Courroux"
L["Forge Camp: Terror"] = "Camp de forge : Terreur"
L["m_forgecamp"] = [[#showtooltip
/use [flying] Bombes de la Garde-ciel
/use [noflying] Cristal de bannissement]]
-- Netherwing ---------------
L["Netherwing Ledge"] = "Escarpement d'Aile-du-Néant"
L["m_booterang"] = [[#showtooltip
/target Péons Gueules-de-dragon paresseux
/use Botterang
/ClearTarget]]
-- Karazhan -----------------
L["The Curator"] = "Le conservateur"
L["m_curator"] = [[/target Etincelle astrale
/startattack]]
L["Terestian Illhoof"] = "Terestian Malsabot"
L["m_illhoof"] = [[/target Chaînes démoniaques
/startattack]]
-- Zul'Aman -----------------
L["Halazzi"] = "Halazzi"
L["m_halazzi"] = [[/target Totem de foudre corrompu
/startattack]]
-- Serpentshrine Cavern -----
L["Fathom-Lord Karathress"] = "Seigneur des fonds Karathress"
L["m_flk"] = [[/target Totem crache-feu
/startattack]]
L["Lady Vashj"] = "Dame Vashj"
L["m_vashj"] = [[#showtooltip
/use Coeur corrompu
/y <-- TAINTED CORE TO: %t !!
/s <-- TAINTED CORE TO: %t !!
/script SendChatMessage("!! Vous avez le Coeur !!", "WHISPER", nil, UnitName("target"));]]
-- Tempest Keep -------------
-- Mount Hyjal --------------
L["Archimonde"] = "Archimonde"
L["m_archimonde"] = [[#showtooltip
/use Larmes de la déesse]]
-- Black Temple -------------
L["High Warlord Naj'entus"] = "Grand seigneur de guerre Naj'entus"
L["m_najentus"] = [[#showtooltip
/use Epine dorsale de Naj'entus]]
-- /Default macros --------------------
