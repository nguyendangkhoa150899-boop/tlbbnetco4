


--×÷Õß By UK QQ 2269169441


x350011_g_ScriptId	= 350011
x350011_g_BUFFID = {}
x350011_g_BUFFID[1]={"¾ÛÐÇÕó¡¤³¤Éú",16916,"Trß¶ng Sinh Tinh Tr§n",30000,3000}
x350011_g_BUFFID[2]={"¾øÐÇÕó¡¤ÆÆ¾ü",16917,"Phá Quân Tinh Tr§n",10000,3000}
x350011_g_BUFFID[3]={"¾ÛÐÇÕó¡¤ÒõÑô",16918,"Âm Dß½ng Tinh Tr§n",10000,3000}
x350011_g_BUFFID[4]={"¾øÐÇÕó¡¤ÆßÉ±",16927,"Th¤t Sát Tinh Tr§n",15000,3000}
x350011_g_BUFFID[5]={"ËõµØ³É´ç"}
x350011_g_BUFFID[6]={"¾øÐÇÕó¡¤Ì°ÀÇ",16928,"Tham Lang Tinh Tr§n",15000,3000}
x350011_g_BUFFID[7]={"ÆÆ¾ü¾øÐÇÕó",16917,"Phá Quân Tinh Tr§n",10000,3000}
x350011_g_BUFFID[8]={"³¤Éú¾ÛÐÇÕó",16916,"Trß¶ng Sinh Tinh Tr§n",30000,3000}
x350011_g_BUFFID[9]={"ÆÆ¾ü¾øÐÇÕó",16917,"Phá Quân Tinh Tr§n",10000,3000}
x350011_g_BUFFID[10]={"ÆÆ¾ü¾øÐÇÕó",16917,"Phá Quân Tinh Tr§n",10000,3000}
function x350011_OnDefaultEvent( sceneId, selfId, targetId)
end
function x350011_OnEventRequest( sceneId, selfId, targetId, eventId )
end
function x350011_OnImpactFadeOut( sceneId, selfId, impactId)
	if GetHp( sceneId, selfId ) == 0 then
		return
	end
local mymaxhp = GetMaxHp( sceneId, selfId )	
local misspos = GetMissionData( sceneId, selfId, GUIGU_XINGZHEN)
local myid = floor(misspos/1000000)
local PlayerX,PlayerZ = GetWorldPos(sceneId,selfId)
if myid ~= 5 then
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 1147) == 1 then
PlayerX,PlayerZ = floor(mod(misspos,1000000)/1000),mod(misspos,1000)
SetPos(sceneId, selfId, PlayerX, PlayerZ)
return
end
end
if myid == 5 then
local targetid = GetMissionData( sceneId, selfId, MF_GetNewUserCard9)
if targetid > 1 then
local objType = GetCharacterType( sceneId, targetid )
if objType == 1 and IsInDist( sceneId, selfId, targetid, 15 ) ~= 1 then
x350011_Tips( sceneId, selfId, "Møc tiêu vô hi®u" )
end
if  objType == 1 and IsInDist( sceneId, selfId, targetid, 15 ) == 1 and LuaFnHaveImpactOfSpecificDataIndex(sceneId, targetid, 1174) == 0 and LuaFnIsObjValid(sceneId, targetid) == 1 and LuaFnIsCharacterLiving(sceneId, targetid) == 1 and 1 == LuaFnUnitIsFriend(sceneId, targetid, selfId) then
SetPos(sceneId, targetid, PlayerX, PlayerZ)
SetPos(sceneId, selfId, PlayerX, PlayerZ)
LuaFnSendSpecificImpactToUnit(sceneId, targetid, targetid, targetid, 1174, 0);
end
end
local PlayerX,PlayerZ = floor(mod(misspos,1000000)/1000),mod(misspos,1000)
--SetPos(sceneId, selfId, PlayerX, PlayerZ)
--SetPos(sceneId, selfId, 61, 70)
return
end
if x350011_g_BUFFID[myid] == nil or x350011_g_BUFFID[myid][2] == nil or x350011_g_BUFFID[myid][3] == nil or x350011_g_BUFFID[myid][4] == nil then
return
end
local MonsterID = LuaFnCreateMonster(sceneId, x350011_g_BUFFID[myid][2], PlayerX, PlayerZ, 6, -1, 350011 )
if MonsterID < 0 then
return
end
mymaxhp2 = floor(mymaxhp*0.15)
if mymaxhp2 < 1 then
mymaxhp2 = 1
end
SetHp(sceneId,MonsterID,mymaxhp2)
mymaxhp2 = floor(mymaxhp*0.03)
if mymaxhp2 < 1 then
mymaxhp2 = 1
end
if myid == 4 then
mymaxhp2 = floor(mymaxhp*0.01)
if mymaxhp2 < 1 then
mymaxhp2 = 1
end
elseif myid == 3 then
		local cold = GetHumanAttr(sceneId, selfId, 3)
		local fire = GetHumanAttr(sceneId, selfId, 4)
		local light = GetHumanAttr(sceneId, selfId, 5)
		local poison = GetHumanAttr(sceneId, selfId, 6)
		local mysuxinglist ={{name = "1", mynowLevel = cold},{name = "2", mynowLevel = fire},{name = "3", mynowLevel = light},{name = "4", mynowLevel = poison}}
		mysuxinglist = funct(sceneId, mysuxinglist)
local maxsuxing = tonumber(mysuxinglist[1].mynowLevel)
mymaxhp2 = floor(maxsuxing/200)
if mymaxhp2 < 1 then
mymaxhp2 = 1
end
if mymaxhp2 > 100 then
mymaxhp2 = 100
end
elseif myid == 6 then
		local cold = GetHumanAttr(sceneId, selfId, 3)
		local fire = GetHumanAttr(sceneId, selfId, 4)
		local light = GetHumanAttr(sceneId, selfId, 5)
		local poison = GetHumanAttr(sceneId, selfId, 6)
		local mysuxinglist ={{name = "1", mynowLevel = cold},{name = "2", mynowLevel = fire},{name = "3", mynowLevel = light},{name = "4", mynowLevel = poison}}
		mysuxinglist = funct(sceneId, mysuxinglist)
local maxsuxing = tonumber(mysuxinglist[1].mynowLevel)
mymaxhp2 = floor((maxsuxing*0.1)/50)-1
if mymaxhp2 < 0 then
mymaxhp2 = 0
end
if mymaxhp2 > 39 then
mymaxhp2 = 39
end
mymaxhp2 = mymaxhp2*10+tonumber(mysuxinglist[1].name)
end
LuaFnSetMonsterExp(sceneId, MonsterID, 0);
LuaFnDisableMonsterDropBox(sceneId, MonsterID);
LuaFnSetNpcIntParameter( sceneId,MonsterID,1,selfId)
SetCurCamp(sceneId, MonsterID, MonsterID, GetCurCamp(sceneId, selfId, selfId))
LuaFnSetNpcIntParameter( sceneId,MonsterID,0,mymaxhp2)
SetCharacterDieTime(sceneId, MonsterID, x350011_g_BUFFID[myid][4])
SetCharacterTimer( sceneId, MonsterID, x350011_g_BUFFID[myid][5])
local myname = GetName(sceneId,selfId)
SetCharacterName(sceneId, MonsterID, x350011_g_BUFFID[myid][3])
PlayerX,PlayerZ = floor(mod(misspos,1000000)/1000),mod(misspos,1000)
SetPos(sceneId, selfId, PlayerX, PlayerZ)
end

--**********************************
--Íæ¼ÒÆÁÄ»ÖÐ¼äÌáÊ¾
--**********************************
function x350011_Tips( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--Monster Timer
--**********************************
function x350011_OnCharacterTimer( sceneId, objId, dataId, uTime )
    local selfId = LuaFnGetNpcIntParameter( sceneId,objId,1)   
	if GetHp( sceneId, objId ) == 0 or LuaFnIsObjValid(sceneId, selfId) ~= 1 or LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end
    local mostername = GetName(sceneId, objId)
	local stringmyswo = strsub(mostername,-13)
	if LuaFnIsObjValid(sceneId, selfId) ~= 1 or LuaFnIsCanDoScriptLogic(sceneId, selfId) ~= 1 or LuaFnIsCharacterLiving(sceneId, selfId) ~= 1  then
	return
	end
	if stringmyswo == "Sát Tinh Tr§n" then
	local PlayerList = {}
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if IsInDist( sceneId, nHumanId, objId, 11 ) == 1 and selfId ~= nHumanId and 1 == LuaFnUnitIsEnemy(sceneId, nHumanId, selfId) and LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
		numPlayer = numPlayer+1
		PlayerList[numPlayer] = nHumanId
		end
	end
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if IsInDist( sceneId, MonsterId, objId, 11 ) == 1 and objId ~= MonsterId and 1 == LuaFnUnitIsEnemy(sceneId, MonsterId, selfId) and LuaFnIsObjValid(sceneId, MonsterId) == 1 and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
		numPlayer = numPlayer+1
		PlayerList[numPlayer] = MonsterId
		end
	end

if numPlayer < 1 then
return
end
local xuhuannum = random(1,6)
if numPlayer < xuhuannum then
xuhuannum = numPlayer
end
local suijiguole = {}
for i = 1,xuhuannum do
suijiguole[i] = -1
end
for i = 1,xuhuannum do
local retplayer = random(1,numPlayer)
for j = 1,xuhuannum do
if PlayerList[retplayer] ~= nil and PlayerList[retplayer] ~= suijiguole[j] then
LuaFnSetDamage(sceneId, selfId, PlayerList[retplayer], LuaFnGetNpcIntParameter( sceneId,objId,0))
LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, PlayerList[retplayer], 1163, 0);
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, PlayerList[retplayer], 206) == 1 then
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, PlayerList[retplayer], 409, 0);
else
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, PlayerList[retplayer], 206, 0);
end
suijiguole[j] = PlayerList[retplayer]
break
end
end
end
    return
	end

	if stringmyswo == "inh Tinh Tr§n" or stringmyswo == "½ng Tinh Tr§n" or stringmyswo == "ang Tinh Tr§n" then
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	x350011_DoAutoGetExpLogic( sceneId, selfId , objId,stringmyswo)
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1  then
		x350011_DoAutoGetExpLogic( sceneId, PlayerId , objId,stringmyswo)
		end
	end
	elseif stringmyswo == "uân Tinh Tr§n" then
	local targetid = GetMissionData( sceneId, selfId, MF_GetNewUserCard8)
	if targetid > 0 and IsInDist( sceneId, targetid, objId, 11 ) == 1 and targetid ~= objId and IsInDist( sceneId, targetid, selfId, 30 ) == 1 and targetid ~= selfId and 1 == LuaFnUnitIsEnemy(sceneId, targetid, selfId) and LuaFnIsObjValid(sceneId, targetid) == 1 and LuaFnIsCharacterLiving(sceneId, targetid) == 1 then
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetid, 1130, 0);
	end
	end

end
function x350011_DoAutoGetExpLogic( sceneId, selfId, objId,stringmyswo)
if stringmyswo == "inh Tinh Tr§n" then
if IsInDist( sceneId, selfId, objId, 11 ) == 1 and 1 ~= LuaFnUnitIsEnemy(sceneId, selfId, objId) then
LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, selfId, 1177, 0);
IncreaseHp( sceneId, selfId, LuaFnGetNpcIntParameter( sceneId,objId,0))
end
elseif stringmyswo == "½ng Tinh Tr§n" then
local targetid = LuaFnGetNpcIntParameter( sceneId,objId,0)
if targetid > 100 then
targetid = 100
end
if targetid > 0 then
local mybuffidlistgandonw = {1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109}
LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, selfId, mybuffidlistgandonw[targetid], 0);
end	
elseif stringmyswo == "ang Tinh Tr§n" then
if IsInDist( sceneId, selfId, objId, 11 ) == 1 and 1 ~= LuaFnUnitIsEnemy(sceneId, selfId, objId) then
local myvalue = LuaFnGetNpcIntParameter( sceneId,objId,0)
local mybuffidlist = {}
mybuffidlist[1] = {1180,1181,1182,1183,1184,1185,1186,1187,1188,1189,1190,1191,1192,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,1219}
mybuffidlist[2] = {1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1238,1239,1240,1241,1242,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,1254,1255,1256,1257,1258,1259}
mybuffidlist[3] = {1260,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271,1272,1273,1274,1275,1276,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299}
mybuffidlist[4] = {1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339}
if mod(myvalue,10) == 1 then
LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, selfId, mybuffidlist[1][floor(myvalue/10)+1], 0);
elseif mod(myvalue,10) == 2 then
LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, selfId, mybuffidlist[2][floor(myvalue/10)+1], 0);
elseif mod(myvalue,10) == 3 then
LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, selfId, mybuffidlist[3][floor(myvalue/10)+1], 0);
elseif mod(myvalue,10) == 4 then
LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, selfId, mybuffidlist[4][floor(myvalue/10)+1], 0);
end
end
end
end
--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x350011_OnDie( sceneId, selfId, killerId )

end