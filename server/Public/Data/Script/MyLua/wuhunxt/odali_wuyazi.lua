-- LÕc Dß½ng NPC
-- yªn thanh 
-- bình thß¶ng 

-- chân v¯n s¯ 
x892101_g_ScriptId  =  892101

-- có sñ ki®n ID li®t bi¬u 
x892101_g_eventList={}
x892101_Kfs_Magic_tips  =  {" C¥m Tinh : Phong "," C¥m Tinh : Ð¸a "," C¥m Tinh : Thüy "," C¥m Tinh : Höa "}
x892101_mysuxinpos ={1,3,5,7,9,11,13,15}
x892101_WuhunSuxingve = {}
x892101_WuhunSuxingve["q"]={20310131,20310132,20310133,20310134,20310135,20310136,20310137,20310138}
x892101_WuhunSuxingve["w"]={20310131,20310132,20310133,20310134,20310135,20310136,20310137,20310138}
x892101_WuhunSuxingve["e"]={20310131,20310132,20310133,20310134,20310135,20310136,20310137,20310138}
x892101_WuhunSuxingve["r"]={20310131,20310132,20310133,20310134,20310135,20310136,20310137,20310138}
x892101_WuhunSuxingve["t"]={20310122,20310123,20310124,20310125,20310126,20310127,20310128,20310129}
x892101_WuhunSuxingve["y"]={20310122,20310123,20310124,20310125,20310126,20310127,20310128,20310129}
x892101_WuhunSuxingve["u"]={20310122,20310123,20310124,20310125,20310126,20310127,20310128,20310129}
x892101_WuhunSuxingve["i"]={20310122,20310123,20310124,20310125,20310126,20310127,20310128,20310129}
x892101_WuhunSuxingve["o"]={20310140,20310141,20310142,20310143,20310144,20310145,20310146,20310147}
x892101_WuhunSuxingve["p"]={20310140,20310141,20310142,20310143,20310144,20310145,20310146,20310147}
x892101_WuhunSuxingve["a"]={20310140,20310141,20310142,20310143,20310144,20310145,20310146,20310147}
x892101_WuhunSuxingve["s"]={20310140,20310141,20310142,20310143,20310144,20310145,20310146,20310147}
x892101_WuhunSuxingve["d"]={20310149,20310150,20310151,20310152,20310153,20310154,20310155,20310156}
x892101_WuhunSuxingve["f"]={20310149,20310150,20310151,20310152,20310153,20310154,20310155,20310156}
x892101_WuhunSuxingve["g"]={20310149,20310150,20310151,20310152,20310153,20310154,20310155,20310156}
x892101_WuhunSuxingve["h"]={20310149,20310150,20310151,20310152,20310153,20310154,20310155,20310156}

x892101_iText  =  {["q"]=" bång công kích ",["w"]=" lØa công kích ",["e"]=" huy«n công kích ",["r"]=" ðµc công kích ",["t"]=" bång kháng tính ",["y"]=" lØa kháng tính ",["u"]=" huy«n kháng tính ",["i"]=" ðµc kháng tính ",["o"]=" coi thß¶ng møc tiêu bång kháng ",["p"]=" coi thß¶ng møc tiêu lØa kháng ",["a"]=" coi thß¶ng møc tiêu huy«n kháng ",["s"]=" coi thß¶ng møc tiêu ðµc kháng ",["d"]=" r¾t xu¯ng møc tiêu bång ch¯ng ðßþc hÕn ",["f"]=" r¾t xu¯ng møc tiêu lØa ch¯ng ðßþc hÕn ",["g"]=" r¾t xu¯ng møc tiêu huy«n ch¯ng ðßþc hÕn ",["h"]=" r¾t xu¯ng møc tiêu ðµc ch¯ng ðßþc hÕn "}      
x892101_WuhunAttr_Book  ={[30700214]="t",[30700215]="y",[30700216]="u",[30700217]="i",[30700218]="q",[30700219]="w",[30700220]="e",[30700221]="r",[30700222]="o",[30700223]="p",[30700224]="a",[30700225]="s",[30700226]="d",[30700227]="f",[30700228]="g",[30700229]="h"}
x892101_WuhunAttrSubItem  =  {}
x892101_WuhunAttrSubItem["q"]={[30700235]="w",[30700236]="e",[30700237]="r",SubItemitem = {30700235,30700236,30700237}}
x892101_WuhunAttrSubItem["w"]={[30700234]="q",[30700236]="e",[30700237]="r",SubItemitem = {30700234,30700236,30700237}}
x892101_WuhunAttrSubItem["e"]={[30700234]="q",[30700235]="w",[30700237]="r",SubItemitem = {30700234,30700235,30700237}}
x892101_WuhunAttrSubItem["r"]={[30700234]="q",[30700235]="w",[30700236]="e",SubItemitem = {30700234,30700235,30700236}}
x892101_WuhunAttrSubItem["t"]={[30700235]="y",[30700236]="u",[30700237]="i",SubItemitem = {30700235,30700236,30700237}}
x892101_WuhunAttrSubItem["y"]={[30700234]="t",[30700236]="u",[30700237]="i",SubItemitem = {30700234,30700236,30700237}}
x892101_WuhunAttrSubItem["u"]={[30700234]="t",[30700235]="y",[30700237]="i",SubItemitem = {30700234,30700235,30700237}}
x892101_WuhunAttrSubItem["i"]={[30700234]="t",[30700235]="y",[30700236]="u",SubItemitem = {30700234,30700235,30700236}}
x892101_WuhunAttrSubItem["o"]={[30700235]="p",[30700236]="a",[30700237]="s",SubItemitem = {30700235,30700236,30700237}}
x892101_WuhunAttrSubItem["p"]={[30700234]="o",[30700236]="a",[30700237]="s",SubItemitem = {30700234,30700236,30700237}}
x892101_WuhunAttrSubItem["a"]={[30700234]="o",[30700235]="p",[30700237]="s",SubItemitem = {30700234,30700235,30700237}}
x892101_WuhunAttrSubItem["s"]={[30700234]="o",[30700235]="p",[30700236]="a",SubItemitem = {30700234,30700235,30700236}}
x892101_WuhunAttrSubItem["d"]={[30700235]="f",[30700236]="g",[30700237]="h",SubItemitem = {30700235,30700236,30700237}}
x892101_WuhunAttrSubItem["f"]={[30700234]="d",[30700236]="g",[30700237]="h",SubItemitem = {30700234,30700236,30700237}}
x892101_WuhunAttrSubItem["g"]={[30700234]="d",[30700235]="f",[30700237]="h",SubItemitem = {30700234,30700235,30700237}}
x892101_WuhunAttrSubItem["h"]={[30700234]="d",[30700235]="f",[30700236]="g",SubItemitem = {30700234,30700235,30700236}}

x892101_g_runhunsi={}  
x892101_g_runhunsi[1]={str  =  " Nhu§n H°n ThÕch Ngñ ",item  =  {20310122,20310123,20310124,20310125,20310126,20310127,20310128,20310129,20310130}}
x892101_g_runhunsi[2]={str  =  " Nhu§n H°n ThÕch Kích ",item  =  {20310131,20310132,20310133,20310134,20310135,20310136,20310137,20310138,20310139}}
x892101_g_runhunsi[3]={str  =  " Nhu§n H°n ThÕch Phách ",item  =  {20310140,20310141,20310142,20310143,20310144,20310145,20310146,20310147,20310148}}
x892101_g_runhunsi[4]={str  =  " Nhu§n H°n ThÕch BÕo ",item  =  {20310149,20310150,20310151,20310152,20310153,20310154,20310155,20310156,20310157}}

x892101_g_WuhunSuxing = {["0"]=0,["q"]=1,["w"]=2,["e"]=3,["r"]=4,["t"]=5,["y"]=6,["u"]=7,["i"]=8,["o"]=9,["p"]=10,["a"]=11,["s"]=12,["d"]=13,["f"]=14,["g"]=15,["h"]=16,["j"]=17,["k"]=18,["l"]=19,["z"]=20,["x"]=21,["c"]=22,["v"]=23,["b"]=24,["n"]=25,["m"]=26,["Q"]=27,["W"]=28,["E"]=29,["R"]=30,["T"]=31,["Y"]=32,["U"]=33,["I"]=34,["O"]=35,["P"]=36,["A"]=37,["S"]=38,["D"]=39,["F"]=40,["G"]=41,["H"]=42,["J"]=43,["K"]=44,["L"]=45,["Z"]=46,["X"]=47,["C"]=48,["V"]=49,["B"]=50,["N"]=51,["M"]=52}
x892101_g_WuHunSkill = {}
x892101_g_WuHunSkillK = {
[1]={1361,1367,1373,1379},
[2]={1385,1391,1397,1403,1409,1415,1421,1427,1433,1439,1445,1451,1457,1463,1469,1475,1481,1487,1493,1499,1505,1511},
[3]={1559,1565,1571,1577,1583,1589,1595},
[4]={1517,1523,1529,1535,1541,1547,1553},
}
x892101_g_WuHunSkill[1] = {"q","w","e","r"}

x892101_g_WuHunSkill[2] = {"t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"}

x892101_g_WuHunSkill[3] = {"I","O","P","A","S","D","F"}

x892101_g_WuHunSkill[4] = {"Q","W","E","R","T","Y","U"}


x892101_WuHunSkillToItem = {}
x892101_WuHunSkillToItem[1361] = 49999000
x892101_WuHunSkillToItem[1362] = 49999001
x892101_WuHunSkillToItem[1363] = 49999002
x892101_WuHunSkillToItem[1364] = 49999003
x892101_WuHunSkillToItem[1365] = 49999004
x892101_WuHunSkillToItem[1366] = 49999005
x892101_WuHunSkillToItem[1367] = 49999006
x892101_WuHunSkillToItem[1368] = 49999007
x892101_WuHunSkillToItem[1369] = 49999008
x892101_WuHunSkillToItem[1370] = 49999009
x892101_WuHunSkillToItem[1371] = 49999010
x892101_WuHunSkillToItem[1372] = 49999011
x892101_WuHunSkillToItem[1373] = 49999012
x892101_WuHunSkillToItem[1374] = 49999013
x892101_WuHunSkillToItem[1375] = 49999014
x892101_WuHunSkillToItem[1376] = 49999015
x892101_WuHunSkillToItem[1377] = 49999016
x892101_WuHunSkillToItem[1378] = 49999017
x892101_WuHunSkillToItem[1379] = 49999018
x892101_WuHunSkillToItem[1380] = 49999019
x892101_WuHunSkillToItem[1381] = 49999020
x892101_WuHunSkillToItem[1382] = 49999021
x892101_WuHunSkillToItem[1383] = 49999022
x892101_WuHunSkillToItem[1384] = 49999023
x892101_WuHunSkillToItem[1385] = 49999024
x892101_WuHunSkillToItem[1386] = 49999025
x892101_WuHunSkillToItem[1387] = 49999026
x892101_WuHunSkillToItem[1388] = 49999027
x892101_WuHunSkillToItem[1389] = 49999028
x892101_WuHunSkillToItem[1390] = 49999029
x892101_WuHunSkillToItem[1391] = 49999030
x892101_WuHunSkillToItem[1392] = 49999031
x892101_WuHunSkillToItem[1393] = 49999032
x892101_WuHunSkillToItem[1394] = 49999033
x892101_WuHunSkillToItem[1395] = 49999034
x892101_WuHunSkillToItem[1396] = 49999035
x892101_WuHunSkillToItem[1397] = 49999036
x892101_WuHunSkillToItem[1398] = 49999037
x892101_WuHunSkillToItem[1399] = 49999038
x892101_WuHunSkillToItem[1400] = 49999039
x892101_WuHunSkillToItem[1401] = 49999040
x892101_WuHunSkillToItem[1402] = 49999041
x892101_WuHunSkillToItem[1403] = 49999042
x892101_WuHunSkillToItem[1404] = 49999043
x892101_WuHunSkillToItem[1405] = 49999044
x892101_WuHunSkillToItem[1406] = 49999045
x892101_WuHunSkillToItem[1407] = 49999046
x892101_WuHunSkillToItem[1408] = 49999047
x892101_WuHunSkillToItem[1409] = 49999048
x892101_WuHunSkillToItem[1410] = 49999049
x892101_WuHunSkillToItem[1411] = 49999050
x892101_WuHunSkillToItem[1412] = 49999051
x892101_WuHunSkillToItem[1413] = 49999052
x892101_WuHunSkillToItem[1414] = 49999053
x892101_WuHunSkillToItem[1415] = 49999054
x892101_WuHunSkillToItem[1416] = 49999055
x892101_WuHunSkillToItem[1417] = 49999056
x892101_WuHunSkillToItem[1418] = 49999057
x892101_WuHunSkillToItem[1419] = 49999058
x892101_WuHunSkillToItem[1420] = 49999059
x892101_WuHunSkillToItem[1421] = 49999060
x892101_WuHunSkillToItem[1422] = 49999061
x892101_WuHunSkillToItem[1423] = 49999062
x892101_WuHunSkillToItem[1424] = 49999063
x892101_WuHunSkillToItem[1425] = 49999064
x892101_WuHunSkillToItem[1426] = 49999065
x892101_WuHunSkillToItem[1427] = 49999066
x892101_WuHunSkillToItem[1428] = 49999067
x892101_WuHunSkillToItem[1429] = 49999068
x892101_WuHunSkillToItem[1430] = 49999069
x892101_WuHunSkillToItem[1431] = 49999070
x892101_WuHunSkillToItem[1432] = 49999071
x892101_WuHunSkillToItem[1433] = 49999072
x892101_WuHunSkillToItem[1434] = 49999073
x892101_WuHunSkillToItem[1435] = 49999074
x892101_WuHunSkillToItem[1436] = 49999075
x892101_WuHunSkillToItem[1437] = 49999076
x892101_WuHunSkillToItem[1438] = 49999077
x892101_WuHunSkillToItem[1439] = 49999078
x892101_WuHunSkillToItem[1440] = 49999079
x892101_WuHunSkillToItem[1441] = 49999080
x892101_WuHunSkillToItem[1442] = 49999081
x892101_WuHunSkillToItem[1443] = 49999082
x892101_WuHunSkillToItem[1444] = 49999083
x892101_WuHunSkillToItem[1445] = 49999084
x892101_WuHunSkillToItem[1446] = 49999085
x892101_WuHunSkillToItem[1447] = 49999086
x892101_WuHunSkillToItem[1448] = 49999087
x892101_WuHunSkillToItem[1449] = 49999088
x892101_WuHunSkillToItem[1450] = 49999089
x892101_WuHunSkillToItem[1451] = 49999090
x892101_WuHunSkillToItem[1452] = 49999091
x892101_WuHunSkillToItem[1453] = 49999092
x892101_WuHunSkillToItem[1454] = 49999093
x892101_WuHunSkillToItem[1455] = 49999094
x892101_WuHunSkillToItem[1456] = 49999095
x892101_WuHunSkillToItem[1457] = 49999096
x892101_WuHunSkillToItem[1458] = 49999097
x892101_WuHunSkillToItem[1459] = 49999098
x892101_WuHunSkillToItem[1460] = 49999099
x892101_WuHunSkillToItem[1461] = 49999100
x892101_WuHunSkillToItem[1462] = 49999101
x892101_WuHunSkillToItem[1463] = 49999102
x892101_WuHunSkillToItem[1464] = 49999103
x892101_WuHunSkillToItem[1465] = 49999104
x892101_WuHunSkillToItem[1466] = 49999105
x892101_WuHunSkillToItem[1467] = 49999106
x892101_WuHunSkillToItem[1468] = 49999107
x892101_WuHunSkillToItem[1469] = 49999108
x892101_WuHunSkillToItem[1470] = 49999109
x892101_WuHunSkillToItem[1471] = 49999110
x892101_WuHunSkillToItem[1472] = 49999111
x892101_WuHunSkillToItem[1473] = 49999112
x892101_WuHunSkillToItem[1474] = 49999113
x892101_WuHunSkillToItem[1475] = 49999114
x892101_WuHunSkillToItem[1476] = 49999115
x892101_WuHunSkillToItem[1477] = 49999116
x892101_WuHunSkillToItem[1478] = 49999117
x892101_WuHunSkillToItem[1479] = 49999118
x892101_WuHunSkillToItem[1480] = 49999119
x892101_WuHunSkillToItem[1481] = 49999120
x892101_WuHunSkillToItem[1482] = 49999121
x892101_WuHunSkillToItem[1483] = 49999122
x892101_WuHunSkillToItem[1484] = 49999123
x892101_WuHunSkillToItem[1485] = 49999124
x892101_WuHunSkillToItem[1486] = 49999125
x892101_WuHunSkillToItem[1487] = 49999126
x892101_WuHunSkillToItem[1488] = 49999127
x892101_WuHunSkillToItem[1489] = 49999128
x892101_WuHunSkillToItem[1490] = 49999129
x892101_WuHunSkillToItem[1491] = 49999130
x892101_WuHunSkillToItem[1492] = 49999131
x892101_WuHunSkillToItem[1493] = 49999132
x892101_WuHunSkillToItem[1494] = 49999133
x892101_WuHunSkillToItem[1495] = 49999134
x892101_WuHunSkillToItem[1496] = 49999135
x892101_WuHunSkillToItem[1497] = 49999136
x892101_WuHunSkillToItem[1498] = 49999137
x892101_WuHunSkillToItem[1499] = 49999138
x892101_WuHunSkillToItem[1500] = 49999139
x892101_WuHunSkillToItem[1501] = 49999140
x892101_WuHunSkillToItem[1502] = 49999141
x892101_WuHunSkillToItem[1503] = 49999142
x892101_WuHunSkillToItem[1504] = 49999143
x892101_WuHunSkillToItem[1505] = 49999144
x892101_WuHunSkillToItem[1506] = 49999145
x892101_WuHunSkillToItem[1507] = 49999146
x892101_WuHunSkillToItem[1508] = 49999147
x892101_WuHunSkillToItem[1509] = 49999148
x892101_WuHunSkillToItem[1510] = 49999149
x892101_WuHunSkillToItem[1511] = 49999150
x892101_WuHunSkillToItem[1512] = 49999151
x892101_WuHunSkillToItem[1513] = 49999152
x892101_WuHunSkillToItem[1514] = 49999153
x892101_WuHunSkillToItem[1515] = 49999154
x892101_WuHunSkillToItem[1516] = 49999155
x892101_WuHunSkillToItem[1517] = 49999156
x892101_WuHunSkillToItem[1518] = 49999157
x892101_WuHunSkillToItem[1519] = 49999158
x892101_WuHunSkillToItem[1520] = 49999159
x892101_WuHunSkillToItem[1521] = 49999160
x892101_WuHunSkillToItem[1522] = 49999161
x892101_WuHunSkillToItem[1523] = 49999162
x892101_WuHunSkillToItem[1524] = 49999163
x892101_WuHunSkillToItem[1525] = 49999164
x892101_WuHunSkillToItem[1526] = 49999165
x892101_WuHunSkillToItem[1527] = 49999166
x892101_WuHunSkillToItem[1528] = 49999167
x892101_WuHunSkillToItem[1529] = 49999168
x892101_WuHunSkillToItem[1530] = 49999169
x892101_WuHunSkillToItem[1531] = 49999170
x892101_WuHunSkillToItem[1532] = 49999171
x892101_WuHunSkillToItem[1533] = 49999172
x892101_WuHunSkillToItem[1534] = 49999173
x892101_WuHunSkillToItem[1535] = 49999174
x892101_WuHunSkillToItem[1536] = 49999175
x892101_WuHunSkillToItem[1537] = 49999176
x892101_WuHunSkillToItem[1538] = 49999177
x892101_WuHunSkillToItem[1539] = 49999178
x892101_WuHunSkillToItem[1540] = 49999179
x892101_WuHunSkillToItem[1541] = 49999180
x892101_WuHunSkillToItem[1542] = 49999181
x892101_WuHunSkillToItem[1543] = 49999182
x892101_WuHunSkillToItem[1544] = 49999183
x892101_WuHunSkillToItem[1545] = 49999184
x892101_WuHunSkillToItem[1546] = 49999185
x892101_WuHunSkillToItem[1547] = 49999186
x892101_WuHunSkillToItem[1548] = 49999187
x892101_WuHunSkillToItem[1549] = 49999188
x892101_WuHunSkillToItem[1550] = 49999189
x892101_WuHunSkillToItem[1551] = 49999190
x892101_WuHunSkillToItem[1552] = 49999191
x892101_WuHunSkillToItem[1553] = 49999192
x892101_WuHunSkillToItem[1554] = 49999193
x892101_WuHunSkillToItem[1555] = 49999194
x892101_WuHunSkillToItem[1556] = 49999195
x892101_WuHunSkillToItem[1557] = 49999196
x892101_WuHunSkillToItem[1558] = 49999197
x892101_WuHunSkillToItem[1559] = 49999198
x892101_WuHunSkillToItem[1560] = 49999199
x892101_WuHunSkillToItem[1561] = 49999200
x892101_WuHunSkillToItem[1562] = 49999201
x892101_WuHunSkillToItem[1563] = 49999202
x892101_WuHunSkillToItem[1564] = 49999203
x892101_WuHunSkillToItem[1565] = 49999204
x892101_WuHunSkillToItem[1566] = 49999205
x892101_WuHunSkillToItem[1567] = 49999206
x892101_WuHunSkillToItem[1568] = 49999207
x892101_WuHunSkillToItem[1569] = 49999208
x892101_WuHunSkillToItem[1570] = 49999209
x892101_WuHunSkillToItem[1571] = 49999210
x892101_WuHunSkillToItem[1572] = 49999211
x892101_WuHunSkillToItem[1573] = 49999212
x892101_WuHunSkillToItem[1574] = 49999213
x892101_WuHunSkillToItem[1575] = 49999214
x892101_WuHunSkillToItem[1576] = 49999215
x892101_WuHunSkillToItem[1577] = 49999216
x892101_WuHunSkillToItem[1578] = 49999217
x892101_WuHunSkillToItem[1579] = 49999218
x892101_WuHunSkillToItem[1580] = 49999219
x892101_WuHunSkillToItem[1581] = 49999220
x892101_WuHunSkillToItem[1582] = 49999221
x892101_WuHunSkillToItem[1583] = 49999222
x892101_WuHunSkillToItem[1584] = 49999223
x892101_WuHunSkillToItem[1585] = 49999224
x892101_WuHunSkillToItem[1586] = 49999225
x892101_WuHunSkillToItem[1587] = 49999226
x892101_WuHunSkillToItem[1588] = 49999227
x892101_WuHunSkillToItem[1589] = 49999228
x892101_WuHunSkillToItem[1590] = 49999229
x892101_WuHunSkillToItem[1591] = 49999230
x892101_WuHunSkillToItem[1592] = 49999231
x892101_WuHunSkillToItem[1593] = 49999232
x892101_WuHunSkillToItem[1594] = 49999233
x892101_WuHunSkillToItem[1595] = 49999234
x892101_WuHunSkillToItem[1596] = 49999235
x892101_WuHunSkillToItem[1597] = 49999236
x892101_WuHunSkillToItem[1598] = 49999237
x892101_WuHunSkillToItem[1599] = 49999238
x892101_WuHunSkillToItem[1600] = 49999239
x892101_WuHunSkillToItem[1652] = 49999240
x892101_WuHunSkillToItem[1653] = 49999241
x892101_WuHunSkillToItem[1654] = 49999242
x892101_WuHunSkillToItem[1655] = 49999243
x892101_WuHunSkillToItem[1656] = 49999244
x892101_WuHunSkillToItem[1657] = 49999245
x892101_WuHunSkillToItem[1658] = 49999246
x892101_WuHunSkillToItem[1659] = 49999247
x892101_WuHunSkillToItem[1660] = 49999248
x892101_WuHunSkillToItem[1661] = 49999249
x892101_WuHunSkillToItem[1662] = 49999250
x892101_WuHunSkillToItem[1663] = 49999251
x892101_WuHunSkillToItem[1664] = 49999252
x892101_WuHunSkillToItem[1665] = 49999253
x892101_WuHunSkillToItem[1666] = 49999254
x892101_WuHunSkillToItem[1667] = 49999255
x892101_WuHunSkillToItem[1668] = 49999256
x892101_WuHunSkillToItem[1669] = 49999257
x892101_WuHunSkillToItem[1670] = 49999258
x892101_WuHunSkillToItem[1671] = 49999259
x892101_WuHunSkillToItem[1672] = 49999260
x892101_WuHunSkillToItem[1673] = 49999261
x892101_WuHunSkillToItem[1674] = 49999262
x892101_WuHunSkillToItem[1675] = 49999263
x892101_WuHunSkillToItem[1676] = 49999264
x892101_WuHunSkillToItem[1677] = 49999265
x892101_WuHunSkillToItem[1678] = 49999266
x892101_WuHunSkillToItem[1679] = 49999267
x892101_WuHunSkillToItem[1680] = 49999268
x892101_WuHunSkillToItem[1681] = 49999269
x892101_WuHunSkillToItem[1682] = 49999270
x892101_WuHunSkillToItem[1683] = 49999271
x892101_WuHunSkillToItem[1684] = 49999272
x892101_WuHunSkillToItem[1685] = 49999273
x892101_WuHunSkillToItem[1686] = 49999274
x892101_WuHunSkillToItem[1687] = 49999275
x892101_WuHunSkillToItem[1688] = 49999276
x892101_WuHunSkillToItem[1689] = 49999277
x892101_WuHunSkillToItem[1690] = 49999278
x892101_WuHunSkillToItem[1691] = 49999279
x892101_WuHunSkillToItem[1692] = 49999280
x892101_WuHunSkillToItem[1693] = 49999281
x892101_WuHunSkillToItem[1694] = 49999282
x892101_WuHunSkillToItem[1695] = 49999283
x892101_WuHunSkillToItem[1696] = 49999284
x892101_WuHunSkillToItem[1697] = 49999285
x892101_WuHunSkillToItem[1698] = 49999286
x892101_WuHunSkillToItem[1699] = 49999287
x892101_WuHunSkillToItem[1700] = 49999288
x892101_WuHunSkillToItem[1701] = 49999289
x892101_WuHunSkillToItem[1702] = 49999290
x892101_WuHunSkillToItem[1703] = 49999291
x892101_WuHunSkillToItem[1704] = 49999292
x892101_WuHunSkillToItem[1705] = 49999293
x892101_WuHunSkillToItem[1706] = 49999294
x892101_WuHunSkillToItem[1707] = 49999295
x892101_WuHunSkillToItem[1708] = 49999296
x892101_WuHunSkillToItem[1709] = 49999297
x892101_WuHunSkillToItem[1710] = 49999298
x892101_WuHunSkillToItem[1711] = 49999299
x892101_WuHunSkillToItem[1712] = 49999300
x892101_WuHunSkillToItem[1713] = 49999301
x892101_WuHunSkillToItem[1714] = 49999302
x892101_WuHunSkillToItem[1715] = 49999303
x892101_WuHunSkillToItem[1716] = 49999304
x892101_WuHunSkillToItem[1717] = 49999305
x892101_WuHunSkillToItem[1718] = 49999306
x892101_WuHunSkillToItem[1719] = 49999307
x892101_WuHunSkillToItem[1720] = 49999308
x892101_WuHunSkillToItem[1721] = 49999309
x892101_WuHunSkillToItem[1722] = 49999310
x892101_WuHunSkillToItem[1723] = 49999311
x892101_WuHunSkillToItem[1724] = 49999312
x892101_WuHunSkillToItem[1725] = 49999313
x892101_WuHunSkillToItem[1726] = 49999314
x892101_WuHunSkillToItem[1727] = 49999315
x892101_WuHunSkillToItem[1728] = 49999316
x892101_WuHunSkillToItem[1729] = 49999317
x892101_WuHunSkillToItem[1730] = 49999318
x892101_WuHunSkillToItem[1731] = 49999319

x892101_skillstrtoid ={}
x892101_skillstrtoid["q1"]  =  1361-- thanh d§t chi h°n (1 c¤p )
x892101_skillstrtoid["q2"]  =  1362-- thanh d§t chi h°n (2 c¤p )
x892101_skillstrtoid["q3"]  =  1363-- thanh d§t chi h°n (3 c¤p )
x892101_skillstrtoid["q4"]  =  1364-- thanh d§t chi h°n (4 c¤p )
x892101_skillstrtoid["q5"]  =  1365-- thanh d§t chi h°n (5 c¤p )
x892101_skillstrtoid["q6"]  =  1366-- thanh d§t chi h°n (6 c¤p )
x892101_skillstrtoid["q7"]  =  1652-- thanh d§t chi h°n (7 c¤p )
x892101_skillstrtoid["q8"]  =  1653-- thanh d§t chi h°n (8 c¤p )
x892101_skillstrtoid["w1"]  =  1367-- hàn phong chi h°n (1 c¤p )
x892101_skillstrtoid["w2"]  =  1368-- hàn phong chi h°n (2 c¤p )
x892101_skillstrtoid["w3"]  =  1369-- hàn phong chi h°n (3 c¤p )
x892101_skillstrtoid["w4"]  =  1370-- hàn phong chi h°n (4 c¤p )
x892101_skillstrtoid["w5"]  =  1371-- hàn phong chi h°n (5 c¤p )
x892101_skillstrtoid["w6"]  =  1372-- hàn phong chi h°n (6 c¤p )
x892101_skillstrtoid["w7"]  =  1654-- hàn phong chi h°n (7 c¤p )
x892101_skillstrtoid["w8"]  =  1655-- hàn phong chi h°n (8 c¤p )
x892101_skillstrtoid["e1"]  =  1373-- vû dûng chi h°n (1 c¤p )
x892101_skillstrtoid["e2"]  =  1374-- vû dûng chi h°n (2 c¤p )
x892101_skillstrtoid["e3"]  =  1375-- vû dûng chi h°n (3 c¤p )
x892101_skillstrtoid["e4"]  =  1376-- vû dûng chi h°n (4 c¤p )
x892101_skillstrtoid["e5"]  =  1377-- vû dûng chi h°n (5 c¤p )
x892101_skillstrtoid["e6"]  =  1378-- vû dûng chi h°n (6 c¤p )
x892101_skillstrtoid["e7"]  =  1656-- vû dûng chi h°n (7 c¤p )
x892101_skillstrtoid["e8"]  =  1657-- vû dûng chi h°n (8 c¤p )
x892101_skillstrtoid["r1"]  =  1379-- ngñ th¬ chi h°n (1 c¤p )
x892101_skillstrtoid["r2"]  =  1380-- ngñ th¬ chi h°n (2 c¤p )
x892101_skillstrtoid["r3"]  =  1381-- ngñ th¬ chi h°n (3 c¤p )
x892101_skillstrtoid["r4"]  =  1382-- ngñ th¬ chi h°n (4 c¤p )
x892101_skillstrtoid["r5"]  =  1383-- ngñ th¬ chi h°n (5 c¤p )
x892101_skillstrtoid["r6"]  =  1384-- ngñ th¬ chi h°n (6 c¤p )
x892101_skillstrtoid["r7"]  =  1658-- ngñ th¬ chi h°n (7 c¤p )
x892101_skillstrtoid["r8"]  =  1659-- ngñ th¬ chi h°n (8 c¤p )
x892101_skillstrtoid["t1"]  =  1385-- du thân chi h°n (1 c¤p )
x892101_skillstrtoid["t2"]  =  1386-- du thân chi h°n (2 c¤p )
x892101_skillstrtoid["t3"]  =  1387-- du thân chi h°n (3 c¤p )
x892101_skillstrtoid["t4"]  =  1388-- du thân chi h°n (4 c¤p )
x892101_skillstrtoid["t5"]  =  1389-- du thân chi h°n (5 c¤p )
x892101_skillstrtoid["t6"]  =  1390-- du thân chi h°n (6 c¤p )
x892101_skillstrtoid["t7"]  =  1660-- du thân chi h°n (7 c¤p )
x892101_skillstrtoid["t8"]  =  1661-- du thân chi h°n (8 c¤p )
x892101_skillstrtoid["y1"]  =  1391-- thßþng võ chi h°n (1 c¤p )
x892101_skillstrtoid["y2"]  =  1392-- thßþng võ chi h°n (2 c¤p )
x892101_skillstrtoid["y3"]  =  1393-- thßþng võ chi h°n (3 c¤p )
x892101_skillstrtoid["y4"]  =  1394-- thßþng võ chi h°n (4 c¤p )
x892101_skillstrtoid["y5"]  =  1395-- thßþng võ chi h°n (5 c¤p )
x892101_skillstrtoid["y6"]  =  1396-- thßþng võ chi h°n (6 c¤p )
x892101_skillstrtoid["y7"]  =  1662-- thßþng võ chi h°n (7 c¤p )
x892101_skillstrtoid["y8"]  =  1663-- thßþng võ chi h°n (8 c¤p )
x892101_skillstrtoid["u1"]  =  1397-- không còn chút sÑc lñc nào chi h°n (1 c¤p )
x892101_skillstrtoid["u2"]  =  1398-- không còn chút sÑc lñc nào chi h°n (2 c¤p )
x892101_skillstrtoid["u3"]  =  1399-- không còn chút sÑc lñc nào chi h°n (3 c¤p )
x892101_skillstrtoid["u4"]  =  1400-- không còn chút sÑc lñc nào chi h°n (4 c¤p )
x892101_skillstrtoid["u5"]  =  1401-- không còn chút sÑc lñc nào chi h°n (5 c¤p )
x892101_skillstrtoid["u6"]  =  1402-- không còn chút sÑc lñc nào chi h°n (6 c¤p )
x892101_skillstrtoid["u7"]  =  1664-- không còn chút sÑc lñc nào chi h°n (7 c¤p )
x892101_skillstrtoid["u8"]  =  1665-- không còn chút sÑc lñc nào chi h°n (8 c¤p )
x892101_skillstrtoid["i1"]  =  1403-- di®t linh chi h°n (1 c¤p )
x892101_skillstrtoid["i2"]  =  1404-- di®t linh chi h°n (2 c¤p )
x892101_skillstrtoid["i3"]  =  1405-- di®t linh chi h°n (3 c¤p )
x892101_skillstrtoid["i4"]  =  1406-- di®t linh chi h°n (4 c¤p )
x892101_skillstrtoid["i5"]  =  1407-- di®t linh chi h°n (5 c¤p )
x892101_skillstrtoid["i6"]  =  1408-- di®t linh chi h°n (6 c¤p )
x892101_skillstrtoid["i7"]  =  1666-- di®t linh chi h°n (7 c¤p )
x892101_skillstrtoid["i8"]  =  1667-- di®t linh chi h°n (8 c¤p )
x892101_skillstrtoid["o1"]  =  1409-- phá th¬ chi h°n (1 c¤p )
x892101_skillstrtoid["o2"]  =  1410-- phá th¬ chi h°n (2 c¤p )
x892101_skillstrtoid["o3"]  =  1411-- phá th¬ chi h°n (3 c¤p )
x892101_skillstrtoid["o4"]  =  1412-- phá th¬ chi h°n (4 c¤p )
x892101_skillstrtoid["o5"]  =  1413-- phá th¬ chi h°n (5 c¤p )
x892101_skillstrtoid["o6"]  =  1414-- phá th¬ chi h°n (6 c¤p )
x892101_skillstrtoid["o7"]  =  1668-- phá th¬ chi h°n (7 c¤p )
x892101_skillstrtoid["o8"]  =  1669-- phá th¬ chi h°n (8 c¤p )
x892101_skillstrtoid["p1"]  =  1415-- loÕn ð¸nh chi h°n (1 c¤p )
x892101_skillstrtoid["p2"]  =  1416-- loÕn ð¸nh chi h°n (2 c¤p )
x892101_skillstrtoid["p3"]  =  1417-- loÕn ð¸nh chi h°n (3 c¤p )
x892101_skillstrtoid["p4"]  =  1418-- loÕn ð¸nh chi h°n (4 c¤p )
x892101_skillstrtoid["p5"]  =  1419-- loÕn ð¸nh chi h°n (5 c¤p )
x892101_skillstrtoid["p6"]  =  1420-- loÕn ð¸nh chi h°n (6 c¤p )
x892101_skillstrtoid["p7"]  =  1670-- loÕn ð¸nh chi h°n (7 c¤p )
x892101_skillstrtoid["p8"]  =  1671-- loÕn ð¸nh chi h°n (8 c¤p )
x892101_skillstrtoid["a1"]  =  1421-- n£ng thân chi h°n (1 c¤p )
x892101_skillstrtoid["a2"]  =  1422-- n£ng thân chi h°n (2 c¤p )
x892101_skillstrtoid["a3"]  =  1423-- n£ng thân chi h°n (3 c¤p )
x892101_skillstrtoid["a4"]  =  1424-- n£ng thân chi h°n (4 c¤p )
x892101_skillstrtoid["a5"]  =  1425-- n£ng thân chi h°n (5 c¤p )
x892101_skillstrtoid["a6"]  =  1426-- n£ng thân chi h°n (6 c¤p )
x892101_skillstrtoid["a7"]  =  1672-- n£ng thân chi h°n (7 c¤p )
x892101_skillstrtoid["a8"]  =  1673-- n£ng thân chi h°n (8 c¤p )
x892101_skillstrtoid["s1"]  =  1427-- tuy®t tình chi h°n (1 c¤p )
x892101_skillstrtoid["s2"]  =  1428-- tuy®t tình chi h°n (2 c¤p )
x892101_skillstrtoid["s3"]  =  1429-- tuy®t tình chi h°n (3 c¤p )
x892101_skillstrtoid["s4"]  =  1430-- tuy®t tình chi h°n (4 c¤p )
x892101_skillstrtoid["s5"]  =  1431-- tuy®t tình chi h°n (5 c¤p )
x892101_skillstrtoid["s6"]  =  1432-- tuy®t tình chi h°n (6 c¤p )
x892101_skillstrtoid["s7"]  =  1674-- tuy®t tình chi h°n (7 c¤p )
x892101_skillstrtoid["s8"]  =  1675-- tuy®t tình chi h°n (8 c¤p )
x892101_skillstrtoid["d1"]  =  1433-- l® m¾i v×a chi h°n (1 c¤p )
x892101_skillstrtoid["d2"]  =  1434-- l® m¾i v×a chi h°n (2 c¤p )
x892101_skillstrtoid["d3"]  =  1435-- l® m¾i v×a chi h°n (3 c¤p )
x892101_skillstrtoid["d4"]  =  1436-- l® m¾i v×a chi h°n (4 c¤p )
x892101_skillstrtoid["d5"]  =  1437-- l® m¾i v×a chi h°n (5 c¤p )
x892101_skillstrtoid["d6"]  =  1438-- l® m¾i v×a chi h°n (6 c¤p )
x892101_skillstrtoid["d7"]  =  1676-- l® m¾i v×a chi h°n (7 c¤p )
x892101_skillstrtoid["d8"]  =  1677-- l® m¾i v×a chi h°n (8 c¤p )
x892101_skillstrtoid["f1"]  =  1439-- toàn nhu chi h°n (1 c¤p )
x892101_skillstrtoid["f2"]  =  1440-- toàn nhu chi h°n (2 c¤p )
x892101_skillstrtoid["f3"]  =  1441-- toàn nhu chi h°n (3 c¤p )
x892101_skillstrtoid["f4"]  =  1442-- toàn nhu chi h°n (4 c¤p )
x892101_skillstrtoid["f5"]  =  1443-- toàn nhu chi h°n (5 c¤p )
x892101_skillstrtoid["f6"]  =  1444-- toàn nhu chi h°n (6 c¤p )
x892101_skillstrtoid["f7"]  =  1678-- toàn nhu chi h°n (7 c¤p )
x892101_skillstrtoid["f8"]  =  1679-- toàn nhu chi h°n (8 c¤p )
x892101_skillstrtoid["g1"]  =  1445-- vû nh§n chi h°n (1 c¤p )
x892101_skillstrtoid["g2"]  =  1446-- vû nh§n chi h°n (2 c¤p )
x892101_skillstrtoid["g3"]  =  1447-- vû nh§n chi h°n (3 c¤p )
x892101_skillstrtoid["g4"]  =  1448-- vû nh§n chi h°n (4 c¤p )
x892101_skillstrtoid["g5"]  =  1449-- vû nh§n chi h°n (5 c¤p )
x892101_skillstrtoid["g6"]  =  1450-- vû nh§n chi h°n (6 c¤p )
x892101_skillstrtoid["g7"]  =  1680-- vû nh§n chi h°n (7 c¤p )
x892101_skillstrtoid["g8"]  =  1681-- vû nh§n chi h°n (8 c¤p )
x892101_skillstrtoid["h1"]  =  1451-- âm miên chi h°n (1 c¤p )
x892101_skillstrtoid["h2"]  =  1452-- âm miên chi h°n (2 c¤p )
x892101_skillstrtoid["h3"]  =  1453-- âm miên chi h°n (3 c¤p )
x892101_skillstrtoid["h4"]  =  1454-- âm miên chi h°n (4 c¤p )
x892101_skillstrtoid["h5"]  =  1455-- âm miên chi h°n (5 c¤p )
x892101_skillstrtoid["h6"]  =  1456-- âm miên chi h°n (6 c¤p )
x892101_skillstrtoid["h7"]  =  1682-- âm miên chi h°n (7 c¤p )
x892101_skillstrtoid["h8"]  =  1683-- âm miên chi h°n (8 c¤p )
x892101_skillstrtoid["j1"]  =  1457-- tinh chính xác chi h°n (1 c¤p )
x892101_skillstrtoid["j2"]  =  1458-- tinh chính xác chi h°n (2 c¤p )
x892101_skillstrtoid["j3"]  =  1459-- tinh chính xác chi h°n (3 c¤p )
x892101_skillstrtoid["j4"]  =  1460-- tinh chính xác chi h°n (4 c¤p )
x892101_skillstrtoid["j5"]  =  1461-- tinh chính xác chi h°n (5 c¤p )
x892101_skillstrtoid["j6"]  =  1462-- tinh chính xác chi h°n (6 c¤p )
x892101_skillstrtoid["j7"]  =  1684-- tinh chính xác chi h°n (7 c¤p )
x892101_skillstrtoid["j8"]  =  1685-- tinh chính xác chi h°n (8 c¤p )
x892101_skillstrtoid["k1"]  =  1463-- linh sái chi h°n (1 c¤p )
x892101_skillstrtoid["k2"]  =  1464-- linh sái chi h°n (2 c¤p )
x892101_skillstrtoid["k3"]  =  1465-- linh sái chi h°n (3 c¤p )
x892101_skillstrtoid["k4"]  =  1466-- linh sái chi h°n (4 c¤p )
x892101_skillstrtoid["k5"]  =  1467-- linh sái chi h°n (5 c¤p )
x892101_skillstrtoid["k6"]  =  1468-- linh sái chi h°n (6 c¤p )
x892101_skillstrtoid["k7"]  =  1686-- linh sái chi h°n (7 c¤p )
x892101_skillstrtoid["k8"]  =  1687-- linh sái chi h°n (8 c¤p )
x892101_skillstrtoid["l1"]  =  1469-- ðoÕn m¾i v×a chi h°n (1 c¤p )
x892101_skillstrtoid["l2"]  =  1470-- ðoÕn m¾i v×a chi h°n (2 c¤p )
x892101_skillstrtoid["l3"]  =  1471-- ðoÕn m¾i v×a chi h°n (3 c¤p )
x892101_skillstrtoid["l4"]  =  1472-- ðoÕn m¾i v×a chi h°n (4 c¤p )
x892101_skillstrtoid["l5"]  =  1473-- ðoÕn m¾i v×a chi h°n (5 c¤p )
x892101_skillstrtoid["l6"]  =  1474-- ðoÕn m¾i v×a chi h°n (6 c¤p )
x892101_skillstrtoid["l7"]  =  1688-- ðoÕn m¾i v×a chi h°n (7 c¤p )
x892101_skillstrtoid["l8"]  =  1689-- ðoÕn m¾i v×a chi h°n (8 c¤p )
x892101_skillstrtoid["z1"]  =  1475-- rách nhu chi h°n (1 c¤p )
x892101_skillstrtoid["z2"]  =  1476-- rách nhu chi h°n (2 c¤p )
x892101_skillstrtoid["z3"]  =  1477-- rách nhu chi h°n (3 c¤p )
x892101_skillstrtoid["z4"]  =  1478-- rách nhu chi h°n (4 c¤p )
x892101_skillstrtoid["z5"]  =  1479-- rách nhu chi h°n (5 c¤p )
x892101_skillstrtoid["z6"]  =  1480-- rách nhu chi h°n (6 c¤p )
x892101_skillstrtoid["z7"]  =  1690-- rách nhu chi h°n (7 c¤p )
x892101_skillstrtoid["z8"]  =  1691-- rách nhu chi h°n (8 c¤p )
x892101_skillstrtoid["x1"]  =  1481-- äm nh§n chi h°n (1 c¤p )
x892101_skillstrtoid["x2"]  =  1482-- äm nh§n chi h°n (2 c¤p )
x892101_skillstrtoid["x3"]  =  1483-- äm nh§n chi h°n (3 c¤p )
x892101_skillstrtoid["x4"]  =  1484-- äm nh§n chi h°n (4 c¤p )
x892101_skillstrtoid["x5"]  =  1485-- äm nh§n chi h°n (5 c¤p )
x892101_skillstrtoid["x6"]  =  1486-- äm nh§n chi h°n (6 c¤p )
x892101_skillstrtoid["x7"]  =  1692-- äm nh§n chi h°n (7 c¤p )
x892101_skillstrtoid["x8"]  =  1693-- äm nh§n chi h°n (8 c¤p )
x892101_skillstrtoid["c1"]  =  1487-- ðâm miên chi h°n (1 c¤p )
x892101_skillstrtoid["c2"]  =  1488-- ðâm miên chi h°n (2 c¤p )
x892101_skillstrtoid["c3"]  =  1489-- ðâm miên chi h°n (3 c¤p )
x892101_skillstrtoid["c4"]  =  1490-- ðâm miên chi h°n (4 c¤p )
x892101_skillstrtoid["c5"]  =  1491-- ðâm miên chi h°n (5 c¤p )
x892101_skillstrtoid["c6"]  =  1492-- ðâm miên chi h°n (6 c¤p )
x892101_skillstrtoid["c7"]  =  1694-- ðâm miên chi h°n (7 c¤p )
x892101_skillstrtoid["c8"]  =  1695-- ðâm miên chi h°n (8 c¤p )
x892101_skillstrtoid["v1"]  =  1493-- nhi­u chính xác chi h°n (1 c¤p )
x892101_skillstrtoid["v2"]  =  1494-- nhi­u chính xác chi h°n (2 c¤p )
x892101_skillstrtoid["v3"]  =  1495-- nhi­u chính xác chi h°n (3 c¤p )
x892101_skillstrtoid["v4"]  =  1496-- nhi­u chính xác chi h°n (4 c¤p )
x892101_skillstrtoid["v5"]  =  1497-- nhi­u chính xác chi h°n (5 c¤p )
x892101_skillstrtoid["v6"]  =  1498-- nhi­u chính xác chi h°n (6 c¤p )
x892101_skillstrtoid["v7"]  =  1696-- nhi­u chính xác chi h°n (7 c¤p )
x892101_skillstrtoid["v8"]  =  1697-- nhi­u chính xác chi h°n (8 c¤p )
x892101_skillstrtoid["b1"]  =  1499-- tuy®t sái chi h°n (1 c¤p )
x892101_skillstrtoid["b2"]  =  1500-- tuy®t sái chi h°n (2 c¤p )
x892101_skillstrtoid["b3"]  =  1501-- tuy®t sái chi h°n (3 c¤p )
x892101_skillstrtoid["b4"]  =  1502-- tuy®t sái chi h°n (4 c¤p )
x892101_skillstrtoid["b5"]  =  1503-- tuy®t sái chi h°n (5 c¤p )
x892101_skillstrtoid["b6"]  =  1504-- tuy®t sái chi h°n (6 c¤p )
x892101_skillstrtoid["b7"]  =  1698-- tuy®t sái chi h°n (7 c¤p )
x892101_skillstrtoid["b8"]  =  1699-- tuy®t sái chi h°n (8 c¤p )

x892101_skillstrtoid["n1"]  =  1505-- mÕnh kích chi h°n (1 c¤p )
x892101_skillstrtoid["n2"]  =  1506-- mÕnh kích chi h°n (2 c¤p )
x892101_skillstrtoid["n3"]  =  1507-- mÕnh kích chi h°n (3 c¤p )
x892101_skillstrtoid["n4"]  =  1508-- mÕnh kích chi h°n (4 c¤p )
x892101_skillstrtoid["n5"]  =  1509-- mÕnh kích chi h°n (5 c¤p )
x892101_skillstrtoid["n6"]  =  1510-- mÕnh kích chi h°n (6 c¤p )
x892101_skillstrtoid["n7"]  =  1700-- mÕnh kích chi h°n (7 c¤p )
x892101_skillstrtoid["n8"]  =  1701-- mÕnh kích chi h°n (8 c¤p )
x892101_skillstrtoid["m1"]  =  1511-- tuy®t khí chi h°n (1 c¤p )
x892101_skillstrtoid["m2"]  =  1512-- tuy®t khí chi h°n (2 c¤p )
x892101_skillstrtoid["m3"]  =  1513-- tuy®t khí chi h°n (3 c¤p )
x892101_skillstrtoid["m4"]  =  1514-- tuy®t khí chi h°n (4 c¤p )
x892101_skillstrtoid["m5"]  =  1515-- tuy®t khí chi h°n (5 c¤p )
x892101_skillstrtoid["m6"]  =  1516-- tuy®t khí chi h°n (6 c¤p )
x892101_skillstrtoid["m7"]  =  1702-- tuy®t khí chi h°n (7 c¤p )
x892101_skillstrtoid["m8"]  =  1703-- tuy®t khí chi h°n (8 c¤p )
x892101_skillstrtoid["Q1"]  =  1517-- di®t thª bát phß½ng (1 c¤p )
x892101_skillstrtoid["Q2"]  =  1518-- di®t thª bát phß½ng (2 c¤p )
x892101_skillstrtoid["Q3"]  =  1519-- di®t thª bát phß½ng (3 c¤p )
x892101_skillstrtoid["Q4"]  =  1520-- di®t thª bát phß½ng (4 c¤p )
x892101_skillstrtoid["Q5"]  =  1521-- di®t thª bát phß½ng (5 c¤p )
x892101_skillstrtoid["Q6"]  =  1522-- di®t thª bát phß½ng (6 c¤p )
x892101_skillstrtoid["Q7"]  =  1704-- di®t thª bát phß½ng (7 c¤p )
x892101_skillstrtoid["Q8"]  =  1705-- di®t thª bát phß½ng (8 c¤p )
x892101_skillstrtoid["W1"]  =  1523-- tuy®t cänh tán giªt (1 c¤p )
x892101_skillstrtoid["W2"]  =  1524-- tuy®t cänh tán giªt (2 c¤p )
x892101_skillstrtoid["W3"]  =  1525-- tuy®t cänh tán giªt (3 c¤p )
x892101_skillstrtoid["W4"]  =  1526-- tuy®t cänh tán giªt (4 c¤p )
x892101_skillstrtoid["W5"]  =  1527-- tuy®t cänh tán giªt (5 c¤p )
x892101_skillstrtoid["W6"]  =  1528-- tuy®t cänh tán giªt (6 c¤p )
x892101_skillstrtoid["W7"]  =  1706-- tuy®t cänh tán giªt (7 c¤p )
x892101_skillstrtoid["W8"]  =  1707-- tuy®t cänh tán giªt (8 c¤p )
x892101_skillstrtoid["E1"]  =  1529-- ðóng bång vÕn d£m (1 c¤p )
x892101_skillstrtoid["E2"]  =  1530-- ðóng bång vÕn d£m (2 c¤p )
x892101_skillstrtoid["E3"]  =  1531-- ðóng bång vÕn d£m (3 c¤p )
x892101_skillstrtoid["E4"]  =  1532-- ðóng bång vÕn d£m (4 c¤p )
x892101_skillstrtoid["E5"]  =  1533-- ðóng bång vÕn d£m (5 c¤p )
x892101_skillstrtoid["E6"]  =  1534-- ðóng bång vÕn d£m (6 c¤p )
x892101_skillstrtoid["E7"]  =  1708-- ðóng bång vÕn d£m (7 c¤p )
x892101_skillstrtoid["E8"]  =  1709-- ðóng bång vÕn d£m (8 c¤p )
x892101_skillstrtoid["R1"]  =  1535-- thiên höa li®u nguyên (1 c¤p )
x892101_skillstrtoid["R2"]  =  1536-- thiên höa li®u nguyên (2 c¤p )
x892101_skillstrtoid["R3"]  =  1537-- thiên höa li®u nguyên (3 c¤p )
x892101_skillstrtoid["R4"]  =  1538-- thiên höa li®u nguyên (4 c¤p )
x892101_skillstrtoid["R5"]  =  1539-- thiên höa li®u nguyên (5 c¤p )
x892101_skillstrtoid["R6"]  =  1540-- thiên höa li®u nguyên (6 c¤p )
x892101_skillstrtoid["R7"]  =  1710-- thiên höa li®u nguyên (7 c¤p )
x892101_skillstrtoid["R8"]  =  1711-- thiên höa li®u nguyên (8 c¤p )
x892101_skillstrtoid["T1"]  =  1541-- cu°ng lôi ngày hàng (1 c¤p )
x892101_skillstrtoid["T2"]  =  1542-- cu°ng lôi ngày hàng (2 c¤p )
x892101_skillstrtoid["T3"]  =  1543-- cu°ng lôi ngày hàng (3 c¤p )
x892101_skillstrtoid["T4"]  =  1544-- cu°ng lôi ngày hàng (4 c¤p )
x892101_skillstrtoid["T5"]  =  1545-- cu°ng lôi ngày hàng (5 c¤p )
x892101_skillstrtoid["T6"]  =  1546-- cu°ng lôi ngày hàng (6 c¤p )
x892101_skillstrtoid["T7"]  =  1712-- cu°ng lôi ngày hàng (7 c¤p )
x892101_skillstrtoid["T8"]  =  1713-- cu°ng lôi ngày hàng (8 c¤p )
x892101_skillstrtoid["Y1"]  =  1547-- k¸ch ðµc ôn d¸ch (1 c¤p )
x892101_skillstrtoid["Y2"]  =  1548-- k¸ch ðµc ôn d¸ch (2 c¤p )
x892101_skillstrtoid["Y3"]  =  1549-- k¸ch ðµc ôn d¸ch (3 c¤p )
x892101_skillstrtoid["Y4"]  =  1550-- k¸ch ðµc ôn d¸ch (4 c¤p )
x892101_skillstrtoid["Y5"]  =  1551-- k¸ch ðµc ôn d¸ch (5 c¤p )
x892101_skillstrtoid["Y6"]  =  1552-- k¸ch ðµc ôn d¸ch (6 c¤p )
x892101_skillstrtoid["Y7"]  =  1714-- k¸ch ðµc ôn d¸ch (7 c¤p )
x892101_skillstrtoid["Y8"]  =  1715-- k¸ch ðµc ôn d¸ch (8 c¤p )
x892101_skillstrtoid["U1"]  =  1553-- sóng dæ liên kích (1 c¤p )
x892101_skillstrtoid["U2"]  =  1554-- sóng dæ liên kích (2 c¤p )
x892101_skillstrtoid["U3"]  =  1555-- sóng dæ liên kích (3 c¤p )
x892101_skillstrtoid["U4"]  =  1556-- sóng dæ liên kích (4 c¤p )
x892101_skillstrtoid["U5"]  =  1557-- sóng dæ liên kích (5 c¤p )
x892101_skillstrtoid["U6"]  =  1558-- sóng dæ liên kích (6 c¤p )
x892101_skillstrtoid["U7"]  =  1716-- sóng dæ liên kích (7 c¤p )
x892101_skillstrtoid["U8"]  =  1717-- sóng dæ liên kích (8 c¤p )
x892101_skillstrtoid["I1"]  =  1559-- cß½ng mãnh ðòn nghiêm tr÷ng (1 c¤p )
x892101_skillstrtoid["I2"]  =  1560-- cß½ng mãnh ðòn nghiêm tr÷ng (2 c¤p )
x892101_skillstrtoid["I3"]  =  1561-- cß½ng mãnh ðòn nghiêm tr÷ng (3 c¤p )
x892101_skillstrtoid["I4"]  =  1562-- cß½ng mãnh ðòn nghiêm tr÷ng (4 c¤p )
x892101_skillstrtoid["I5"]  =  1563-- cß½ng mãnh ðòn nghiêm tr÷ng (5 c¤p )
x892101_skillstrtoid["I6"]  =  1564-- cß½ng mãnh ðòn nghiêm tr÷ng (6 c¤p )
x892101_skillstrtoid["I7"]  =  1718-- cß½ng mãnh ðòn nghiêm tr÷ng (7 c¤p )
x892101_skillstrtoid["I8"]  =  1719-- cß½ng mãnh ðòn nghiêm tr÷ng (8 c¤p )
x892101_skillstrtoid["O1"]  =  1565-- nhu xà ðánh b¤t ng¶ (1 c¤p )
x892101_skillstrtoid["O2"]  =  1566-- nhu xà ðánh b¤t ng¶ (2 c¤p )
x892101_skillstrtoid["O3"]  =  1567-- nhu xà ðánh b¤t ng¶ (3 c¤p )
x892101_skillstrtoid["O4"]  =  1568-- nhu xà ðánh b¤t ng¶ (4 c¤p )
x892101_skillstrtoid["O5"]  =  1569-- nhu xà ðánh b¤t ng¶ (5 c¤p )
x892101_skillstrtoid["O6"]  =  1570-- nhu xà ðánh b¤t ng¶ (6 c¤p )
x892101_skillstrtoid["O7"]  =  1720-- nhu xà ðánh b¤t ng¶ (7 c¤p )
x892101_skillstrtoid["O8"]  =  1721-- nhu xà ðánh b¤t ng¶ (8 c¤p )
x892101_skillstrtoid["P1"]  =  1571-- hàn bång xuyên thÑ (1 c¤p )
x892101_skillstrtoid["P2"]  =  1572-- hàn bång xuyên thÑ (2 c¤p )
x892101_skillstrtoid["P3"]  =  1573-- hàn bång xuyên thÑ (3 c¤p )
x892101_skillstrtoid["P4"]  =  1574-- hàn bång xuyên thÑ (4 c¤p )
x892101_skillstrtoid["P5"]  =  1575-- hàn bång xuyên thÑ (5 c¤p )
x892101_skillstrtoid["P6"]  =  1576-- hàn bång xuyên thÑ (6 c¤p )
x892101_skillstrtoid["P7"]  =  1722-- hàn bång xuyên thÑ (7 c¤p )
x892101_skillstrtoid["P8"]  =  1723-- hàn bång xuyên thÑ (8 c¤p )
x892101_skillstrtoid["A1"]  =  1577-- lØa cháy ð¯t thân (1 c¤p )
x892101_skillstrtoid["A2"]  =  1578-- lØa cháy ð¯t thân (2 c¤p )
x892101_skillstrtoid["A3"]  =  1579-- lØa cháy ð¯t thân (3 c¤p )
x892101_skillstrtoid["A4"]  =  1580-- lØa cháy ð¯t thân (4 c¤p )
x892101_skillstrtoid["A5"]  =  1581-- lØa cháy ð¯t thân (5 c¤p )
x892101_skillstrtoid["A6"]  =  1582-- lØa cháy ð¯t thân (6 c¤p )
x892101_skillstrtoid["A7"]  =  1724-- lØa cháy ð¯t thân (7 c¤p )
x892101_skillstrtoid["A8"]  =  1725-- lØa cháy ð¯t thân (8 c¤p )
x892101_skillstrtoid["S1"]  =  1583-- thiên lôi oanh ðính (1 c¤p )
x892101_skillstrtoid["S2"]  =  1584-- thiên lôi oanh ðính (2 c¤p )
x892101_skillstrtoid["S3"]  =  1585-- thiên lôi oanh ðính (3 c¤p )
x892101_skillstrtoid["S4"]  =  1586-- thiên lôi oanh ðính (4 c¤p )
x892101_skillstrtoid["S5"]  =  1587-- thiên lôi oanh ðính (5 c¤p )
x892101_skillstrtoid["S6"]  =  1588-- thiên lôi oanh ðính (6 c¤p )
x892101_skillstrtoid["S7"]  =  1726-- thiên lôi oanh ðính (7 c¤p )
x892101_skillstrtoid["S8"]  =  1727-- thiên lôi oanh ðính (8 c¤p )
x892101_skillstrtoid["D1"]  =  1589-- vø hü thñc ðµc (1 c¤p )
x892101_skillstrtoid["D2"]  =  1590-- vø hü thñc ðµc (2 c¤p )
x892101_skillstrtoid["D3"]  =  1591-- vø hü thñc ðµc (3 c¤p )
x892101_skillstrtoid["D4"]  =  1592-- vø hü thñc ðµc (4 c¤p )
x892101_skillstrtoid["D5"]  =  1593-- vø hü thñc ðµc (5 c¤p )
x892101_skillstrtoid["D6"]  =  1594-- vø hü thñc ðµc (6 c¤p )
x892101_skillstrtoid["D7"]  =  1728-- vø hü thñc ðµc (7 c¤p )
x892101_skillstrtoid["D8"]  =  1729-- vø hü thñc ðµc (8 c¤p )
x892101_skillstrtoid["F1"]  =  1595-- lôi ðình mãnh kích (1 c¤p )
x892101_skillstrtoid["F2"]  =  1596-- lôi ðình mãnh kích (2 c¤p )
x892101_skillstrtoid["F3"]  =  1597-- lôi ðình mãnh kích (3 c¤p )
x892101_skillstrtoid["F4"]  =  1598-- lôi ðình mãnh kích (4 c¤p )
x892101_skillstrtoid["F5"]  =  1599-- lôi ðình mãnh kích (5 c¤p )
x892101_skillstrtoid["F6"]  =  1600-- lôi ðình mãnh kích (6 c¤p )
x892101_skillstrtoid["F7"]  =  1730-- lôi ðình mãnh kích (7 c¤p )
x892101_skillstrtoid["F8"]  =  1731-- lôi ðình mãnh kích (8 c¤p )

x892101_g_hubin2  =  {20309101,20309102,20309103,20309104,20309105,20309106,20309106,20309108,20309109,20309110}
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function x892101_UpdateEventList( sceneId, selfId,targetId )


    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex  =  " Cô nß½ng "
	 else
	 	 PlayerSex  =  " Thiªu hi®p "
	 end
	BeginEvent(sceneId)
	 	 AddText(sceneId," Võ H°n Tông Sß ")
	 	 for  i,  eventId  in  x892101_g_eventList  do
	 	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 end
	 			 AddText( sceneId, " =#ef12345#Y  Chú ý: Tháo ðiêu vån trß¾c khi ðøc l² thuµc tính m· rµng Võ H°n, không làm theo s¨ b¸ m¤t ðiêu vån ")	 	 
	 	 AddNumText(sceneId,x892101_g_ScriptId," Tång C¤p #YVõ H°n  ",6,7)    ---
	 	 --AddNumText(sceneId,x892101_g_ScriptId," #cFF0000Tång C¤p Võ H°n Nhanh ",6,50)
	 	 AddNumText(sceneId,x892101_g_ScriptId," Ðøc l² #YThuµc tính m· rµng ( #cFF0000Tháo Ðiêu Vån ra)",6,12)
	 	 AddNumText(sceneId,x892101_g_ScriptId," H÷c sách #YKÛ nång m· rµng ",6,13)
	 	 AddNumText(sceneId,x892101_g_ScriptId," Nâng C¤p #YKÛ nång m· rµng ",6,14)
	 	 AddNumText(sceneId,x892101_g_ScriptId," GÞ bö(VÑt Bö) #YKÛ nång m· rµng ",6,9)
	 	 AddNumText(sceneId,x892101_g_ScriptId," Lînh ngµ #YKÛ nång Võ H°n ",6,10)
	 	 AddNumText(sceneId,x892101_g_ScriptId," T¦y lÕi #YKÛ nång Võ H°n ",6,11)
	 	 AddNumText(sceneId,x892101_g_ScriptId," Thång c¤p #YKÛ nång Võ H°n ",6,5)
	 	 --AddNumText(sceneId,x892101_g_ScriptId," Thay ð±i #YC¥m tinh Võ H°n ",6,21)
	 	 --AddNumText(sceneId,x892101_g_ScriptId," Hþp thành #YNhu§n H°n ThÕch ",6,15)
	 	 --AddNumText(sceneId,x892101_g_ScriptId," Hþp Thành #YH°n Bång Châu ",6,20)
	 	 --AddNumText(sceneId,x892101_g_ScriptId," Võ H°n nói rõ ",8,888)
	 	 --AddNumText(sceneId,x892101_g_ScriptId," l¥n sau tr· lÕi ",6,6)
	 EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x892101_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x892101_UpdateEventList(  sceneId,  selfId,  targetId  )
end
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 2
--**********************************
function  x892101_OnDefaultEvent2(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 for  i  =  1,4  do
	 AddNumText(sceneId,x892101_g_ScriptId," Hþp lên "..x892101_g_runhunsi[i].str.."",6,15+i)
	 end
	 AddNumText(sceneId,x892101_g_ScriptId," Tr· lÕi ",8,130)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 2
--**********************************
function  x892101_OnDefaultEvent3(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 local  sownum  =  0
	 for  i  =  2,8  do
	 sownum  =  0  +  i
	 if  i  ~=  7  and  i  ~=  8  then
	 AddNumText(sceneId,x892101_g_ScriptId," Hþp lên H°n Bång Châu C¤p  "..sownum.." ",6,631+i)
	 end
	 end
	 AddNumText(sceneId,x892101_g_ScriptId," Tr· lÕi ",8,130)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end	 
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x892101_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 for  i,  findId  in  x892101_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
	 
	 local  NumText  =  GetNumText();
	 
	 if  NumText  ==  5  then    
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,selfId);
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090723    )
	 elseif  NumText  ==  6  then    
	 	 
	 	 BeginUICommand(sceneId)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  1000)

	 elseif  NumText  ==  12  then    
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,selfId);
                                UICommand_AddInt(  sceneId,4)
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090721    )	 
elseif  NumText  ==  8  then
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId);
                UICommand_AddInt(  sceneId,2)
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090720    )
elseif  NumText  ==  9  then
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId);
                UICommand_AddInt(  sceneId,3)
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090720    )
elseif  NumText  ==  50  then
	 local  ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  0  )
	 if  ret  ~=  1  then
	 	 BeginEvent(sceneId)
	 	 AddText(sceneId," Yêu C¥u Ð£t Võ H°n c¥n Tång C¤p Vào Ô ThÑ Nh¤t Trong Tay Näi ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 gem_index  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  0  )
	 if  gem_index  >=  10156208  or  gem_index<  10156100    then
                	 BeginEvent(sceneId)
	 	 AddText(sceneId," Yêu C¥u Ð£t Võ H°n C¥n Tång C¤p Vào Ô ThÑ Nh¤t Và Võ H°n ÐÆng C¤p Thß Vào Ô ThÑ Hai Trong Tay Näi ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	   end
	
	
	
	x892101_NetCo4_FixWH( sceneId, selfId, 0 )  -- [NetCo4 30/09]
	if  (mod(gem_index,10)==8)    then
                	 BeginEvent(sceneId)
	 	 AddText(sceneId," Võ H°n Ðã ÐÕt T¾i C¤p Ðµ T¯i Ða, Không Th¬ Tång Thêm Næa ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
        end  
	 local  aau  =  10156208
	 if  gem_index  <  10156200  then  
	 	 aau  =  10156108
	 end	 
	 	 
	 gem_index1  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  1  )
	 if  gem_index1  ~=  30000002  then  
	                 	 BeginEvent(sceneId)
	 	 AddText(sceneId," Yêu C¥u Ð£t Võ H°n ÐÆng C¤p Thß Vào Ô ThÑ Hai Trong Tay Näi ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 return	 
	 end
    	 local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
	 local  nMoneyJB  =  GetMoney(sceneId,selfId)
	 local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
	 if  nMoneySelf  <  800000  then
        x892101_NotifyFailBox(  sceneId,  selfId,    "#G Vàng Không Ðü ! "  )
        return
	 end
	 
	 
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  800000  );
  local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  0)  

local    friendName  ,wuhunhesen=  "",8
    if  skilstring  ==nil  then  
friendName  =  "&WH"..  wuhunhesen..strrep(  "0",  24  )
else
friendName  =  "&WH"..  wuhunhesen..strrep(  "0",  24  )..skilstring  
end
friendName1,gsubnum  =  gsub(friendName,"(&WH)%d("..strrep("%w",23)..")".."(%d)","%1"..  wuhunhesen.."%2"..random(4))
	 LuaFnEraseItem(  sceneId,  selfId,  0  )
	 LuaFnEraseItem(  sceneId,  selfId,1  )
	 local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,aau,  QUALITY_MUST_BE_CHANGE  )	 
        LuaFnSetItemCreator(sceneId,  selfId,  bagpos01,  friendName1);
	 if  gamecon  >  0  then
        x892101_sanbiaoshi(  sceneId,  selfId,bagpos01,biaoshi  )
        end
	 x892101_NotifyFailBox(  sceneId,  selfId,    "#G Chúc m×ng, Võ H°n hþp thành công ! Võ h°n ðã ðÕt t¾i "..wuhunhesen.." c¤p, và Lînh ngµ "..x892101_Kfs_Magic_tips[random(4)]..""  )

	 
	 elseif  NumText  ==  10  then
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId);
                UICommand_AddInt(  sceneId,1)
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090722    )
	 elseif  NumText  ==  11  then
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId);
                UICommand_AddInt(  sceneId,2)
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090722    )	 
        elseif  NumText  ==  14  then	 	 
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId);
                UICommand_AddInt(  sceneId,1)
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090720    )
	 elseif  NumText  ==  21  then
        BeginEvent(sceneId)
	 AddNumText(sceneId,x892101_g_ScriptId,"#{WHGBSX_xml_XX(03)}",6,100)
	 AddNumText(sceneId,x892101_g_ScriptId,"#{WHGBSX_xml_XX(04)}",6,101)
	 AddNumText(sceneId,x892101_g_ScriptId,"#{WHGBSX_xml_XX(05)}",6,102)
	 AddNumText(sceneId,x892101_g_ScriptId,"#{WHGBSX_xml_XX(06)}",6,103)
	 AddNumText(sceneId,x892101_g_ScriptId," tr· v« trang trß¾c ",8,130)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 elseif  NumText  >=  100  and  NumText  <=  103  then
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId);
                UICommand_AddInt(  sceneId,3)
	 	 UICommand_AddInt(  sceneId,NumText-99)
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090722    )	 	 
        elseif  NumText  ==  15  then
	 BeginEvent(sceneId)
	 for  i  =  1,4  do
	 AddNumText(sceneId,x892101_g_ScriptId," Hþp lên"..x892101_g_runhunsi[i].str.."",6,15+i)
	 end
	 AddNumText(sceneId,x892101_g_ScriptId," Tr· lÕi ",8,130)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
        elseif  NumText  >=  16  and  NumText  <=  19  then
	 BeginEvent(sceneId)
	 for  i  =  1,8  do
	 if  i  ~=  7  and  i  ~=  8  then
	 AddNumText(sceneId,x892101_g_ScriptId," Hþp lên "..x892101_g_runhunsi[NumText-15].str.."c¤p "..tonumber(i+1).."",6,599+i+8*(NumText-16))
	 end
	 end
	 AddNumText(sceneId,x892101_g_ScriptId," Tr· lÕi ",8,131)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)	 
	 elseif  NumText  >=  600  and  NumText  <=  631  then
	 x892101_WuhunRunHunSiHeSeng(  sceneId,  selfId,  targetId,  NumText)
	 elseif  NumText  ==  20  then
	 BeginEvent(sceneId)
	 local  sownum  =  0
	 for  i  =  2,8  do
	 sownum  =  0  +  i
	 if  i  ~=  7  and  i  ~=  8  then
	 AddNumText(sceneId,x892101_g_ScriptId," Hþp lên H°n Bång Châu C¤p "..sownum.." ",6,631+i)
	 end
	 end
	 --AddNumText(sceneId,x892101_g_ScriptId," tr· v« trang trß¾c ",8,130)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)	 
	 elseif  NumText  >=  632  and  NumText  <=  639  then
        x892101_WuhunHunBinShu(  sceneId,  selfId,  targetId,NumText)
	 elseif  NumText  ==  13  then
        	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId);
	 	 UICommand_AddInt(sceneId,5);
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090721    )
        
	 elseif  NumText  ==  888  then    -- nói rõ 
	 	 BeginEvent(sceneId)
	 	 	 AddNumText(sceneId,x892101_g_ScriptId," Võ H°n ð¬ tùy ",6,666)
	 	 	 AddNumText(sceneId,x892101_g_ScriptId," Võ H°n nhß thª nào thång c¤p ",6,667)
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)

	 elseif  NumText  ==  666  then    -- tång lên Võ H°n c¤p b§c 
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId," m¾i cû ba hoàn ? phßþng hoàng lång mµ có nh¤t ð¸nh ky tÖ s¯ tuôn ra ! ")
	 	 	 AddNumText(sceneId,x892101_g_ScriptId," tr· v« trang trß¾c ",8,130)
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 elseif  NumText  ==  667  then    -- tång lên Võ H°n c¤p b§c 
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,"#cfabf8f Võ H°n nhß thª nào thång c¤p :#r  #W sØ døng #G2#W cá c¤p b§c gi¯ng nhau #G Võ H°n #W nhßng hþp thành cao h½n tñ thân #G1#W cá c¤p b§c ðích Võ H°n . Võ H°n lên t¾i 5 c¤p sau c¥n #R? Võ H°n t¤n thång ðan ?#W m¾i có th¬ lên t¾i #G6#W c¤p Võ H°n ?#R#W Võ H°n lên t¾i #G6#W c¤p lúc s¨ lînh ngµ ðªn ? tinh chu¦n chi h°n ? kÛ nång ! ")
	 	 	 AddNumText(sceneId,x892101_g_ScriptId," tr· v« trang trß¾c ",8,130)
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 elseif  NumText  ==  130  then
	 	 x892101_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 elseif  NumText  ==  131  then	 
	 	 x892101_OnDefaultEvent2(  sceneId,  selfId,targetId  )
	 elseif  NumText  ==  132  then	 
	 	 x892101_OnDefaultEvent3(  sceneId,  selfId,targetId  )	 
	 elseif  NumText  ==  7  then
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId);
                UICommand_AddInt(  sceneId,2)
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090721    )
	               end
	 	       end
--**********************************
-- Võ H°n h°n bång châu hþp thành 
--**********************************
function  x892101_WuhunHunBinShu(  sceneId,  selfId,  targetId,NumText)
        if  NumText  <  632  or  NumText  >  639  then
	 return
	 end
	 if  mod((NumText  -  632),8)+1  >=  6  then
	 x892101_NotifyFailBox(  sceneId,  selfId,    " #cFF0000Hi®n ta chßa cho hþp H°n Bång Châu lên C¤p 6, höi hoài sÇn cu¯n B¡c Minh Th¥n Công ta phang toét ð¥u bây gi¶!"  )
	 return
	 end
	 local  nMoneyJB  =  GetMoney(sceneId,selfId)
	 if  nMoneyJB  <  10000  then
          x892101_NotifyFailBox(  sceneId,  selfId,    "#G ngài trên ngß¶i chßa ðü #{_MONEY10000} , không cách nào tiªn hành thao tác ! "  )
	           return
	   end
	 local  stopid  =  NumText-631
	 local  conitem,nextcon,del,key,addnum,addnum2,addnum3  =  0,0,0,0,0,0,0
	 local  yinxiangnum,yinxiangnum2  ={},{}
	 for  i  =  1,getn(x892101_g_hubin2)-1  do
	 if  i  ==  stopid  then
	 break
	 end
	 conitem  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  x892101_g_hubin2[i])
	 if  i  >=  1  and  i  <=  6  then
	 key  =  5
	 elseif  i  >=  7  and  i  <  9  then
	 key  =  3
	 else
        break
	 end
	 if  mod(conitem,key)~=0  then
	 addnum3  =  addnum3+1
	 yinxiangnum[addnum3]  =  x892101_g_hubin2[i]
	 yinxiangnum2[addnum3]  =  mod(conitem,key)
	 end
	 if    conitem  >=  key  then
	 
	 nextcon  =  floor(conitem/key)
	 del=LuaFnDelAvailableItem(sceneId,selfId,x892101_g_hubin2[i],nextcon*key)
	 if  del  ==  1  then
	 addnum  =  x892101_g_hubin2[i+1]
	 addnum2  =  nextcon
	 for  j  =  1,nextcon  do
	 TryRecieveItem(  sceneId,  selfId,  x892101_g_hubin2[i+1],  1  )
	 end
	 end
	 
        end
	 
        end
	 if  addnum2  ==  0  then
	 x892101_ShowNotice(  sceneId,  selfId,  targetId,  " Trên ngß¶i không có H°n Bång Châu ho£c ðã b¸ khóa ",2)
	 return
	 end

	 stringt  ="Chúc m×ng các hÕ ðã hþp thành công#cFF0000 [#{_ITEM"..addnum.."}]"..addnum2.." cái #Yvà còn th×a lÕi: #cFF0000 "
	 if  getn(yinxiangnum)  >  0  then
	 for  i  =  1,getn(yinxiangnum)  do
	 stringt  =  stringt..";[#{_ITEM"..yinxiangnum[i].."}]"..yinxiangnum2[i].." cái "
        end
	 end
        LuaFnCostMoney(  sceneId,  selfId,  10000  );
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0)
	 x892101_ShowNotice(  sceneId,  selfId,  targetId,  stringt,2)
end	 	       
--**********************************
-- Võ H°n nhu§n h°n thÕch hþp thành 
--**********************************	 
function  x892101_WuhunRunHunSiHeSeng(  sceneId,  selfId,  targetId,  NumText)
        if  NumText  <  600  or  NumText  >  631  then
	 return
	 end
	 if  mod((NumText  -  600),8)+1  >=  6  then
	 x892101_NotifyFailBox(  sceneId,  selfId,    "Hi®n ta chßa cho hþp Nhu§n H°n ThÕch lên c¤p 7, höi mµt l¥n næa là sÇn ðôi dép này này... ta phóng t¾i nhé! "  )
	 return
	 end
	 local  nMoneyJB  =  GetMoney(sceneId,selfId)
	 if  nMoneyJB  <  10000  then
          x892101_NotifyFailBox(  sceneId,  selfId,    "#G Trên ngß¶i không ðü #{_MONEY10000} , Không th¬ tiªn hành thao tác! "  )
	           return
	   end
	 local  iskv  =  floor(((NumText-599)-1)/8)+1
	 local  stopid  =  mod(((NumText-599)-1),8)+2
	 if  0  >=  iskv  or  4  <  iskv  or  1  >=  stopid  or  9  <  stopid  then
	 x892101_NotifyFailBox(  sceneId,  selfId,    " không biªt sai l¥m ! ")
	 return
	 end
	 local  conitem,nextcon,del,key,addnum,addnum2,addnum3  =  0,0,0,0,0,0,0
	 local  yinxiangnum,yinxiangnum2  ={},{}
	 for  i  =  1,getn(x892101_g_runhunsi[iskv].item)-1  do
	 if  i  ==  stopid  then
	 break
	 end
	 conitem  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  x892101_g_runhunsi[iskv].item[i])
	 if  i  >=  1  and  i  <=  4  then
	 key  =  3
	 elseif  i  >=  5  and  i  <=  9  then
	 key  =  2
	 else
        break
	 end
	 if  mod(conitem,key)~=0  then
	 addnum3  =  addnum3+1
	 yinxiangnum[addnum3]  =  x892101_g_runhunsi[iskv].item[i]
	 yinxiangnum2[addnum3]  =  mod(conitem,key)
	 end
	 if    conitem  >=  key  then
	 
	 nextcon  =  floor(conitem/key)
	 del=LuaFnDelAvailableItem(sceneId,selfId,x892101_g_runhunsi[iskv].item[i],nextcon*key)
	 if  del  ==  1  then
	 addnum  =  x892101_g_runhunsi[iskv].item[i+1]
	 addnum2  =  nextcon
	 for  j  =  1,nextcon  do
	 TryRecieveItem(  sceneId,  selfId,  x892101_g_runhunsi[iskv].item[i+1],  1  )
	 end
	 end
	 
        end
	 
        end
	 if  addnum2  ==  0  then
	 x892101_ShowNotice(  sceneId,  selfId,  targetId,  " Các hÕ trên ngß¶i không có "..x892101_g_runhunsi[iskv].str.."",1)
	 return
	 end

	 stringt  =" Chúc m×ng các hÕ ðã hþp thành công#cFF0000 [#{_ITEM"..addnum.."}]"..addnum2.." cái #Yvà còn th×a lÕi:#cFF0000 "
	 if  getn(yinxiangnum)  >  0  then
	 for  i  =  1,getn(yinxiangnum)  do
	 stringt  =  stringt..",[#{_ITEM"..yinxiangnum[i].."}]"..yinxiangnum2[i].." cái "
        end
	 end
        LuaFnCostMoney(  sceneId,  selfId,  10000  );
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0)
	 x892101_ShowNotice(  sceneId,  selfId,  targetId,  stringt,1)
      
end	       
--**********************************
-- Võ H°n tång lên hþp thành c¤p b§c 
--**********************************
function  x892101_GetWh_XinXT(  sceneId,  selfId,keyids,  m_Equip_Idx,  m_Equip_Item,  keyid)
                if  not  m_Equip_Idx  or  not  m_Equip_Item  or  m_Equip_Idx  ==  nil  or  m_Equip_Item  ==  nil  then
                return
                end
    	 if  m_Equip_Idx  ==  m_Equip_Item  then
	 	 	 BeginEvent(sceneId)
	 	 AddText(sceneId," Sai v§t ph¦m ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 if  0  >  m_Equip_Idx  or  29  <  m_Equip_Idx  then
	 return
	 end  



          if  keyids  ==10  then  -- hþp thành 

	 local  ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  m_Equip_Idx  )
	 if  ret  ~=  1  then
	 	 BeginEvent(sceneId)
	 	 AddText(sceneId," bö vào c¥n hþp thành c¤p b§c ðích Võ H°n không th¬ dùng ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 
	 ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  m_Equip_Item  )
	 if  ret  ~=  1  then
	 	 BeginEvent(sceneId)
	 	 AddText(sceneId," tham dñ hþp thành Võ H°n không th¬ dùng ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 gem_index  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  m_Equip_Idx  )
	 if  gem_index  >  10156208  or  gem_index<  10156100    then
                	 BeginEvent(sceneId)
	 	 AddText(sceneId," xin/m¶i bö vào c¥n hþp thành c¤p b§c ðích Võ H°n ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	   end
	 
	 
	 index  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  m_Equip_Item  )
	 if    index  >    10156208  or  index  <    10156100    then
                	 BeginEvent(sceneId)
	 	 AddText(sceneId," M¶i bö vào Võ H°n ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
          end
	 
	 x892101_NetCo4_FixWH( sceneId, selfId, m_Equip_Idx )  -- [NetCo4 30/09]
	 x892101_NetCo4_FixWH( sceneId, selfId, m_Equip_Item )
	 if  (mod(gem_index,10)==8)    then
                	 BeginEvent(sceneId)
	 	 AddText(sceneId," Võ H°n ðã ðÕt c¤p b§c cao nh¤t, không th¬ hþp thành næa ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
        end  
	 
	 if    (mod(index,10)==8)    then
                	 BeginEvent(sceneId)
	 	 AddText(sceneId," Võ H°n ðã ðÕt c¤p b§c cao nh¤t, không th¬ hþp thành næa ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
                end
------------------------------------------------------------------------------------------
	     local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  m_Equip_Idx)  --"_q1e2t1i2p1a2d1f1q1e5z9011800000"
            local  wuhunhesen,suxian,isgsub  =  0,0,0
	     local  skilx,skilz,wuhunhesenstr
	     if  nil  ~=  skilstring  then
	     isgsub  =  1
	     skilx,skilz,wuhunhesenstr  =  strfind(skilstring,"&WH".."(%d)"..strrep("%w",21))
            if  nil  ~=  wuhunhesenstr  and  nil  ~=  skilx  then
	     wuhunhesen  =  tonumber(wuhunhesenstr)
	     if  nil  ==  wuhunhesen  then
	     wuhunhesen  =  0
	     end
	     isgsub  =  2
            end
	     end  
	     local  _,Fskilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  m_Equip_Item)  --"_q1e2t1i2p1a2d1f1q1e5z9011800000"
            local  Fwuhunhesen,Fsuxian  =  0,0,0
	     local  Fskilx,Fskilz,Fwuhunhesenstr
	     if  nil  ~=  Fskilstring  then
	     Fskilx,Fskilz,Fwuhunhesenstr  =  strfind(Fskilstring,"&WH".."(%d)"..strrep("%w",21))
            if  nil  ~=  Fwuhunhesenstr  and  nil  ~=  Fskilx  then
	     Fwuhunhesen  =  tonumber(Fwuhunhesenstr)
	     if  nil  ==  Fwuhunhesen  then
	     Fwuhunhesen  =  0
	     end
	     isgsub  =  2
	     end
	     end
              if  wuhunhesen  ~=  Fwuhunhesen  then
                              	 BeginEvent(sceneId)
	 	 AddText(sceneId," C¥n 2 Võ H°n có cùng c¤p b§c, vui lòng ki¬m tra lÕi ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
                end
	   local  ret1  =  GetGemEmbededCount(  sceneId,  selfId,  m_Equip_Item  )
	     local  ret,gamecon,biaoshi  =  x892101_sanbiaocheck(  sceneId,  selfId,m_Equip_Idx)
            if  ret  ==  0  then
            return
            end
	 
	 
        	 if  ret1  ~=  0  then
	 	 BeginEvent(sceneId)
	 	 AddText(sceneId," vây quanh bäo thÕch Võ H°n , không th¬ làm tài li®u Võ H°n tiªn hành hþp thành ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	       end
	 local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
	 local  nMoneyJB  =  GetMoney(sceneId,selfId)
	 local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
	 if  nMoneySelf  <  800000  then
        x892101_NotifyFailBox(  sceneId,  selfId,    "#GVàng không ðü "  )
        return
	 end
-------------------------------------------------------------------------------
          local  friendName,gsubnum  ="",1
	   wuhunhesen  =  wuhunhesen  +  1
          if  isgsub  ==  0  then
	   friendName  =  "&WH"..  wuhunhesen..strrep(  "0",  24  )
	   elseif  isgsub  ==  1  then
	   friendName  =  skilstring.."&WH"..  wuhunhesen..strrep(  "0",24  )
	   elseif    isgsub  ==  2  then
	       friendName,gsubnum  =  gsub(skilstring,"(&WH)%d("..strrep("%w",24)..")","%1"..  wuhunhesen.."%2")
	 	   if  0  ==  gsubnum  then
	           x892101_NotifyFailBox(  sceneId,  selfId,    " hþp thành Võ H°n th¤t bÕi ! "  )
	           return
	         end
	 	 if  wuhunhesen  >=5    then
	 	 sx  =  random(1,4)	 
	 	 friendName,gsubnum  =  gsub(skilstring,"(&WH)%d("..strrep("%w",23)..")".."(%d)","%1"..  wuhunhesen.."%2"..sx)
	 	   suxian  =1
	 	 if  0  ==  gsubnum  then
	           x892101_NotifyFailBox(  sceneId,  selfId,    " hþp thành Võ H°n th¤t bÕi ! "  )
	           return
	         end	 
	 	 end
	   end
	 gem_index  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  m_Equip_Idx  )
	 LuaFnEraseItem(  sceneId,  selfId,  m_Equip_Item  )
	 LuaFnEraseItem(  sceneId,  selfId,  m_Equip_Idx  )
	 local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  gem_index+1,  QUALITY_MUST_BE_CHANGE  )	 
        LuaFnItemBind( sceneId, selfId,bagpos01)
		LuaFnSetItemCreator(sceneId,  selfId,  bagpos01,  friendName);
	 if  gamecon  >  0  then
        x892101_sanbiaoshi(  sceneId,  selfId,bagpos01,biaoshi  )
        end
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
        LuaFnCostMoneyWithPriority(  sceneId,  selfId,  800000  );
	 if  suxian  ==  0  then
     x892101_NotifyFailBox(  sceneId,  selfId,    "#G Chúc m×ng, Võ H°n hþp thành công, Võ H°n ðÕt t¾i "..wuhunhesen.." c¤p "  )
        else
	 x892101_NotifyFailBox(  sceneId,  selfId,    "#G Chúc m×ng, Võ H°n hþp thành công, Võ H°n ðÕt t¾i "..wuhunhesen.." c¤p , và Lînh ngµ "..x892101_Kfs_Magic_tips[sx]..""  )
	 end
	 

	   end
	 
        if  keyids  ~=  nil  then  
	 if  87  ==  keyids  then
	 x892101_WuhunJinShen(  sceneId,  selfId,  m_Equip_Idx,m_Equip_Item)
	 return
	 end
	 if    keyids  ==  17  then-- n£ng t¡m Võ H°n C¥m Tinh 
	 x892101_ReSetWuhunSuXiang(  sceneId,  selfId,  m_Equip_Idx,keyid)
	 return
	 end
	 if  keyids  ==  -990  then---- phán ðoán Võ H°n phát tri¬n kÛ nång , cùng v¾i kÛ nång ðªm , cûng truy«n cho khách hàng bßng . 
	 x892101_GetWuhunSkillNum(  sceneId,  selfId,  m_Equip_Idx)
	 return
	 end
	 if  keyids  ==  20  then-- Võ H°n kÛ nång thång c¤p 
	 x892101_WuhunSkillUp(  sceneId,  selfId,  m_Equip_Idx,keyid)
	 return
	 end
	 if  keyids  ==  19  then-- Võ H°n kÛ nång n£ng t¡m 
	 x892101_WuhunSkillReSet(  sceneId,  selfId,  m_Equip_Idx)
	 return
	 end
	 if  keyids  ==  18  then-- Võ H°n kÛ nång lînh ngµ h÷c t§p 
	 x892101_WuhunSkillStudy(  sceneId,  selfId,  m_Equip_Idx)
	 return
	 end
	 if  keyids  ==  16  then-- Võ H°n phát tri¬n thuµc tính thü tiêu 
	 x892101_WuhunAttrDel(  sceneId,  selfId,  m_Equip_Idx,  keyid)
	 return
	 end
	 if  keyids  ==  15  then-- Võ H°n phát tri¬n thuµc tính n£ng t¡m 
	 x892101_WuhunAttrSub(  sceneId,  selfId,  m_Equip_Idx,  m_Equip_Item,  keyid)
	 return
	 end


	 if  m_Equip_Item  ==  -996  and  keyids  ==  -996  then---- phán ðoán Võ H°n phát tri¬n thuµc tính , cùng v¾i phát tri¬n ðªm , cûng truy«n cho khách hàng bßng . 
        x892101_GetWuhunSlotnum(  sceneId,  selfId,  m_Equip_Idx,1)
	 return
	 end
	 
	 
	 if  keyids  ==  14  then-- Võ H°n phát tri¬n thuµc tính thång c¤p 
	 x892101_WuhunAttrUpLevel(  sceneId,  selfId,  m_Equip_Idx,  m_Equip_Item,  keyid)
	 return
	 end
	 if  keyids  ==  13  then-- Võ H°n phát tri¬n thuµc tính h÷c t§p 
        x892101_WuhunAttrStudey(  sceneId,  selfId,  m_Equip_Idx,  m_Equip_Item)
	 return
	 end
	 if  keyids  ==  12  then-- Võ H°n phát tri¬n thuµc tính lan m· ra 
        x892101_WuhunTypeSlot(  sceneId,  selfId,  m_Equip_Idx,  m_Equip_Item)
	 return
	 end
	 end
	 

      end
      --*************************************************************
-- Võ H°n hþp thành c¤p b§c thông báo 
--*************************************************************

function  x892101_ShowRandomSystemNotice(  sceneId,  selfId,  strItemInfo,whunhunlevel,suxian  )
	 
	     local  PlayerName  =  GetName(sceneId,selfId)
	     local  str
	     if  suxian  ==  0  then
	     str  =  format(  "#{_INFOUSR%s}#P ðem #{_INFOMSG%s1} ðích hþp thành c¤p b§c , thành công tång lên t¾i #G%s#P c¤p ",  PlayerName,  strItemInfo,whunhunlevel  )
            else
	     str  =  format(  "#{_INFOUSR%s}#P ðem #{_INFOMSG%s1} ðích hþp thành c¤p b§c , thành công tång lên t¾i #G%s#P c¤p , cûng lînh ngµ "..x892101_Kfs_Magic_tips[suxian].."",  PlayerName,  strItemInfo,whunhunlevel)
	     end
	   BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
	 
end
function  x892101_GetIsWHNotAndLevel(  sceneId,  selfId,pos)
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  pos)
local  posx,posz,startstr,tapey,level,suxiang,whtabey,endstr  =  nil,nil,nil,nil,nil,nil,nil,nil
if  skilstring  ~=  nil  then
posx,posz,startstr,tapey,level,suxiang,whtabey,endstr  =  strfind(skilstring,"(.*)(&WH"..strrep("%w",22)..")(%d)(%d)(%d)(.*)")
end
local  isfinddiaowen  =  0
if  posx  ~=  nil  and  posz  ~=  nil  then
isfinddiaowen  =  1
else
if  skilstring  ~=  nil  then
startstr  =  skilstring
endstr  =  ""
end
end
return  isfinddiaowen,startstr,tapey,level,suxiang,whtabey,endstr
end



function  x892101_WuhunJinShen(  sceneId,  selfId,  todoso,svbzbbcf)                            -- kh¯i hþp thành 
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  todoso  )
local  msyret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  todoso  )

x892101_NotifyFailBox(  sceneId,  selfId,  " này Võ H°n hþp thành c¤p b§c ðã ðÕt t¾i cao c¤p nh¤t ")  
if  msyret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không th¬ dùng "  )
	 	 return
end
if  myitemid  ~=  10156208  and  myitemid~=  10156108    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào 8 c¤p Võ H°n "  )
	 	 return
end

local  myitemid2  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  svbzbbcf  )
local  msyret2  =  LuaFnIsItemAvailable(  sceneId,  selfId,  svbzbbcf  )
if  msyret2  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n chÑng minh không th¬ dùng "  )
	 	 return
end

if  (  myitemid2  <  38001101  or  myitemid2  >  38001108  )  then
x892101_NotifyFailBox(  sceneId,  selfId,  " n½i này chï có th¬ bö vào Võ H°n chÑng minh ")    
return
end




local  lv  =  0
lv  =mod(myitemid2,10)      
local  isfindwh,ststr,level,sux,dstr  =x892101_wuhunskuozhuan(sceneId,  selfId,todoso)--  x892101_GetIsWHNotAndLevel(  sceneId,  selfId,todoso)
if  level  ==  nil  then
level  =  0
else
if  tonumber(level)  ==  nil  then
level  =  0
end
end
level  =  tonumber(level)  
if  level  >=  8  then
x892101_NotifyFailBox(  sceneId,  selfId,  " Võ H°n ðã ðÕt t¾i cänh gi¾i cao nh¤t ")  
return
end
if  level  >=  lv  then
x892101_NotifyFailBox(  sceneId,  selfId,  " này Võ H°n hþp thành c¤p b§c ðã ðÕt t¾i "..level.." c¤p , không cách nào dùng v§t này ph¦m tång lên hþp thành c¤p b§c ")  
return
end
if  sux  ==  nil  then
sux  =  0
else
if  tonumber(sux)  ==  nil  then
sux  =  0
end
end

-----------------
	 



local  friendName  =  ""
if  isfindwh  ==  1  then
friendName  =  ststr..tostring(  lv)..tostring(sux)..dstr
else

if  ststr  ==  nil  then
friendName  =  "&WH"..  tostring(lv)..strrep(  "0",  24  )
else
friendName  =  ststr.."&WH"..tostring(lv)..strrep(  "0",24  )
end

end


if  lv  >=5    then
sx  =  random(1,4)	 
friendName,gsubnum  =  gsub(friendName,"(&WH)%d("..strrep("%w",23)..")".."(%d)","%1"..  tostring(lv).."%2"..sx)
suxian  =1	 
end	 

if  friendName  ==  ""  then
x892101_NotifyFailBox(  sceneId,  selfId,  " Võ H°n hþp thành th¤t bÕi ")  
return
end

LuaFnEraseItem(  sceneId,  selfId,  svbzbbcf  )

LuaFnSetItemCreator(sceneId,  selfId,  todoso,  friendName);
local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  todoso  )
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  50000  );
	 if  suxian  ==  0  then
        x892101_NotifyFailBox(  sceneId,  selfId,    "#G Chúc m×ng ngài, Võ H°n hþp thành công! Võ H°n ðã ðÕt t¾i "..  lv.." c¤p "  )
        else
	 x892101_NotifyFailBox(  sceneId,  selfId,    "#G Chúc m×ng ngài , Võ H°n Võ H°n hþp thành công! Võ H°n ðã ðÕt t¾i "..  lv.." c¤p , Và lînh ngµ "..x892101_Kfs_Magic_tips[sux]..""  )
	 end
x892101_ShowRandomSystemNotice(  sceneId,  selfId,  szItemTransfer,  lv,sux  )
end

function  x892101_ReSetWuhunSuXiang(  sceneId,  selfId,  equitid,keyid)    -- Võ H°n sØa ð±i C¥m Tinh 
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  equitid  )
ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  equitid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không th¬ dùng "  )
	 	 return
end
if  myitemid  >  10156208  or  myitemid<  10156100    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n "  )
	 	 return
end

if  keyid  <  1  or  keyid  >  4  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i lña ch÷n Võ H°n mu¯n thay ð±i C¥m Tinh "  )
return
end

local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  equitid)
if  skilstring  ==  nil  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào ðã có C¥m Tinh ðích Võ H°n ! ! "  )
return
end


local  skilx,skilz,WuHunSkillStr1  =  strfind(skilstring,"&WH"..strrep("%w",24).."(%d)")
if  nil  ==  skilx  or  nil  ==  skilz  or  "0"  ==  WuHunSkillStr1    then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào ðã có C¥m Tinh ðích Võ H°n ! ! "  )
return
end





local  WHSuXianLv  =  tonumber(WuHunSkillStr1)
if  0  ==  WHSuXianLv  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n ðã c¥m tinh m¾i có th¬ t¦y lÕi KÛ Nång ! ! "  )
return
end

local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  50000  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Vàng không ðü ! "  )
return
end

if  LuaFnGetAvailableItemCount(sceneId,  selfId,  30700233)  <  1  then
x892101_NotifyFailBox(  sceneId,  selfId,    "#{_ITEM30700233}  chßa ðü 1 cá ! "  )
return
end

local  friendName,iokornot  =  gsub(skilstring,"(&WH"..strrep("%w",24)..")%d","%1"..  keyid)
if  iokornot  ==  0  then
x892101_NotifyFailBox(  sceneId,  selfId,    " sØa ð±i Võ H°n C¥m Tinh th¤t bÕi ! ! "  )
return
end
LuaFnDelAvailableItem(sceneId,selfId,30700233,1)
LuaFnSetItemCreator(sceneId,  selfId,  equitid,  friendName);
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  50000  );
x892101_NotifyFailBox(  sceneId,  selfId,    " chúc m×ng ngß½i , thành công sØa ð±i Võ H°n thuµc tính vì "..x892101_Kfs_Magic_tips[keyid].." ! "  )
end
--*************************************************************************************************
---- phán ðoán Võ H°n phát tri¬n kÛ nång , cùng v¾i kÛ nång ðªm , cûng truy«n cho khách hàng bßng . 
--*************************************************************************************************	 
function  x892101_GetWuhunSkillNum(  sceneId,  selfId,  equitid)
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  equitid  )
ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  equitid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không th¬ dùng "  )
	 	 return
end
if  myitemid  >  10156208  or  myitemid<  10156100    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào Võ H°n "  )
	 	 return
end
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  equitid)  --"_q1e2t1i2p1a2d1f1q1e5z9011800000"
---- bång höa huy«n ðµc công ? bång höa huy«n ðµc kháng ? bång höa huy«n ðµc giäm kháng ? bång höa huy«n ðµc giäm ch¯ng ðßþc hÕn ( b¯n l¤y hai , t±ng cµng 8 cá m²i chiªm 2 v¸ ) , ba Võ H°n kÛ nång (3 cá m²i chiªm 2 v¸ ), hþp thành c¤p b§c (1 v¸ ) , C¥m Tinh (1 v¸ ) , Võ H°n công kích loÕi hình (1 v¸ ) , phát tri¬n thuµc tính s¯ lßþng (1 v¸ ) , Võ H°n trß¾c m£t c¤p b§c ( chiªm 2 v¸ thêm kinh nghi®m thång ðích c¤p l¾n nh¤t 120 c¤p ), phía sau 3 v¸ bäo t°n kinh nghi®m 
if  skilstring  ==  nil  then
x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n ðã Lînh Ngµ KÛ Nång nªu mu¯n tiªp tøc ! ! "  )
return
end
local  skilx,skilz,WuHunSkillStr1,WuHunSkillStr2,WuHunSkillStr3  =  strfind(skilstring,"_"..strrep("%w",16).."(%w%d)(%w%d)(%w%d)"..strrep("%w",9))
if  nil  ==  skilx  or  nil  ==  skilz  or  nil  ==  WuHunSkillStr1  or  nil  ==  WuHunSkillStr2    or  nil  ==  WuHunSkillStr3    then
x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n ðã Lînh Ngµ KÛ Nång nªu mu¯n tiªp tøc ! ! "  )
return
end
if  nil  ==  x892101_skillstrtoid[WuHunSkillStr1]  and  nil  ==  x892101_skillstrtoid[WuHunSkillStr2]  and  nil  ==  x892101_skillstrtoid[WuHunSkillStr3]  then
x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n ðã Lînh Ngµ KÛ Nång nªu mu¯n tiªp tøc ! ! "  )
return
end
if  nil  ==  x892101_WuHunSkillToItem[x892101_skillstrtoid[WuHunSkillStr1]]  and  nil  ==  x892101_WuHunSkillToItem[x892101_skillstrtoid[WuHunSkillStr2]]  and  nil  ==  x892101_WuHunSkillToItem[x892101_skillstrtoid[WuHunSkillStr3]]  then
x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n ðã Lînh Ngµ KÛ Nång nªu mu¯n tiªp tøc ! ! "  )
return
end
local  myseiseop  =  {WuHunSkillStr1,WuHunSkillStr2,WuHunSkillStr3}
local  jisum  =  0
local  missmywuhunskill  =  {}
for  i  =  1,3  do
if  nil  ~=  x892101_skillstrtoid[myseiseop[i]]  then
jisum  =  jisum  +  1
missmywuhunskill[jisum]  =  x892101_WuHunSkillToItem[x892101_skillstrtoid[myseiseop[i]]]
end
end

BeginUICommand(sceneId)
UICommand_AddInt(sceneId,equitid)
for  i  =  1,3  do
if  nil  ==  missmywuhunskill[i]  then
UICommand_AddInt(sceneId,0)
else
UICommand_AddInt(sceneId,missmywuhunskill[i])
end
end
UICommand_AddString(sceneId,"KFSWuhunSkillUp")
EndUICommand(sceneId)
DispatchUICommand(sceneId,selfId,2015021099)
end
--*************************************************************************************************
-- Võ H°n phát tri¬n kÛ nång n£ng t¡m 
--*************************************************************************************************	 
function  x892101_WuhunSkillUp(  sceneId,  selfId,  equitid,idosoebn)    --x892101_skillstrtoid
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  equitid  )
ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  equitid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không th¬ dùng "  )
	 	 return
end
if  myitemid  >  10156208  or  myitemid<  10156100    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào Võ H°n "  )
	 	 return
end


local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  equitid)  --"_q1e2t1i2p1a2d1f1q1e5z9011800000"
if  skilstring  ==  nil  then
x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n ðã Lînh Ngµ KÛ Nång nªu mu¯n tiªp tøc ! ! "  )
return
end

local  skilx,skilz,WuHunSkillStr1,WuHunSkillLv1,WuHunSkillStr2,WuHunSkillLv2,WuHunSkillStr3,WuHunSkillLv3  =  strfind(skilstring,"&WH"..strrep("%w",18).."(%w)(%d)(%w)(%d)(%w)(%d)"..strrep("%w",1))
if  nil  ==  skilx  or  nil  ==  skilz  or  nil  ==  WuHunSkillStr1  or  nil  ==  WuHunSkillStr2    or  nil  ==  WuHunSkillStr3  or  nil  ==  WuHunSkillLv1  or  nil  ==  WuHunSkillLv2    or  nil  ==  WuHunSkillLv3  then
x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n ðã Lînh Ngµ KÛ Nång nªu mu¯n tiªp tøc ! ! "  )
return
end

if  idosoebn  <  1  or  idosoebn  >  3  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i lña ch÷n mu¯n thång c¤p ðích Võ H°n kÛ nång ! ! "  )
return
end

local  strinskillstr  =  {WuHunSkillStr1,WuHunSkillStr2,WuHunSkillStr3}
local  strinskillLv  =  {WuHunSkillLv1,WuHunSkillLv2,WuHunSkillLv3}


local  myseiseop  =  {WuHunSkillStr1..WuHunSkillLv1,WuHunSkillStr2..WuHunSkillLv2,WuHunSkillStr3..WuHunSkillLv3}


if  nil  ==  x892101_skillstrtoid[myseiseop[idosoebn]]  or  nil  ==  strinskillstr[idosoebn]  or  nil  ==  strinskillLv[idosoebn]  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i lña ch÷n mu¯n thång c¤p ðích Võ H°n kÛ nång ! ! ")
return
end

local  NeWLv  =  tonumber(strinskillLv[idosoebn])
if  nil  ==  NeWLv  then
NeWLv  =  6
end
if  tonumber(strinskillLv[idosoebn])  >=  6  then
x892101_NotifyFailBox(  sceneId,  selfId,    " nên Võ H°n kÛ nång ðã ðÕt t¾i cao c¤p nh¤t , không th¬ s¨ tiªp tøc thång c¤p ! ! "  )
return
end

NeWLv  =  NeWLv+1
local  NewWuHunLv  =  strinskillstr[idosoebn]..  NeWLv
if  idosoebn  ==  1  then
NewWuHunLv  =  NewWuHunLv..myseiseop[2]..myseiseop[3]
elseif    idosoebn  ==  2  then
NewWuHunLv  =  myseiseop[1]..NewWuHunLv..myseiseop[3]
elseif      idosoebn  ==  3  then
NewWuHunLv  =  myseiseop[1]..myseiseop[2]..NewWuHunLv
else
NewWuHunLv  =  NewWuHunLv.."0000"
end
local  friendName,gsubnumis  =  gsub(  skilstring,  "(&WH"..strrep("%w",18)..")"..strrep("%w",6).."("..strrep("%w",1)..")",  "%1"..NewWuHunLv.."%2",1  )
if  0  ==  gsubnumis  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Thång c¤p kÛ nång th¤t bÕi! "  )
return
end
local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  60000  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Vàng không ðü! "  )
return
end
if  nil  ==  x892101_g_hubin2[NeWLv]  then
x892101_NotifyFailBox(  sceneId,  selfId,    " tài li®u bi¬u sai l¥m ! "  )
return
end
if  LuaFnGetAvailableItemCount(sceneId,  selfId,  x892101_g_hubin2[NeWLv])  <  1  then
x892101_NotifyFailBox(  sceneId,  selfId,    "#{_ITEM"..x892101_g_hubin2[NeWLv].."}  chßa ðü 1 cái ! "  )
return
end
DelSkill(sceneId,  selfId,  x892101_skillstrtoid[myseiseop[idosoebn]])
AddSkill(    sceneId,  selfId,  x892101_skillstrtoid[myseiseop[idosoebn]]+1)
LuaFnDelAvailableItem(sceneId,selfId,x892101_g_hubin2[NeWLv],1)
LuaFnSetItemCreator(sceneId,  selfId,  equitid,  friendName);
local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  equitid  )
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  60000  );
x892101_NotifyFailBox(  sceneId,  selfId,    " Chúc m×ng ngài, Ðã thång c¤p kÛ nång Võ H°n thành công! ")
x892101_GetWuhunSkillNum(  sceneId,  selfId,  equitid)
end
--*************************************************************************************************
-- Võ H°n phát tri¬n kÛ nång n£ng t¡m 
--*************************************************************************************************	 
-- [NetCo4 09/10] Custom Vo Hon (trang admin bot: Cong cu > Custom Vo Hon). Linh ngo / tay chieu doc ti le tu file duoi
-- moi lan bam (sua file co hieu luc ngay, khong can restart). Dong file: "<nhom> <chu>:<trong so> ..." - nhom 1 = o 1,
-- 2 = o 2, 3 = o 3 Luu Ly Diem (10156200-208), 4 = o 3 Ngu Dao Ban (10156100-108); "giucap 1" = tay giu cap tung o.
-- Khong co file / nhom khong co dong / tong trong so 0 -> chon deu nhu GM cu.
x892101_NetCo4_VHFile = "./txt/NetCo4Cfg/vohon.txt"
function x892101_NetCo4_VHCfg()
	local cfg = { w = {}, giucap = 0 }
	local h = openfile( x892101_NetCo4_VHFile, "r" )
	if h == nil then
		return cfg
	end
	local line = read( h, "*l" )
	while line do
		local _, _, k, rest = strfind( line, "^(%w+)%s+(.*)$" )
		if k == "giucap" then
			if strfind( rest, "^1" ) then
				cfg.giucap = 1
			end
		elseif k and tonumber( k ) then
			local w = {}
			local pos = 1
			while 1 do
				local a, b, c, n = strfind( rest, "(%a):(%d+)", pos )
				if a == nil then
					break
				end
				w[c] = tonumber( n )
				pos = b + 1
			end
			cfg.w[ tonumber( k ) ] = w
		end
		line = read( h, "*l" )
	end
	closefile( h )
	return cfg
end

-- chon 1 chi so trong x892101_g_WuHunSkill[nhom] theo trong so
function x892101_NetCo4_Chon( cfg, nhom )
	local ds = x892101_g_WuHunSkill[nhom]
	local w = cfg.w[nhom]
	local tong = 0
	if w then
		for i = 1, getn( ds ) do
			tong = tong + ( w[ ds[i] ] or 0 )
		end
	end
	if tong <= 0 then
		return random( 1, getn( ds ) )
	end
	local r = random( 1, tong )
	for i = 1, getn( ds ) do
		r = r - ( w[ ds[i] ] or 0 )
		if r <= 0 then
			return i
		end
	end
	return getn( ds )
end

-- 3 chieu moi: tra ve chuoi 6 ky tu (chu + cap x 3) va 3 ma ky nang. capcu = chuoi cu (jn) khi tay, nil khi linh ngo.
-- O 3: Luu Ly Diem theo MA (ban goc so ten VISCII "luu ly diem" voi ten GBK trong EquipBase -> khong bao gio khop).
function x892101_NetCo4_Roll3( myitemid, capcu )
	local cfg = x892101_NetCo4_VHCfg()
	local nhom = { 1, 2, 4 }
	if myitemid >= 10156200 then
		nhom[3] = 3
	end
	local s = ""
	local ids = {}
	for o = 1, 3 do
		local chu = x892101_g_WuHunSkill[ nhom[o] ][ x892101_NetCo4_Chon( cfg, nhom[o] ) ]
		local cap = 1
		if capcu and cfg.giucap == 1 then
			cap = tonumber( strsub( capcu, o * 2, o * 2 ) ) or 1
			if cap < 1 or cap > 6 then
				cap = 1
			end
		end
		local id = x892101_skillstrtoid[ chu .. cap ]
		if id == nil then
			cap = 1
			id = x892101_skillstrtoid[ chu .. "1" ]
		end
		s = s .. chu .. cap
		ids[o] = id
	end
	return s, ids
end

-- go MOI chieu Vo Hon khoi nhan vat (cap 1-6: 1361-1600, cap 7-8: 1652-1731; ban goc sot 1384 Ngu The cap 6) roi them 3 chieu moi
function x892101_NetCo4_GanChieu( sceneId, selfId, ids )
	for i = 1361, 1600 do
		DelSkill( sceneId, selfId, i )
	end
	for i = 1652, 1731 do
		DelSkill( sceneId, selfId, i )
	end
	for o = 1, 3 do
		if ids[o] then
			AddSkill( sceneId, selfId, ids[o] )
		end
	end
end

function  x892101_WuhunSkillReSet(  sceneId,  selfId,  equitid)
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  equitid  )
ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  equitid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không th¬ dùng "  )
	 	 return
end
if  myitemid  >  10156208  or  myitemid<  10156100    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n "  )
	 	 return
end
  local  isko,kz,r,d,sx,jn=  x892101_Get_WH_SX(sceneId,  selfId,equitid)
  local  isok,startstr1,number2,number1,sridnes1  =  x892101_wuhunskuozhuan(sceneId,  selfId,equitid)
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  equitid)
if  skilstring  ==  nil  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i trß¾c lînh ngµ Võ H°n kÛ nång ! ! "  )
return
end

if  tonumber(  number2)  <4  then  
	 
x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n hþp thành dß¾i c¤m 4 không th¬ có KÛ Nång "  )	 
	 return
end	 




if  strlen(jn)  ~=  6  then  
x892101_NotifyFailBox(  sceneId,  selfId,    " trß¾c m£t Võ H°n không th¬ lînh ngµ kÛ nång ! ! "  )	 
	 return
end	 
  if  strsub(jn,1,2)  ==  "00"  or  strsub(jn,3,4)  ==  "00"    or  strsub(jn,5,6)  ==  "00"    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Chßa Lînh Ngµ KÛ Nång không th¬ T¦y KÛ Nång "  )
	 return
end
local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  50000  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Vàng không ðü "  )
return
end
if  LuaFnGetAvailableItemCount(sceneId,  selfId,  30700213)  <  10  then
x892101_NotifyFailBox(  sceneId,  selfId,    "[#{_ITEM30700213}] chßa ðü 10 cá ! ! "  )
return
end  

local  chuoimoi,  idsmoi  =  x892101_NetCo4_Roll3(  myitemid,  jn  )   -- [NetCo4 09/10] ti le theo trang admin (vohon.txt), giu cap neu bat
friendName,gsubnumis  =  gsub(  skilstring,  "(&WH"..strrep("%w",18)..")".."%w%w".."%w%w".."%w%w(%w)",  "%1"..chuoimoi.."%2",1  )

if  gsubnumis  ==  0  then
x892101_NotifyFailBox(  sceneId,  selfId," T¦y KÛ Nång Võ H°n Th¤t BÕi "  )
return	 
end	 

x892101_NetCo4_GanChieu(  sceneId,  selfId,  idsmoi  )   -- [NetCo4 09/10] doi chieu SAU khi kiem xong (ban goc doi truoc roi moi kiem gsub)
LuaFnDelAvailableItem(sceneId,selfId,30700213,10)
LuaFnSetItemCreator(sceneId,  selfId,  equitid,  friendName);
local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  equitid  )
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  50000  );
x892101_NotifyFailBox(  sceneId,  selfId,    " Chúc m×ng ngài, Tr÷ng T¦y KÛ Nång Võ H°n thành công ! "  )



end
--*************************************************************************************************
-- Võ H°n phát tri¬n kÛ nång lînh ngµ 
--*************************************************************************************************	 
function  x892101_WuhunSkillStudy(  sceneId,  selfId,  equitid)    -- Võ H°n kÛ nång lînh ngµ OK
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  equitid  )
ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  equitid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không th¬ dùng "  )
	 	 return
end
if  myitemid  >  10156208  or  myitemid<  10156100    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n "  )
	 	 return
end
  local  isko,kz,r,d,sx,jn    =  x892101_Get_WH_SX(sceneId,  selfId,equitid)
  local  isok,startstr1,number2,number1,sridnes1  =  x892101_wuhunskuozhuan(sceneId,  selfId,equitid)
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  equitid)  
if  skilstring  ==  nil  then
x892101_NotifyFailBox(  sceneId,  selfId,    " trß¾c m£t Võ H°n không th¬ lînh ngµ kÛ nång ! ! "  )
return
end

if  tonumber(number2)  ==  nil  or  tonumber(number2)  <8  then  
x892101_NotifyFailBox(  sceneId,  selfId,    " trß¾c m£t Võ H°n không th¬ lînh ngµ kÛ nång chï có hþp thành c¤p b§c ðªn 8 c¤p m¾i có th¬ lînh ngµ ! ! "  )	 
return
end

if  strlen(jn)  ~=  6  then  
x892101_NotifyFailBox(  sceneId,  selfId,    " trß¾c m£t Võ H°n không th¬ lînh ngµ kÛ nång ! ! "  )	 
	 return
end	 


-- [NetCo4 09/10] kiem "da linh ngo" + tien TRUOC (ban goc them chieu cho nhan vat roi moi kiem -> thieu tien van duoc chieu)
  if  strsub(jn,1,2)  ~=  "00"  or  strsub(jn,3,4)  ~=  "00"    or  strsub(jn,5,6)  ~=  "00"    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " trß¾c m¡t c¤p b§c không có có th¬ lînh ngµ kÛ nång "  )
	 return
end


local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  50000  then
x892101_NotifyFailBox(  sceneId,  selfId,    "Vàng không ðü "  )
return
end
local  chuoimoi,  idsmoi  =  x892101_NetCo4_Roll3(  myitemid,  nil  )   -- [NetCo4 09/10] ti le theo trang admin (vohon.txt), cap 1
friendName,gsubnumis  =  gsub(  skilstring,  "(&WH"..strrep("%w",18)..")".."%w%w".."%w%w".."%w%w(%w)",  "%1"..chuoimoi.."%2",1  )
if  0  ==  gsubnumis    then
x892101_NotifyFailBox(  sceneId,  selfId,    " lînh ngµ kÛ nång th¤t bÕi "  )
return
end  




x892101_NetCo4_GanChieu(  sceneId,  selfId,  idsmoi  )
LuaFnSetItemCreator(sceneId,  selfId,  equitid,  friendName);
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  50000  );
x892101_NotifyFailBox(  sceneId,  selfId,    " chúc m×ng ngß½i , thành công lînh ngµ Võ H°n kÛ nång ! "  )  
end

--*************************************************************************************************
-- Võ H°n phát tri¬n thuµc tính thü tiêu     OK
--*************************************************************************************************	 
function  x892101_WuhunAttrDel(  sceneId,  selfId,  equitid,  idssea)
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  equitid  )
ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  equitid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không th¬ dùng "  )
	 	 return
end
if  myitemid  >  10156208  or  myitemid<  10156100    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào Võ H°n "  )
	 	 return
end
local  _,_,_,_,_,_,shuxtab  =  x892101_Get_WH_SX(sceneId,  selfId,equitid)
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  equitid)  --"_q1e2t1i2p1a2d1f1q1e5z9011800000"
if  skilstring  ==  nil  then
return
end

local  qfb=  {}
local  qfbb=  {}
if  getn(shuxtab)  >0  then  
	 for  i  =  1  ,  getn(shuxtab)  do  
                  if  shuxtab[i]  ~=  nil  then  
	 	 	 
                        tinsert(qfbb,strsub(shuxtab[i],1,1))
	 	 	 tinsert(qfb,strsub(shuxtab[i],2,2))
	 	 end  
	 end
end  	 

if  1  >  idssea  or  8  <  idssea  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i lña ch÷n mu¯n thü tiêu ðích Võ H°n phát tri¬n thuµc tính "  )
return
end

if  getn(shuxtab)  <1  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không có nhßng thü tiêu ðích phát tri¬n thuµc tính "  )
return
end

local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  80000  then
x892101_NotifyFailBox(  sceneId,  selfId,    "#GVàng không ðü "  )
return
end
gsubnumis  =  0
local  friendName,gsubnumis  =  gsub(skilstring,  tostring(qfbb[idssea]..qfb[idssea]),  "00",1  )
if  0  ==  gsubnumis    then
x892101_NotifyFailBox(  sceneId,  selfId,    " thü tiêu Võ H°n phát tri¬n thuµc tính th¤t bÕi ! "  )
return
end
LuaFnSetItemCreator(sceneId,  selfId,  equitid,  friendName);
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  80000  );
x892101_NotifyFailBox(  sceneId,  selfId,    " chúc m×ng ngß½i , Võ H°n "..x892101_iText[qfbb[idssea]].." phát tri¬n thuµc tính thü tiêu thành công ! "  )
end
--*************************************************************************************************
-- Võ H°n n£ng t¡m phát tri¬n thuµc tính 
--*************************************************************************************************	 	 	 
function  x892101_WuhunAttrSub(  sceneId,  selfId,  equitid,  itemid,  idssea)
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  equitid  )
local  myitemid2  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  itemid  )
if  myitemid  >  10156208  or  myitemid<  10156100    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào Võ H°n "  )
	 	 return
end
ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  equitid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không th¬ dùng "  )
	 	 return
	 end
ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  itemid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Ñc h°n thÕch không th¬ dùng "  )
	 	 return
	 end
	 
local  isko,kz,r,d,sx,jn,shuxtab  =  x892101_Get_WH_SX(sceneId,  selfId,equitid)	 
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  equitid)  --"_q1e2t1i2p1a2d1f1q1e5z9011800000"
---- bång höa huy«n ðµc công ? bång höa huy«n ðµc kháng ? bång höa huy«n ðµc giäm kháng ? bång höa huy«n ðµc giäm ch¯ng ðßþc hÕn ( b¯n l¤y hai , t±ng cµng 8 cá m²i chiªm 2 v¸ ) , ba Võ H°n kÛ nång (3 cá m²i chiªm 2 v¸ ), hþp thành c¤p b§c (1 v¸ ) , C¥m Tinh (1 v¸ ) , Võ H°n công kích loÕi hình (1 v¸ ) , phát tri¬n thuµc tính s¯ lßþng (1 v¸ ) , Võ H°n trß¾c m£t c¤p b§c ( chiªm 2 v¸ thêm kinh nghi®m thång ðích c¤p l¾n nh¤t 120 c¤p ), phía sau 3 v¸ bäo t°n kinh nghi®m 
if  skilstring  ==  nil  then
return
end
if  tonumber(kz)  <1  then
return
end
  
if  1  >  idssea  or  8  <  idssea  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n s¯ li®u sai l¥m "  )
return
end





if  nil  ==  x892101_mysuxinpos[idssea]  then
return
end
local  skilstring2  =  strsub(skilstring1,x892101_mysuxinpos[idssea],x892101_mysuxinpos[idssea])
if  nil  ==  skilstring2  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Sai S¯ Li®u  "  )
return
end

if  nil  ==  x892101_WuhunAttrSubItem[skilstring2]  or  nil  ==  x892101_iText[skilstring2]  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Sai S¯ Li®u "  )
return
end

if  nil  ==  x892101_WuhunAttrSubItem[skilstring2][myitemid2]  then
local  puttoitem  =  ""
for  i  =  1,getn(x892101_WuhunAttrSubItem[skilstring2].SubItemitem)  do
if  nil  ~=  x892101_WuhunAttrSubItem[skilstring2].SubItemitem[i]  then
if  i  ~=  getn(x892101_WuhunAttrSubItem[skilstring2].SubItemitem)  then
puttoitem  =  puttoitem.."[#{_ITEM"..x892101_WuhunAttrSubItem[skilstring2].SubItemitem[i].."}] ho£c "
else
puttoitem  =  puttoitem.."[#{_ITEM"..x892101_WuhunAttrSubItem[skilstring2].SubItemitem[i].."}]"
end
end
end
x892101_NotifyFailBox(  sceneId,  selfId,  " M¶i bö vào "..puttoitem  )
return
end

local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  50000  then
x892101_NotifyFailBox(  sceneId,  selfId,    "#GVàng không ðü "  )
return
end
if  nil  ==  x892101_iText[x892101_WuhunAttrSubItem[skilstring2][myitemid2]]  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n s¯ li®u sai l¥m "  )
return
end
local  repstring1,repstring2  =  strfind(skilstring1,x892101_WuhunAttrSubItem[skilstring2][myitemid2])
if  nil  ~=  repstring1  or  nil  ~=  repstring2  then
x892101_NotifyFailBox(  sceneId,  selfId,    "#G Không th¬ ðem "..x892101_iText[skilstring2].." Tr÷ng T¦y "..x892101_iText[x892101_WuhunAttrSubItem[skilstring2][myitemid2]].." Thuµc Tính ! "  )
return
end
local  skilstring3,gsubnumis  =  "",0
if  1  ==  idssea  then
skilstring3,gsubnumis  =  gsub(skilstring1,""..skilstring2.."("..strrep("%w",15)..")",""..x892101_WuhunAttrSubItem[skilstring2][myitemid2].."%1",1)
elseif  8  ==  idssea  then
skilstring3,gsubnumis  =  gsub(skilstring1,"("..strrep("%w",14)..")"..skilstring2.."(%d)","%1"..x892101_WuhunAttrSubItem[skilstring2][myitemid2].."%2",1)
else
skilstring3,gsubnumis  =  gsub(skilstring1,"("..strrep("%w",x892101_mysuxinpos[idssea]-1)..")"..""..skilstring2.."".."("..strrep("%w",16-x892101_mysuxinpos[idssea])..")","%1"..x892101_WuhunAttrSubItem[skilstring2][myitemid2].."%2",1)
end
if  0  ==  gsubnumis    then
x892101_NotifyFailBox(  sceneId,  selfId,    " Phát Tri¬n KÛ Nång Võ H°n th¤t bÕi ! "  )
return
end
gsubnumis  =  0
local  friendName,gsubnumis  =  gsub(  skilstring,  "_"..strrep("%w",16),  "_"..skilstring3,1  )
if  0  ==  gsubnumis    then
x892101_NotifyFailBox(  sceneId,  selfId,    " Phát Tri¬n KÛ Nång Võ H°n th¤t bÕi ! "  )
return
end
LuaFnSetItemCreator(sceneId,  selfId,  equitid,  friendName);
local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  equitid  )
local  yihunsi  =  GetBagItemTransfer(  sceneId,  selfId,  itemid  )
LuaFnEraseItem(  sceneId,  selfId,  itemid  )
--x892101_WuhunAttrSubGongGao(  sceneId,  selfId,  szItemTransfer,yihunsi,x892101_iText[skilstring2],x892101_iText[x892101_WuhunAttrSubItem[skilstring2][myitemid2]]  )
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  50000  );
x892101_NotifyFailBox(  sceneId,  selfId,    " Chúc m×ng , Võ H°n "..x892101_iText[skilstring2].." Tr÷ng T¦y Thuµc Tính "..x892101_iText[x892101_WuhunAttrSubItem[skilstring2][myitemid2]].." Thành Công ! "  )
x892101_GetWuhunSlotnum(  sceneId,  selfId,  equitid,2)  

end
--*************************************************************************************************
-- Võ H°n n£ng t¡m phát tri¬n thông báo 
--*************************************************************************************************	 	 	 
function  x892101_WuhunAttrSubGongGao(  sceneId,  selfId,  szItemTransfer,yihunsi,yuansuxin,newsuxin  )
	     local  PlayerName  =  GetName(sceneId,selfId)
	     str  =  format(  "#{_INFOUSR%s}#Y tiêu hao #G1#Y cá #{_INFOMSG"..yihunsi.."} ðem #{_INFOMSG%s1} ðích #B"..yuansuxin.."#Y n£ng t¡m vì #G"..newsuxin.."#Y . ",  PlayerName,  szItemTransfer  )
	   BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
end
--*************************************************************************************************
-- Võ H°n tång lên phát tri¬n thuµc tính 
--*************************************************************************************************	 	 	 
function  x892101_WuhunAttrUpLevel(  sceneId,  selfId,  equitid,  itemid,idssea)
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  equitid  )
local  myitemid2  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  itemid  )

if  myitemid  >  10156208  or  myitemid<  10156100    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n "  )
	 	 return
end

ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  equitid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n không th¬ dùng "  )
	 	 return
	 end
ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  itemid  )
if  ret  ~=  1  then
        x892101_NotifyFailBox(  sceneId,  selfId,    " Nhu§n H°n ThÕc không th¬ dùng "  )
	 	 return
	 end


local  _,_,_,_,_,_,shuxtab  =  x892101_Get_WH_SX(sceneId,  selfId,equitid)
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  equitid)  --"_q1e2t1i2p1a2d1f1q1e5z9011800000"
---- bång höa huy«n ðµc công ? bång höa huy«n ðµc kháng ? bång höa huy«n ðµc giäm kháng ? bång höa huy«n ðµc giäm ch¯ng ðßþc hÕn ( b¯n l¤y hai , t±ng cµng 8 cá m²i chiªm 2 v¸ ) , ba Võ H°n kÛ nång (3 cá m²i chiªm 2 v¸ ), hþp thành c¤p b§c (1 v¸ ) , C¥m Tinh (1 v¸ ) , Võ H°n công kích loÕi hình (1 v¸ ) , phát tri¬n thuµc tính s¯ lßþng (1 v¸ ) , Võ H°n trß¾c m£t c¤p b§c ( chiªm 2 v¸ thêm kinh nghi®m thång ðích c¤p l¾n nh¤t 120 c¤p ), phía sau 3 v¸ bäo t°n kinh nghi®m 
if  skilstring  ==  nil  then
return
end  
if  1  >  idssea  or  8  <  idssea  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n s¯ li®u sai l¥m "  )
return
end

local  qfb=  {}
local  qfbb=  {}
if  getn(shuxtab)  >0  then  
	 for  i  =  1  ,  getn(shuxtab)  do  
                  if  shuxtab[i]  ~=  nil  then  
	 	 	 
                        tinsert(qfbb,strsub(shuxtab[i],1,1))
	 	 	 tinsert(qfb,strsub(shuxtab[i],2,2))
	 	 end  
	 end
end  	 




if  8  <=  tonumber(  qfb[idssea])  then
x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n "..x892101_iText[qfbb[idssea]].." phát tri¬n thuµc tính ðã là cao c¤p nh¤t , không th¬ s¨ tiªp tøc tång lên ! ! "  )
return
end
if  x892101_WuhunSuxingve[qfbb[idssea]][tonumber(  qfb[idssea])]  ~=  myitemid2  then
x892101_NotifyFailBox(  sceneId,  selfId,    " C¥n [#{_ITEM"..x892101_WuhunSuxingve[qfbb[idssea]][tonumber(  qfb[idssea]+0)].."}]"  )
return
end
local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  50000  then
x892101_NotifyFailBox(  sceneId,  selfId,    "#G Vàng không ðü ! "  )
return
end
skilstring3,gsubnumis  =  gsub(skilstring,tostring(  qfbb[idssea]..qfb[idssea]),tostring(qfbb[idssea]..(tonumber(  qfb[idssea])+1)),1)  
if  0  ==  gsubnumis    then
x892101_NotifyFailBox(  sceneId,  selfId,    " Võ H°n thång c¤p phát tri¬n thuµc tính th¤t bÕi ! "  )
return
end
LuaFnSetItemCreator(sceneId,  selfId,  equitid,  skilstring3);
local  runhustr  =  GetBagItemTransfer(  sceneId,  selfId,  itemid  )
LuaFnEraseItem(  sceneId,  selfId,  itemid  )
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  50000  );
x892101_NotifyFailBox(  sceneId,  selfId,    " chúc m×ng ngß½i , thành công tång lên Võ H°n "..x892101_iText[qfbb[idssea]].." phát tri¬n thuµc tính ðªn "..(tonumber(  qfb[idssea])+1)  .." c¤p ! "  )
end
--***************************************************************************
-- Võ H°n tång lên phát tri¬n thuµc tính thông báo 
--***************************************************************************
function  x892101_WuhunAttrUpLevelGongGao(  sceneId,  selfId,  szItemTransfer,runhu,WHLevel,kuozhanstr  )
	     local  PlayerName  =  GetName(sceneId,selfId)
	     str  =  format(  "#{_INFOUSR%s} l½ ðãng ðem #{_INFOMSG%s1} cùng #{_INFOMSG"..runhu.."} tiªn hành dung hþp , "..kuozhanstr.." tång lên vì "..WHLevel.." c¤p ",  PlayerName,  szItemTransfer  )
	   BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
	 
end

--***************************************************************************
-- phán ðoán Võ H°n phát tri¬n thuµc tính , cùng v¾i phát tri¬n ðªm , cûng truy«n cho khách hàng bßng . 
--***************************************************************************
function  x892101_GetWuhunSlotnum(  sceneId,  selfId,  pos,UpOrNot)  
if  pos  <  0  or  pos  >  29  then
pos  =  0
end
local  myitemid  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  pos  )
if  myitemid  >  10156208  or  myitemid<  10156100    then
        x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào Võ H°n "  )
	 	 return
end
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  pos)  --"_q1e2t1i2p1a2d1f1q1e5z9011800000"
---- bång höa huy«n ðµc công ? bång höa huy«n ðµc kháng ? bång höa huy«n ðµc giäm kháng ? bång höa huy«n ðµc giäm ch¯ng ðßþc hÕn ( b¯n l¤y hai , t±ng cµng 8 cá m²i chiªm 2 v¸ ) , ba Võ H°n kÛ nång (3 cá m²i chiªm 2 v¸ ), hþp thành c¤p b§c (1 v¸ ) , C¥m Tinh (1 v¸ ) , Võ H°n công kích loÕi hình (1 v¸ ) , phát tri¬n thuµc tính s¯ lßþng (1 v¸ ) , Võ H°n trß¾c m£t c¤p b§c ( chiªm 2 v¸ thêm kinh nghi®m thång ðích c¤p l¾n nh¤t 120 c¤p ), phía sau 3 v¸ bäo t°n kinh nghi®m 
if  skilstring  ==  nil  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào ðã h÷c t§p phát tri¬n thuµc tính ðích Võ H°n "  )
return
end
local  skilx,skilz  =  strfind(skilstring,"_")
if  skilx  ==  nil  or  skilz  ==  nil  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào ðã h÷c t§p phát tri¬n thuµc tính ðích Võ H°n "  )
return
end


local  skilstring2  =  strsub(skilstring,skilz+26,skilz+26)
if  skilstring2  ==  nil  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào ðã h÷c t§p phát tri¬n thuµc tính ðích Võ H°n "  )
return  
end
local  kzlan  =  tonumber(skilstring2)
if  nil  ==  kzlan  or  8  <  kzlan  then
kzlan  =  0
end
if  0  >=  kzlan  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào ðã h÷c t§p phát tri¬n thuµc tính ðích Võ H°n "  )
return  
end

local  skilstring1  =  strsub(skilstring,skilz+1,skilz+16)
if  skilstring1  ==  nil  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào ðã h÷c t§p phát tri¬n thuµc tính ðích Võ H°n "  )
return  
end
local  liststr  =  {"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h"}
local  isokornot,fix,fiz  =  0
for  i  =  1,16  do
fix,fiz  =  strfind(skilstring1,liststr[i])
if  fix  ~=  nil  and  fiz  ~=  nil  then
isokornot  =  1
break
end
end
if  0  ==  isokornot  then
x892101_NotifyFailBox(  sceneId,  selfId,    " xin/m¶i bö vào ðã h÷c t§p phát tri¬n thuµc tính ðích Võ H°n "  )
return  
end

BeginUICommand(sceneId)
UICommand_AddInt(sceneId,pos)
UICommand_AddInt(sceneId,tonumber(skilstring2))
UICommand_AddInt(sceneId,UpOrNot)
UICommand_AddString(sceneId,"WuhunExtraPropertyUp")
UICommand_AddString(sceneId,skilstring1)
EndUICommand(sceneId)
DispatchUICommand(sceneId,selfId,2011072899)
end    
--**********************************
-- Võ H°n m· ra phát tri¬n thuµc tính lan 
--**********************************
function  x892101_WuhunTypeSlot(  sceneId,  selfId,  m_Equip_Idx,  m_Equip_Item)      -- Võ H°n m· ra phát tri¬n thuµc tính lan dùng cho m· ra phát tri¬n 
	 	 if  m_Equip_Idx  ==  m_Equip_Item  then
	 	 x892101_NotifyFailBox(  sceneId,  selfId,    " Sai v§t ph¦m "  )
	 	 return
	         end
        local  ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  m_Equip_Idx  )
	 if  ret  ~=  1  then
	 	 x892101_NotifyFailBox(  sceneId,  selfId,    " bö vào mu¯n m· ra phát tri¬n thuµc tính lan ðích Võ H°n ! ! "  )
	 	 return
	 end
	 ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  m_Equip_Item  )
	 if  ret  ~=  1  then
	 	 x892101_NotifyFailBox(  sceneId,  selfId,    " M¶i bö vào [#{_ITEM20310158}] ho£c [#{_ITEM20310159}]"  )
	 	 return
	 end
	 
	 local  gem_index  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  m_Equip_Idx  )
	 local  equippoint  =  GetItemEquipPoint(gem_index)  
	 if  equippoint  ~=  10    then
                	 BeginEvent(sceneId)
	 	 AddText(sceneId," chï có Võ H°n m¾i có th¬ m· ra phát tri¬n thuµc tính lan ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	   end
	   
	 local    index  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  m_Equip_Item  )

	 if    index  ~=    20310158  and  index  ~=    20310159    then
                	 BeginEvent(sceneId)
	 	 AddText(sceneId," xin/m¶i bö vào [#{_ITEM20310158}] ho£c [#{_ITEM20310159}]");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
        end
	 
	 
	 
	 local  isok,startstr1,number2,number1,sridnes1  =  x892101_wuhunskuozhuan(sceneId,  selfId,m_Equip_Idx)
	   if  isok  ==  0  then
	     	 	 x892101_NotifyFailBox(  sceneId,  selfId,    " C¥n tång thêm c¤p cho #YVõ H°n "  )
	 	 return
	   end
      if  isok  ==  1  then
	   if  number1  >=  8  then
	     	 	 x892101_NotifyFailBox(  sceneId,  selfId,    " Ðã ðÕt cänh gi¾i cao nh¤t! "  )
	 	 return
	     end  
	   if  number1  >=  number2  then
	     	 	 x892101_NotifyFailBox(  sceneId,  selfId,    " C¥n tång thêm c¤p cho #YVõ H°n "  )
	 	 return
	   end
	   end  
	 local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
	 local  nMoneyJB  =  GetMoney(sceneId,selfId)
	 local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
	 if  nMoneySelf  <  800000  then
                                  x892101_NotifyFailBox(  sceneId,  selfId,    "#GVàng không ðü "  )
	           return
	 end
	 	 number1  =  number1+1  
	         local  friendName  =  startstr1..  number2..  number1..sridnes1
	 	 if  friendName  ==  nil  then
	 	 friendName  =  ""
	 	 end
                LuaFnSetItemCreator(sceneId,  selfId,  m_Equip_Idx,  friendName);
	 	 local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  m_Equip_Idx  )
	 	 LuaFnEraseItem(  sceneId,  selfId,  m_Equip_Item  )
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
                LuaFnCostMoneyWithPriority(  sceneId,  selfId,  800000  );
                x892101_NotifyFailBox(  sceneId,  selfId,    "#G Chúc m×ng, m· rµng ô KÛ Nång thành công ! "  )	 
end
--*************************************************************
-- Võ H°n m· ra phát tri¬n lan phán ðoán 
--*************************************************************
-- [NetCo4 30/09] Vo Hon nang cap bang menu "Thang cap vo hon" (new/event/wuhun/wuyazi.lua) chi doi ID
-- (10156101 -> 102...) ma KHONG ghi chuoi &WH<cap hop thanh>, nen duc lo / hop thanh coi no la cap 0.
-- Ham nay: chua co &WH thi ghi &WH<so cuoi ID> + 24 so 0 (dung dinh dang isgsub==0 cua hop thanh goc).
function x892101_NetCo4_FixWH( sceneId, selfId, pos )
	if pos == nil or pos < 0 or pos > 29 then
		return
	end
	local itemid = LuaFnGetItemTableIndexByIndex( sceneId, selfId, pos )
	if itemid < 10156100 or itemid > 10156208 then
		return
	end
	local _, cur = LuaFnGetItemCreator( sceneId, selfId, pos )
	if cur ~= nil and strfind( cur, "&WH" ) ~= nil then
		return
	end
	local lvl = mod( itemid, 10 )
	if lvl > 8 then
		lvl = 8
	end
	local moi = "&WH" .. lvl .. strrep( "0", 24 )
	if cur ~= nil and cur ~= "" then
		moi = cur .. moi
	end
	LuaFnSetItemCreator( sceneId, selfId, pos, moi )
end

function  x892101_wuhunskuozhuan(sceneId,  selfId,pos)    ---- Võ H°n m· ra phát tri¬n lan phán ðoán 
x892101_NetCo4_FixWH( sceneId, selfId, pos )  -- [NetCo4 30/09]
if  pos  <  0  or  pos  >  29  then
pos  =  0
end

local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  pos)  --"_q1e2t1i2p1a2d1f1q1e5z9011800000"
if  skilstring  ==  nil  then
return  0
end
local  skilx,skilz,startstr,henchenlevel,kuozhanglevel,endstr  =  strfind(skilstring,".*(&WH)(%w)(%w)("..strrep("%w",23)..")(.*)")
if  skilx  ==  nil  or  skilz  ==  nil  then
return  0
end
if  henchenlevel  ==  nil  then
return  0
end


local  num  =  tonumber(henchenlevel)
if  nil  ==  num  then
num  =  0
end


local  num2  =  tonumber(kuozhanglevel)

if  nil  ==  num2  then
num2  =  0
end
return  1,startstr,num,num2,endstr
end
--**********************************
-- Võ H°n m· ra phát tri¬n thuµc tính lan thông báo 
--**********************************      
function  x892101_ShowRandomSystemNoticekbkz(  sceneId,  selfId,  strItemInfo,kuozang  )
	     local  PlayerName  =  GetName(sceneId,selfId)
	 local    str  =  format(  "#{_INFOUSR%s}#P thành công tång lên #{_INFOMSG%s1} ðích phát tri¬n thuµc tính lan ðªn "..kuozang.." cá . ",  PlayerName,  strItemInfo  )
	   BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
end
--*************************************************************
-- thü tiêu Võ H°n phát tri¬n 
--*************************************************************
function  x892101_ReomveWuHunSuXing(  sceneId,  selfId,posindex1,posindex2,posindex3)

end                          


--*************************************************************
-- Võ H°n h÷c t§p phát tri¬n thuµc tính 
--*************************************************************
function  x892101_WuhunAttrStudey(  sceneId,  selfId,  m_Equip_Idx,  m_Equip_Item)
	 if  m_Equip_Idx  ==  m_Equip_Item  then
	 	 	 BeginEvent(sceneId)
	 	 AddText(sceneId," Sai v§t ph¦m ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 local  ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  m_Equip_Idx  )
	 if  ret  ~=  1  then
	 	 BeginEvent(sceneId)
	 	 AddText(sceneId," bö vào Võ H°n không th¬ dùng ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 
	 ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  m_Equip_Item  )
	 if  ret  ~=  1  then
	 	 BeginEvent(sceneId)
	 	 AddText(sceneId," Sách Võ H°n thuµc tính không th¬ dùng ! ! ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 
	 local  gem_index  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  m_Equip_Idx  )
	 if  gem_index  >  10156208  or  gem_index<  10156100    then
                	 BeginEvent(sceneId)
	 	 AddText(sceneId," xin/m¶i bö vào c¥n h÷c t§p phát tri¬n thuµc tính ðích Võ H°n ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	   end
	   local  gem_index1  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  m_Equip_Item  )
	   if  x892101_WuhunAttr_Book[gem_index1]  ==  nil  then
	         BeginEvent(sceneId)
	 	 AddText(sceneId," xin/m¶i bö vào c¥n h÷c t§p phát tri¬n thuµc tính ðích ð¯i Ñng Võ H°n thuµc tính sách ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	   end
	 
	   local  isko,kz,r,d,sx,jn    =  x892101_Get_WH_SX(sceneId,  selfId,m_Equip_Idx)
	   if  isko  ==  0  then
	   	 BeginEvent(sceneId)
	 	 AddText(sceneId," trß¾c hªt m· ra phát tri¬n thuµc tính ! ! ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	   end
	 
	 if  r  >=8  then  
	 x892101_NotifyFailBox(  sceneId,  selfId,    " Không th¬ h÷c thêm thuµc tính "  )	 
	 	 return
	 end	 
	 
	 
	   if  r  >=tonumber(  kz)  then
	   	 BeginEvent(sceneId)
	 	 AddText(sceneId," xin/m¶i trß¾c tång lên phát tri¬n thuµc tính lan ðªm ! ! ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	   end  
	 
	   local  skilx,skilz  =  strfind(sx,x892101_WuhunAttr_Book[gem_index1])
	   if  skilx  ~=  nil  or  skilz  ~=  nil  then
	   	 BeginEvent(sceneId)
	 	 AddText(sceneId," Sách KÛ nång này ðã ðßþc h÷c t§p ");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	   return
	   end
	 
	 local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
	 local  nMoneyJB  =  GetMoney(sceneId,selfId)
	 local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
	 if  nMoneySelf  <  50000  then
        x892101_NotifyFailBox(  sceneId,  selfId,    "#G Vàng không ðü ! "  )
	 return
	 end    
	 	   
	 local  tihuanhstr,P  =  gsub(sx,"00",x892101_WuhunAttr_Book[gem_index1].."1",1)  
	 if  tihuanhstr  ==  nil  or  p  ==0    then
	 x892101_NotifyFailBox(  sceneId,  selfId,    " không biªt sai l¥m ! ! "  )
	 return
	 end
        
	 local  _,u=LuaFnGetItemCreator(sceneId,  selfId,  m_Equip_Idx)
	 
      local  Name,p  =gsub(u,sx,tihuanhstr,1);
      if  Name  ==  nil  or  p  ==  0  then
      x892101_NotifyFailBox(  sceneId,  selfId,    " không biªt sai l¥m ! ! "  )
      return
      end
                LuaFnSetItemCreator(sceneId,  selfId,  m_Equip_Idx,  Name);
	 	 LuaFnEraseItem(  sceneId,  selfId,  m_Equip_Item  )
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
                LuaFnCostMoneyWithPriority(  sceneId,  selfId,  50000  );
                x892101_NotifyFailBox(  sceneId,  selfId,    "#G Chúc m×ng ,Võ H°n phát tri¬n thuµc tính thành công! "  )	 
end

function  x892101_Get_WH_SX(sceneId,  selfId,pos)
local  shuxingtab  =  {}	 
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,pos)  
if  skilstring  ==  nil  then  
	 return  0,0,0,0,0,0,0
end	 
local  starpos1,endpos1,kz,sx,jn  =  nil,nil,0,nil,nil
starpos1,endpos1,kz,sx,jn,sx1  =  strfind(skilstring,"&WH%w(%w)("..strrep("%w",16)..")("..strrep("%w",6)..")(%w)")	 

if  starpos1  ==nil  or  endpos1  ==  nil  then  
return  0,0,0,0,0,0,0
end	 
local  r,d  =0,0

if  sx  ~=  nil  and  strlen(sx)==16  then  
for  i=1,16,2  do  
if  strsub(sx,i,i+1)  ~=  "00"  then  
tinsert(shuxingtab,strsub(sx,i,i+1))	 
r  =r+1  
end
end    
end	 
if  jn~=  nil  and  strlen(jn)==6  then  
for  i=1,6,2  do  
if  strsub(sx,i,i+1)  ~=  "00"  then  
d  =d+1  
end
end  	 
end	 
return  1,kz,r,d,sx,jn  ,shuxingtab
end	 
--*************************************************************
-- Võ H°n h÷c t§p phát tri¬n thuµc tính thông báo 
--*************************************************************
function  x892101_ShowRandomSystemstudeykz(  sceneId,  selfId,  strItemInfo,kuozhanstr  )
	 local  PlayerName  =  GetName(sceneId,selfId)
	 local  str  =  ""
	 if  nil  ==  kuozhanstr  then
	 str  =  format(  "#{_INFOUSR%s}#ccccc66 phí hªt tâm tß , r¯t cøc ð¬ cho #{_INFOMSG%s1}#ccccc66 thu ðßþc phát tri¬n thuµc tính ",  PlayerName,  strItemInfo  )
	 else
	 str  =  format(  "#{_INFOUSR%s}#ccccc66 phí hªt tâm tß , r¯t cøc ð¬ cho #{_INFOMSG%s1}#ccccc66 thu ðßþc "..kuozhanstr.." phát tri¬n thuµc tính ",  PlayerName,  strItemInfo  )
	 end
	 BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
end    
--*************************************************************
-- Võ H°n h÷c t§p phát tri¬n thuµc tính phán ðoán 
--*************************************************************
function  x892101_WuhunAttrlist(  sceneId,  selfId,  pos)
if  pos  <  0  or  pos  >  29  then
pos  =  0
end
local  _,skilstring  =  LuaFnGetItemCreator(sceneId,  selfId,  pos)  --"_q1e2t1i2p1a2d1f1q1e5z9011800"
-- bång höa huy«n ðµc công ? bång höa huy«n ðµc kháng ? bång höa huy«n ðµc giäm kháng ? bång höa huy«n ðµc giäm ch¯ng ðßþc hÕn ( b¯n l¤y hai ) , ba Võ H°n kÛ nång , hþp thành c¤p b§c , C¥m Tinh , Võ H°n công kích loÕi hình , phát tri¬n thuµc tính s¯ lßþng , Võ H°n trß¾c m£t c¤p b§c ( thêm kinh nghi®m thång ðích c¤p l¾n nh¤t 120 c¤p )
if  skilstring  ==  nil  then
return  0
end
local  long  =          strlen(skilstring)
local  skilx,skilz  =  strfind(skilstring,"_")
if  skilx  ==  nil  or  skilz  ==  nil  then
return  0
end
local  skilstring1  =  strsub(skilstring,skilz+1,skilz+16)
if  skilstring1  ==  nil  then
return  0
end
local  skilstring2  =  strsub(skilstring,skilz+26,skilz+26)
if  skilstring2  ==  nil  then
return  0
end


local  num  =  tonumber(skilstring2)
if  nil  ==  num  or  8  <  num  then
num  =  0
end
-- tr· v«   suy lu§n , có phát tri¬n ðªm , phát tri¬n thuµc tính tñ phù chu²i , _ v¸ trí , toàn bµ tñ phù chu²i , ðã h÷c t§p phát tri¬n s¯ lßþng 
return  1,num,skilstring1,skilz,skilstring,CallScriptFunction((892112),  "wuhunSuXingCheck",sceneId,selfId,pos)

end
--**********************************
--  -- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x892101_NotifyFailBox(  sceneId,  selfId,    msg  )
	 BeginEvent(sceneId)
	 AddText(sceneId,msg)
	 EndEvent(sceneId)
	 DispatchMissionTips(sceneId,selfId)

end
-- nhà ch½i màn änh trung gian ð« kÏ 
function  x892101_ShowNotice(  sceneId,  selfId,targetId,    strNotice,key)
	 BeginEvent(sceneId)
	 AddText(sceneId,strNotice)
	 if  nil  ~=  key  and  key  ==  1  then
	 AddNumText(sceneId,x892101_g_ScriptId," Tr· lÕi ",8,131)
	 end
	 if  nil  ~=  key  and  key  ==  2  then
	 AddNumText(sceneId,x892101_g_ScriptId," Tr· lÕi ",8,132)
	 end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

function  x892101_sanbiaocheck(  sceneId,  selfId,Index)
	 local  ret  =  GetGemEmbededCount(  sceneId,  selfId,  Index  )
	 if  ret  ~=  0  then
	 	 local  materbagspace  =  LuaFnGetMaterialBagSpace(  sceneId,  selfId)
	 	 if  materbagspace  <  1  then
	 	 x892101_NotifyFailBox(  sceneId,  selfId,  " tài li®u lan xin/m¶i lßu mµt vô ích cách "  )
	 	 return  0,0,{}
	       end
	 end
	 local  equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  Index  )
	 local  biaoshi  =  {}
	 local  gemEmbededIdx  =  -1
	 local  jisu  =  0
	 if  equipMaxGemCount  >  0  then
	 for  i  =  0,equipMaxGemCount-1  do
	 gemEmbededIdx  =  GetGemEmbededType(  sceneId,  selfId,  Index,  i  )
	 if  gemEmbededIdx  >  0  then
	 jisu  =  jisu  +  1
	 biaoshi[jisu]  =  gemEmbededIdx
	 end
	 end	 
	 end
return  1,equipMaxGemCount,biaoshi	 
end	 

function  x892101_sanbiaoshi(  sceneId,  selfId,pos,biaoshilist  )
if  biaoshilist  ==  nil  or  getn(biaoshilist)  <=  0  then
return
end
local  ret  =  0
local  equipMaxGemCount  =  0
while  equipMaxGemCount  <  getn(biaoshilist)  do
if  equipMaxGemCount  >=  getn(biaoshilist)  then
break
end	 
if  equipMaxGemCount  <  3  then	 
ret  =  AddBagItemSlot(  sceneId,  selfId,  pos  )
end
if    equipMaxGemCount  ==  3  then	 
ret  =  AddBagItemSlotFour(  sceneId,  selfId,  pos  )
end	 
equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  pos  )
end
for  i  =  1,getn(biaoshilist)  do
local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  biaoshilist[i],  1  )
if  bagpos01  ~=  -1  then
GemEnchasing(  sceneId,  selfId,  bagpos01,  pos  )
end
end

end
