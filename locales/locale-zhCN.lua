local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "zhCN")
if not L then return end


-- Core -------------------------------
L["In combat! %s queued lol!"] = "战斗中! %s 要等一下才能使用!" -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = "%s! 宏已存在!" -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = "请用以下命令指定宏: /ihml macroname <宏名称>" -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = "|cffff9999警告!|r 找不到宏 %s。请建立新的宏!" -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space :("] = "|cffff9999警告!|r 宏空间不足"
-- /core ------------------------------

-- Config -----------------------------
-- Options ------------------
L["Macros"] = "宏"
L["Options"] = "选项"
L["Auto Swap"] = "自动更换"
L["Use Auto Swap"] = "使用自动更换"
L["Silent"] = "安静"
L["Don't print to chat when swapping."] = "更换时不印出讯息。"
L["Auto Swap events"] = "自动更换事件"
L["BigWigs"] = "首领警报"
L["By BigWigs Boss Module"] = "依首领警报模块"
L["Instance type"] = "副本类别"
L["By instance type. (arena, pvp, party or raid)"] = "依副本类别 (竞技场、战场、小队或团队)" -- Don't translate (arena, pvp, party or raid), those names won't change with locale
L["Zone"] = "地区"
L["By Zone"] = "依地区"
L["Used Macro"] = "已使用宏"
L["Make Macro"] = "建立新宏"
L["Pickup Macro"] = "选择宏"
L["Click to pickup the IHML macro so that you can place it on an action bar."] = "点击万用宏，将它放到你的动作条上。"
L["Reinsert default macros"] = "重置预设宏"
L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."] = "重新建立已删除的预设宏。同名的宏不会被改变，如果你要恢复成原版，请先删除它。"
-- Macros -------------------
L["Select Macro:"] = "选择宏:"
L["Select a macro."] = "选择一个宏。"
L["Swap!"] = "更换!"
L["Swap to the selected macro."] = "更换成选择的宏。"
L["Edit Macro"] = "编辑宏"
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 779. You might want to edit this from the Blizzard Macro UI."] = "名称: 输入 \"boss\" 代表最后使用的首领模块 或 \"zone\" 代表目前地区。\n图示: 为 1 到 779 的数字，从系统宏窗口来指定图标会比较容易。"
L["Name:"] = "名称:"
L["This needs to match the boss module name or zone exactly for auto swap to work."] = "这需要跟随首领模块名称或者是准确地区名称才能使自动变换动作。"
L["Macros must have a name!"] = "宏必需要有名称!"
L["No boss module loaded!"] = "没有首领模块加载!"
L["%s already exists!"] = "%s 已经存在!" -- %s gets replaced with the macro in question
L["Icon:"] = "图示:"
L["Icon"] = "图示"
--L["Macro body:"] = true
L["The macro goes here. Still limited to 255 characters."] = "输入宏，内容需在255个字符内。"
L["Make a new macro."] = "建立新宏。"
L["New macro"] = "新宏"
L["New macro %d"] = "新宏%d" -- %d gets replaced with a number
L["Remove!"] = "移除!"
L["Remove the macro."] = "移除该宏。"
L["Are you sure you want to remove %s?"] = "你确定要移除 %s 吗?" -- %s gets replaced with the macro in question
-- /config ----------------------------

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
--L["Greengill Coast"] = "Greengill Coast"
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
--L["Sun's Reach Armory"] = "Sun's Reach Armory"
--L["m_atamal"] = [[#showtooltip item:34500
--/use Ata'mal Armament]]
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
