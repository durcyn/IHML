local LibStub = LibStub

local MODNAME = "IHML"

local IHML = LibStub("AceAddon-3.0"):NewAddon(MODNAME,"AceConsole-3.0","AceEvent-3.0","AceHook-3.0")
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
local GetMinimapZoneText = GetMinimapZoneText
local GetMacroIndexByName = GetMacroIndexByName

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

local defaults = {
	profile = {
		autoswap = true,
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
			[1] = L["m_skettis"],
			[L["Blackwind Lake"]] = 1,
			[L["Lower Veil Shil'ak"]] = 1,
			[L["Skettis"]] = 1,
			[L["Terokk's Rest"]] = 1,
			[L["Upper Veil Shil'ak"]] = 1,
			[L["Veil Ala'rak"]] = 1,
			[L["Veil Harr'ik"]] = 1,
			-- Ogri'La ------
			[2] = L["m_forgecamp"],
			[L["Forge Camp: Wrath"]] = 2,
			[L["Forge Camp: Terror"]] = 2,
			[L["Vortex Pinnacle"]] = L["m_vortexpinnacle"],
			-- Netherwing ---
			[L["Netherwing Ledge"]] = L["m_booterang"],
			-- Shattered Sun Offensive --
			[L["Isle of Quel'Danas"]] = L["m_crystalcores"],
			[L["Sun's Reach Sanctum"]] = L["m_manaremnants"],
			[L["Throne of Kil'jaeden"]] = L["m_blood4blood"],
			[L["Spirit Fields"]] = L["m_spectrogoggles"],
			[L["The Dead Scar"]] = L["m_deadscar"],
			[L["The Dawning Square"]] = L["m_ssbanner"],
			[L["Bash'ir Landing"]] = L["m_bashir"],
			[3] = L["m_flamingoil"],
			[L["The Sin'loren"]] = 3,
			[L["The Dawnchaser"]] = 3,
			[L["The Bloodoath"]] = 3,
			[L["Greengill Coast"]] = L["m_greengil"],
			[L["Dawnstar Village"]] = L["m_dawnstar"],
			[L["Sun's Reach Armory"]] = L["m_atamal"],
			[L["Razorthorn Rise"]] = L["m_razorthorn"],
			-- Cooking ------
			[L["Ancestral Grounds"]] = L["m_soup4soul"],
			-- BC Instances
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
			[L["Archimonde"]] = L["m_archimonde"],
			-- Black Temple ---------------------
			[L["High Warlord Naj'entus"]] = L["m_najentus"],
			-------------------------------------

			-- Wrath Dailies
			-- Howling Fjord
			[7] = L["m_fishyfish"],
			[L["Howling Fjord"]] = 7,
			[L["Ledge of Garvan"]] = 7,
			[L["Twin Coast"]] = L["m_lureit"],
			-- Borean Tundra
			[L["Coldarra"]] = L["m_drakehunt"],
			-- The Storm Peaks
			[5] = L["m_essenceofice"],
			[L["Fjorn's Anvil"]] = 5,
			[L["Frostfield Lake"]] = 5,
			[L["The Forlorn Mine"]] = L["m_discipline"],
			[6] = L["m_aberations"],
			[L["The Blighted Pool"]] = 6,
			[L["Valkyrion"]] = 6,
			[L["Garm's Bane"]] = L["m_landmine"],
			[L["Thunderfall"]] = L["m_hodirhorn"],
			[L["Valley of Ancient Winters"]] = L["m_hodirdaily"],
			[L["The Pit of the Fang"]] = L["m_pitoffang"],
			-- Zul'Drak
			[L["Drak'Sorta"]] = L["m_draksorta"],
			-- Ice Crown
			[L["The Valley of Fallen Heroes"]] = L["m_alliancebline"],
			[L["Njorndar Village"]] = L["m_leavemark"],
			[L["Onslaught Harbor"]] = L["m_corpserise"],
			-- Shozalar Basin
			[L["The Stormwright's Shelf"]] = L["m_windandwater"],
			-- Strand of the Ancients
			[L["Courtyard of the Ancients"]] = L["m_strand"],
			-- WotLK Instances
			-- Culling of Stratholme
			[L["The Culling of Stratholme"]] = L["m_cos"],
		},
	}
}

-- Helper function
local function setMacro(name, icon, body)
	if icon == nil and body == nil then
		mName[tostring(name)] = nil
		mIcon[name] = nil
		mBody[name] = nil
		-- Setting default macros to nil won't do it
		db:RegisterDefaults(defaults)
		if mBody[name] then
			mBody[name] = false
		end
	else
		mName[tostring(name)] = tostring(name)
		mIcon[name] = icon
		mBody[name] = body
	end
end

local function checkMacro(name, dontMake)
	if not name then
		return IHML:Print(L["Please choose a macroname by typing: /ihml macroname <name here>"])
	elseif GetMacroIndexByName(name) == 0 then
		if dontMake or InCombatLockdown() then
			return IHML:Print(format(L["|cffff9999Warning!|r No macro named %s found. Make it plz!"], name))
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
			return IHML:Print(L["|cffff9999Warning!|r No free macro space :("])
		end
	end
	return 1
end

function IHML:OnInitialize()
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

	if LibStub:GetLibrary("LibAboutPanel", true) then
		LibStub("LibAboutPanel").new(nil,MODNAME)
	else
		self:Print("Lib AboutPanel not loaded.")
	end

end

function IHML:OnProfileChanged()
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

function IHML:OnEnable()
	self:UpdateSettings()
	checkMacro(p.macroname)
	if c.current then
		queued = c.current
		c.current = nil
		self:SwapMacro(nil, true)
		currentType = nil
	else
		self:SwapMacro("default", true)
	end
	self:RegisterEvent("ADDON_LOADED") -- To detect when the BigWigs/Macro frame loads
	if not bwLoaded and BigWigs then
		self:ADDON_LOADED(nil, "BigWigs") -- BigWigs has already loaded
	end
	if not macroUIHooked and MacroFrame then
		self:ADDON_LOADED(nil, "Blizzard_MacroUI") -- the MacroUI has already loaded
	end
end

function IHML:OnDisable()
	bw2bm = nil
end

function IHML:ZoneChanged()
	local zone = GetMinimapZoneText()
	self:SwapMacro(zone)
	if currentType == "zone" then
		if c.current ~= zone and c.current ~= mBody[zone] then
			currentType = nil
			self:SwapMacro("default")
		end
	elseif c.current == zone or c.current == mBody[zone] then
		currentType = "zone"
	end
end

function IHML:PLAYER_ENTERING_WORLD()
	local instanceType = select(2, IsInInstance())
	if instanceType == "none" then
		if currentType == "instance" then
			currentType = nil
			self:SwapMacro("default")
		end
	else
		self:SwapMacro(instanceType)
		if c.current == instanceType then
			currentType = "instance"
		end
	end
end

function IHML:ADDON_LOADED(event, addon)
	if addon == "Blizzard_MacroUI" then
		-- Blizzard_MacroUI loads twice for some reason
		-- (guessing it has got something to do with the dummy addon in the AddOns-folder)
		-- MacroFrame remains nil until it has loaded for real.
		if MacroFrame == nil then return end
		-- Use secure hook, to avoid taint if editing macros in combat
		self:SecureHook("MacroPopupOkayButton_OnClick", function()
			if MacroPopupEditBox:GetText() == p.macroname then
				currentIcon = MacroPopupFrame.selectedIcon
				mIcon[c.current] = currentIcon
				--IHML:Print("Caught macro icon index: "..currentIcon)
			end
		end)
		macroUIHooked = true
	elseif addon == "BigWigs" then
		AceLibrary("AceEvent-2.0").RegisterEvent(IHML, "Ace2_AddonEnabled", function(addon)
			-- If the addon don't have enabletrigger then it's not a bossmod
			if addon.enabletrigger and bw2bm then
				lastboss = addon.name
				IHML:SwapMacro(lastboss)
				if c.current == lastboss then
					currentType = "boss"
				end
			end
		end)
		AceLibrary("AceEvent-2.0").RegisterEvent(IHML, "BigWigs_RecvSync", function(sync, module)
			if sync ~= "BossDeath" then return end
			if c.current == module then
				currentType = nil
				IHML:SwapMacro("default")
			end
		end)
		bwLoaded = true
	end
	if macroUIHooked and bwLoaded then
		self:UnregisterEvent("ADDON_LOADED") -- Don't need this anymore
	end
end

function IHML:SwapMacro(new, silent)
	if silent == nil then silent = p.silent end
	new = new ~= "PLAYER_REGEN_ENABLED" and new or queued
	local body = mBody[new]
	local oldnew
	if type(body) == "number" then
		oldnew = new
		new = body
		body = mBody[new]
	end
	if not new or -- Got called without argument even when there was nothing queued.
		not body then -- Macro don't exists
		return
	end
	if new == c.current then -- Macro is same as current macro.
		if queued then
			-- Remove the queued macro
			queued = nil
			self:UnregisterEvent("PLAYER_REGEN_ENABLED")
		end
		return
	end
	if InCombatLockdown() then
		if queued and (queued == oldnew or queued == new) then return end
		queued = oldnew or new
		self:RegisterEvent("PLAYER_REGEN_ENABLED", "SwapMacro")
		if not silent then self:Print(format(L["In combat! %s queued lol!"], queued)) end
		return
	end
	local icon = mIcon[new]
	if not silent then self:Print(format(L["%s! I have that macro lol!"], oldnew or new)) end
	local index = GetMacroIndexByName(p.macroname)
	if index == 0 then return end
	EditMacro(index, p.macroname, icon, body, 1, 0)
	c.current = new
	currentIcon = icon
	queued = nil
	self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end


function IHML:ChatCommand(msg)
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
		IHML:OnProfileChanged()
		return
	end
--	self:Print(msg)
	self:SwapMacro(msg)
	if c.current == msg then
		currentType = nil
	end
end

function IHML:UpdateSettings()
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
			set = function(k, v) p[k.arg] = v; IHML:UpdateSettings() end,
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
		func = function() IHML:SwapMacro(guiMacro); if c.current == guiMacro then currentType = nil end end,
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
				name = L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 1044. You might want to edit this from the Blizzard Macro UI."],
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
			IHML:OnProfileChanged()
		end,
	},
}

_G.IHML = IHML
