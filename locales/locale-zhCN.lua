local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "zhCN")
if not L then return end


--[[ Core -------------------------------
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
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 779. You might want to edit this from the Blizzard Macro UI."] = true
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
-- /config ----------------------------]]

-- Default macros ---------------------
-- Skettis ------------------
L["Blackwind Lake"] = "黑风湖"
L["Lower Veil Shil'ak"] = "下层夏尔克鸦巢"
L["Skettis"] = "斯克提斯"
L["Terokk's Rest"] = "泰罗克之墓"
L["Upper Veil Shil'ak"] = "上层夏尔克鸦巢"
L["Veil Ala'rak"] = "奥拉克鸦巢"
L["Veil Harr'ik"] = "哈雷克鸦巢"
L["m_skettis"] = [[#showtooltip item:32406
/use [flying] 天空卫队的炸弹]]
-- Ogri'La ------------------
L["Vortex Pinnacle"] = "漩涡峰"
L["m_vortexpinnacle"] = [[#showtooltip item:32698
/use 牧绳
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = "铸魔营地：天罚"
L["Forge Camp: Terror"] = "铸魔营地：恐怖"
L["m_forgecamp"] = [[#showtooltip item:32456; item:32696
/use [flying] 天空卫队炸弹
/use [noflying] 放逐水晶]]
-- Netherwing ---------------
L["Netherwing Ledge"] = "灵翼浮岛"
L["m_booterang"] = [[#showtooltip item:32680
/target 偷懒的龙喉苦工
/use 训诫靴
/cleartarget]]
-- Shattered Sun Offensive --
L["Isle of Quel'Danas"] = "奎尔丹纳斯岛"
L["m_crystalcores"] = [[#showtooltip item:34368
/target 游荡的奥术守卫
/use 调和过的水晶核心]]
L["Sun's Reach Sanctum"] = "日境圣所"
L["m_manaremnants"] = [[#showtooltip item:34338
/use 法力余烬]]
L["Throne of Kil'jaeden"] = "基尔加丹王座"
L["m_blood4blood"] = [[#showtooltip item:34257
/use 魔化虹管 ]]
L["Spirit Fields"] = "灵魂平原"
L["m_spectrogoggles"] = [[#showtooltip item:35233
/use 多相光谱护目镜
/equip 多相光谱护目镜]]
L["The Dead Scar"] = "死亡之痕"
L["m_deadscar"] = [[#showtooltip item:34475
/use 秘法炸药]]
L["The Dawning Square"] = "曙光广场"
L["m_ssbanner"] = [[#showtooltip [dead] item:34414; item:34533
/use [dead] 破碎之日旗帜; item:34533]] -- Translate Astromancer's Crystal pls :)
--L["Greengil Coast"] = "Greengil Coast"
--L["Dawnstar Village"] = "Dawnstar Village"
--L["m_astrocrystal"] = [[#showtooltip item:34533
--/use Astromancer's Crystal]]
L["Bash'ir Landing"] = "巴什伊尔码头"
L["m_bashir"] = [[#showtooltip item:34248
/use 巴什伊尔相位设备]]
--L["The Sin'loren"] = "The Sin'loren"
--L["The Dawnchaser"] = "The Dawnchaser"
--L["The Bloodoath"] = "The Bloodoath"
--L["m_flamingoil"] = [[#showtooltip item:34489
--/use Flaming Oil]]
-- Magisters' Terrace -------
L["Halls of Theory"] = "学术大厅"
L["m_vexallus"] = [[/targetexact 纯净能量
/startattack]]
-- Karazhan -----------------
L["The Curator"] = "馆长"
L["m_curator"] = [[/targetexact 星界光芒
/startattack]]
L["Terestian Illhoof"] = "特雷斯坦·邪蹄"
L["m_illhoof"] = [[/targetexact 恶魔锁链
/startattack]]
-- Zul'Aman -----------------
L["Halazzi"] = "哈尔拉兹"
L["m_halazzi"] = [[/targetexact 堕落闪电图腾
/startattack]]
-- Serpentshrine Cavern -----
L["Fathom-Lord Karathress"] = "深水领主卡拉瑟雷斯"
L["m_flk"] = [[/targetexact 溅火图腾
/startattack]]
L["Lady Vashj"] = "瓦丝琪"
L["m_vashj"] = [[#showtooltip item:31088
/use 污染之核
/y <-- 污染之核 传给: %t !!
/s <-- 污染之核 传给: %t !!
/script SendChatMessage("你有污染之核！", "WHISPER", nil, UnitName("target"));]]
-- Tempest Keep -------------
-- Mount Hyjal --------------
L["Archimonde"] = "阿克蒙德"
L["m_archimonde"] = [[#showtooltip item:24494
/use 女神之泪]]
-- Black Temple -------------
L["High Warlord Naj'entus"] = "高阶督军纳因图斯"
L["m_najentus"] = [[#showtooltip item:32408
/use 纳因图斯之脊]]
-- /Default macros --------------------
