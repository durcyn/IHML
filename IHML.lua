--[[

************************************************************************

IHML.lua

File date: @file-date-iso@ 
Project version: @project-version@

Author: Ackis
Original Author: Snago

************************************************************************

--]]

--- **IHML** allows you to dynamically switch between macros depending on certain conditions.
-- There is a default set of macros for use within IHML, however you can add more.\\
-- IHML supports all the daily quests which use items from BC and WotLK.
-- @class file
-- @name IHML.lua
-- @release 2.6

local LibStub = LibStub

local MODNAME = "IHML"

IHML = LibStub("AceAddon-3.0"):NewAddon(MODNAME,"AceConsole-3.0","AceEvent-3.0","AceHook-3.0")

local addon	= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L = LibStub("AceLocale-3.0"):GetLocale(MODNAME)

-- Upvalues from the global namespace
local next = next
local type = type
local pairs = pairs
local select = select
local tonumber = tonumber
local tostring = tostring
local EditMacro = EditMacro
local format = string.format
local CreateMacro = CreateMacro
local PickupMacro = PickupMacro
local IsInInstance = IsInInstance
local GetMacroInfo = GetMacroInfo
local InCombatLockdown = InCombatLockdown
local GetMacroIconInfo = GetMacroIconInfo
--local GetMinimapZoneText = GetMinimapZoneText
local GetMacroIndexByName = GetMacroIndexByName
local UnitFactionGroup = UnitFactionGroup
local UnitIsPlayer = UnitIsPlayer
local GetRealZoneText = GetRealZoneText
local GetActiveTalentGroup = GetActiveTalentGroup
local GetSubZoneText = GetSubZoneText

-- locals
local db, c, p, options
local bw2bm
local mName -- Need for AceConfig
local mIcon, mBody
local currentIcon -- the index for the current macro icon
local queued
local macroUIHooked, bwLoaded
local lastboss
local currentType
local lastMacro

--- Default Macros which are included
-- @class table
-- @name defaultmacrolist
-- @field m_skettis <<code>>#showtooltip item:32406
-- /use [flying] item:32406<</code>>
-- @field m_pinnacle <<code>>#showtooltip item:32698
-- /use item:32698
-- /stopattack
-- /petpassive<</code>>
-- @field m_forgecamp <<code>>#showtooltip [flying] item:32456; [noflying] item:32696
-- /use [flying] item:32456; [noflying] item:32696<</code>>
-- @field manaremnants <<code>>#showtooltip item:34338
-- /use item:34338<</code>>
-- @field m_blood4blood <<code>>#showtooltip item:34257
-- /use item:34257<</code>>
-- @field m_spectrogoggles <<code>>#showtooltip item:35233
-- /use item:35233
-- /equip item:35233<</code>>
-- @field m_deadscar <<code>>#showtooltip item:34475
-- /use item:34475<</code>>
-- @field m_ssbanner <<code>>#showtooltip [dead] item:34414; item:34533
-- /use [dead] item:34414; item:34533<</code>>
-- @field m_greengil <<code>>#showtooltip [exists] item:34483; item:34533
-- /use [exists] item:34483; item:34533<</code>>
-- @field m_dawnstar <<code>>#showtooltip [dead] item:34368; item:34533
-- /use [dead] item:34368; item:34533<</code>>
-- @field m_bashir <<code>>#showtooltip item:34248
-- /use item:34248<</code>>
-- @field m_flamingoil <<code>>#showtooltip item:34489
-- /use item:34489<</code>>
-- @field m_atamal <<code>>#showtooltip item:34500
-- /use item:34500<</code>>
-- @field m_soup4soul <<code>>#showtooltip item:33851
-- /use item:33851<</code>>
-- @field m_blackmorass <<code>>#showtooltip item:24289
-- /use item:24289<</code>>
-- @field m_archimonde <<code>>#showtooltip item:24494
-- /use item:24494<</code>>
-- @field m_najentus <<code>>#showtooltip item:32408
-- /use item:32408<</code>>
-- @field m_discipline <<code>>#showtooltip item:42837
-- /use item:42837<</code>>
-- @field m_essenceofice <<code>>#showtooltip item:42246
-- /use item:42246<</code>>
-- @field m_aberations <<code>>#showtooltip item:41612
-- /use item:41612<</code>>
-- @field m_landmine <<code>>#showtooltip item:40676
-- /use item:40676<</code>>
-- @field m_hodirhorn <<code>>#showtooltip item:42164
-- /use item:42164<</code>>
-- @field m_hodirdaily <<code>>#showtooltip [dead] item:42479; item:42774
-- /use [dead] item:42479; item:42774<</code>>
-- @field m_pitoffang <<code>>#showtooltip item:42499
-- /use item:42499<</code>>
-- @field m_leavemark <<code>>#showtooltip [dead] item:42480
-- /use [dead] item:42480<</code>>
-- @field m_corpserise <<code>>#showtooltip [dead] item:40587
-- /use [dead] item:40587<</code>>
-- @field m_windandwater <<code>>#showtooltip item:39571
-- /use item:39571<</code>>
-- @field m_strand <<code>>#showtooltip item:39213
-- /use item:39213<</code>>
-- @field m_cos <<code>>#showtooltip item:37888
-- /use item:37888<</code>>
-- @field m_fishyfish <<code>>#showtooltip item:40946
-- /use item:40946<</code>>
-- @field m_draksotra <<code>>#showtooltip [dead] item:38556;item:38544
-- /use [dead] item:38556;item:38544<</code>>
-- @field m_zuldrak <<code>>#showtooltip item:38566
-- /use item:38566<</code>>
-- @field m_venturebay <<code>>#showtooltip item:37621
-- /use item:37621<</code>>
-- @field m_grizzly <<code>>#showtooltip item:35908
-- /use item:35908<</code>>
-- @field m_halaa <<code>>#showtooltip item:24538
-- /use item:24538<</code>>
-- @field m_bluesky <<code>>#showtooltip item:37568
-- /use item:37568<</code>>
-- @field m_greattree <<code>>#showtooltip item:45046
-- /use item:45046<</code>>
-- @field m_chipofulduar <<code>>#showtooltip item:45281
-- /use item:45281<</code>>
-- @field m_edgeofwinter <<code>>#showtooltip item:45005
-- /use item:45005<</code>>
-- @field m_ghostfish <<code>>#showtooltip item:45902
-- /use item:45902<</code>>
-- @field m_winterhyacinth <<code>>#showtooltip item:45000
-- /use item:45000<</code>>
-- @field m_argentjousting <<code>>#showtooltip [nomounted] item:46106;item:45724
-- /use [mounted] item:45724
-- /equip [nomounted] item:46106 -- Argent
-- /equip [nomounted] item:46070 -- Hord
-- /equip [nomounted] item:46069 -- Ally<</code>>
-- @field m_hrothgar <<code>>#showtooltip item:47006
-- /use item:47006<</code>>
-- @field m_sharkbait <<code>>#showtooltip item:47036
-- /use item:47036<</code>>

--- Default Macros which are included (local specific)
-- @class table
-- @name dlocalizedefaultmacrolist
-- @field m_bladefitforchampion <<code>>#showtooltip item:44986
-- /use item:44986
-- /tar Lake Frog
-- /kiss<</code>>
-- @field m_lureit <<code>>#showtooltip item:34127
-- /target Reef Bull
-- /target Attracted Reef Bull
-- /use item:34127<</code>>
-- @field m_alliancebline <<code>>#showtooltip item:44212
-- /targetexact Skybreaker Recon Fighter
-- /use item:44212<</code>>
-- @field m_brokenfront <<code>>#showtooltip item:43968
-- /targetexact Hulking Abomination
-- /use item:43968<</code>>
-- @field m_drakehunt <<code>>#showtooltip item:35506
-- /targetexact Nexus Drake Hatchling
-- /use item:35506<</code>>
-- @field m_vashj <<code>>/stopmacro[noexists][harm]
-- /run i=31088 t="target" if GetItemCount(i)>0 and HasFullControl() and IsItemInRange(i,t) then n=UnitName(t) s=SendChatMessage m="<-- TAINTED CORE TO --> " s(m..n.." !","RAID") s(m.."YOU !","WHISPER",nil,n) end
-- /use item:31088<</code>>
-- @field m_flk <<code>>/targetexact Spitfire Totem
-- /startattack<</code>>
-- @field m_booterang <<code>>#showtooltip [flying] item:32680; item:32503
-- /use [noflying] item:32503
-- /stopmacro [noflying]
-- /targetexact Disobedient Dragonmaw Peon
-- /use item:32680
-- /cleartarget<</code>>
-- @field m_crystalcores <<code>>#showtooltip item:34368
-- /targetexact Erratic Sentry
-- /use item:34368<</code>>
-- @field m_razorthorn <<code>>#showtooltip [pet, harm, nodead] Ravage; [pet] Expose Razorthorn Root; item:34255
-- /use [nopet] item:34255
-- /cast [pet, harm, nodead] Ravage; [pet] Expose Razorthorn Root<</code>>
-- @field m_vexallus <<code>>/targetexact Pure Energy
-- /startattack<</code>>
-- @field m_curator <<code>>/targetexact Astral Flare
-- /startattack<</code>>
-- @field m_illhoof <<code>>/targetexact Demon Chains
-- /startattack<</code>>
-- @field m_halazzi <<code>>/targetexact Corrupted Lightning Totem
-- /startattack<</code>>
--@field m_kraken <<code>>#showtooltip item:46954
--/target North sea Kraken
--/use item:46954
--/target Kvaldir deepcaller
--/use item:46954<</code>>

-- Default non-localized macros
local defaultmacrolist = {
	["m_skettis"] = [[#showtooltip item:32406
/use [flying] item:32406]],
	["m_pinnacle"] = [[#showtooltip item:32698
/use item:32698
/stopattack
/petpassive]],
	["m_forgecamp"] = [[#showtooltip [flying] item:32456; [noflying] item:32696
/use [flying] item:32456; [noflying] item:32696]],
	["m_manaremnants"] = [[#showtooltip item:34338
/use item:34338]],
	["m_blood4blood"] = [[#showtooltip item:34257
/use item:34257]],
	["m_spectrogoggles"] = [[#showtooltip item:35233
/use item:35233
/equip item:35233]],
	["m_deadscar"] = [[#showtooltip item:34475
/use item:34475]],
	["m_ssbanner"] = [[#showtooltip [dead] item:34414; item:34533
/use [dead] item:34414; item:34533]],
	["m_greengil"] = [[#showtooltip [exists] item:34483; item:34533
/use [exists] item:34483; item:34533]],
	["m_dawnstar"] = [[#showtooltip [dead] item:34368; item:34533
/use [dead] item:34368; item:34533]],
	["m_bashir"] = [[#showtooltip item:34248
/use item:34248]],
	["m_flamingoil"] = [[#showtooltip item:34489
/use item:34489]],
	["m_atamal"] = [[#showtooltip item:34500
/use item:34500]],
	["m_soup4soul"] = [[#showtooltip item:33851
/use item:33851]],
	["m_blackmorass"] = [[#showtooltip item:24289
/use item:24289]], -- ???
	["m_archimonde"] = [[#showtooltip item:24494
/use item:24494]],
	["m_najentus"] = [[#showtooltip item:32408
/use item:32408]],
	["m_discipline"] = [[#showtooltip item:42837
/use item:42837]],
	["m_essenceofice"] = [[#showtooltip item:42246
/use item:42246]],
	["m_aberations"] = [[#showtooltip item:41612
/use item:41612]],
	["m_landmine"] = [[#showtooltip [exists] item:46885; item:40676
/use [exists] item:46885; item:40676]],
	["m_hodirhorn"] = [[#showtooltip item:42164
/use item:42164]],
	["m_hodirdaily"] = [[#showtooltip [dead] item:42479; item:42774
/use [dead] item:42479; item:42774]],
	["m_pitoffang"] = [[#showtooltip item:42499
/use item:42499]],
	["m_leavemark"] = [[#showtooltip [dead] item:42480
/use [dead] item:42480]],
	["m_corpserise"] = [[#showtooltip [dead] item:40587
/use [dead] item:40587]],
	["m_windandwater"] = [[#showtooltip [noexists] item:39599; item:39571
/use [noexists] item:39599; item:39571]],
	["m_strand"] = [[#showtooltip item:39213
/use item:39213]],
	["m_cos"] = [[#showtooltip item:37888
/use item:37888]],
	["m_fishyfish"] = [[#showtooltip item:40946
/use item:40946]],
-- 38556 == Incinerating Oil
-- 38544 == Argent Crusade Banner
-- 38564 == torches
-- 38566 == Steel spade
-- 38574 == grenades
	["m_draksotra"] = [[#showtooltip [dead] item:38556;item:38544
/use [dead] item:38556;item:38544]],
	["m_zuldrak"] = [[#showtooltip item:38566
/use item:38566]],
	["m_venturebay"] = [[#showtooltip item:37621
/use item:37621]],
	["m_grizzly"] = [[#showtooltip item:35908
/use item:35908]],
	["m_halaa"] = [[#showtooltip item:24538
/use item:24538]],
	["m_bluesky"] = [[#showtooltip item:37568
/use item:37568]],
	["m_greattree"] = [[#showtooltip item:45046
/use item:45046]],
	["m_chipofulduar"] = [[#showtooltip item:45281
/use item:45281]],
	["m_edgeofwinter"] = [[#showtooltip item:45005
/use item:45005]],
	["m_ghostfish"] = [[#showtooltip item:45902
/use item:45902]],
	["m_winterhyacinth"] = [[#showtooltip item:45000
/use item:45000]],
	["m_argentjousting"] = [[#showtooltip [nomounted] item:46106;item:45724
/use [mounted] item:45724
/equip [nomounted] item:46106 -- Argent
/equip [nomounted] item:46070 -- Hord
/equip [nomounted] item:46069 -- Ally]],
	["m_hrothgar"] = [[#showtooltip item:47006
/use item:47006]],
	["m_sharkbait"] = [[#showtooltip item:47036
/use item:47036]],
	["m_pvp"] = [[/print "Default macro when opposing faction is targetted."]],
	["default1"] = [[/print "Default macro when no other macro exists and you are in talent spec 1."]], -- Default macro that it'll switch to for spec 1
	["default2"] = [[/print "Default macro when no other macro exists and you are in talent spec 2."]], -- Default macro that it'll switch to for spec 2
	["default"] = [[/print "Default macro when no other macro exists."]], -- Default macro when you don't care about specs
}

-- Default settings
local defaults = {
	profile = {
		autoswap = true,
		pvpenabled = false,
		usedefault = true,
		talentbased = true,
		silent = true,
		byBigWigs2BossMod = true,
		byInstanceType = true,
		byZone = true,
		macroname = "ihml",
		macroIcon = {
			["*"] = 1, -- Most macros will have 1 (the question mark) as icon
			[L["Halls of Theory"]] = 661,
			[L["The Curator"]] = 661,
			[L["Terestian Illhoof"]] = 636,
			[L["Halazzi"]] = 644,
			[L["Fathom-Lord Karathress"]] = 384,
		},
		macroBody = {
			-- BC Dailies
			-- Daily quests ---------------------
			-- Skettis ------
			[1] = defaultmacrolist["m_skettis"],
			[L["Blackwind Lake"]] = 1,
			[L["Lower Veil Shil'ak"]] = 1,
			[L["Skettis"]] = 1,
			[L["Terokk's Rest"]] = 1,
			[L["Upper Veil Shil'ak"]] = 1,
			[L["Veil Ala'rak"]] = 1,
			[L["Veil Harr'ik"]] = 1,
			-- Ogri'La
			[2] = defaultmacrolist["m_forgecamp"],
			[L["Forge Camp: Wrath"]] = 2,
			[L["Forge Camp: Terror"]] = 2,
			[L["Vortex Pinnacle"]] = defaultmacrolist["m_pinnacle"],
			-- Netherwing
			[L["Netherwing Ledge"]] = L["m_booterang"],
			-- Halaa
			[L["Halaa"]] = defaultmacrolist["m_halaa"],
			-- Shattered Sun Offensive --
			[L["Isle of Quel'Danas"]] = L["m_crystalcores"],
			[L["Sun's Reach Sanctum"]] = defaultmacrolist["m_manaremnants"],
			[L["Throne of Kil'jaeden"]] = defaultmacrolist["m_blood4blood"],
			[L["Spirit Fields"]] = defaultmacrolist["m_spectrogoggles"],
			[L["The Dead Scar"]] = defaultmacrolist["m_deadscar"],
			[L["The Dawning Square"]] = defaultmacrolist["m_ssbanner"],
			[L["Bash'ir Landing"]] = defaultmacrolist["m_bashir"],
			[3] = defaultmacrolist["m_flamingoil"],
			[L["The Sin'loren"]] = 3,
			[L["The Dawnchaser"]] = 3,
			[L["The Bloodoath"]] = 3,
			[L["Greengill Coast"]] = defaultmacrolist["m_greengil"],
			[L["Dawnstar Village"]] = defaultmacrolist["m_dawnstar"],
			[L["Sun's Reach Armory"]] = defaultmacrolist["m_atamal"],
			[L["Razorthorn Rise"]] = L["m_razorthorn"],
			-- Cooking ------
			[L["Ancestral Grounds"]] = defaultmacrolist["m_soup4soul"],
			-- BC Instances
			-- The Black Morass
			[L["The Black Morass"]] = defaultmacrolist["m_blackmorass"],
			-- Magisters' Terrace ---------------
			[L["Halls of Theory"]] = L["m_vexallus"],
			-- Karazhan -------------------------
			[L["The Curator"]] = L["m_curator"],
			[L["Terestian Illhoof"]] = L["m_illhoof"],
			-- Zul'Aman -------------------------
			[L["Halazzi"]] = L["m_halazzi"],
			-- Serpentshrine Cavern -------------
			[L["Fathom-Lord Karathress"]] = L["m_flk"],
			[L["Lady Vashj"]] = L["m_vashj"],
			-- Mount Hyjal ----------------------
			[L["Archimonde"]] = defaultmacrolist["m_archimonde"],
			-- Black Temple ---------------------
			[L["High Warlord Naj'entus"]] = defaultmacrolist["m_najentus"],
			-- Wrath Dailies
			-- Howling Fjord
			[6] = defaultmacrolist["m_fishyfish"],
			[L["Howling Fjord"]] = 6,
			[L["Ledge of Garvan"]] = 6,
			[L["Twin Shores"]] = L["m_lureit"],
			[L["Winter's Breath Lake"]] = defaultmacrolist["m_edgeofwinter"],
			-- Borean Tundra
			[L["Coldarra"]] = L["m_drakehunt"],
			-- Grizzly Hills
			[L["Blue Sky Logging Grounds"]] = defaultmacrolist["m_bluesky"],
			[L["Grizzly Hills"]] = defaultmacrolist["m_grizzly"],
			[L["Venture Bay"]] = defaultmacrolist["m_venturebay"],
			[L["Ashwood Lake"]] = L["m_bladefitforchampion"],
			[L["Ashwood Post"]] = L["m_bladefitforchampion"],
			-- The Storm Peaks
			[4] = defaultmacrolist["m_essenceofice"],
			[L["Fjorn's Anvil"]] = 4,
			[L["Frostfield Lake"]] = 4,
			[L["The Forlorn Mine"]] = defaultmacrolist["m_discipline"],
			[5] = defaultmacrolist["m_aberations"],
			[L["The Blighted Pool"]] = 5,
			[L["Valkyrion"]] = 5,
			[L["Snowblind Hills"]] = defaultmacrolist["m_landmine"],
			[L["Garm's Bane"]] = defaultmacrolist["m_landmine"],
			[L["Thunderfall"]] = defaultmacrolist["m_hodirhorn"],
			[L["Valley of Ancient Winters"]] = defaultmacrolist["m_hodirdaily"],
			[L["The Pit of the Fang"]] = defaultmacrolist["m_pitoffang"],
			[L["The Foot Steppes"]] = defaultmacrolist["m_chipofulduar"],
			-- Zul'Drak
			[L["Drak'Sotra"]] = defaultmacrolist["m_draksotra"],
			[L["Zul'Drak"]] = defaultmacrolist["m_zuldrak"],
			[L["Drak'Mar Lake"]] = defaultmacrolist["m_winterhyacinth"],
			-- Ice Crown
			[L["The Broken Front"]] = L["m_brokenfront"],
			[L["The Valley of Fallen Heroes"]] = L["m_alliancebline"],
			[L["Njorndar Village"]] = defaultmacrolist["m_leavemark"],
			[L["Onslaught Harbor"]] = defaultmacrolist["m_corpserise"],
			[8] = defaultmacrolist["m_argentjousting"],
			[L["Argent Tournament Grounds"]] = 8,
			[L["The Horde Valiants' Ring"]] = 8,
			[L["The Argent Valiants' Ring"]] = 8,
			[L["The Alliance Valiants' Ring"]] = 8,
			[L["The Aspirants' Ring"]] = 8,
			[L["The Ring of Champions"]] = 8,
			[L["Argent Pavilion"]] = 8,
			[L["Silver Covenant Pavilion"]] = 8,
			[L["Sunreaver Pavilion"]] = 8,
			[L["The Court of Bones"]] = 8,
			[L["The Sea Reaver's Run"]] = L["m_kraken"],
			[L["Hrothgar's Landing"]] = defaultmacrolist["m_hrothgar"],
			[L["The Crimson Dawn"]]= defaultmacrolist["m_sharkbait"],
			[L["The Silver Blade"]]= defaultmacrolist["m_sharkbait"],
			-- Shozalar Basin
			[L["The Stormwright's Shelf"]] = defaultmacrolist["m_windandwater"],
			[L["River's Heart"]] = defaultmacrolist["m_ghostfish"],
			-- Strand of the Ancients
			[L["Courtyard of the Ancients"]] = defaultmacrolist["m_strand"],
			-- Crystalsong Forest
			[L["The Great Tree"]] = defaultmacrolist["m_greattree"],
			[L["Crystalsong Forest"]] = defaultmacrolist["m_greattree"],
			-- WotLK Instances
			-- Culling of Stratholme
			[L["The Culling of Stratholme"]] = defaultmacrolist["m_cos"],
			[L["PVP"]] = defaultmacrolist["m_pvp"],
			[L["Default Macro"]] = defaultmacrolist["default"],
			[L["Default Macro Spec 1"]] = defaultmacrolist["default1"],
			[L["Default Macro Spec 2"]] = defaultmacrolist["default2"],
		},
	}
}

-- Helper function
local function setMacro(name, icon, body)

	-- No icon or macro body
	if ((icon == nil) and (body == nil)) then
		mName[tostring(name)] = nil
		mIcon[name] = nil
		mBody[name] = nil
		-- Setting default macros to nil won't do it
		db:RegisterDefaults(defaults)
		if (mBody[name]) then
			mBody[name] = false
		end
	else
		mName[tostring(name)] = tostring(name)
		mIcon[name] = icon
		mBody[name] = body
	end

end

local function checkMacro(name, dontMake)

	if (not name) then
		return addon:Print(L["Please choose a macroname by typing: /ihml macroname <name here>"])
	elseif (GetMacroIndexByName(name) == 0) then
		if dontMake or InCombatLockdown() then
			return addon:Print(format(L["|cffff9999Warning!|r No macro named %s found. Make it plz!"], name))
		else
			for perChar = 0, 1 do
				local m = perChar*18+18
				for i = m-17, m do 
					local test = GetMacroInfo(i)
					if not test then
						return CreateMacro(name, 1, "", 1, perChar)
					end
				end
			end
			return addon:Print(L["|cffff9999Warning!|r No free macro space :("])
		end
	end
	return 1

end

function addon:OnInitialize()

	db = LibStub("AceDB-3.0"):New("IHMLDB", defaults, "Default")
	self.db = db
	c = db.char
	self:OnProfileChanged()
	db.RegisterCallback(self, "OnProfileChanged")
	
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("IHML", options)
	self.options = options
	options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(db)
	options.args.profile.order = 300
	self:RegisterChatCommand("ihml", "ChatCommand", true)

	if (LibStub:GetLibrary("LibAboutPanel", true)) then
		LibStub("LibAboutPanel").new(nil,MODNAME)
	else
		self:Print("Lib AboutPanel not loaded.")
	end

end

function addon:OnProfileChanged()
	p = db.profile
	mName = {}
	mIcon = p.macroIcon
	mBody = p.macroBody
	for k, v in pairs(mBody) do
		if v then
			mName[tostring(k)] = tostring(k)
		end
	end
end

function addon:OnEnable()

	self:UpdateSettings()
	checkMacro(p.macroname)
	if (c.current) then
		queued = c.current
		c.current = nil
		self:SwapMacro(nil, true)
		currentType = nil
	elseif (p.usedefault == true) then
		self:SwapMacro(L["Default Macro"], true)
	end
	self:RegisterEvent("ADDON_LOADED") -- To detect when the BigWigs/Macro frame loads
	if not bwLoaded and BigWigs then
		self:ADDON_LOADED(nil, "BigWigs") -- BigWigs has already loaded
	end
	if not macroUIHooked and MacroFrame then
		self:ADDON_LOADED(nil, "Blizzard_MacroUI") -- the MacroUI has already loaded
	end

end

function addon:OnDisable()
	bw2bm = nil
end

function addon:ZoneChanged()

	local zone = GetSubZoneText()

	self:SwapMacro(zone)

	if (currentType == "zone") then
		if ((c.current ~= zone) and (c.current ~= mBody[zone])) then
			currentType = nil
			if (p.usedefault == true) then
				self:SwapMacro(L["Default Macro"], true)
			end
		end
	elseif ((c.current == zone) or (c.current == mBody[zone])) then
		currentType = "zone"
		return
	end
	
	local zone1 = zone

	zone = GetRealZoneText()
	self:SwapMacro(zone)

	if (currentType == "zone") then
		if ((c.current ~= zone) and (c.current ~= mBody[zone])) then
			if ((c.current ~= zone1) and (c.current ~= mBody[zone1])) then
				currentType = nil
				if (p.usedefault == true) then
					self:SwapMacro(L["Default Macro"], true)
				end
			end
		end
	elseif ((c.current == zone) or (c.current == mBody[zone])) then
		currentType = "zone"
	end

end

local playerFaction = UnitFactionGroup("player")

--- Function when the PLAYER_TARGET_CHANGED event occurs
-- @name IHML:PLAYER_TARGET_CHANGED
-- @see IHML:OnInitialize()
-- @see IHML:UpdateSettings()
-- @usage IHML:PLAYER_TARGET_CHANGED()
-- @return Updates current macro to the PVP macro if the PVP flag is set, and the target is an opposite faction NPC.

function addon:PLAYER_TARGET_CHANGED()

	-- We assume that the flag is enabled because this event will be disabled if the option is set that way

	-- Remember what our last macro was
	if (c.current ~= L["PVP"]) then
		lastMacro = c.current
	end

	if (UnitIsPlayer("target")) then
		local targetfaction = UnitFactionGroup("target")
		if (targetfaction ~= playerFaction) then
			self:SwapMacro(L["PVP"])
		else
			self:SwapMacro(lastMacro)
		end
	else
		self:SwapMacro(lastMacro)
	end

end

--- Function when the PLAYER_ENTERING_WORLD event occurs
-- @name IHML:PLAYER_ENTERING_WORLD
-- @see IHML:OnInitialize()
-- @see IHML:UpdateSettings()
-- @usage IHML:PLAYER_ENTERING_WORLD()
-- @return Swaps the macro the the default macro or sets the currentType flag to be instance depending on the circumstance.

function addon:PLAYER_ENTERING_WORLD()

	-- Lets see which type of instance we're in, if any
	local instanceType = select(2, IsInInstance())

	if (instanceType == "none") then
		if (currentType == "instance") then
			currentType = nil
			if (p.usedefault == true) then
				self:SwapMacro(L["Default Macro"], true)
			end
		end
	else
		self:SwapMacro(instanceType)
		if (c.current == instanceType) then
			currentType = "instance"
		end
	end
end

--- Function when the PLAYER_TALENT_UPDATE event occurs
-- @name IHML:PLAYER_TALENT_UPDATE
-- @see IHML:OnInitialize()
-- @see IHML:UpdateSettings()
-- @usage IHML:PLAYER_TALENT_UPDATE()
-- @return Swaps the macro the the default macro when there is a talent change.

function addon:PLAYER_TALENT_UPDATE()

	-- Remember what our last macro was 
	if ((c.current == L["Default Macro"]) or (c.current == L["Default Macro Spec 1"]) or (c.current == L["Default Macro Spec 2"])) then
		self:SwapMacro(L["Default Macro"], true)
	end

end

function addon:ADDON_LOADED(event, addonname)

	if (addonname == "Blizzard_MacroUI") then
		-- Blizzard_MacroUI loads twice for some reason
		-- (guessing it has got something to do with the dummy addon in the AddOns-folder)
		-- MacroFrame remains nil until it has loaded for real.
		if MacroFrame == nil then return end
		-- Use secure hook, to avoid taint if editing macros in combat
		self:SecureHook("MacroPopupOkayButton_OnClick", function()
			if MacroPopupEditBox:GetText() == p.macroname then
				currentIcon = MacroPopupFrame.selectedIcon
				mIcon[c.current] = currentIcon
			end
		end)
		macroUIHooked = true

	elseif (addonname == "BigWigs") then
		AceLibrary("AceEvent-2.0").RegisterEvent(IHML, "Ace2_AddonEnabled", function(addonname)
			-- If the addon don't have enabletrigger then it's not a bossmod
			if ((addonname.enabletrigger) and (bw2bm)) then
				lastboss = addonname.name
				addon:SwapMacro(lastboss)
				if (c.current == lastboss) then
					currentType = "boss"
				end
			end
		end)
		AceLibrary("AceEvent-2.0").RegisterEvent(IHML, "BigWigs_RecvSync", function(sync, module)
			if (sync ~= "BossDeath") then
				return
			end
			if (c.current == module) then
				currentType = nil
				if (p.usedefault == true) then
					self:SwapMacro(L["Default Macro"], true)
				end
			end
		end)
		bwLoaded = true
	end

	if macroUIHooked and bwLoaded then
		self:UnregisterEvent("ADDON_LOADED") -- Don't need this anymore
	end

end

--- Swaps between an existing macro and a new macro.
-- @name IHML:SwapMacro
-- @see defaultmacrolist
-- @usage IHML:SwapMacro(new, silent)
-- @param new New macro to swap to, or "PLAYER_REGEN_ENABLED" when the player goes out of combat and a macro is queued.
-- @param silent Boolean to determine if we output a message to chat when the macro is swapped.
-- @return Macro body text is changed to the new body text

function addon:SwapMacro(new, silent)

	-- If we don't pass the silent parameter, use the default
	if (silent == nil) then 
		silent = p.silent
	end

	new = new ~= "PLAYER_REGEN_ENABLED" and new or queued

	-- If we are swapping to the default macro
	if (((p.usedefault == true) and new == L["Default Macro"]) and (p.talentbased == true)) then
		-- Get the active talent group
		local activetalent = GetActiveTalentGroup(false, false)
		if (activetalent == 1) then
			new = L["Default Macro Spec 1"]
		elseif (activetalent == 2) then
			new = L["Default Macro Spec 2"]
		end
	end

	local body = mBody[new]
	local oldnew

	if (type(body) == "number") then
		oldnew = new
		new = body
		body = mBody[new]
	end

	if (not new) or -- Got called without argument even when there was nothing queued.
	   (not body) then -- Macro don't exists
		return
	end

	if (new == c.current) then -- Macro is same as current macro
		if (queued) then
			-- Remove the queued macro
			queued = nil
			self:UnregisterEvent("PLAYER_REGEN_ENABLED")
		end
		return
	end

	if (InCombatLockdown()) then
		if (queued and ((queued == oldnew) or (queued == new))) then
			return
		end
		queued = oldnew or new
		self:RegisterEvent("PLAYER_REGEN_ENABLED", "SwapMacro")
		if not silent then
			self:Print(format(L["In combat! %s queued lol!"], queued))
		end
		return
	end

	local icon = mIcon[new]

	if (not silent) then
		self:Print(format(L["%s! I have that macro lol!"], oldnew or new))
	end

	local index = GetMacroIndexByName(p.macroname)
	if (index == 0) then
		return
	end

	EditMacro(index, p.macroname, icon, body, 1, 0)
	c.current = new
	currentIcon = icon
	queued = nil
	self:UnregisterEvent("PLAYER_REGEN_ENABLED")

end

function addon:ChatCommand(msg)
	local arg, pos = self:GetArgs(msg, 1, 1)
	if not arg or arg == "config" or arg == "gui" or arg == "show" then
		LibStub("AceConfigDialog-3.0"):Open("IHML")
		return
	elseif arg == "help" then
		self:Print("|cffff9933Commands:|r")
		self:Print("|cffff9999config|r - Open the configuration window")
		self:Print("|cffff9999save|r - Save any modifications to the current macro")
		self:Print("|cffff9999saveas|r |cff9999ff\"new name\"|r - Save modifications to a new macro")
		self:Print("|cffff9999rename|r |cff9999ff\"new name\"|r - Change name for current macro")
		self:Print("|cffff9999delete|r |cff9999ff\"macro\"|r - Delete a macro")
		self:Print("|cffff9999list|r - List all available macros")
		-- Keep the ingame command list simple
		--self:Print("|cffff9999insertdefault|r - Reinserts the default macros")
		--self:Print("|cffff9999macroname|r |cff9999ff\"macro\"|r - Choose what macroslot IHML will swap. Default: imhl")
		self:Print("|cff9999ffAnything else|r - Swap macro")
		return
	elseif arg == "save" then
		-- Save any modifications to the current macro
		if not c.current then return self:Print("No current macro") end
		local body = select(3, GetMacroInfo(p.macroname))
		if body then
			setMacro(c.current, currentIcon, body)
			self:Print("Saved as "..c.current)
		end
		return
	elseif arg == "saveas" then
		if not c.current then return self:Print("No current macro") end
		-- Save any modifications to a new macro
		arg, pos = self:GetArgs(msg, 1, pos)
		if arg then
			if arg == "boss" then
				if not lastboss then return self:Print("No last boss nub!") end
				arg = lastboss
			end
			local body = select(3, GetMacroInfo(p.macroname))
			if body then
				setMacro(arg, currentIcon, body)
				c.current = arg
			end
			self:Print("Saved as "..arg)
		end
		return
	elseif arg == "rename" then
		if not c.current then return self:Print("No current macro") end
		-- Change name for current macro
		local arg2
		arg, arg2, pos = self:GetArgs(msg, 2, pos)
		if arg then
			if arg2 then
				if mBody[arg] and not mBody[arg2] then
					setMacro(arg2, mIcon[arg], mBody[arg])
					setMacro(arg)
					self:Print("Renamed \""..arg.."\" to \""..arg2.."\"")
				end
			else
				if not mBody[arg] then
					setMacro(arg, mIcon[c.current], mBody[c.current])
					setMacro(c.current)
					c.current = arg
					self:Print("Renamed \""..c.current.."\" to \""..arg.."\"")
				end
			end
		end
		return
	elseif arg == "delete" or arg == "remove" then
		-- Delete a macro
		-- If there's no other argument, delete the current
		arg, pos = self:GetArgs(msg, 1, pos)
		if arg then
			self:Print("Deleting macro: "..arg)
			setMacro(arg)
		elseif c.current then
			self:Print("Deleting macro: "..c.current)
			setMacro(c.current)
			c.current = nil
		end
		return
	elseif arg == "list" then
		for k in pairs(mBody) do
			self:Print(k)
		end
		return
	elseif arg == "macroname" then
		arg, pos = self:GetArgs(msg, 1, pos)
		if arg then
			checkMacro(arg, true)
			p.macroname = arg
		end
	elseif arg == "pickup" then
		if InCombatLockdown() then return end
		if checkMacro(p.macroname) == 1 then
			PickupMacro(p.macroname)
		end
	elseif arg == "insertdefault" then
		for k in pairs(mBody) do
			if mBody[k] == false then
				mBody[k] = nil
			end
		end
		db:RegisterDefaults(defaults)
		addon:OnProfileChanged()
		return
	end
--	self:Print(msg)
	self:SwapMacro(msg)
	if c.current == msg then
		currentType = nil
	end
end

function addon:UpdateSettings()
	if p.autoswap then
		bw2bm = p.byBigWigs2BossMod == true
		if p.byInstanceType then
			self:RegisterEvent("PLAYER_ENTERING_WORLD")
		else
			self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		end
		if p.byZone then
			self:RegisterEvent("MINIMAP_ZONE_CHANGED", "ZoneChanged")
			self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ZoneChanged")
			self:RegisterEvent("ZONE_CHANGED_INDOORS", "ZoneChanged")
			self:RegisterEvent("ZONE_CHANGED", "ZoneChanged")
		else
			self:UnregisterEvent("MINIMAP_ZONE_CHANGED")
			self:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
			self:UnregisterEvent("ZONE_CHANGED_INDOORS")
			self:UnregisterEvent("ZONE_CHANGED")
		end
		if (p.pvpenabled == true) then
			self:RegisterEvent("PLAYER_TARGET_CHANGED")
		else
			self:UnregisterEvent("PLAYER_TARGET_CHANGED")
		end
		if (p.usedefault == false) then
			options.args.option.args.autoswap.args.events.args.talentbased.disabled = true
		else
			options.args.option.args.autoswap.args.events.args.talentbased.disabled = false
		end
		if (p.talentbased == true) then
			self:RegisterEvent("PLAYER_TALENT_UPDATE")
		else
			self:UnregisterEvent("PLAYER_TALENT_UPDATE")
		end
	else
		bw2bm = nil
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self:UnregisterEvent("MINIMAP_ZONE_CHANGED")
		self:UnregisterEvent("ZONE_CHANGED")
	end
end

options = {
	type = "group",
	name = "IHML",
	args = {
		macros = {
			type = "group",
			name = L["Macros"],
			desc = L["Macros"],
			order = 100,
			--args = {}, -- defined later
		},
		option = {
			type = "group",
			name = L["Options"],
			desc = L["Options"],
			order = 200,
			get = function(k) return p[k.arg] end,
			set = function(k, v) p[k.arg] = v; addon:UpdateSettings() end,
			--args = {}, -- defined later
		},
	}
}

options.args.option.args = {
	autoswap = {
		name = L["Auto Swap"], type = "group",
		desc = L["Auto Swap"],
		inline = true,
		order = 100,
		args = {
			use = {
				name = L["Use Auto Swap"],
				desc = L["Use Auto Swap"],
				type = "toggle",
				arg = "autoswap",
				order = 100,
			},
			silent = {
				name = L["Silent"],
				desc = L["Don't print to chat when swapping."],
				type = "toggle",
				arg = "silent",
				order = 150,
			},
			events = {
				name = L["Auto Swap events"], type = "group",
				desc = L["Auto Swap events"],
				inline = true,
				order = 200,
				disabled = function(info) return not p.autoswap end,
				args = {
					bigwigs2 = {
						name = L["BigWigs"], type = "toggle",
						desc = L["By BigWigs Boss Module"],
						order = 100,
						arg = "byBigWigs2BossMod",
					},
					instancetype = {
						name = L["Instance type"], type = "toggle",
						desc = L["By instance type. (arena, pvp, party or raid)"],
						order = 150,
						arg = "byInstanceType",
					},
					zone = {
						name = L["Zone"], type = "toggle",
						desc = L["By Zone"],
						order = 200,
						arg = "byZone",
					},
					usedefault = {
						name = L["Use Default"],
						type = "toggle",
						desc = L["USE_DEFAULT_DESC"],
						order = 249,
						arg = "usedefault",
					},
					pvp = {
						name = L["PVP"],
						type = "toggle",
						desc = L["PVP"],
						order = 250,
						arg = "pvpenabled",
					},
					talentbased = {
						name = L["Talent Specific"],
						type = "toggle",
						desc = L["Different default macro based on which talent spec you have enabled."],
						order = 251,
						arg = "talentbased",
					},
				},
			},
		},
	},
	macroname = {
		name = L["Used Macro"],
		desc = L["Used Macro"],
		type = "input",
		arg = "macroname",
		set = function(k, v) p["macroname"] = v or p.macroname; checkMacro(v,true) end,
		order = 200,
	},
	makemacro = {
		name = L["Make Macro"], type = "execute",
		desc = L["Make Macro"],
		order = 201,
		hidden = function() return GetMacroIndexByName(p.macroname) ~= 0 end,
		func = function() checkMacro(p.macroname) end,
	},
	pickup = {
		name = L["Pickup Macro"], type = "execute",
		desc = L["Click to pickup the IHML macro so that you can place it on an action bar."],
		order = 202,
		hidden = function() return GetMacroIndexByName(p.macroname) == 0 end,
		disabled = InCombatLockdown,
		func = function()
			-- Shouldn't happen because the button is disabled, but it won't hurt to test anyway.
			if InCombatLockdown() then return end
			if checkMacro(p.macroname) == 1 then
				PickupMacro(p.macroname)
			end
		end,
	},
}

local guiMacro
options.args.macros.args = {
	list = {
		type = "select",
		name = L["Select Macro:"],
		desc = L["Select a macro."],
		order = 100,
		values = function() return mName end,
		get = function()
			if guiMacro then
				if guiMacro == c.current then
					guiMacro = nil
					return tostring(c.current)
				elseif mBody[guiMacro] then
					return tostring(guiMacro)
				end
			elseif c.current then
				return tostring(c.current)
			end
			guiMacro = next(mName)
			return tostring(guiMacro)
		end,
		set = function(info,v)
			if tostring(tonumber(v)) == v then v = tonumber(v) end
			guiMacro = v ~= c.current and v or nil
		end,
	},
	swap = {
		type = "execute",
		name = L["Swap!"],
		desc = L["Swap to the selected macro."],
		order = 101,
		disabled = function() return guiMacro == nil end,
		func = function() addon:SwapMacro(guiMacro); if c.current == guiMacro then currentType = nil end end,
	},
	macro = {
		type = "group",
		name = L["Edit Macro"],
		inline = true,
		order = 200,
		disabled = function() return guiMacro == nil and c.current == nil end,
		args = {
			info = {
				type = "description",
				name = L["Last Module"],
				order = 100,
				image = function() return GetMacroIconInfo(mBody[guiMacro] and mIcon[guiMacro] or (c.current ~= nil and currentIcon or 1)), 56, 56 end,
			},
			name = {
				type = "input",
				name = L["Name:"],
				desc = L["This needs to match the boss module name or zone exactly for auto swap to work."],
				order = 200,
				validate = function(info, k)
					if k == "" then
						return L["Macros must have a name!"]
					elseif k == "boss" and lastboss == nil then
						return L["No boss module loaded!"]
					elseif mBody[k] then
						return format(L["%s already exists!"], k)
					end
					return true
				end,
				get = function() return mBody[guiMacro] and tostring(guiMacro) or tostring(c.current) end,
				set = function(info,k)
					if k == "boss" then
						k = lastboss
					elseif k == "zone" then
						k = GetMinimapZoneText()
					elseif tostring(tonumber(k)) == k then
						k = tonumber(k)
					end
					if mBody[guiMacro] then
						setMacro(k, mIcon[guiMacro], mBody[guiMacro])
						setMacro(guiMacro)
						if guiMacro == c.current then
							c.current = k
						end
						guiMacro = k
					else
						setMacro(k, mIcon[c.current], mBody[c.current])
						setMacro(c.current)
						c.current = k
					end
				end,
			},
			icon = {
				type = "input",
				name = L["Icon:"],
				desc = L["Icon"],
				order = 300,
				validate = function(info, k)
					local n = tonumber(k) or 0
					if n <= 0 or n > 1044 then
						return false
					elseif format("%d",n) == k then
						return true
					end
					return false
				end,
				get = function() return tostring(mBody[guiMacro] and mIcon[guiMacro] or currentIcon or "") end,
				set = function(info,k)
					if mBody[guiMacro] then
						mIcon[guiMacro] = tonumber(k)
					else
						currentIcon = tonumber(k)
						mIcon[c.current] = currentIcon
						if not InCombatLockdown() then
							EditMacro(GetMacroIndexByName(p.macroname), p.macroname, currentIcon)
						end
					end
				end,
			},
			body = {
				type = "input",
				name = "",
				desc = L["The macro goes here. Still limited to 255 characters."],
				order = 400,
				multiline = true,
				width = "full",
				get = function() return mBody[guiMacro] and tostring(mBody[guiMacro]) or tostring(mBody[c.current]) end,
				set = function(info,k)
					if tostring(tonumber(k)) == k then k = tonumber(k) end
					if mBody[guiMacro] then
						mBody[guiMacro] = k
					else
						mBody[c.current] = k
						if not InCombatLockdown() then
							EditMacro(GetMacroIndexByName(p.macroname), p.macroname, currentIcon, k)
						end
					end
				end,
			},
			new = {
				type = "execute",
				name = L["New macro"],
				desc = L["Make a new macro."],
				order = 560,
				disabled = false,
				func = function()
					local name = L["New macro"]
					if mBody[name] then
						local i = 2
						local testname = format(L["New macro %d"], i)
						while mBody[testname] do
							i = i + 1
							testname = format(L["New macro %d"], i)
						end
						name = testname
					end
					setMacro(name, 1, "")
					guiMacro = name
				end,
			},
			delete = {
				type = "execute",
				name = L["Remove!"],
				desc = L["Remove the macro."],
				order = 550,
				disabled = function()
					local name = guiMacro or c.current
					if name and mBody[name] then return false end
					return true
				end,
				confirm = function() return format(L["Are you sure you want to remove %s?"], mBody[guiMacro] and guiMacro or c.current) end,
				func = function()
					if mBody[guiMacro] then
						setMacro(guiMacro)
						guiMacro = nil
					elseif c.current then
						setMacro(c.current)
						c.current = nil
					end
				end,
			},
		},
	},
	insertdefault = {
		name = L["Reinsert default macros"], type = "execute",
		desc = L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."],
		order = 300,
		width = "full",
		func = function()
			for k in pairs(mBody) do
				if mBody[k] == false then
					mBody[k] = nil
				end
			end
			db:RegisterDefaults(defaults)
			addon:OnProfileChanged()
		end,
	},
}
