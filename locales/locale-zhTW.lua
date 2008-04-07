local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "zhTW")
if not L then return end

-- See locale-exEX.lua for instructions in how to make a translation

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
L["Blackwind Lake"] = "黑風湖"
L["Lower Veil Shil'ak"] = "迷霧希拉克下層"
L["Skettis"] = "司凱堤斯"
L["Terokk's Rest"] = "泰洛克之墓"
L["Upper Veil Shil'ak"] = "迷霧希拉克上層"
L["Veil Ala'rak"] = "迷霧亞拉芮克"
L["Veil Harr'ik"] = "迷霧哈瑞克"
L["m_skettis"] = [[#showtooltip item:32406
/use [mounted] 禦天者爆破彈藥]]
-- Ogri'La ------------------
L["Vortex Pinnacle"] = "漩渦尖塔"
L["m_vortexpinnacle"] = [[#showtooltip item:32698
/use 綑綁套索
/stopattack
/petpassive]]
L["Forge Camp: Wrath"] = "煉冶場:憤怒"
L["Forge Camp: Terror"] = "煉冶場:驚駭"
L["m_forgecamp"] = [[#showtooltip [flying] item:32456; item:32696
/use [flying] 禦天者炸彈
/use [noflying] 驅逐水晶]]
-- Netherwing ---------------
L["Netherwing Ledge"] = "虛空之翼岩架"
L["m_booterang"] = [[#showtooltip item:32680
/targetexact 不服從的龍喉苦工
/use 迴力靴
/cleartarget]]
-- Shattered Sun Offensive --
L["Isle of Quel'Danas"] = "奎爾達納斯之島"
L["m_crystalcores"] = [[#showtooltip item:34368
/targetexact 不穩定的哨兵
/use 調諧水晶核]]
L["Sun's Reach Sanctum"] = "日境聖所"
L["m_manaremnants"] = [[#showtooltip item:34338
/use 法力殘餘]]
L["Throne of Kil'jaeden"] = "基爾加丹王座"
L["m_blood4blood"] = [[#showtooltip item:34257
/use 魔化虹管 ]]
L["Spirit Fields"] = "靈魂原野"
L["m_spectrogoggles"] = [[#showtooltip item:35233
/use 多相光譜護目鏡
/equip 多相光譜護目鏡]]
L["The Dead Scar"] = "死亡之痕"
L["m_deadscar"] = [[#showtooltip item:34475
/use 秘法炸藥]]
L["The Dawning Square"] = "曙光廣場"
L["m_ssbanner"] = [[#showtooltip item:34414
/targetexact 憎恨密使
/use 破碎之日旗幟]]
L["Bash'ir Landing"] = "貝許爾平臺"
L["m_bashir"] = [[#showtooltip item:34248
/use 貝許爾相位裝置]]
L["The Sin'loren"] = "辛洛倫"
L["The Dawnchaser"] = "晨逐者"
L["The Bloodoath"] = "血之誓約"
L["m_flamingoil"] = [[#showtooltip item:34489
/use 烈焰之油]]
-- Magisters' Terrace -------
L["Halls of Theory"] = "學術大廳"
L["m_vexallus"] = [[/targetexact 純淨能量
/startattack]]
-- Karazhan -----------------
L["The Curator"] = "館長"
L["m_curator"] = [[/targetexact 星界爆發
/startattack]]
L["Terestian Illhoof"] = "泰瑞斯提安·疫蹄"
L["m_illhoof"] = [[/targetexact 惡魔鍊
/startattack]]
-- Zul'Aman -----------------
L["Halazzi"] = "哈拉齊"
L["m_halazzi"] = [[/targetexact 墮落的閃電圖騰
/startattack]]
-- Serpentshrine Cavern -----
L["Fathom-Lord Karathress"] = "深淵之王卡拉薩瑞斯"
L["m_flk"] = [[/targetexact 飛火圖騰
/startattack]]
L["Lady Vashj"] = "瓦許女士"
L["m_vashj"] = [[#showtooltip item:31088
/use 受污染的核心
/y <-- 受污染的核心 傳給: %t !!
/s <-- 受污染的核心 傳給: %t !!
/script SendChatMessage("你有受污染的核心！", "WHISPER", nil, UnitName("target"));]]
-- Tempest Keep -------------
-- Mount Hyjal --------------
L["Archimonde"] = "阿克蒙德"
L["m_archimonde"] = [[#showtooltip item:24494
/use 女神之淚]]
-- Black Temple -------------
L["High Warlord Naj'entus"] = "高階督軍納珍塔斯"
L["m_najentus"] = [[#showtooltip item:32408
/use 納珍塔斯脊骨]]
-- /Default macros --------------------
