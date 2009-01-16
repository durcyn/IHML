local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "deDE")
if not L then return end


-- Core -------------------------------
L["In combat! %s queued lol!"] = "Im Kampf! %s in der Warteschlange!" -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = "%s! Ich habe diese Makro!" -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = "Bitte w\195\164hle einen Makronamen mittels: /ihml macroname <Name hier einf\195\188gen>" -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = "|cffff9999Warnung!|r Kein Makro namens %s gefunden. Bitte zuerst erstellen!" -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space :("] = "|cffff9999Warnung!|r Kein freier Makroplatz :("
-- /core ------------------------------

-- Config -----------------------------
-- Options ------------------
L["Macros"] = "Makros"
L["Options"] = "Optionen"
L["Auto Swap"] = "Auto-Wechsel"
L["Use Auto Swap"] = "Auto-Wechsel verwenden"
L["Silent"] = "Still"
L["Don't print to chat when swapping."] = "Keine Chatausgabe beim Wechsel."
L["Auto Swap events"] = "Auto-Wechsel-Events"
L["BigWigs"] = "BigWigs"
L["By BigWigs Boss Module"] = "Nach BigWigs Boss Modulen"
L["Instance type"] = "Instanztyp"
L["By instance type. (arena, pvp, party or raid)"] = "Nach Instanztyp. (arena, pvp, party oder raid)" -- Don't translate (arena, pvp, party or raid), those names won't change with locale
L["Zone"] = "Zone"
L["By Zone"] = "Nach Zone"
L["Used Macro"] = "Verwendetes Makro"
L["Make Macro"] = "Makro erstellen"
L["Pickup Macro"] = "Makro aufnehmen"
L["Click to pickup the IHML macro so that you can place it on an action bar."] = "Klicke hier, um das IHML Makro aufzunehmen, so dass es in die F\195\164higkeitenleiste ziehen kannst."
L["Reinsert default macros"] = "Standardmakros wieder einf\195\188gen"
L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."] = "Klicke hier, um ein entferntes Standardmakro wiederherzustellen. Ersetzt keine ge\195\164nderten Makroversionen. Wenn du ge\195\164nderte Standardmakros wiederherstellen m\195\182chtest, musst du sie zuvor l\195\182schen."
-- Macros -------------------
L["Select Macro:"] = "Makro ausw\195\164hlen:"
L["Select a macro."] = "Ein Makro ausw\195\164hlen."
L["Swap!"] = "Wechsel!"
L["Swap to the selected macro."] = "Auf das ausgew\195\164hlte Makro wechseln."
L["Edit Macro"] = "Makro editieren"
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 779. You might want to edit this from the Blizzard Macro UI."] = "Name: Gib \"boss\" f\195\188r zuletzt geladenes Bossmodul oder \"zone\" f\195\188r aktuelle Zone ein.\nSymbol: Eine Zahl von 1 bis 779. Es empfiehlt sich dieses \195\188ber das Blizzard-Makro-UI festzulegen."
L["Name:"] = "Name:"
L["This needs to match the boss module name or zone exactly for auto swap to work."] = "Dieser muss mit dem Bossmodul-Namen oder der Zone exakt \195\188bereinstimmen, damit der Auto-Wechsel funktioniert."
L["Macros must have a name!"] = "Makros m\195\188ssen einen Namen haben!"
L["No boss module loaded!"] = "Kein Bossmodul geladen!"
L["%s already exists!"] = "%s existiert bereits!" -- %s gets replaced with the macro in question
L["Icon:"] = "Symbol:"
L["Icon"] = "Symbol"
L["Macro body:"] = "Makro-K\195\182rper"
L["The macro goes here. Still limited to 255 characters."] = "Hierher kommt das Makro. Noch immer auf 255 Zeichen limitiert."
L["Make a new macro."] = "Ein neues Makro erstellen."
L["New macro"] = "Neues Makro"
L["New macro %d"] = "Neues Makro %d" -- %d gets replaced with a number
L["Remove!"] = "Entfernen!"
L["Remove the macro."] = "Das Makro entfernen."
L["Are you sure you want to remove %s?"] = "Bist du sicher, da\195\159 du %s entfernen m\195\182chtest?" -- %s gets replaced with the macro in question
-- /config ----------------------------

-- Default macros ---------------------
-- Skettis ------------------
L["Blackwind Lake"] = "Schattenwindsee"
L["Lower Veil Shil'ak"] = "Unteres Shil'akversteck"
L["Skettis"] = "Skettis"
L["Terokk's Rest"] = "Terokks Ruh"
L["Upper Veil Shil'ak"] = "Oberes Shil'akversteck"
L["Veil Ala'rak"] = "Ala'rakversteck"
L["Veil Harr'ik"] = "Harr'ikversteck"
L["m_skettis"] = [[#showtooltip item:32406
/use Sprengladungen der Himmelswache]]
-- Ogri'La ------------------
L["Vortex Pinnacle"] = "Vortexgipfel"
L["m_vortexpinnacle"] = [[#showtooltip item:32698
/use Bändigungsseil
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = "Konstruktionslager: Wut"
L["Forge Camp: Terror"] = "Konstruktionslager: Terror"
L["m_forgecamp"] = [[#showtooltip [flying] item:32456; item:32696
/use [flying] Bomben der Himmelswache
/use [noflying] Kristall der Verbannung]] 
-- Netherwing ---------------
L["Netherwing Ledge"] = "Netherschwingenscherbe"
L["m_booterang"] = [[#showtooltip [flying] item:32680; item:32503
/use [noflying] Yarzills Hammel
/stopmacro [noflying]
/targetexact Ungehorsamer Peon des Drachenmals
/use Schuhmerang
/cleartarget]] 
-- Shattered Sun Offensive --
L["Isle of Quel'Danas"] = "Insel von Quel'Danas"
L["m_crystalcores"] = [[#showtooltip item:34368
/targetexact Herumirrender Wachposten
/use Abgestimmte Kristallkerne]]
L["Sun's Reach Sanctum"] = "Sanktum der Sonnenweiten"
L["m_manaremnants"] = [[#showtooltip item:34338
/use Manaüberreste]]
L["Throne of Kil'jaeden"] = "Kil'jaedens Thron"
L["m_blood4blood"] = [[#showtooltip item:34257
/use Teufelstrinker]]
L["Spirit Fields"] = "Geisterfelder"
L["m_spectrogoggles"] = [[#showtooltip item:35233
/use Spektrografische Multiphasenbrille
/equip Spektrografische Multiphasenbrille]]
L["The Dead Scar"] = "Die Todesschneise"
L["m_deadscar"] = [[#showtooltip item:34475
/use Arkane Ladungen]]
L["The Dawning Square"] = "Platz der Morgenröte"
L["m_ssbanner"] = [[#showtooltip [dead] item:34414; item:34533
/use [dead] Banner der Zerschmetterten Sonne; Kristall des Astromanten]]
L["Greengill Coast"] = "Küste der Grünkiemen"
L["m_greengil"] = [[#showtooltip [exists] item:34483; item:34533
/use [exists] Kugel der Murlockontrolle; Kristall des Astromanten]]
L["Dawnstar Village"] = "Morgenstern"
L["m_dawnstar"] = [[#showtooltip [dead] item:34368; item:34533
/use [dead] Abgestimmte Kristallkerne; Kristall des Astromanten]]
L["Bash'ir Landing"] = "Landeplatz von Bash'ir"
L["m_bashir"] = [[#showtooltip item:34248
/use Phasenvorrichtung von Bash'ir]]
L["The Sin'loren"] = "Die Sin'loren"
L["The Dawnchaser"] = "Die Morgensturm"
L["The Bloodoath"] = "Die Blutschwur"
L["m_flamingoil"] = [[#showtooltip item:34489
/use Flammendes Öl]]
L["Sun's Reach Armory"] = "Waffenkammer der Sonnenweiten"
L["m_atamal"] = [[#showtooltip item:34500
/use Waffe von Ata'mal]]
L["Razorthorn Rise"] = "Messerdornhöhe"
L["m_razorthorn"] = [[#showtooltip [pet, harm, nodead] Messerdornfelshetzer; [pet] Messerdornwurzel aufdecken; item:34255
/use [nopet] Messerdornschinderdrüse
/cast [pet, harm, nodead] Messerdornfelshetzer; [pet] Messerdornwurzel aufdecken]]
-- Cooking ------------------
L["Ancestral Grounds"] = "Ahnengrund"
L["m_soup4soul"] = [[#showtooltip item:33851
/use Kochtopf]]
-- The Black Morass -------------
L["The Black Morass"] = "Der schwarze Morast"
L["m_blackmorass"] = [[#showtooltip item:24289
/use Chronosignal]]
-- Magisters' Terrace -------
L["Halls of Theory"] = "Hallen der Theorie"
L["m_vexallus"] = [[/targetexact Pure Energie
/startattack]]
-- Karazhan -----------------
L["The Curator"] = "Der Kurator"
L["m_curator"] = [[/targetexact Astralflimmern
/startattack]]
L["Terestian Illhoof"] = "Terestian Siechhuf"
L["m_illhoof"] = [[/targetexact Dämonenketten
/startattack]]
-- Zul'Aman -----------------
L["Halazzi"] = "Halazzi"
L["m_halazzi"] = [[/targetexact Verderbtes Blitzschlagtotem
/startattack]]
-- Serpentshrine Cavern -----
L["Fathom-Lord Karathress"] = "Tiefenlord Karathress"
L["m_flk"] = [[/targetexact Feuerspuckendes Totem
/startattack]]
L["Lady Vashj"] = "Lady Vashj"
L["m_vashj"] = [[/stopmacro[noexists][harm]
/run i=31088 t="target" if GetItemCount(i)>0 and HasFullControl() and IsItemInRange(i,t) then n=UnitName(t) s=SendChatMessage m="<-- KERN ZU --> " s(m..n.." !","RAID") s(m.."DU !","WHISPER",nil,n) end
/use item:31088]] -- This is probably as bad as "All your base are belong to us". Keep the 255 char limit in mind when doing a proper translation
-- Tempest Keep -------------
-- Mount Hyjal --------------
L["Archimonde"] = "Archimonde"
L["m_archimonde"] = [[#showtooltip item:24494
/use Tränen der Göttin]]
-- Black Temple -------------
L["High Warlord Naj'entus"] = "Oberster Kriegsfürst Naj'entus"
L["m_najentus"] = [[#showtooltip item:32408
/use Naj'entus' Stachel]]

-- WotLK
L["Coldarra"] = "Kaltarra"
L["m_drakehunt"] = [[#showtooltip item:35506
/targetexact Nexusdrachenjunges
/use Raelorasz' Speer]]
-- Storm Peaks
L["The Forlorn Mine"] = "Die verlassene Mine"
L["m_discipline"] = [[#showtooltip item:42837
/use Disziplinarrute]]
L["Fjorn's Anvil"] = "Fjorns Amboss"
L["Frostfield Lake"] = "Frostfeldsee"
L["m_essenceofice"] = [[#showtooltip item:42246
/use Essenz des Eises]]
L["Valkyrion"] = "Valkyrion"
L["The Blighted Pool"] = "Der verseuchte Teich"
L["m_aberations"] = [[#showtooltip item:41612
/use Phiole voll Frostöl]]
L["Garm's Bane"] = "Garms Bann"
L["m_landmine"] = [[#showtooltip item:40676
/use Verbesserte Landminen]]
L["Thunderfall"] = "Donnerfall"
L["m_hodirhorn"] = [[#showtooltip item:42164
/use Hodirs Horn]]
L["Valley of Ancient Winters"] = "Das uralte Wintertal"
L["m_hodirdaily"] = [[#showtooltip [dead] item:42479; item:42774
/use [dead] Fangzahn eines astralen Worgs; Arngrims Zahn]]
L["The Pit of the Fang"] = "Die Reißzahngrube"
L["m_pitoffang"] = [[#showtooltip item:42499
/use item:42499]]
-- Ice Crown
L["The Valley of Fallen Heroes"] = "Das Tal der Gefallenen Helden"
L["m_alliancebline"] = [[#showtooltip item:44212
/target Kampfaufklärer der Himmelsbrecher
/use SGM-3]]
L["Njorndar Village"] = "Njorndar"
L["m_leavemark"] = [[#showtooltip item:42480
/use [dead] Banner der Schwarzen Klinge]]
L["Onslaught Harbor"] = "Hafen des Ansturms"
L["m_corpserise"] = [[#showtooltip item:40587
/use [dead] Tinktur des Dunkelheilers]]
-- Basin
L["The Stormwright's Shelf"] = "Das Sturmherrenschelf"
L["m_windandwater"] = [[#showtooltip item:39571
/use Trommeln des Sturms]]
-- Strand of the Ancients
L["Courtyard of the Ancients"] = "Der Hof der Uralten" --needs varification!
L["m_strand"] = [[#showtooltip item:39213
/use item:39213]]
-- The Culling of Stratholme
L["The Culling of Stratholme"] = "Das Ausmerzen von Stratholme"
L["m_cos"] = [[#showtooltip item:37888
/use Arkaner Disruptor]]
-- Howling Fjord
L["Howling Fjord"] = "Der heulende Fjord"
L["Ledge of Garvan"] = "Garvans Riff"
L["Twin Coast"] = "Zwillingsküste"
L["m_fishyfish"] = [[#showtooltip item:40946
/use Anuniaqs Netz]]
L["m_lureit"] = [[#showtooltip item:34127
/target Riffbulle
/target Angelockter Riffbulle
/use Schmackhafter Rifffisch]]
-- Zul'Drak
--L["Drak'Sotra"] = true
L["m_draksotra"] = [[#showtooltip [dead] item:38556;item:38544
/use [dead] item:38556;item:38544]]
--L["Zul'Drak"] = true
L["m_zuldrak"] = [[#showtooltip item:38566
/use item:38566]]
-- /Default macros --------------------
