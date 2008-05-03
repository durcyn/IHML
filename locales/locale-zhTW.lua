local L = LibStub("AceLocale-3.0"):NewLocale("IHML", "zhTW")
if not L then return end


-- Core -------------------------------
L["In combat! %s queued lol!"] = "戰鬥中! %s 已排程!" -- %s will be replaced with the macro in question
L["%s! I have that macro lol!"] = "%s! 巨集已存在!" -- %s will be replaced with the macro in question
L["Please choose a macroname by typing: /ihml macroname <name here>"] = "請用以下命令指定巨集: /ihml macroname <巨集名稱>" -- Don't translate the command, it won't change
L["|cffff9999Warning!|r No macro named %s found. Make it plz!"] = "|cffff9999警告!|r 找不到巨集 %s。請建立新的巨集!" -- %s will be replaced with macroname
L["|cffff9999Warning!|r No free macro space :("] = "|cffff9999警告!|r 巨集空間不足"
-- /core ------------------------------

-- Config -----------------------------
-- Options ------------------
L["Macros"] = "巨集"
L["Options"] = "選項"
L["Auto Swap"] = "自動更換"
L["Use Auto Swap"] = "使用自動更換"
L["Silent"] = "不活動"
L["Don't print to chat when swapping."] = "更換時不印出訊息"
L["Auto Swap events"] = "自動更換事件"
L["BigWigs"] = "BigWigs"
L["By BigWigs Boss Module"] = "依 BigWigs 模組"
L["Instance type"] = "副本類別"
L["By instance type. (arena, pvp, party or raid)"] = "依副本類別 (arena, pvp, party or raid)" -- Don't translate (arena, pvp, party or raid), those names won't change with locale
L["Zone"] = "地區"
L["By Zone"] = "依地區"
L["Used Macro"] = "已使用巨集"
L["Make Macro"] = "建立新巨集"
L["Pickup Macro"] = "選擇巨集"
L["Click to pickup the IHML macro so that you can place it on an action bar."] = "點擊 IHML 巨集，這樣你可以將它放到你的動作條上"
L["Reinsert default macros"] = "重置預設巨集"
L["Use this to recover any removed default macros. Won't replace changed versions. If you want to revert changed macros delete them first."] = "還原已刪除的預設巨集。不會取代已變更的版本，如果你要還原已變更的巨集，請先刪除它們"
-- Macros -------------------
L["Select Macro:"] = "選擇巨集:"
L["Select a macro."] = "選擇一個巨集。"
L["Swap!"] = "更換!"
L["Swap to the selected macro."] = "更換成選擇的巨集"
L["Edit Macro"] = "編輯巨集"
L["Name: Type \"boss\" for last loaded boss module or \"zone\" for current zone.\nIcon: A number from 1 to 779. You might want to edit this from the Blizzard Macro UI."] = "名稱: 輸入 \"boss\" 代表最後使用的首領模組 或 \"zone\" 代表目前地區。\n圖示: 為 1 到 779 的數字，從暴風雪巨集視窗來編輯會比較容易"
L["Name:"] = "名稱:"
L["This needs to match the boss module name or zone exactly for auto swap to work."] = "這必須對應首領模組名稱或者是準確地區名稱才能使自動變換動作"
L["Macros must have a name!"] = "巨集必需要有名稱!"
L["No boss module loaded!"] = "沒有首領模組載入!"
L["%s already exists!"] = "%s 已經存在!" -- %s gets replaced with the macro in question
L["Icon:"] = "圖示:"
L["Icon"] = "圖示"
--L["Macro body:"] = true
L["The macro goes here. Still limited to 255 characters."] = "輸入巨集，內容仍限制在 255 字元以內"
L["Make a new macro."] = "建立新巨集"
L["New macro"] = "新巨集"
L["New macro %d"] = "新巨集 %d" -- %d gets replaced with a number
L["Remove!"] = "移除!"
L["Remove the macro."] = "移除該巨集"
L["Are you sure you want to remove %s?"] = "你確定要移除 %s 嗎?" -- %s gets replaced with the macro in question
-- /config ----------------------------

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
/use [flying] 禦天者爆破彈藥]]
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
L["m_booterang"] = [[#showtooltip [flying] item:32680; item:32503
/use [noflying] 亞吉歐的羊肉
/stopmacro [noflying]
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
L["m_ssbanner"] = [[#showtooltip [dead] item:34414; item:34533
/use [dead] 破碎之日旗幟; 星術師水晶]]
L["Greengill Coast"] = "綠鰓海岸"
L["m_greengil"] = [[#showtooltip [exists] item:34483; item:34533
/use [exists] 人魚控制寶珠; 星術師水晶]]
L["Dawnstar Village"] = "晨星村"
L["m_dawnstar"] = [[#showtooltip [dead] item:34368; item:34533
/use [dead] 調諧水晶核; 星術師水晶]]
L["Bash'ir Landing"] = "貝許爾平臺"
L["m_bashir"] = [[#showtooltip item:34248
/use 貝許爾相位裝置]]
L["The Sin'loren"] = "辛洛倫"
L["The Dawnchaser"] = "晨逐者"
L["The Bloodoath"] = "血之誓約"
L["m_flamingoil"] = [[#showtooltip item:34489
/use 烈焰之油]]
L["Sun's Reach Armory"] = "日境軍械庫"
L["m_atamal"] = [[#showtooltip item:34500
/use 阿塔莫武裝]]
L["Razorthorn Rise"] = "刺棘高地"
L["m_razorthorn"] = [[#showtooltip [pet, harm, nodead] 劫掠; [pet] 發現刺棘根莖; item:34255
/use [nopet] 刺棘撕掠者腺體
/cast [pet, harm, nodead] 劫掠; [pet] 發現刺棘根莖]]
-- Cooking ------------------
L["Ancestral Grounds"] = "先祖之地"
L["m_soup4soul"] = [[#showtooltip item:33851
/use 煮菜鍋]]
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
