local LibStub = LibStub
local IHML = LibStub("AceAddon-3.0"):NewAddon("IHML", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("IHML")

-- Upvalues from the global namespace
local format = string.format
local pairs = pairs
local select = select
local string = string
local tonumber = tonumber
local tostring = tostring
local GetMinimapZoneText = GetMinimapZoneText
local InCombatLockdown = InCombatLockdown
local CreateMacro = CreateMacro
local EditMacro = EditMacro
local GetMacroIndexByName = GetMacroIndexByName
local GetMacroInfo = GetMacroInfo
local GetMacroIconInfo = GetMacroIconInfo

-- locals
local db, c, p, options
local bw2bm
local mName -- Need for AceConfig
local mIcon, mBody
local currentIcon -- the index for the current macro icon
local queued
local macroUIHooked, bwLoaded
local lastboss

local defaults = {
	profile = {
		autoswap = true,
		byBigWigs2BossMod = true,
		byInstanceType = true,
		byZone = true,
		macroname = "ihml",
	}
}

-- Helper function
local function setMacro(name, icon, body, dontOverwrite)
	if dontOverwrite and mIcon[name] then return end
	mName[name] = icon and name or nil -- Makes it still possible to delete macros with setMacro(name)
	mIcon[name] = icon
	mBody[name] = body
end

local function insertDefaultMacros()
-- Please exuse the missing indent. He just couldn't make it.
-- Some macros XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- Daily quests -----------------------
-- Skettis --------
setMacro(L["Skettis"], 1, L["m_skettis"], true)
-- Ogri'La --------
setMacro(L["Vortex Pinnacle"], 1, L["m_vortexpinnacle"], true)
setMacro(L["Forge Camp: Wrath"], 1, L["m_forgecamp"], true)
setMacro(L["Forge Camp: Terror"], 1, L["m_forgecamp"], true)
-- Netherwing -----
-- TODO: Go figure out what macros to write
---------------------------------------

-- Karazhan ---------------------------
setMacro(L["The Curator"], 651, L["m_curator"], true)
setMacro(L["Terestian Illhoof"], 626, L["m_illhoof"], true)
---------------------------------------

-- Zul'Aman ---------------------------
setMacro(L["Halazzi"], 634, L["m_halazzi"], true)
---------------------------------------

-- Serpentshrine Cavern ---------------
setMacro(L["Fathom-Lord Karathress"], 376, L["m_flk"], true)
setMacro(L["Lady Vashj"], 1, L["m_vashj"], true)
---------------------------------------

-- Tempest Keep -----------------------
---------------------------------------

-- Mount Hyjal ------------------------
setMacro(L["Archimonde"], 1, L["m_archimonde"], true)
---------------------------------------

-- Black Temple -----------------------
setMacro(L["High Warlord Naj'entus"], 1, L["m_najentus"], true)
---------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

local function checkMacro(name, dontMake)
	if not name then
		IHML:Print(L["Please choose a macroname by typing: /ihml macroname <name here>"])
	elseif GetMacroIndexByName(name) == 0 then
		if dontMake then
			IHML:Print(format(L["|cffff9999Warning!|r No macro named %s found. Make it plz!"], name))
		else
			local i = 1
			while i <= 18 do 
				local test = GetMacroInfo(i)
				if not test then
					CreateMacro(name, 1, "", 1, false)
					return
				end
				i = i + 1
			end
			IHML:Print(L["|cffff9999Warning!|r No free macro space for a non character specific macro :("])
		end
	elseif GetMacroIndexByName(name) > 18 then
		IHML:Print(format(L["%s is character specific. It is recomended to use a general macro if the profile is used with more than one character. (And to get rid of this nagging ;P)"], name))
	end
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
end

function IHML:OnProfileChanged()
	p = db.profile
	mName = {}
	mIcon = p.macroIcon
	mBody = p.macroBody
	if not mIcon or not mBody then
		mIcon = {}
		mBody = {}
		insertDefaultMacros()
		p.macroIcon = mIcon
		p.macroBody = mBody
	else
		for k in pairs(mIcon) do
			mName[k] = k
		end
	end	
end

function IHML:OnEnable()
	self:UpdateSettings()
	checkMacro(p.macroname)
	if c.current then
		queued = c.current
		c.current = nil
		self:SwapMacro()
	end
	self:RegisterEvent("ADDON_LOADED") -- To detect when the BigWigs/Macro frame loads
	if not bwLoaded and BigWigs then
		self:ADDON_LOADED("BigWigs") -- BigWigs has already loaded
	end
	if not macroUIHooked and MacroFrame then
		self:ADDON_LOADED("Blizzard_MacroUI") -- the MacroUI has already loaded
	end
end

function IHML:OnDisable()
	bw2bm = nil
end

function IHML:ZoneChanged()
	self:SwapMacro(GetMinimapZoneText())
end

function IHML:PLAYER_ENTERING_WORLD()
	local _, instanceType = IsInInstance()
	if instanceType ~= "none" then
		self:SwapMacro(instanceType)
	end
end

function IHML:ADDON_LOADED(addon)
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
			end
		end)
		bwLoaded = true
	end
	if macroUIHooked and bwLoaded then
		self:UnregisterEvent("ADDON_LOADED") -- Don't need this anymore
	end
end

function IHML:SwapMacro(new)
	new = new ~= "PLAYER_REGEN_ENABLED" and new or queued
	if not new or -- Got called without argument even when there was nothing queued.
		not mIcon[new] or -- Macro don't exists
		new == c.current then -- Macro is same as current macro. TODO: Swap anyway if the macro has been modified?
		return
	end
	if InCombatLockdown() then
		if queued and queued == new then return end
		queued = new
		self:RegisterEvent("PLAYER_REGEN_ENABLED", "SwapMacro")
		self:Print(format(L["In combat! %s queued lol!"], queued))
		return
	end
	local icon, body = mIcon[new], mBody[new]
	self:Print(format(L["%s! I have that macro lol!"], new))
	EditMacro(GetMacroIndexByName(p.macroname), p.macroname, icon, body, 1, 0)
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
				if mIcon[arg] and not mIcon[arg2] then
					setMacro(arg2, mIcon[arg], mBody[arg])
					setMacro(arg)
					self:Print("Renamed \""..arg.."\" to \""..arg2.."\"")
				end
			else
				if not mIcon[arg] then
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
		for k in pairs(mIcon) do
			self:Print(k)
		end
		return
	elseif arg == "macroname" then
		arg, pos = self:GetArgs(msg, 1, pos)
		if arg then
			checkMacro(arg, true)
			p.macroname = arg
		end
	elseif arg == "insertdefault" then
		insertDefaultMacros()
		return
	end
--	self:Print(msg)
	self:SwapMacro(msg)
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
			self:RegisterEvent("ZONE_CHANGED", "ZoneChanged")
		else
			self:UnregisterEvent("MINIMAP_ZONE_CHANGED")
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
		disabled = function() return GetMacroIndexByName(p.macroname) ~= 0 end,
		func = function() checkMacro(p.macroname) end,
	},
	insertdefault = {
		name = L["Reinsert default macros"], type = "execute",
		desc = L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."],
		order = 300,
		func = insertDefaultMacros,
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
					return c.current
				elseif mIcon[guiMacro] then
					return guiMacro
				end
			elseif c.current then
				return c.current
			end
			guiMacro = next(mName)
			return guiMacro
		end,
		set = function(info,v) guiMacro = v ~= c.current and v or nil end,
	},
	swap = {
		type = "execute",
		name = L["Swap!"],
		desc = L["Swap to the selected macro."],
		order = 101,
		func = function() IHML:SwapMacro(guiMacro) end,
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
				name = L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 769. You might want to edit this from the Blizzard Macro UI."],
				order = 100,
				image = function() return GetMacroIconInfo(mIcon[guiMacro] or (c.current ~= nil and currentIcon or 1)), 56, 56 end,
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
					elseif mIcon[k] then
						return format(L["%s already exists!"], k)
					end
					return true
				end,
				get = function() return mIcon[guiMacro] and guiMacro or c.current end,
				set = function(info,k)
					if k == "boss" then
						k = lastboss
					elseif k == "zone" then
						k = GetMinimapZoneText()
					end
					if mIcon[guiMacro] then
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
					if n <= 0 or n >= 770 then
						return false
					elseif string.format("%d",n) == k then
						return true
					end
					return false
				end,
				get = function() return tostring(mIcon[guiMacro] or currentIcon or "") end,
				set = function(info,k)
					if mIcon[guiMacro] then
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
				get = function() return mIcon[guiMacro] and mBody[guiMacro] or mBody[c.current] end,
				set = function(info,k)
					if mIcon[guiMacro] then
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
					if mIcon[name] then
						local i = 2
						local testname = string.format("New macro %d", name, i)
						while mIcon[testname] do
							i = i + 1
							testname = string.format("New macro %d", name, i)
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
					if name and mIcon[name] then return false end
					return true
				end,
				confirm = function() return string.format("Are you sure you want to remove %s?", mIcon[guiMacro] and guiMacro or c.current) end,
				func = function()
					if mIcon[guiMacro] then
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
}

_G.IMHL = IHML
