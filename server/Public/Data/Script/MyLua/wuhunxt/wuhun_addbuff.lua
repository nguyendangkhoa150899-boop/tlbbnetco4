--脚本号
x892112_g_scriptId = 892112
x892112_WuhunSuxing = {["0"]=0,["q"]=1,["w"]=2,["e"]=3,["r"]=4,["t"]=5,["y"]=6,["u"]=7,["i"]=8,["o"]=9,["p"]=10,["a"]=11,["s"]=12,["d"]=13,["f"]=14,["g"]=15,["h"]=16,["j"]=17,["k"]=18,["l"]=19,["z"]=20,["x"]=21,["c"]=22,["v"]=23,["b"]=24,["n"]=25,["m"]=26,["Q"]=27,["W"]=28,["E"]=29,["R"]=30,["T"]=31,["Y"]=32,["U"]=33,["I"]=34,["O"]=35,["P"]=36,["A"]=37,["S"]=38,["D"]=39,["F"]=40,["G"]=41,["H"]=42,["J"]=43,["K"]=44,["L"]=45,["Z"]=46,["X"]=47,["C"]=48,["V"]=49,["B"]=50,["N"]=51,["M"]=52}

--技能定义q-F 1-40 清逸之魂|寒锋之魂|武勇之魂|御体之魂|游身之魂|尚武之魂|乏力之魂|灭灵之魂|破体之魂|乱定之魂|重身之魂|绝情之魂|厉刚之魂|旋柔之魂|武韧之魂|阴绵之魂|星准之魂|灵洒之魂|断刚之魂|裂柔之魂|黯韧之魂|刺绵之魂|扰准之魂|绝洒之魂|强击之魂|绝气之魂|灭世八方|绝境散杀|冰封万里|天火燎原|狂雷天降|剧毒瘟疫|怒涛连击|刚猛重击|柔蛇突袭|寒冰穿刺|烈焰灼身|天雷轰顶|雾腐蚀毒|雷霆猛击
--属性定义q-h 1-16 1-4 冰、火、玄、毒攻  5-8 冰、火、玄、毒抗  9-12 冰、火、玄、毒减抗
--"_q1e2w1r2p1a2d1f1q1w5e8011800000" --技能部分q1w5e8 清逸之魂1级 寒锋之魂5级 武勇之魂8级
--扩展属性部分q1e2w1r2p1a2d1 冰攻1级 玄攻2级 火攻1级 毒攻2级 减火抗1级 减玄抗2级 降低目标冰抗下限1级
--011800 合成等级0级，风属相，武魂攻击类型（平衡型），扩展属性数量（8条），武魂当前等级0级（加经验升的级最大120级）
--"_q1e2w1r2p1a2d1f1q1w5e8011800000"
----冰火玄毒攻、冰火玄毒抗、冰火玄毒减抗、冰火玄毒减抗下限（四取二，一共8个每个占2位），三个武魂技能（3个每个占2位）,合成等级（1位），属相（1位），武魂攻击类型（1位），扩展属性数量（1位），武魂当前等级（占2位加经验升的级最大120级）,后面3位保存经验
x892112_WuhunSuTostring = {[0]="0",[1]="q",[2]="w",[3]="e",[4]="r",[5]="t",[6]="y",[7]="u",[8]="i",[9]="o",[10]="p",[11]="a",[12]="s",[13]="d",[14]="f",[15]="g",[16]="h",[17]="j",[18]="k",[19]="l",[20]="z",[21]="x",[22]="c",[23]="v",[24]="b",[25]="n"}

-- 已废弃 当前武魂属性攻 MD_WUHUN_NOWSUXING=293	
-- 已废弃 当前武魂抗 MD_WUHUN_NOWGANG=294	
--已废弃 当前武魂减抗 MD_WUHUN_NOWDELGANG = 338
--已废弃 当前武魂技能 MD_WUHUN_NOWSKILLS = 330 
--已废弃当前武魂减冰火玄毒抗下限 MD_PLAYER_BINDOWN

x892112_misssuxingandjinen = {MD_WUHUN_KUZANG0,MD_WUHUN_KUZANG1,MD_WUHUN_KUZANG2,MD_WUHUN_NOWSKILLS}
--每个扩展属性最大数值只到百位，三个最多九位数，可储存入一个missdata里
--预计每个missdata储存3个扩展属性MD_WUHUN_KUZANG0-MD_WUHUN_KUZANG2用于储存扩展属性，已经足够
--扩展技能千位数可忽略，要用时再叫上，最多到百位，三个扩展技能储存在一个missdata里已足够
--三个扩展技能储存于1个missdata里，即MD_WUHUN_NOWSKILLS

x892112_missFeiKoZhan = MD_WUHUN_KUZANG3
x892112_missFeiKoZhan0 = MD_WUHUN_KUZANG4
--011800 合成等级，属相，武魂攻击类型，扩展属性数量储存在MD_WUHUN_KUZANG3里
--武魂当前等级（加经验升的级最大120级）,武魂当前经验
x892112_MissGangDel = {MD_PLAYER_BINGD,MD_PLAYER_HUOGD,MD_PLAYER_XUANGD,MD_PLAYER_DUGD}
--记录抗和减抗
x892112_wuhun_addImpact = {}
x892112_wuhun_addImpact[0011] = 10675  --冰攻1
x892112_wuhun_addImpact[0012] = 10676  --冰攻2
x892112_wuhun_addImpact[0013] = 10677  --冰攻3
x892112_wuhun_addImpact[0014] = 10678  --冰攻4
x892112_wuhun_addImpact[0015] = 10679  --冰攻5
x892112_wuhun_addImpact[0016] = 10680  --冰攻6
x892112_wuhun_addImpact[0017] = 10681  --冰攻7
x892112_wuhun_addImpact[0018] = 10682  --冰攻8
x892112_wuhun_addImpact[0021] = 10683  --火攻1
x892112_wuhun_addImpact[0022] = 10684  --火攻2
x892112_wuhun_addImpact[0023] = 10685  --火攻3
x892112_wuhun_addImpact[0024] = 10686  --火攻4
x892112_wuhun_addImpact[0025] = 10687  --火攻5
x892112_wuhun_addImpact[0026] = 10688  --火攻6
x892112_wuhun_addImpact[0027] = 10689  --火攻7
x892112_wuhun_addImpact[0028] = 10690  --火攻8
x892112_wuhun_addImpact[0031] = 10691  --玄攻1
x892112_wuhun_addImpact[0032] = 10692  --玄攻2
x892112_wuhun_addImpact[0033] = 10693  --玄攻3
x892112_wuhun_addImpact[0034] = 10694  --玄攻4
x892112_wuhun_addImpact[0035] = 10695  --玄攻5
x892112_wuhun_addImpact[0036] = 10696  --玄攻6
x892112_wuhun_addImpact[0037] = 10697  --玄攻7
x892112_wuhun_addImpact[0038] = 10698  --玄攻8
x892112_wuhun_addImpact[0041] = 10699  --毒攻1
x892112_wuhun_addImpact[0042] = 10700  --毒攻2
x892112_wuhun_addImpact[0043] = 10701  --毒攻3
x892112_wuhun_addImpact[0044] = 10702  --毒攻4
x892112_wuhun_addImpact[0045] = 10703  --毒攻5
x892112_wuhun_addImpact[0046] = 10704  --毒攻6
x892112_wuhun_addImpact[0047] = 10705  --毒攻7
x892112_wuhun_addImpact[0048] = 10706  --毒攻8
x892112_wuhun_addImpact[0051] = 10707  --冰抗1
x892112_wuhun_addImpact[0052] = 10708  --冰抗2
x892112_wuhun_addImpact[0053] = 10709  --冰抗3
x892112_wuhun_addImpact[0054] = 10710  --冰抗4
x892112_wuhun_addImpact[0055] = 10711  --冰抗5
x892112_wuhun_addImpact[0056] = 10712  --冰抗6
x892112_wuhun_addImpact[0057] = 10713  --冰抗7
x892112_wuhun_addImpact[0058] = 10714  --冰抗8
x892112_wuhun_addImpact[0061] = 10715  --火抗1
x892112_wuhun_addImpact[0062] = 10716  --火抗2
x892112_wuhun_addImpact[0063] = 10717  --火抗3
x892112_wuhun_addImpact[0064] = 10718  --火抗4
x892112_wuhun_addImpact[0065] = 10719  --火抗5
x892112_wuhun_addImpact[0066] = 10720  --火抗6
x892112_wuhun_addImpact[0067] = 10721  --火抗7
x892112_wuhun_addImpact[0068] = 10722  --火抗8
x892112_wuhun_addImpact[0071] = 10723  --玄抗1
x892112_wuhun_addImpact[0072] = 10724  --玄抗2
x892112_wuhun_addImpact[0073] = 10725  --玄抗3
x892112_wuhun_addImpact[0074] = 10726  --玄抗4
x892112_wuhun_addImpact[0075] = 10727  --玄抗5
x892112_wuhun_addImpact[0076] = 10728  --玄抗6
x892112_wuhun_addImpact[0077] = 10729  --玄抗7
x892112_wuhun_addImpact[0078] = 10730  --玄抗8
x892112_wuhun_addImpact[0081] = 10731  --毒抗1
x892112_wuhun_addImpact[0082] = 10732  --毒抗2
x892112_wuhun_addImpact[0083] = 10733  --毒抗3
x892112_wuhun_addImpact[0084] = 10734  --毒抗4
x892112_wuhun_addImpact[0085] = 10735  --毒抗5
x892112_wuhun_addImpact[0086] = 10736  --毒抗6
x892112_wuhun_addImpact[0087] = 10737  --毒抗7
x892112_wuhun_addImpact[0088] = 10738  --毒抗8
x892112_wuhun_addImpact[0091] = 10739  --减少冰1
x892112_wuhun_addImpact[0092] = 10740  --减少冰2
x892112_wuhun_addImpact[0093] = 10741  --减少冰3
x892112_wuhun_addImpact[0094] = 10742  --减少冰4
x892112_wuhun_addImpact[0095] = 10743  --减少冰5
x892112_wuhun_addImpact[0096] = 10744  --减少冰6
x892112_wuhun_addImpact[0097] = 10745  --减少冰7
x892112_wuhun_addImpact[0098] = 10746  --减少冰8
x892112_wuhun_addImpact[00101] = 10747  --减少火1
x892112_wuhun_addImpact[00102] = 10748  --减少火2
x892112_wuhun_addImpact[00103] = 10749  --减少火3
x892112_wuhun_addImpact[00104] = 10750  --减少火4
x892112_wuhun_addImpact[00105] = 10751  --减少火5
x892112_wuhun_addImpact[00106] = 10752  --减少火6
x892112_wuhun_addImpact[00107] = 10753  --减少火7
x892112_wuhun_addImpact[00108] = 10754  --减少火8
x892112_wuhun_addImpact[00111] = 10755  --减少玄1
x892112_wuhun_addImpact[00112] = 10756  --减少玄2
x892112_wuhun_addImpact[00113] = 10757  --减少玄3
x892112_wuhun_addImpact[00114] = 10758  --减少玄4
x892112_wuhun_addImpact[00115] = 10759  --减少玄5
x892112_wuhun_addImpact[00116] = 10760  --减少玄6
x892112_wuhun_addImpact[00117] = 10761  --减少玄7
x892112_wuhun_addImpact[00118] = 10762  --减少玄8
x892112_wuhun_addImpact[00121] = 10763  --减少毒1
x892112_wuhun_addImpact[00122] = 10764  --减少毒2
x892112_wuhun_addImpact[00123] = 10765  --减少毒3
x892112_wuhun_addImpact[00124] = 10766  --减少毒4
x892112_wuhun_addImpact[00125] = 10767  --减少毒5
x892112_wuhun_addImpact[00126] = 10768  --减少毒6
x892112_wuhun_addImpact[00127] = 10769  --减少毒7
x892112_wuhun_addImpact[00128] = 10770  --减少毒8



x892112_wuhun_addImpact[1100] = 10675   --  冰攻1					
x892112_wuhun_addImpact[1200] = 10676   --  冰攻2					
x892112_wuhun_addImpact[1300] = 10677   --  冰攻3					
x892112_wuhun_addImpact[1400] = 10678   --  冰攻4					
x892112_wuhun_addImpact[1500] = 10679   --  冰攻5					
x892112_wuhun_addImpact[1600] = 10680   --  冰攻6					
x892112_wuhun_addImpact[1700] = 10681   --  冰攻7					
x892112_wuhun_addImpact[1800] = 10682   --  冰攻8					
x892112_wuhun_addImpact[2100] = 10683   --  火攻1					
x892112_wuhun_addImpact[2200] = 10684   --  火攻2					
x892112_wuhun_addImpact[2300] = 10685   --  火攻3					
x892112_wuhun_addImpact[2400] = 10686   --  火攻4					
x892112_wuhun_addImpact[2500] = 10687   --  火攻5					
x892112_wuhun_addImpact[2600] = 10688   --  火攻6					
x892112_wuhun_addImpact[2700] = 10689   --  火攻7					
x892112_wuhun_addImpact[2800] = 10690   --  火攻8					
x892112_wuhun_addImpact[3100] = 10691   --  玄攻1					
x892112_wuhun_addImpact[3200] = 10692   --  玄攻2					
x892112_wuhun_addImpact[3300] = 10693   --  玄攻3					
x892112_wuhun_addImpact[3400] = 10694   --  玄攻4					
x892112_wuhun_addImpact[3500] = 10695   --  玄攻5					
x892112_wuhun_addImpact[3600] = 10696   --  玄攻6					
x892112_wuhun_addImpact[3700] = 10697   --  玄攻7					
x892112_wuhun_addImpact[3800] = 10698   --  玄攻8					
x892112_wuhun_addImpact[4100] = 10699   --  毒攻1					
x892112_wuhun_addImpact[4200] = 10700   --  毒攻2					
x892112_wuhun_addImpact[4300] = 10701   --  毒攻3					
x892112_wuhun_addImpact[4400] = 10702   --  毒攻4					
x892112_wuhun_addImpact[4500] = 10703   --  毒攻5					
x892112_wuhun_addImpact[4600] = 10704   --  毒攻6					
x892112_wuhun_addImpact[4700] = 10705   --  毒攻7					
x892112_wuhun_addImpact[4800] = 10706   --  毒攻8					
x892112_wuhun_addImpact[5100] = 10707   --  冰抗1					
x892112_wuhun_addImpact[5200] = 10708   --  冰抗2					
x892112_wuhun_addImpact[5300] = 10709   --  冰抗3					
x892112_wuhun_addImpact[5400] = 10710   --  冰抗4					
x892112_wuhun_addImpact[5500] = 10711   --  冰抗5					
x892112_wuhun_addImpact[5600] = 10712   --  冰抗6					
x892112_wuhun_addImpact[5700] = 10713   --  冰抗7					
x892112_wuhun_addImpact[5800] = 10714   --  冰抗8					
x892112_wuhun_addImpact[6100] = 10715   --  火抗1					
x892112_wuhun_addImpact[6200] = 10716   --  火抗2					
x892112_wuhun_addImpact[6300] = 10717   --  火抗3					
x892112_wuhun_addImpact[6400] = 10718   --  火抗4					
x892112_wuhun_addImpact[6500] = 10719   --  火抗5					
x892112_wuhun_addImpact[6600] = 10720   --  火抗6					
x892112_wuhun_addImpact[6700] = 10721   --  火抗7					
x892112_wuhun_addImpact[6800] = 10722   --  火抗8					
x892112_wuhun_addImpact[7100] = 10723   --  玄抗1					
x892112_wuhun_addImpact[7200] = 10724   --  玄抗2					
x892112_wuhun_addImpact[7300] = 10725   --  玄抗3					
x892112_wuhun_addImpact[7400] = 10726   --  玄抗4					
x892112_wuhun_addImpact[7500] = 10727   --  玄抗5					
x892112_wuhun_addImpact[7600] = 10728   --  玄抗6					
x892112_wuhun_addImpact[7700] = 10729   --  玄抗7					
x892112_wuhun_addImpact[7800] = 10730   --  玄抗8					
x892112_wuhun_addImpact[8100] = 10731   --  毒抗1					
x892112_wuhun_addImpact[8200] = 10732   --  毒抗2					
x892112_wuhun_addImpact[8300] = 10733   --  毒抗3					
x892112_wuhun_addImpact[8400] = 10734   --  毒抗4					
x892112_wuhun_addImpact[8500] = 10735   --  毒抗5					
x892112_wuhun_addImpact[8600] = 10736   --  毒抗6					
x892112_wuhun_addImpact[8700] = 10737   --  毒抗7					
x892112_wuhun_addImpact[8800] = 10738   --  毒抗8					
x892112_wuhun_addImpact[9100] = 10739   --  减少冰1					
x892112_wuhun_addImpact[9200] = 10740   --  减少冰2					
x892112_wuhun_addImpact[9300] = 10741   --  减少冰3					
x892112_wuhun_addImpact[9400] = 10742   --  减少冰4					
x892112_wuhun_addImpact[9500] = 10743   --  减少冰5					
x892112_wuhun_addImpact[9600] = 10744   --  减少冰6					
x892112_wuhun_addImpact[9700] = 10745   --  减少冰7					
x892112_wuhun_addImpact[9800] = 10746   --  减少冰8					
x892112_wuhun_addImpact[10100] = 10747   --  减少火1					
x892112_wuhun_addImpact[10200] = 10748   --  减少火2					
x892112_wuhun_addImpact[10300] = 10749   --  减少火3					
x892112_wuhun_addImpact[10400] = 10750   --  减少火4					
x892112_wuhun_addImpact[10500] = 10751   --  减少火5					
x892112_wuhun_addImpact[10600] = 10752   --  减少火6					
x892112_wuhun_addImpact[10700] = 10753   --  减少火7					
x892112_wuhun_addImpact[10800] = 10754   --  减少火8					
x892112_wuhun_addImpact[11100] = 10755   --  减少玄1					
x892112_wuhun_addImpact[11200] = 10756   --  减少玄2					
x892112_wuhun_addImpact[11300] = 10757   --  减少玄3					
x892112_wuhun_addImpact[11400] = 10758   --  减少玄4					
x892112_wuhun_addImpact[11500] = 10759   --  减少玄5					
x892112_wuhun_addImpact[11600] = 10760   --  减少玄6					
x892112_wuhun_addImpact[11700] = 10761   --  减少玄7					
x892112_wuhun_addImpact[11800] = 10762   --  减少玄8					
x892112_wuhun_addImpact[12100] = 10763   --  减少毒1					
x892112_wuhun_addImpact[12200] = 10764   --  减少毒2					
x892112_wuhun_addImpact[12300] = 10765   --  减少毒3					
x892112_wuhun_addImpact[12400] = 10766   --  减少毒4					
x892112_wuhun_addImpact[12500] = 10767   --  减少毒5					
x892112_wuhun_addImpact[12600] = 10768   --  减少毒6					
x892112_wuhun_addImpact[12700] = 10769   --  减少毒7					
x892112_wuhun_addImpact[12800] = 10770   --  减少毒8					

x892112_skillstrtoid ={}

x892112_skillstrtoid["q1"] = 1361--清逸之魂（1级）
x892112_skillstrtoid["q2"] = 1362--清逸之魂（2级）
x892112_skillstrtoid["q3"] = 1363--清逸之魂（3级）
x892112_skillstrtoid["q4"] = 1364--清逸之魂（4级）
x892112_skillstrtoid["q5"] = 1365--清逸之魂（5级）
x892112_skillstrtoid["q6"] = 1366--清逸之魂（6级）
x892112_skillstrtoid["q7"] = 1652--清逸之魂（7级）
x892112_skillstrtoid["q8"] = 1653--清逸之魂（8级）
x892112_skillstrtoid["w1"] = 1367--寒锋之魂（1级）
x892112_skillstrtoid["w2"] = 1368--寒锋之魂（2级）
x892112_skillstrtoid["w3"] = 1369--寒锋之魂（3级）
x892112_skillstrtoid["w4"] = 1370--寒锋之魂（4级）
x892112_skillstrtoid["w5"] = 1371--寒锋之魂（5级）
x892112_skillstrtoid["w6"] = 1372--寒锋之魂（6级）
x892112_skillstrtoid["w7"] = 1654--寒锋之魂（7级）
x892112_skillstrtoid["w8"] = 1655--寒锋之魂（8级）
x892112_skillstrtoid["e1"] = 1373--武勇之魂（1级）
x892112_skillstrtoid["e2"] = 1374--武勇之魂（2级）
x892112_skillstrtoid["e3"] = 1375--武勇之魂（3级）
x892112_skillstrtoid["e4"] = 1376--武勇之魂（4级）
x892112_skillstrtoid["e5"] = 1377--武勇之魂（5级）
x892112_skillstrtoid["e6"] = 1378--武勇之魂（6级）
x892112_skillstrtoid["e7"] = 1656--武勇之魂（7级）
x892112_skillstrtoid["e8"] = 1657--武勇之魂（8级）
x892112_skillstrtoid["r1"] = 1379--御体之魂（1级）
x892112_skillstrtoid["r2"] = 1380--御体之魂（2级）
x892112_skillstrtoid["r3"] = 1381--御体之魂（3级）
x892112_skillstrtoid["r4"] = 1382--御体之魂（4级）
x892112_skillstrtoid["r5"] = 1383--御体之魂（5级）
x892112_skillstrtoid["r6"] = 1384--御体之魂（6级）
x892112_skillstrtoid["r7"] = 1658--御体之魂（7级）
x892112_skillstrtoid["r8"] = 1659--御体之魂（8级）
x892112_skillstrtoid["t1"] = 1385--游身之魂（1级）
x892112_skillstrtoid["t2"] = 1386--游身之魂（2级）
x892112_skillstrtoid["t3"] = 1387--游身之魂（3级）
x892112_skillstrtoid["t4"] = 1388--游身之魂（4级）
x892112_skillstrtoid["t5"] = 1389--游身之魂（5级）
x892112_skillstrtoid["t6"] = 1390--游身之魂（6级）
x892112_skillstrtoid["t7"] = 1660--游身之魂（7级）
x892112_skillstrtoid["t8"] = 1661--游身之魂（8级）
x892112_skillstrtoid["y1"] = 1391--尚武之魂（1级）
x892112_skillstrtoid["y2"] = 1392--尚武之魂（2级）
x892112_skillstrtoid["y3"] = 1393--尚武之魂（3级）
x892112_skillstrtoid["y4"] = 1394--尚武之魂（4级）
x892112_skillstrtoid["y5"] = 1395--尚武之魂（5级）
x892112_skillstrtoid["y6"] = 1396--尚武之魂（6级）
x892112_skillstrtoid["y7"] = 1662--尚武之魂（7级）
x892112_skillstrtoid["y8"] = 1663--尚武之魂（8级）
x892112_skillstrtoid["u1"] = 1397--乏力之魂（1级）
x892112_skillstrtoid["u2"] = 1398--乏力之魂（2级）
x892112_skillstrtoid["u3"] = 1399--乏力之魂（3级）
x892112_skillstrtoid["u4"] = 1400--乏力之魂（4级）
x892112_skillstrtoid["u5"] = 1401--乏力之魂（5级）
x892112_skillstrtoid["u6"] = 1402--乏力之魂（6级）
x892112_skillstrtoid["u7"] = 1664--乏力之魂（7级）
x892112_skillstrtoid["u8"] = 1665--乏力之魂（8级）
x892112_skillstrtoid["i1"] = 1403--灭灵之魂（1级）
x892112_skillstrtoid["i2"] = 1404--灭灵之魂（2级）
x892112_skillstrtoid["i3"] = 1405--灭灵之魂（3级）
x892112_skillstrtoid["i4"] = 1406--灭灵之魂（4级）
x892112_skillstrtoid["i5"] = 1407--灭灵之魂（5级）
x892112_skillstrtoid["i6"] = 1408--灭灵之魂（6级）
x892112_skillstrtoid["i7"] = 1666--灭灵之魂（7级）
x892112_skillstrtoid["i8"] = 1667--灭灵之魂（8级）
x892112_skillstrtoid["o1"] = 1409--破体之魂（1级）
x892112_skillstrtoid["o2"] = 1410--破体之魂（2级）
x892112_skillstrtoid["o3"] = 1411--破体之魂（3级）
x892112_skillstrtoid["o4"] = 1412--破体之魂（4级）
x892112_skillstrtoid["o5"] = 1413--破体之魂（5级）
x892112_skillstrtoid["o6"] = 1414--破体之魂（6级）
x892112_skillstrtoid["o7"] = 1668--破体之魂（7级）
x892112_skillstrtoid["o8"] = 1669--破体之魂（8级）
x892112_skillstrtoid["p1"] = 1415--乱定之魂（1级）
x892112_skillstrtoid["p2"] = 1416--乱定之魂（2级）
x892112_skillstrtoid["p3"] = 1417--乱定之魂（3级）
x892112_skillstrtoid["p4"] = 1418--乱定之魂（4级）
x892112_skillstrtoid["p5"] = 1419--乱定之魂（5级）
x892112_skillstrtoid["p6"] = 1420--乱定之魂（6级）
x892112_skillstrtoid["p7"] = 1670--乱定之魂（7级）
x892112_skillstrtoid["p8"] = 1671--乱定之魂（8级）
x892112_skillstrtoid["a1"] = 1421--重身之魂（1级）
x892112_skillstrtoid["a2"] = 1422--重身之魂（2级）
x892112_skillstrtoid["a3"] = 1423--重身之魂（3级）
x892112_skillstrtoid["a4"] = 1424--重身之魂（4级）
x892112_skillstrtoid["a5"] = 1425--重身之魂（5级）
x892112_skillstrtoid["a6"] = 1426--重身之魂（6级）
x892112_skillstrtoid["a7"] = 1672--重身之魂（7级）
x892112_skillstrtoid["a8"] = 1673--重身之魂（8级）
x892112_skillstrtoid["s1"] = 1427--绝情之魂（1级）
x892112_skillstrtoid["s2"] = 1428--绝情之魂（2级）
x892112_skillstrtoid["s3"] = 1429--绝情之魂（3级）
x892112_skillstrtoid["s4"] = 1430--绝情之魂（4级）
x892112_skillstrtoid["s5"] = 1431--绝情之魂（5级）
x892112_skillstrtoid["s6"] = 1432--绝情之魂（6级）
x892112_skillstrtoid["s7"] = 1674--绝情之魂（7级）
x892112_skillstrtoid["s8"] = 1675--绝情之魂（8级）
x892112_skillstrtoid["d1"] = 1433--厉刚之魂（1级）
x892112_skillstrtoid["d2"] = 1434--厉刚之魂（2级）
x892112_skillstrtoid["d3"] = 1435--厉刚之魂（3级）
x892112_skillstrtoid["d4"] = 1436--厉刚之魂（4级）
x892112_skillstrtoid["d5"] = 1437--厉刚之魂（5级）
x892112_skillstrtoid["d6"] = 1438--厉刚之魂（6级）
x892112_skillstrtoid["d7"] = 1676--厉刚之魂（7级）
x892112_skillstrtoid["d8"] = 1677--厉刚之魂（8级）
x892112_skillstrtoid["f1"] = 1439--旋柔之魂（1级）
x892112_skillstrtoid["f2"] = 1440--旋柔之魂（2级）
x892112_skillstrtoid["f3"] = 1441--旋柔之魂（3级）
x892112_skillstrtoid["f4"] = 1442--旋柔之魂（4级）
x892112_skillstrtoid["f5"] = 1443--旋柔之魂（5级）
x892112_skillstrtoid["f6"] = 1444--旋柔之魂（6级）
x892112_skillstrtoid["f7"] = 1678--旋柔之魂（7级）
x892112_skillstrtoid["f8"] = 1679--旋柔之魂（8级）
x892112_skillstrtoid["g1"] = 1445--武韧之魂（1级）
x892112_skillstrtoid["g2"] = 1446--武韧之魂（2级）
x892112_skillstrtoid["g3"] = 1447--武韧之魂（3级）
x892112_skillstrtoid["g4"] = 1448--武韧之魂（4级）
x892112_skillstrtoid["g5"] = 1449--武韧之魂（5级）
x892112_skillstrtoid["g6"] = 1450--武韧之魂（6级）
x892112_skillstrtoid["g7"] = 1680--武韧之魂（7级）
x892112_skillstrtoid["g8"] = 1681--武韧之魂（8级）
x892112_skillstrtoid["h1"] = 1451--阴绵之魂（1级）
x892112_skillstrtoid["h2"] = 1452--阴绵之魂（2级）
x892112_skillstrtoid["h3"] = 1453--阴绵之魂（3级）
x892112_skillstrtoid["h4"] = 1454--阴绵之魂（4级）
x892112_skillstrtoid["h5"] = 1455--阴绵之魂（5级）
x892112_skillstrtoid["h6"] = 1456--阴绵之魂（6级）
x892112_skillstrtoid["h7"] = 1682--阴绵之魂（7级）
x892112_skillstrtoid["h8"] = 1683--阴绵之魂（8级）
x892112_skillstrtoid["j1"] = 1457--星准之魂（1级）
x892112_skillstrtoid["j2"] = 1458--星准之魂（2级）
x892112_skillstrtoid["j3"] = 1459--星准之魂（3级）
x892112_skillstrtoid["j4"] = 1460--星准之魂（4级）
x892112_skillstrtoid["j5"] = 1461--星准之魂（5级）
x892112_skillstrtoid["j6"] = 1462--星准之魂（6级）
x892112_skillstrtoid["j7"] = 1684--星准之魂（7级）
x892112_skillstrtoid["j8"] = 1685--星准之魂（8级）
x892112_skillstrtoid["k1"] = 1463--灵洒之魂（1级）
x892112_skillstrtoid["k2"] = 1464--灵洒之魂（2级）
x892112_skillstrtoid["k3"] = 1465--灵洒之魂（3级）
x892112_skillstrtoid["k4"] = 1466--灵洒之魂（4级）
x892112_skillstrtoid["k5"] = 1467--灵洒之魂（5级）
x892112_skillstrtoid["k6"] = 1468--灵洒之魂（6级）
x892112_skillstrtoid["k7"] = 1686--灵洒之魂（7级）
x892112_skillstrtoid["k8"] = 1687--灵洒之魂（8级）
x892112_skillstrtoid["l1"] = 1469--断刚之魂（1级）
x892112_skillstrtoid["l2"] = 1470--断刚之魂（2级）
x892112_skillstrtoid["l3"] = 1471--断刚之魂（3级）
x892112_skillstrtoid["l4"] = 1472--断刚之魂（4级）
x892112_skillstrtoid["l5"] = 1473--断刚之魂（5级）
x892112_skillstrtoid["l6"] = 1474--断刚之魂（6级）
x892112_skillstrtoid["l7"] = 1688--断刚之魂（7级）
x892112_skillstrtoid["l8"] = 1689--断刚之魂（8级）
x892112_skillstrtoid["z1"] = 1475--裂柔之魂（1级）
x892112_skillstrtoid["z2"] = 1476--裂柔之魂（2级）
x892112_skillstrtoid["z3"] = 1477--裂柔之魂（3级）
x892112_skillstrtoid["z4"] = 1478--裂柔之魂（4级）
x892112_skillstrtoid["z5"] = 1479--裂柔之魂（5级）
x892112_skillstrtoid["z6"] = 1480--裂柔之魂（6级）
x892112_skillstrtoid["z7"] = 1690--裂柔之魂（7级）
x892112_skillstrtoid["z8"] = 1691--裂柔之魂（8级）
x892112_skillstrtoid["x1"] = 1481--黯韧之魂（1级）
x892112_skillstrtoid["x2"] = 1482--黯韧之魂（2级）
x892112_skillstrtoid["x3"] = 1483--黯韧之魂（3级）
x892112_skillstrtoid["x4"] = 1484--黯韧之魂（4级）
x892112_skillstrtoid["x5"] = 1485--黯韧之魂（5级）
x892112_skillstrtoid["x6"] = 1486--黯韧之魂（6级）
x892112_skillstrtoid["x7"] = 1692--黯韧之魂（7级）
x892112_skillstrtoid["x8"] = 1693--黯韧之魂（8级）
x892112_skillstrtoid["c1"] = 1487--刺绵之魂（1级）
x892112_skillstrtoid["c2"] = 1488--刺绵之魂（2级）
x892112_skillstrtoid["c3"] = 1489--刺绵之魂（3级）
x892112_skillstrtoid["c4"] = 1490--刺绵之魂（4级）
x892112_skillstrtoid["c5"] = 1491--刺绵之魂（5级）
x892112_skillstrtoid["c6"] = 1492--刺绵之魂（6级）
x892112_skillstrtoid["c7"] = 1694--刺绵之魂（7级）
x892112_skillstrtoid["c8"] = 1695--刺绵之魂（8级）
x892112_skillstrtoid["v1"] = 1493--扰准之魂（1级）
x892112_skillstrtoid["v2"] = 1494--扰准之魂（2级）
x892112_skillstrtoid["v3"] = 1495--扰准之魂（3级）
x892112_skillstrtoid["v4"] = 1496--扰准之魂（4级）
x892112_skillstrtoid["v5"] = 1497--扰准之魂（5级）
x892112_skillstrtoid["v6"] = 1498--扰准之魂（6级）
x892112_skillstrtoid["v7"] = 1696--扰准之魂（7级）
x892112_skillstrtoid["v8"] = 1697--扰准之魂（8级）
x892112_skillstrtoid["b1"] = 1499--绝洒之魂（1级）
x892112_skillstrtoid["b2"] = 1500--绝洒之魂（2级）
x892112_skillstrtoid["b3"] = 1501--绝洒之魂（3级）
x892112_skillstrtoid["b4"] = 1502--绝洒之魂（4级）
x892112_skillstrtoid["b5"] = 1503--绝洒之魂（5级）
x892112_skillstrtoid["b6"] = 1504--绝洒之魂（6级）
x892112_skillstrtoid["b7"] = 1698--绝洒之魂（7级）
x892112_skillstrtoid["b8"] = 1699--绝洒之魂（8级）
x892112_skillstrtoid["n1"] = 1505--强击之魂（1级）
x892112_skillstrtoid["n2"] = 1506--强击之魂（2级）
x892112_skillstrtoid["n3"] = 1507--强击之魂（3级）
x892112_skillstrtoid["n4"] = 1508--强击之魂（4级）
x892112_skillstrtoid["n5"] = 1509--强击之魂（5级）
x892112_skillstrtoid["n6"] = 1510--强击之魂（6级）
x892112_skillstrtoid["n7"] = 1700--强击之魂（7级）
x892112_skillstrtoid["n8"] = 1701--强击之魂（8级）
x892112_skillstrtoid["m1"] = 1511--绝气之魂（1级）
x892112_skillstrtoid["m2"] = 1512--绝气之魂（2级）
x892112_skillstrtoid["m3"] = 1513--绝气之魂（3级）
x892112_skillstrtoid["m4"] = 1514--绝气之魂（4级）
x892112_skillstrtoid["m5"] = 1515--绝气之魂（5级）
x892112_skillstrtoid["m6"] = 1516--绝气之魂（6级）
x892112_skillstrtoid["m7"] = 1702--绝气之魂（7级）
x892112_skillstrtoid["m8"] = 1703--绝气之魂（8级）
x892112_skillstrtoid["Q1"] = 1517--灭世八方（1级）
x892112_skillstrtoid["Q2"] = 1518--灭世八方（2级）
x892112_skillstrtoid["Q3"] = 1519--灭世八方（3级）
x892112_skillstrtoid["Q4"] = 1520--灭世八方（4级）
x892112_skillstrtoid["Q5"] = 1521--灭世八方（5级）
x892112_skillstrtoid["Q6"] = 1522--灭世八方（6级）
x892112_skillstrtoid["Q7"] = 1704--灭世八方（7级）
x892112_skillstrtoid["Q8"] = 1705--灭世八方（8级）
x892112_skillstrtoid["W1"] = 1523--绝境散杀（1级）
x892112_skillstrtoid["W2"] = 1524--绝境散杀（2级）
x892112_skillstrtoid["W3"] = 1525--绝境散杀（3级）
x892112_skillstrtoid["W4"] = 1526--绝境散杀（4级）
x892112_skillstrtoid["W5"] = 1527--绝境散杀（5级）
x892112_skillstrtoid["W6"] = 1528--绝境散杀（6级）
x892112_skillstrtoid["W7"] = 1706--绝境散杀（7级）
x892112_skillstrtoid["W8"] = 1707--绝境散杀（8级）
x892112_skillstrtoid["E1"] = 1529--冰封万里（1级）
x892112_skillstrtoid["E2"] = 1530--冰封万里（2级）
x892112_skillstrtoid["E3"] = 1531--冰封万里（3级）
x892112_skillstrtoid["E4"] = 1532--冰封万里（4级）
x892112_skillstrtoid["E5"] = 1533--冰封万里（5级）
x892112_skillstrtoid["E6"] = 1534--冰封万里（6级）
x892112_skillstrtoid["E7"] = 1708--冰封万里（7级）
x892112_skillstrtoid["E8"] = 1709--冰封万里（8级）
x892112_skillstrtoid["R1"] = 1535--天火燎原（1级）
x892112_skillstrtoid["R2"] = 1536--天火燎原（2级）
x892112_skillstrtoid["R3"] = 1537--天火燎原（3级）
x892112_skillstrtoid["R4"] = 1538--天火燎原（4级）
x892112_skillstrtoid["R5"] = 1539--天火燎原（5级）
x892112_skillstrtoid["R6"] = 1540--天火燎原（6级）
x892112_skillstrtoid["R7"] = 1710--天火燎原（7级）
x892112_skillstrtoid["R8"] = 1711--天火燎原（8级）
x892112_skillstrtoid["T1"] = 1541--狂雷天降（1级）
x892112_skillstrtoid["T2"] = 1542--狂雷天降（2级）
x892112_skillstrtoid["T3"] = 1543--狂雷天降（3级）
x892112_skillstrtoid["T4"] = 1544--狂雷天降（4级）
x892112_skillstrtoid["T5"] = 1545--狂雷天降（5级）
x892112_skillstrtoid["T6"] = 1546--狂雷天降（6级）
x892112_skillstrtoid["T7"] = 1712--狂雷天降（7级）
x892112_skillstrtoid["T8"] = 1713--狂雷天降（8级）
x892112_skillstrtoid["Y1"] = 1547--剧毒瘟疫（1级）
x892112_skillstrtoid["Y2"] = 1548--剧毒瘟疫（2级）
x892112_skillstrtoid["Y3"] = 1549--剧毒瘟疫（3级）
x892112_skillstrtoid["Y4"] = 1550--剧毒瘟疫（4级）
x892112_skillstrtoid["Y5"] = 1551--剧毒瘟疫（5级）
x892112_skillstrtoid["Y6"] = 1552--剧毒瘟疫（6级）
x892112_skillstrtoid["Y7"] = 1714--剧毒瘟疫（7级）
x892112_skillstrtoid["Y8"] = 1715--剧毒瘟疫（8级）
x892112_skillstrtoid["U1"] = 1553--怒涛连击（1级）
x892112_skillstrtoid["U2"] = 1554--怒涛连击（2级）
x892112_skillstrtoid["U3"] = 1555--怒涛连击（3级）
x892112_skillstrtoid["U4"] = 1556--怒涛连击（4级）
x892112_skillstrtoid["U5"] = 1557--怒涛连击（5级）
x892112_skillstrtoid["U6"] = 1558--怒涛连击（6级）
x892112_skillstrtoid["U7"] = 1716--怒涛连击（7级）
x892112_skillstrtoid["U8"] = 1717--怒涛连击（8级）
x892112_skillstrtoid["I1"] = 1559--刚猛重击（1级）
x892112_skillstrtoid["I2"] = 1560--刚猛重击（2级）
x892112_skillstrtoid["I3"] = 1561--刚猛重击（3级）
x892112_skillstrtoid["I4"] = 1562--刚猛重击（4级）
x892112_skillstrtoid["I5"] = 1563--刚猛重击（5级）
x892112_skillstrtoid["I6"] = 1564--刚猛重击（6级）
x892112_skillstrtoid["I7"] = 1718--刚猛重击（7级）
x892112_skillstrtoid["I8"] = 1719--刚猛重击（8级）
x892112_skillstrtoid["O1"] = 1565--柔蛇突袭（1级）
x892112_skillstrtoid["O2"] = 1566--柔蛇突袭（2级）
x892112_skillstrtoid["O3"] = 1567--柔蛇突袭（3级）
x892112_skillstrtoid["O4"] = 1568--柔蛇突袭（4级）
x892112_skillstrtoid["O5"] = 1569--柔蛇突袭（5级）
x892112_skillstrtoid["O6"] = 1570--柔蛇突袭（6级）
x892112_skillstrtoid["O7"] = 1720--柔蛇突袭（7级）
x892112_skillstrtoid["O8"] = 1721--柔蛇突袭（8级）
x892112_skillstrtoid["P1"] = 1571--寒冰穿刺（1级）
x892112_skillstrtoid["P2"] = 1572--寒冰穿刺（2级）
x892112_skillstrtoid["P3"] = 1573--寒冰穿刺（3级）
x892112_skillstrtoid["P4"] = 1574--寒冰穿刺（4级）
x892112_skillstrtoid["P5"] = 1575--寒冰穿刺（5级）
x892112_skillstrtoid["P6"] = 1576--寒冰穿刺（6级）
x892112_skillstrtoid["P7"] = 1722--寒冰穿刺（7级）
x892112_skillstrtoid["P8"] = 1723--寒冰穿刺（8级）
x892112_skillstrtoid["A1"] = 1577--烈焰灼身（1级）
x892112_skillstrtoid["A2"] = 1578--烈焰灼身（2级）
x892112_skillstrtoid["A3"] = 1579--烈焰灼身（3级）
x892112_skillstrtoid["A4"] = 1580--烈焰灼身（4级）
x892112_skillstrtoid["A5"] = 1581--烈焰灼身（5级）
x892112_skillstrtoid["A6"] = 1582--烈焰灼身（6级）
x892112_skillstrtoid["A7"] = 1724--烈焰灼身（7级）
x892112_skillstrtoid["A8"] = 1725--烈焰灼身（8级）
x892112_skillstrtoid["S1"] = 1583--天雷轰顶（1级）
x892112_skillstrtoid["S2"] = 1584--天雷轰顶（2级）
x892112_skillstrtoid["S3"] = 1585--天雷轰顶（3级）
x892112_skillstrtoid["S4"] = 1586--天雷轰顶（4级）
x892112_skillstrtoid["S5"] = 1587--天雷轰顶（5级）
x892112_skillstrtoid["S6"] = 1588--天雷轰顶（6级）
x892112_skillstrtoid["S7"] = 1726--天雷轰顶（7级）
x892112_skillstrtoid["S8"] = 1727--天雷轰顶（8级）
x892112_skillstrtoid["D1"] = 1589--雾腐蚀毒（1级）
x892112_skillstrtoid["D2"] = 1590--雾腐蚀毒（2级）
x892112_skillstrtoid["D3"] = 1591--雾腐蚀毒（3级）
x892112_skillstrtoid["D4"] = 1592--雾腐蚀毒（4级）
x892112_skillstrtoid["D5"] = 1593--雾腐蚀毒（5级）
x892112_skillstrtoid["D6"] = 1594--雾腐蚀毒（6级）
x892112_skillstrtoid["D7"] = 1728--雾腐蚀毒（7级）
x892112_skillstrtoid["D8"] = 1729--雾腐蚀毒（8级）
x892112_skillstrtoid["F1"] = 1595--雷霆猛击（1级）
x892112_skillstrtoid["F2"] = 1596--雷霆猛击（2级）
x892112_skillstrtoid["F3"] = 1597--雷霆猛击（3级）
x892112_skillstrtoid["F4"] = 1598--雷霆猛击（4级）
x892112_skillstrtoid["F5"] = 1599--雷霆猛击（5级）
x892112_skillstrtoid["F6"] = 1600--雷霆猛击（6级）
x892112_skillstrtoid["F7"] = 1730--雷霆猛击（7级）
x892112_skillstrtoid["F8"] = 1731--雷霆猛击（8级）






x892101_iTextkkp = {
["q1"]={"冰攻击","(1)级","+30",10675},
["q2"]={"冰攻击","(2)级","+60",10676},
["q3"]={"冰攻击","(3)级","+90",10677},
["q4"]={"冰攻击","(4)级","+120",10678},
["q5"]={"冰攻击","(5)级","+150",10679},
["q6"]={"冰攻击","(6)级","+180",10680},
["q7"]={"冰攻击","(7)级","+210",10681},
["q8"]={"冰攻击","(8)级","+240",10682},

["w1"]={"火攻击","(1)级","+30",10683},
["w2"]={"火攻击","(2)级","+60",10684},
["w3"]={"火攻击","(3)级","+90",10685},
["w4"]={"火攻击","(4)级","+120",10686},
["w5"]={"火攻击","(5)级","+150",10687},
["w6"]={"火攻击","(6)级","+180",10688},
["w7"]={"火攻击","(7)级","+210",10689},
["w8"]={"火攻击","(8)级","+240",10690},

["e1"]={"玄攻击","(1)级","+30",10691},
["e2"]={"玄攻击","(2)级","+60",10692},
["e3"]={"玄攻击","(3)级","+90",10693},
["e4"]={"玄攻击","(4)级","+120",10694},
["e5"]={"玄攻击","(5)级","+150",10695},
["e6"]={"玄攻击","(6)级","+180",10696},
["e7"]={"玄攻击","(7)级","+21",10697},
["e8"]={"玄攻击","(8)级","+240",10698},

["r1"]={"毒攻击","(1)级","+30",10699},
["r2"]={"毒攻击","(2)级","+60",10700},
["r3"]={"毒攻击","(3)级","+90",10701},
["r4"]={"毒攻击","(4)级","+120",10702},
["r5"]={"毒攻击","(5)级","+150",10703},
["r6"]={"毒攻击","(6)级","+180",10704},
["r7"]={"毒攻击","(7)级","+210",10705},
["r8"]={"毒攻击","(8)级","+240",10706},

["t1"]={"冰抗性","(1)级","+10",10707},
["t2"]={"冰抗性","(2)级","+20",10708},
["t3"]={"冰抗性","(3)级","+30",10709},
["t4"]={"冰抗性","(4)级","+40",10710},
["t5"]={"冰抗性","(5)级","+50",10711},
["t6"]={"冰抗性","(6)级","+60",10712},
["t7"]={"冰抗性","(7)级","+70",10713},
["t8"]={"冰抗性","(8)级","+80",10714},

["y1"]={"火抗性","(1)级","+10",10715},
["y2"]={"火抗性","(2)级","+20",10716},
["y3"]={"火抗性","(3)级","+30",10717},
["y4"]={"火抗性","(4)级","+40",10718},
["y5"]={"火抗性","(5)级","+50",10719},
["y6"]={"火抗性","(6)级","+60",10720},
["y7"]={"火抗性","(7)级","+70",10721},
["y8"]={"火抗性","(8)级","+80",10722},

["u1"]={"玄抗性","(1)级","+10",10723},
["u2"]={"玄抗性","(2)级","+20",10724},
["u3"]={"玄抗性","(3)级","+30",10725},
["u4"]={"玄抗性","(4)级","+40",10726},
["u5"]={"玄抗性","(5)级","+50",10727},
["u6"]={"玄抗性","(6)级","+60",10728},
["u7"]={"玄抗性","(7)级","+70",10729},
["u8"]={"玄抗性","(8)级","+80",10730},

["i1"]={"毒抗性","(1)级","+10",10731},
["i2"]={"毒抗性","(2)级","+20",10732},
["i3"]={"毒抗性","(3)级","+30",10733},
["i4"]={"毒抗性","(4)级","+40",10734},
["i5"]={"毒抗性","(5)级","+50",10735},
["i6"]={"毒抗性","(6)级","+60",10736},
["i7"]={"毒抗性","(7)级","+70",10737},
["i8"]={"毒抗性","(8)级","+80",10738},

["o1"]={"忽略目标冰抗","(1)级","+10",10739},
["o2"]={"忽略目标冰抗","(2)级","+20",10740},
["o3"]={"忽略目标冰抗","(3)级","+30",10741},
["o4"]={"忽略目标冰抗","(4)级","+40",10742},
["o5"]={"忽略目标冰抗","(5)级","+50",10743},
["o6"]={"忽略目标冰抗","(6)级","+60",10744},
["o7"]={"忽略目标冰抗","(7)级","+70",10745},
["o8"]={"忽略目标冰抗","(8)级","+80",10746},

["p1"]={"忽略目标火抗","(1)级","+10",10747},
["p2"]={"忽略目标火抗","(2)级","+20",10748},
["p3"]={"忽略目标火抗","(3)级","+30",10749},
["p4"]={"忽略目标火抗","(4)级","+40",10750},
["p5"]={"忽略目标火抗","(5)级","+50",10751},
["p6"]={"忽略目标火抗","(6)级","+60",10752},
["p7"]={"忽略目标火抗","(7)级","+70",10753},
["p8"]={"忽略目标火抗","(8)级","+80",10754},

["a1"]={"忽略目标玄抗","(1)级","+10",10755},
["a2"]={"忽略目标玄抗","(2)级","+20",10756},
["a3"]={"忽略目标玄抗","(3)级","+30",10757},
["a4"]={"忽略目标玄抗","(4)级","+40",10758},
["a5"]={"忽略目标玄抗","(5)级","+50",10759},
["a6"]={"忽略目标玄抗","(6)级","+60",10760},
["a7"]={"忽略目标玄抗","(7)级","+70",10761},
["a8"]={"忽略目标玄抗","(8)级","+80",10762},

["s1"]={"忽略目标毒抗","(1)级","+10",10763},
["s2"]={"忽略目标毒抗","(2)级","+20",10764},
["s3"]={"忽略目标毒抗","(3)级","+30",10765},
["s4"]={"忽略目标毒抗","(4)级","+40",10766},
["s5"]={"忽略目标毒抗","(5)级","+50",10767},
["s6"]={"忽略目标毒抗","(6)级","+60",10768},
["s7"]={"忽略目标毒抗","(7)级","+70",10769},
["s8"]={"忽略目标毒抗","(8)级","+80",10770},

["d1"]={"降低目标冰抗下限","(1)级","+10",10770},
["d2"]={"降低目标冰抗下限","(2)级","+20",10770},
["d3"]={"降低目标冰抗下限","(3)级","+30",10770},
["d4"]={"降低目标冰抗下限","(4)级","+40",10770},
["d5"]={"降低目标冰抗下限","(5)级","+50",10770},
["d6"]={"降低目标冰抗下限","(6)级","+60",10770},
["d7"]={"降低目标冰抗下限","(7)级","+70",10770},
["d8"]={"降低目标冰抗下限","(8)级","+80",10770},

["f1"]={"降低目标火抗下限","(1)级","+10",10770},
["f2"]={"降低目标火抗下限","(2)级","+20",10770},
["f3"]={"降低目标火抗下限","(3)级","+30",10770},
["f4"]={"降低目标火抗下限","(4)级","+40",10770},
["f5"]={"降低目标火抗下限","(5)级","+50",10770},
["f6"]={"降低目标火抗下限","(6)级","+60",10770},
["f7"]={"降低目标火抗下限","(7)级","+70",10770},
["f8"]={"降低目标火抗下限","(8)级","+80",10770},

["g1"]={"降低目标玄抗下限","(1)级","+10",10770},
["g2"]={"降低目标玄抗下限","(2)级","+20",10770},
["g3"]={"降低目标玄抗下限","(3)级","+30",10770},
["g4"]={"降低目标玄抗下限","(4)级","+40",10770},
["g5"]={"降低目标玄抗下限","(5)级","+50",10770},
["g6"]={"降低目标玄抗下限","(6)级","+60",10770},
["g7"]={"降低目标玄抗下限","(7)级","+70",10770},
["g8"]={"降低目标玄抗下限","(8)级","+80",10770},

["h1"]={"降低目标毒抗下限","(1)级","+10",10770},
["h2"]={"降低目标毒抗下限","(2)级","+20",10770},
["h3"]={"降低目标毒抗下限","(3)级","+30",10770},
["h4"]={"降低目标毒抗下限","(4)级","+40",10770},
["h5"]={"降低目标毒抗下限","(5)级","+50",10770},
["h6"]={"降低目标毒抗下限","(6)级","+60",10770},
["h7"]={"降低目标毒抗下限","(7)级","+70",10770},
["h8"]={"降低目标毒抗下限","(8)级","+80",10770},
  
}



--属性定义1-4 冰、火、玄、毒攻  5-8 冰、火、玄、毒抗  9-12 冰、火、玄、毒减抗
--BUFF表调用规则，正和反如果有就加状态。如果是零就清除状态
function x892112_wuhunAddImpact(sceneId, selfId)
--x892112_wuhun(sceneId, selfId)

if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 28988) == 1 then
--x892112_NotifyTip( sceneId, selfId, "aes")
LuaFnCancelSpecificImpact(sceneId,selfId,28988)
end 
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,28988) ~= 1 then 
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 28988, 0);
end

x892112_wuhun(sceneId, selfId,0)
return 1--,x892112_NotifyTip( sceneId, selfId, ""..adds[1].."|"..adds[2].."|"..adds[3].."|"..adds[4].."" )--x892112_wuhun_addImpact,x892112_NotifyTip( sceneId, selfId, "OK" )
end
--*************************************************************
--武魂加状态
--*************************************************************
function x892112_wuhun(sceneId, selfId,pos)
--local friendName = "_g100000000000000"
--LuaFnSetItemCreator(sceneId, selfId, pos, friendName);
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 11923, 0);
local skieoseidk = GetMissionData( sceneId, selfId, x892112_misssuxingandjinen[getn(x892112_misssuxingandjinen)])
local skieios = {floor(skieoseidk/1000000)+1000,floor(mod(skieoseidk,1000000)/1000)+1000,mod(skieoseidk,1000)+1000}
for i = 1,3 do
if skieios[i] > 0 and skieios[i] ~= 1000 then
if HaveSkill( sceneId, selfId,skieios[i]) == 1 then
   DelSkill( sceneId, selfId,skieios[i])
end
end
end    
for i = 1,getn(x892112_misssuxingandjinen) do
SetMissionData( sceneId, selfId, x892112_misssuxingandjinen[i],0 )
end
SetMissionData( sceneId, selfId, x892112_missFeiKoZhan,0)
SetMissionData( sceneId, selfId, x892112_missFeiKoZhan0,0)
---------------------------------------新改的，无规则随便先学什么扩展binge----------------------------
local nwhum,leiwh = x892112_wuhunSXlist(sceneId, selfId,pos)

if nwhum == 0 then
x892112_DelBagWuHunParam(sceneId, selfId)
SetBagItemParam( sceneId, selfId, pos, 7, 1,10)
SetMissionFlag(sceneId, selfId, MF_WuHun_OpenUI, 1)
SetCharacterTimer( sceneId, selfId, 0 )
SetCharacterTimer( sceneId, selfId, 5 )
CallScriptFunction( 300089, "AddJiaYingSuXing", sceneId, selfId)
return
end

local key = {}
local alis,numadd,jisu = 0,0,0,0
for i = 1,16 do
if i <= 4 then
if leiwh[i] ~= nil and leiwh[i] > 0 then
numadd = numadd+1
if numadd == 2 then
jisu = jisu+1
key[jisu] = tonumber(alis.. leiwh[i])
numadd = 0
end
alis = leiwh[i]
end
if i == 4 then
if numadd == 1 then
jisu = jisu+1
key[jisu] = alis
numadd = 0
alis = 0
end
end
end

if i >= 5 and i<=8 then
if leiwh[i] ~= nil and leiwh[i] > 0 then
numadd = numadd+1
if numadd == 2 then
jisu = jisu+1
key[jisu] = tonumber(alis.. leiwh[i])
numadd = 0
end
alis = leiwh[i]
end
if i == 8 then
if numadd == 1 then
jisu = jisu+1
key[jisu] = alis
numadd = 0
alis = 0
end
end
end

if i >= 9 and i<=12 then
if leiwh[i] ~= nil and leiwh[i] > 0 then
numadd = numadd+1
if numadd == 2 then
jisu = jisu+1
key[jisu] = tonumber(alis.. leiwh[i])
numadd = 0
end
alis = leiwh[i]
end
if i == 12 then
if numadd == 1 then
jisu = jisu+1
key[jisu] = alis
numadd = 0
alis = 0
end
end
end

if i >= 13 and i<=16 then
if leiwh[i] ~= nil and leiwh[i] > 0 then
numadd = numadd+1
if numadd == 2 then
jisu = jisu+1
key[jisu] = tonumber(alis.. leiwh[i])
numadd = 0
end
alis = leiwh[i]
end
if i == 16 then
if numadd == 1 then
jisu = jisu+1
key[jisu] = alis
numadd = 0
alis = 0
end
end
end

end



for i = 1,getn(key) do
if key[i] ~= nil then
if key[i] > 0 then
if x892112_wuhun_addImpact[key[i]] ~= nil then
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,x892112_wuhun_addImpact[key[i]]) ~= 1 then 
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x892112_wuhun_addImpact[key[i]], 0);
end
end
end
end
end
---------------------------------------新改的，无规则随便先学什么扩展end----------------------------

local isok,skillbiao = x892112_wuhunskillslist(sceneId, selfId,pos)
local skillvalue = 0
local cengsu = 1000000
if isok == 1 then
for i = 1,3 do
if skillbiao[i] > 0 then
if HaveSkill(sceneId, selfId,skillbiao[i])~= 1 then
AddSkill(sceneId, selfId,skillbiao[i])
end
if i == 1 then
cengsu = 1000000
elseif  i == 2 then
cengsu = 1000
else
cengsu = 1
end
skillvalue = skillvalue + (mod(skillbiao[i],1000))*cengsu
end
end
end
if skillvalue > 0 then
SetMissionData( sceneId, selfId, x892112_misssuxingandjinen[getn(x892112_misssuxingandjinen)],skillvalue )
end


x892112_DelBagWuHunParam(sceneId, selfId)
SetBagItemParam( sceneId, selfId, pos, 7, 1,10)
SetMissionFlag(sceneId, selfId, MF_WuHun_OpenUI, 1)
SetCharacterTimer( sceneId, selfId, 0 )
SetCharacterTimer( sceneId, selfId, 5 )
--x892112_opwuhun( sceneId, selfId)
CallScriptFunction( 300089, "AddJiaYingSuXing", sceneId, selfId)
end
--*************************************************************
--删除武魂记录数据
--*************************************************************
function x892112_DelBagWuHunParam(sceneId, selfId)
local WuHunItemID,itemid2 = 0,0
for i = 0,29 do
WuHunItemID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )
itemid2 = GetBagItemParam( sceneId, selfId, i, 7, 1)
if WuHunItemID >= 10156098 and WuHunItemID >=10156129  then
if GetItemEquipPoint(WuHunItemID) == 10 and itemid2 == 10 then
SetBagItemParam( sceneId, selfId, i, 7, 1,0)  
end
end 
end

end
--*************************************************************
--武魂技能列表
--*************************************************************
function x892112_wuhunskillslist(sceneId, selfId,pos)
if pos < 0 or pos > 29 then
pos = 0
end
local _,skilstring = LuaFnGetItemCreator(sceneId, selfId, pos) --"_a1b1c2d2e2f3g4i3"
if skilstring == nil then
return 0
end
--local long =     strlen(skilstring)
local skilx,skilz = strfind(skilstring,"_")
if skilx == nil or skilz == nil then
return 0
end
local skilstring = strsub(skilstring,skilx+17,skilx+22)
if skilstring == nil then
return 0
end

local skillei = {}
local skilstring1
for  i = 1,3 do
skilstring1 = strsub(skilstring,(i-1)*2+1,(i-1)*2+2)
if skilstring1 ~= nil and skilstring1 ~= "" then
local skilwuhunaddnm = x892112_skillstrtoid[skilstring1]
if skilwuhunaddnm == nil then
skilwuhunaddnm = 0
end
skillei[i] = skilwuhunaddnm
else
skillei[i] = 0
end

end


return 1,skillei
end
--*************************************************************
--武魂技能条数检测
--*************************************************************
function x892112_wuhunskillsCheck(sceneId, selfId,pos)
local num,leiCh = x892112_wuhunskillslist(sceneId, selfId,pos)
if num == 0 then
return 0
end
local yxuexisuxing = 0
for i = 1,3 do
if leiCh[i] > 0 then
yxuexisuxing = yxuexisuxing + 1
end
end



return yxuexisuxing
end
--*************************************************************
--武魂属性条数检测
--*************************************************************
function x892112_wuhunSuXingCheck(sceneId, selfId,pos)

if pos < 0 or pos > 29 then
pos = 0
end

local isokn,zzstring = x892112_wuhunSXlist(sceneId, selfId,pos)
if isokn == 0 then

return 0
end

local yxuexisuxing = 0
if zzstring ~= nil then
for i =1,getn(zzstring) do
if zzstring[i] > 0 then
yxuexisuxing = yxuexisuxing+1
end
end
end

return yxuexisuxing

end
--*************************************************************
--武魂所学属性列表
--*************************************************************
function x892112_wuhunSXlist(sceneId, selfId,pos)
if pos < 0 or pos > 29 then
pos = 0
end
local _,zzstring = LuaFnGetItemCreator(sceneId, selfId, pos) --"_a1b1c2d2e2f3g4i3"
if zzstring == nil then
return 0
end
--local long =     strlen(zzstring)
local x,z = strfind(zzstring,"_")
if x == nil or z == nil then
return 0
end

local string = strsub(zzstring,x,x+16)
if string == nil then
return 0
end
local liststr = {"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h"}



local FeiKoZhanstring = strsub(zzstring,z+23)
local strsebht1,strsebht2,strsebht3
if nil ~= FeiKoZhanstring then
strsebht1 = strsub(FeiKoZhanstring,1,4)
strsebht2 = strsub(FeiKoZhanstring,5,5)
strsebht3 = strsub(FeiKoZhanstring,6,9)
local Levelstrideg = x892112_WuhunSuxing[strsebht2]
if nil == Levelstrideg then
Levelstrideg = "0"
end
if nil == strsebht1 then
strsebht1 = "0"
end
if nil == strsebht3 then
strsebht3 = "0"
end
local savedata = tonumber(Levelstrideg..strsebht3)
if savedata == nil then
savedata = 0
end
local savedata2 = tonumber(strsebht1)
if savedata2 == nil then
savedata2 = 0
end
SetMissionData( sceneId, selfId, x892112_missFeiKoZhan,savedata2)
SetMissionData( sceneId, selfId, x892112_missFeiKoZhan0,savedata)
end



local strstarpos0,strendpos0,strsuxin0,strsuxin1,mywhnumber = strfind(string,"%a%d")
local susinum,jinengsu,missdata,boolse,beisum = 0,0,0,-1,0
while nil ~= strstarpos0 and nil ~= strendpos0 do
strsuxin0 = strsub(string,strstarpos0,strstarpos0)
strsuxin1 = strsub(string,strendpos0,strendpos0)
if nil ~= strsuxin0 and nil ~= strsuxin1 then 
mywhnumber = tonumber(tostring(x892112_WuhunSuxing[strsuxin0])..strsuxin1)
if nil == mywhnumber then
mywhnumber = 0
end
if mywhnumber > 0 then
jinengsu = jinengsu + 1
beisum = mod((jinengsu-1),3)+1
if boolse ~= floor((jinengsu-1)/3)+1 then
boolse = floor((jinengsu-1)/3)+1
end
missdata = GetMissionData( sceneId, selfId, x892112_misssuxingandjinen[boolse])
SetMissionData( sceneId, selfId, x892112_misssuxingandjinen[boolse],missdata+mywhnumber*(1000^(3-beisum)) )
end
end
strstarpos0,strendpos0 = strfind(string,"%a%d",strendpos0+1)
end



local lei = {}
local fix,fiz,wuhunaddnm,string2
for i = 1,16 do
fix,fiz = strfind(string,liststr[i])
if fix ~= nil and fiz ~= nil then
string2 = strsub(string,fix,fiz)
string1 = strsub(string,fiz+1,fiz+1)
wuhunaddnm = tonumber(tostring(x892112_WuhunSuxing[string2])..string1)

if wuhunaddnm == nil then
wuhunaddnm = 0
end
lei[i] = wuhunaddnm
else
lei[i] = 0
end

end



return 1,lei

end
--**********************************
--去除武魂属性
--**********************************
function x892112_DelWuHun( sceneId, selfId,MissItemID)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 11923, 0);
local skieoseidk = GetMissionData( sceneId, selfId, x892112_misssuxingandjinen[getn(x892112_misssuxingandjinen)])
local skieios = {floor(skieoseidk/1000000)+1000,floor(mod(skieoseidk,1000000)/1000)+1000,mod(skieoseidk,1000)+1000}
for i = 1,3 do
if skieios[i] > 0 and skieios[i] ~= 1000 then
if HaveSkill( sceneId, selfId,skieios[i]) == 1 then
   DelSkill( sceneId, selfId,skieios[i])
end
end
end 
for i = 1,getn(x892112_misssuxingandjinen) do
SetMissionData( sceneId, selfId, x892112_misssuxingandjinen[i],0 )
end
local missdata = GetMissionData( sceneId, selfId, x892112_missFeiKoZhan0)
SetMissionData( sceneId, selfId, x892112_missFeiKoZhan,0)
SetMissionData( sceneId, selfId, x892112_missFeiKoZhan0,0)
x892112_GetBagWuHunParam(sceneId, selfId,MissItemID,missdata)
CallScriptFunction( 300089, "AddJiaYingSuXing", sceneId, selfId)
end
--*************************************************************
--检测武魂记录数据
--*************************************************************
function x892112_GetBagWuHunParam(sceneId, selfId,missItemID,missdata)
local WuHunItemID,itemid2,otherpos = 0,0,nil
for i = 0,29 do
WuHunItemID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )
itemid2 = GetBagItemParam( sceneId, selfId, i, 7, 1)
if WuHunItemID == missItemID  then
if GetItemEquipPoint(WuHunItemID) == 10 and itemid2 == 10 then
SetBagItemParam( sceneId, selfId, i, 7, 1,0) 
otherpos = i
end
end 
end
--x892112_NotifyTip( sceneId, selfId, ""..missItemID.."|"..missdata.."" )
if nil == otherpos then
--x892112_NotifyTip( sceneId, selfId, "没找着" )
return
end
--x892112_NotifyTip( sceneId, selfId, otherpos )
local qiyubufen = mod(missdata,1000000)
local mygsubstiring = tostring(qiyubufen)
if nil == mygsubstiring then
mygsubstiring = "0000"
end
local NowLevelLong = strlen(mygsubstiring)
local gsubstridkg = "00000"
if NowLevelLong <= 4 and NowLevelLong >= 1 then
gsubstridkg = strrep("0",5-NowLevelLong)..mygsubstiring
elseif  NowLevelLong == 5 then
local _,_,gustring1,gustring2 = strfind(mygsubstiring,"(%d)(%d%d%d%d)")
if nil == gustring1 then
gustring1 = 0
end
if nil == gustring2 then
gustring2 = "0000"
end
gsubstridkg = x892112_WuhunSuTostring[tonumber(gustring1)]..gustring2
elseif NowLevelLong == 6 then
_,_,gustring1,gustring2 = strfind(mygsubstiring,"(%d%d)(%d%d%d%d)")
if nil == gustring1 then
gustring1 = 0
end
if nil == gustring2 then
gustring2 = "0000"
end
gsubstridkg = x892112_WuhunSuTostring[tonumber(gustring1)]..gustring2
end

local _,zzstring = LuaFnGetItemCreator(sceneId, selfId, otherpos) --"_a1b1c2d2e2f3g4i3"
if zzstring == nil then
local retidss = random(1,5)
zzstring = "_"..strrep("0",24)..""..retidss.."".."0"..gsubstridkg
LuaFnSetItemCreator(sceneId, selfId, otherpos, zzstring);
return
end
--"_q1e2w1r2p1a2d1f1q1w5e8011800000"
--local long =     strlen(zzstring)
local x,z = strfind(zzstring,"_")
if x == nil or z == nil then
local retidss = random(1,5)
zzstring = zzstring.."_"..strrep("0",24)..""..retidss.."".."0"..gsubstridkg
LuaFnSetItemCreator(sceneId, selfId, otherpos, zzstring);
return
end
--0118000000

local gsubstrinds,gsubnumber = gsub(zzstring,"(_"..strrep("%w",26)..")"..strrep("%w",5),"%1"..gsubstridkg,1)
if gsubnumber == 0 or gsubstrinds == zzstring then
return
end
LuaFnSetItemCreator(sceneId, selfId, otherpos, gsubstrinds);
end
--*************************************************************
--武魂合成等级，等级，经验
--*************************************************************

--**********************************
--打开武魂
--**********************************
function x892112_opwuhun( sceneId, selfId , idstrd) --SetMissionData( sceneId, selfId, 472,50000000000)
       local eqid=    LuaFnGetItemTableIndexByIndex( sceneId, selfId, 110 )   --id
		--策划   合成等级 (1)  扩展等级  (1)   扩展属性 (2*8)  技能 (2*3)  属相(1)  站位(3)   28全能
		
		 if eqid<1 then
			for i=10675,10770 do 
			LuaFnCancelSpecificImpact(sceneId,selfId,i)	
			end
		 end
		
		
		
		
		local cz
		if  eqid >0 then
			cz = 600+ mod(eqid,10)*2+8
			else
			cz=100
		end	
		local abc=""
		local _, myname = LuaFnGetItemCreator(sceneId, selfId,110);
		if myname ==nil then
			myname = "0"
		end 		
		Fskilx,Fskilz,Fwuhunhesenstr= strfind(myname,"&WH".."(%d)"..strrep("%w",21))
		if Fskilx == nil then
		Fwuhunhesenstr = 0
		end

	      BeginUICommand(sceneId)
		  UICommand_AddInt(sceneId,idstrd)
		  UICommand_AddString(sceneId,"OPEN_WUHUN_PAGE")
	      UICommand_AddString(sceneId,myname)
		  UICommand_AddInt(sceneId,cz)
	      EndUICommand(sceneId)
	      DispatchUICommand(sceneId,selfId,2014101699)
end
function x892112_Get_WH_SXe(sceneId, selfId,pos)
local shuxingtab = {}	
local _,skilstring = LuaFnGetItemCreator(sceneId, selfId,pos) 
if skilstring == nil then 
	return 0,0,0,0,0,0,0
end	
local starpos1,endpos1,kz,sx,jn = nil,nil,0,nil,nil
starpos1,endpos1,kz,sx,jn,sx1 = strfind(skilstring,"&WH%w(%w)("..strrep("%w",16)..")("..strrep("%w",6)..")(%w)")	

if starpos1 ==nil or endpos1 == nil then 
return 0,0,0,0,0,0,0
end	
local r,d =0,0

if sx ~= nil and strlen(sx)==16 then 
for i=1,16,2 do 
if strsub(sx,i,i+1) ~= "00" then 
tinsert(shuxingtab,strsub(sx,i,i+1))	
r =r+1 
end
end  
end	
if jn~= nil and strlen(jn)==6 then 
for i=1,6,2 do 
if strsub(sx,i,i+1) ~= "00" then 
d =d+1 
end
end 	
end	
return 1,kz,r,d,sx,jn ,shuxingtab
end	
--**********************************
--记录人物抗和减抗
--**********************************
function x892112_MissPlayerSuxingp( sceneId, selfId, id1, id2, id3, id4 )
local Listbiao = {id1,id2,id3,id4}
local missdataids
for i = 1,4 do
missdataids = GetMissionData( sceneId, selfId, x892112_MissGangDel[i])
if Listbiao[i] >= 0 and missdataids ~= Listbiao[i] then
SetMissionData( sceneId, selfId,x892112_MissGangDel[i],Listbiao[i])
end
end

end
--**********************************
--醒目提示
--**********************************
function x892112_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--*************************************************************
--加门派更新武魂技能
--*************************************************************
function x892112_UpWuHunSkills(sceneId, selfId)
local skieoseidk = GetMissionData( sceneId, selfId, x892112_misssuxingandjinen[getn(x892112_misssuxingandjinen)])
local skieios = {floor(skieoseidk/1000000)+1000,floor(mod(skieoseidk,1000000)/1000)+1000,mod(skieoseidk,1000)+1000}
for i = 1,3 do
if skieios[i] > 0 and skieios[i] ~= 1000 then
if HaveSkill( sceneId, selfId,skieios[i]) ~= 1 then
   AddSkill( sceneId, selfId,skieios[i])
end
end
end 

end

--*************************************************************
--武魂加状态
--*************************************************************
function x892112_wuhunAddBuff(sceneId, selfId,pos)

---------------------------------------新改的，无规则随便先学什么扩展binge----------------------------
local nwhum,leiwh = x892112_wuhunSXlistAdd(sceneId, selfId,pos)

if nwhum == 0 then
CallScriptFunction( 300089, "AddJiaYingSuXing", sceneId, selfId)
return
end

local key = {}
local alis,numadd,jisu = 0,0,0,0
for i = 1,16 do
if i <= 4 then
if leiwh[i] ~= nil and leiwh[i] > 0 then
numadd = numadd+1
if numadd == 2 then
jisu = jisu+1
key[jisu] = tonumber(alis.. leiwh[i])
numadd = 0
end
alis = leiwh[i]
end
if i == 4 then
if numadd == 1 then
jisu = jisu+1
key[jisu] = alis
numadd = 0
alis = 0
end
end
end

if i >= 5 and i<=8 then
if leiwh[i] ~= nil and leiwh[i] > 0 then
numadd = numadd+1
if numadd == 2 then
jisu = jisu+1
key[jisu] = tonumber(alis.. leiwh[i])
numadd = 0
end
alis = leiwh[i]
end
if i == 8 then
if numadd == 1 then
jisu = jisu+1
key[jisu] = alis
numadd = 0
alis = 0
end
end
end

if i >= 9 and i<=12 then
if leiwh[i] ~= nil and leiwh[i] > 0 then
numadd = numadd+1
if numadd == 2 then
jisu = jisu+1
key[jisu] = tonumber(alis.. leiwh[i])
numadd = 0
end
alis = leiwh[i]
end
if i == 12 then
if numadd == 1 then
jisu = jisu+1
key[jisu] = alis
numadd = 0
alis = 0
end
end
end

if i >= 13 and i<=16 then
if leiwh[i] ~= nil and leiwh[i] > 0 then
numadd = numadd+1
if numadd == 2 then
jisu = jisu+1
key[jisu] = tonumber(alis.. leiwh[i])
numadd = 0
end
alis = leiwh[i]
end
if i == 16 then
if numadd == 1 then
jisu = jisu+1
key[jisu] = alis
numadd = 0
alis = 0
end
end
end

end



for i = 1,getn(key) do
if key[i] ~= nil then
if key[i] > 0 then
if x892112_wuhun_addImpact[key[i]] ~= nil then
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,x892112_wuhun_addImpact[key[i]]) ~= 1 then 
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x892112_wuhun_addImpact[key[i]], 0);
end
end
end
end
end


CallScriptFunction( 300089, "AddJiaYingSuXing", sceneId, selfId)
end

--*************************************************************
--武魂所学属性列表
--*************************************************************
function x892112_wuhunSXlistAdd(sceneId, selfId,pos)
local _,zzstring = LuaFnGetItemCreator(sceneId, selfId, pos) --"_a1b1c2d2e2f3g4i3"
if zzstring == nil then
return 0
end
local x,z = strfind(zzstring,"_")
if x == nil or z == nil then
return 0
end

local string = strsub(zzstring,x,x+16)
if string == nil then
return 0
end
local liststr = {"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h"}
local lei = {}
local fix,fiz,wuhunaddnm,string2
for i = 1,16 do
fix,fiz = strfind(string,liststr[i])
if fix ~= nil and fiz ~= nil then
string2 = strsub(string,fix,fiz)
string1 = strsub(string,fiz+1,fiz+1)
wuhunaddnm = tonumber(tostring(x892112_WuhunSuxing[string2])..string1)
if wuhunaddnm == nil then
wuhunaddnm = 0
end
lei[i] = wuhunaddnm
else
lei[i] = 0
end

end



return 1,lei

end
