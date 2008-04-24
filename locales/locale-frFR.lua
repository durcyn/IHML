local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "frFR")
if not L then return end


-- Core -------------------------------
L["In combat! %s queued lol!"] = "En combat ! %s a été mis dans la file d'attente lol !" -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = "%s ! j'ai cette macro lol !" -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = "Veuillez choisir une macro grace à la commande : /ihml macroname <nom ici>" -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = "|cffff9999Attention !|r Aucune macro du nom de %s n'a été trouvée. Veuillez la crééer !" -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space :("] = "|cffff9999Attention !|r Vous n'avez plus de place pour une nouvelle macro :("
-- /core ------------------------------

-- Config -----------------------------
-- Options ------------------
L["Macros"] = "Macros"
L["Options"] = "Options"
L["Auto Swap"] = "Changement automatique"
L["Use Auto Swap"] = "Changement auto."
L["Silent"] = "Silencieux"
L["Don't print to chat when swapping."] = "Ne pas afficher les changements dans la fenêtre de discussion."
L["Auto Swap events"] = "Événements de changement automatique"
L["BigWigs"] = "BigWigs"
L["By BigWigs Boss Module"] = "Par les modules de boss de BigWigs."
L["Instance type"] = "Type d'instance"
L["By instance type. (arena, pvp, party or raid)"] = "Par type d'instance. (arena, pvp, party ou raid)" -- Don't translate (arena, pvp, party or raid), those names won't change with locale
L["Zone"] = "Zone"
L["By Zone"] = "Par zone."
L["Used Macro"] = "Macros utilisées"
L["Make Macro"] = "Générer la macro"
L["Pickup Macro"] = "Saisir la macro"
L["Click to pickup the IHML macro so that you can place it on an action bar."] = "Cliquez pour saisir la macro IHML afin de la place sur une barre d'actions."
L["Reinsert default macros"] = "Recréer les macros par défaut"
L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."] = "Utilisez ceci pour récupérer les macros par défaut supprimées. Ceci ne remplacera pas les versions modifiées. Si vous voulez inverser les macros modifiées, supprimez-les d'abord."
-- Macros -------------------
L["Select Macro:"] = "Macro sélectionée :"
L["Select a macro."] = "Choisissez une macro."
L["Swap!"] = "Changer !"
L["Swap to the selected macro."] = "Swap to the selected macro."
L["Edit Macro"] = "Editer la macro"
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 779. You might want to edit this from the Blizzard Macro UI."] = "Nom : Tapez \"boss\" pour le dernier module de boss chargé ou \"zone\" pour la zone actuelle.\nIcône : Un nombre compris entre 1 et 779. Si vous le souhaitez, vous pouvez utiliser l'interface par défaut (Blizzard) pour modifier les macros."
L["Name:"] = "Nom :"
L["This needs to match the boss module name or zone exactly for auto swap to work."] = "Ce paramètre doit correspondre exactement au nom d'un module de boss ou d'une zone pour que le changement automatique fonctionne."
L["Macros must have a name!"] = "Vous devez donner un nom à la macro !"
L["No boss module loaded!"] = "Aucun module de boss n'a été chargé !"
L["%s already exists!"] = "%s existe déjà !" -- %s gets replaced with the macro in question
L["Icon:"] = "Icône :"
L["Icon"] = "Icône"
--L["Macro body:"] = "Corp de la macro :"
L["The macro goes here. Still limited to 255 characters."] = "La macro doit être entrée ici. Toujours limitée à 255 caractères."
L["Make a new macro."] = "Créer un nouvelle macro."
L["New macro"] = "Nouvelle macro"
L["New macro %d"] = "Nouvelle macro %d" -- %d gets replaced with a number
L["Remove!"] = "Supprimer !"
L["Remove the macro."] = "Supprimer la macro."
L["Are you sure you want to remove %s?"] = "Voulez-vous vraiment supprimer la macro %s ?" -- %s gets replaced with the macro in question
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
L["m_skettis"] = [[#showtooltip item:32406
/use Détonateur de la Garde-ciel]]
-- Ogri'La ------------------
L["Vortex Pinnacle"] = "Cime du vortex"
L["m_vortexpinnacle"] = [[#showtooltip item:32698
/use Lasso
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = "Camp de forge : Courroux"
L["Forge Camp: Terror"] = "Camp de forge : Terreur"
L["m_forgecamp"] = [[#showtooltip [flying] item:32456; item:32696
/use [flying] Bombes de la Garde-ciel
/use [noflying] Cristal de bannissement]]
-- Netherwing ---------------
L["Netherwing Ledge"] = "Escarpement d'Aile-du-Néant"
L["m_booterang"] = [[#showtooltip item:32680
/targetexact Péons Gueules-de-dragon désobéissant
/use Botterang
/ClearTarget]]
-- Shattered Sun Offensive --
L["Isle of Quel'Danas"] = "Île de Quel'Danas"
L["m_crystalcores"] = [[#showtooltip item:34368
/targetexact Factionnaire erratique
/use Noyaux cristallins en phase]]
L["Sun's Reach Sanctum"] = "Sanctum des Confins du soleil"
L["m_manaremnants"] = [[#showtooltip item:34338
/use Restes de mana]]
L["Throne of Kil'jaeden"] = "Trône de Kil'jaeden"
L["m_blood4blood"] = [[#showtooltip item:34257
/use Gangresiphon]]
L["Spirit Fields"] = "Champs des esprits"
L["m_spectrogoggles"] = [[#showtooltip item:35233
/use Lunettes spectrographiques multiphases
/equip Lunettes spectrographiques multiphases]]
L["The Dead Scar"] = "La Malebrèche"
L["m_deadscar"] = [[#showtooltip item:34475
/use Charges arcaniques]]
L["The Dawning Square"] = "Place du Point-du-jour"
L["m_ssbanner"] = [[#showtooltip [dead] item:34414; item:34533
/use [dead] Bannière du Soleil brisé; Cristal de l'astromancien]]
L["Greengill Coast"] = "Côte de Verte-branchie"
--L["m_greengil"] = [[#showtooltip [exists] item:34483; item:34533
--/use [exists] Orb of Murloc Control; Cristal de l'astromancien]]
L["Dawnstar Village"] = "Étoile-de-l'aube"
L["m_dawnstar"] = [[#showtooltip [dead] item:34368; item:34533
/use [dead] Noyaux cristallins en phase; Cristal de l'astromancien]]
L["Bash'ir Landing"] = "Point d'ancrage de Bash'ir"
L["m_bashir"] = [[#showtooltip item:34248
/use Machine éclipsante de Bash'ir]]
L["The Sin'loren"] = "Le Sin'loren"
L["The Dawnchaser"] = "Le Chasselaube"
L["The Bloodoath"] = "Le Serment de sang"
L["m_flamingoil"] = [[#showtooltip item:34489
/use Huile enflammée]]
--L["Sun's Reach Armory"] = "Sun's Reach Armory"
--L["m_atamal"] = [[#showtooltip item:34500
--/use Ata'mal Armament]]
-- Magisters' Terrace -------
L["Halls of Theory"] = "Les salles de théorie"
L["m_vexallus"] = [[/targetexact Energie pure
--/startattack]]
-- Karazhan -----------------
L["The Curator"] = "Le conservateur"
L["m_curator"] = [[/targetexact Etincelle astrale
/startattack]]
L["Terestian Illhoof"] = "Terestian Malsabot"
L["m_illhoof"] = [[/targetexact Chaînes démoniaques
/startattack]]
-- Zul'Aman -----------------
L["Halazzi"] = "Halazzi"
L["m_halazzi"] = [[/targetexact Totem de foudre corrompu
/startattack]]
-- Serpentshrine Cavern -----
L["Fathom-Lord Karathress"] = "Seigneur des fonds Karathress"
L["m_flk"] = [[/targetexact Totem crache-feu
/startattack]]
L["Lady Vashj"] = "Dame Vashj"
L["m_vashj"] = [[#showtooltip item:31088
/use Coeur corrompu
/y <-- NOYAU CONTAMINÉ À : %t !!
/s <-- NOYAU CONTAMINÉ À : %t !!
/script SendChatMessage("!! TU AS LE NOYAU !!", "WHISPER", nil, UnitName("target"));]]
-- Tempest Keep -------------
-- Mount Hyjal --------------
L["Archimonde"] = "Archimonde"
L["m_archimonde"] = [[#showtooltip item:24494
/use Larmes de la déesse]]
-- Black Temple -------------
L["High Warlord Naj'entus"] = "Grand seigneur de guerre Naj'entus"
L["m_najentus"] = [[#showtooltip item:32408
/use Epine dorsale de Naj'entus]]
-- /Default macros --------------------
