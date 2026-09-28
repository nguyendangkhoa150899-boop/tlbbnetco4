
x990012_g_scriptId = 990012
------**********************************
------事件交互入口tT
------**********************************

function x990012_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent( sceneId )	
	AddText(sceneId,"   #R帮会据点玩法介绍：玩家通过争夺后帮主可在此处进行归属地领取！领取后可使用头像下方的据点版块地图，传送进入自己的帮会领地。")
	AddText(sceneId,"   #G报名时间：每周五下午一点至晚上七点。#R争夺时间：每周五晚上八点至十点#B据点每5小时会刷新超级boss奖励丰厚")
    local nQuarter = mod(GetQuarterTime(),100);
	local nWeek = GetTodayWeek()
    if nWeek ~= 5 then
	AddNumText( sceneId, x990012_g_scriptId, "敦煌  <"..GetName(sceneId,154)..">", 6, 1)--没到点的时候是这个选项
    elseif nQuarter >= 80 and nQuarter < 84 and nWeek == 5 then
	AddNumText( sceneId, x990012_g_scriptId, "#b#G敦煌  <正在争夺>", 6, 11)--没到点的时候是这个选项
	end
	if nWeek ~= 5 then
	AddNumText( sceneId, x990012_g_scriptId, "雁南  <"..GetName(sceneId,153)..">", 6, 2)
    elseif nQuarter >= 80 and nQuarter < 84 and nWeek == 5 then
	AddNumText( sceneId, x990012_g_scriptId, "#b#G雁南  <正在争夺>", 6, 21)	
	end
	AddNumText( sceneId, x990012_g_scriptId, "#ccccccc嵩山  <未 开 放>", 6, 3)
	AddNumText( sceneId, x990012_g_scriptId, "据点领取/补领(帮主)", 6, 4)
	AddNumText( sceneId, x990012_g_scriptId, "#cFF0000<敦煌据点战报名>", 6, 5)
	AddNumText( sceneId, x990012_g_scriptId, "#cFF0000<雁南据点战报名>", 6, 6)
	AddNumText( sceneId, x990012_g_scriptId, "查看据点情况", 6, 8888)
	AddNumText( sceneId, x990012_g_scriptId, "#ccccccc持续更新更多据点", 6, 99999)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

------**********************************
------事件列表选中一项
------**********************************
function x990012_OnEventRequest(sceneId,selfId,targetId,eventId)

---据点领取开始
if GetNumText() == 4 then
    BeginEvent( sceneId )
	AddText(sceneId,"   最强帮会的实力象征,战无不胜.血染八荒!")
    AddNumText( sceneId, x990012_g_scriptId, "#cFF0000敦煌  <认领>", 6, 44)
	AddNumText( sceneId, x990012_g_scriptId, "#cFF0000雁南  <认领>", 6, 45)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
if GetNumText() == 44 then --敦煌
    if LuaFnGetAvailableItemCount(sceneId, selfId, 40004848) < 1 then
       x990012_NotifyTip( sceneId, selfId, "请查看是否存在或已加锁" )
      return
    end
	if GetGuildPos( sceneId, selfId ) ~= GUILD_POSITION_CHIEFTAIN then	
	return
	end
local str1 = LuaFnGetGuildName( sceneId, selfId )	
SetCharacterName(sceneId,154,str1)
    str = format( str1.."帮会的帮主#{_INFOUSR%s}#H拿出自家兄弟浴血奋战得到的[据点令]#H，在盟印处成功了领取了敦煌作为自家据点",GetName(sceneId,selfId))
    BroadMsgByChatPipe( sceneId, selfId,str, 4 )	
end
if GetNumText() == 45 then --雁南
     if LuaFnGetAvailableItemCount(sceneId, selfId, 40004849) < 1 then
       x990012_NotifyTip( sceneId, selfId, "请查看是否存在或已加锁" )
      return
    end
	if GetGuildPos( sceneId, selfId ) ~= GUILD_POSITION_CHIEFTAIN then	
	return
	end	
local str1 = LuaFnGetGuildName( sceneId, selfId )	
SetCharacterName(sceneId,153,str1)
    str = format( str1.."帮会的帮主#{_INFOUSR%s}#H拿出自家兄弟浴血奋战得到的[据点令]#H，在盟印处成功了领取了雁南作为自家据点",GetName(sceneId,selfId))
    BroadMsgByChatPipe( sceneId, selfId,str, 4 )	
end
---据点领取结束



--完善报名，先由帮主进行据点选择报名
if GetNumText() == 5 then
local nyols = openfile("./txt/JuDian/BaoMing.txt", "r")
local str1 = LuaFnGetGuildName( sceneId, selfId )
local BJJJJJ = 0
if nyols ~= nil then
for i=1, 10 do
local line = read(nyols, "*l") --ID
if line == nil then
break
end
if strfind(line,str1) ~= nil and strfind(line,str1) ~= "" then
BJJJJJ = 1
end

end
end
BeginEvent( sceneId )
AddText(sceneId,"   #R需要由帮主先报名#G(或者您是帮主已经报名)#R确认本帮会需要占领的据地，随后其余人才能报名。")
if BJJJJJ == 0 and GetGuildPos( sceneId, selfId ) == GUILD_POSITION_CHIEFTAIN then
AddNumText( sceneId, x990012_g_scriptId, "#cFF0000<确认报名？>", 6, 55)
elseif BJJJJJ == 1 and GetGuildPos( sceneId, selfId ) ~= GUILD_POSITION_CHIEFTAIN then
AddNumText( sceneId, x990012_g_scriptId, "#cFF0000<确认报名？>", 6, 55)
end
EndEvent( sceneId )
DispatchEventList( sceneId, selfId, targetId )

end

if GetNumText() == 6 then
local nyols = openfile("./txt/JuDian/BaoMing.txt", "r")
local str1 = LuaFnGetGuildName( sceneId, selfId )
local dddiie = 0
if nyols ~= nil then
for i=1, 10 do
local line = read(nyols, "*l") --ID
if line == nil then
break
end
if strfind(line,str1) ~= nil and strfind(line,str1) ~= "" then
dddiie = 1
end

end
end
BeginEvent( sceneId )
AddText(sceneId,"   #R需要由帮主先报名#G(或者您是帮主已经报名)#R确认本帮会需要占领的据地，随后其余人才能报名。")
if dddiie == 0 and GetGuildPos( sceneId, selfId ) == GUILD_POSITION_CHIEFTAIN then
AddNumText( sceneId, x990012_g_scriptId, "#cFF0000<确认报名？>", 6, 66)
elseif dddiie == 1 and GetGuildPos( sceneId, selfId ) ~= GUILD_POSITION_CHIEFTAIN then
AddNumText( sceneId, x990012_g_scriptId, "#cFF0000<确认报名？>", 6, 66)
end
EndEvent( sceneId )
DispatchEventList( sceneId, selfId, targetId )

end

if GetNumText() == 8888 then
---先读数据吧。
local MyName = {}

local nyols = openfile("./txt/JuDian/BaoMing.txt", "r")
if nyols ~= nil then

for i=1, 10 do
local line = read(nyols, "*l") --ID
if line == nil then
break
end

MyName[i] = line
end

end
---读取数据结束



	  BeginUICommand( sceneId )
	  for i = 1,10 do
	  if MyName[i] == nil then
	  MyName[i] =""
	  end
	  UICommand_AddString(sceneId,tostring(MyName[i])..",")     	 	  
	  end
	  UICommand_AddString( sceneId,GetName(sceneId,154))--敦煌据点是否有
	  UICommand_AddString( sceneId,GetName(sceneId,153))--雁南据点是否有
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId,  20190613)
end



local str1 = LuaFnGetGuildName( sceneId, selfId )--玩家自己的帮会名字
local nQuarter = mod(GetQuarterTime(),100);--获取时间
---***据点敦煌 446 据点雁南 447
--CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 446, 159, 66, 20 );

if GetNumText() == 1 then--进入敦煌据点已占领

if str1 == GetName(sceneId,154) then--判断玩家和占领的帮会名称是否一样
CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 446, 276, 147, 20 );
else
x990012_NotifyTip( sceneId, selfId, "   #R您所在的帮会和占领帮会不一样，无法进入别人的领地" )--提示玩家帮会名称不一样，不能进入
end


end

if GetNumText() == 11 then--进入敦煌据点正在争夺
if GetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP) ~= 1 then
x990012_NotifyTip( sceneId, selfId, "   您还没有报名，无法进入" )
return
end
if nQuarter < 80 or nQuarter >= 84 then
x990012_NotifyTip( sceneId, selfId, "   #R未到时间或有问题，请联系GM处理" )
return
end

if str1 == GetName(sceneId,154) then--判断玩家和占领的帮会名称是否一样
CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 446, 65, 52, 20 );
else
CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 446, 68, 94, 20 );
end
SetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP,0)
DelItem( sceneId, selfId, 40004848, 1 )
end


if GetNumText() == 2 then--进入敦煌据点已占领

if str1 == GetName(sceneId,153) then--判断玩家和占领的帮会名称是否一样
CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 447, 265, 282, 20 );
else
x990012_NotifyTip( sceneId, selfId, "   #R您所在的帮会和占领帮会不一样，无法进入别人的领地" )--提示玩家帮会名称不一样，不能进入
end


end

if GetNumText() == 21 then--进入敦煌据点正在争夺
if GetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP) ~= 1 then
x990012_NotifyTip( sceneId, selfId, "   您还没有报名，无法进入" )
return
end
if nQuarter < 80 or nQuarter >= 84 then
x990012_NotifyTip( sceneId, selfId, "   #R未到时间或有问题，请联系GM处理" )
return
end

if str1 == GetName(sceneId,153) then--判断玩家和占领的帮会名称是否一样
CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 447, 37, 209, 20 );
else
CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 447, 44, 173, 20 );
end
SetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP,0)
DelItem( sceneId, selfId, 40004849, 1 )
end



if GetNumText() == 55 then--敦煌报名

	if GetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP) == 1 then
	 x990012_NotifyTip(sceneId,selfId,"您已经报名过了，不要重复报名")
	 return
	end

---检测报名的时候是否已有帮会报名信息
local num = 0
local handle1 = openfile("./txt/JuDian/BaoMing.txt", "r")
if handle1 ~= nil then
local str1 = LuaFnGetGuildName( sceneId, selfId )
for i=1, 20 do--目前只考虑20个帮会 一般肯定够用
local line=read(handle1, "*l")
			if line == nil then --没有
				break
			end
			if strfind(line,str1) ~= nil and strfind(line,str1) ~= "" then --已有
				num=1
				break
			end
end
closefile(handle1)
end


---检测报名的时候是否已有帮会报名信息

if num == 0 then -- 没有时直接写入
local nyols = openfile("./txt/JuDian/BaoMing.txt", "a")
local str1 = LuaFnGetGuildName( sceneId, selfId )
if str1 == nil or str1 == "空" then
str1 = "空"
end
local str2 = LuaFnGetName( sceneId, selfId )
local PingFen = GetMissionData( sceneId, selfId, 400 )
local strax = str1..","..PingFen..",敦煌\n"
	if nil ~= nyols then
	if strax == nil then
	strax = "" 
	end
		write(nyols, strax)
		closefile(nyols)
	end	

	SetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP,1)
	 x990012_NotifyTip(sceneId,selfId,"恭喜您报名成功")
end

if num == 1 then--有的时候读数据开始计算评分
local MyGuildName = ""
local MyGuildNamea = ""
local handle1 = ""
local sssscce = 0
local PingFen = GetMissionData( sceneId, selfId, 400 )
local str1 = LuaFnGetGuildName( sceneId, selfId )
local nyols = openfile("./txt/JuDian/BaoMing.txt", "r")
if nyols ~= nil then

for i=1, 60 do
local line = read(nyols, "*l") --ID
if line == nil then
break
end
if strfind(line,str1) ~= nil and strfind(line,str1) ~= "" then
local changdu = strlen(str1)--帮会名称长度
local nnnn = strfind(line,str1)--帮会名称起始位置

--取评分值
local sssss = strfind(line,",",1)
local changdua = strlen(line)--整体长度

--
local MyGuildName =  strsub( line,changdu+2,changdu+changdua )--取值

local ddddd = strfind(MyGuildName,",",1)

MyGuildNamea =  strsub( MyGuildName,ddddd-1000,ddddd-1 )--取值评分

line = str1..","..tonumber(MyGuildNamea) + PingFen..",敦煌"
sssscce = 1
end
handle1 = handle1..line.."\n"


		
end


if sssscce == 1 then
x990012_SSSt(sceneId, selfId,handle1)
end				
closefile(nyols)			
end


	SetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP,1)
	 x990012_NotifyTip(sceneId,selfId,"恭喜您报名成功")
end

end


if GetNumText() == 66 then--雁南报名
	if GetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP) == 1 then
	 x990012_NotifyTip(sceneId,selfId,"您已经报名过了，不要重复报名")
	 return
	end


---检测报名的时候是否已有帮会报名信息
local num = 0
local handle1 = openfile("./txt/JuDian/BaoMing.txt", "r")
if handle1 ~= nil then
local str1 = LuaFnGetGuildName( sceneId, selfId )
for i=1, 20 do--目前只考虑20个帮会 一般肯定够用
local line=read(handle1, "*l")
			if line == nil then --没有
				break
			end
			if strfind(line,str1) ~= nil and strfind(line,str1) ~= "" then --已有
				num=1
				break
			end
end
closefile(handle1)
end


---检测报名的时候是否已有帮会报名信息

if num == 0 then -- 没有时直接写入
local nyols = openfile("./txt/JuDian/BaoMing.txt", "a")
local str1 = LuaFnGetGuildName( sceneId, selfId )
if str1 == nil or str1 == "空" then
str1 = "空"
end
local str2 = LuaFnGetName( sceneId, selfId )
local PingFen = GetMissionData( sceneId, selfId, 400 )
local strax = str1..","..PingFen..",雁南\n"
	if nil ~= nyols then
	if strax == nil then
	strax = "" 
	end
		write(nyols, strax)
		closefile(nyols)
	end	

	SetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP,1)
	 x990012_NotifyTip(sceneId,selfId,"恭喜您报名成功")
end

if num == 1 then--有的时候读数据开始计算评分
local MyGuildName = ""
local MyGuildNamea = ""
local handle1 = ""
local sssscce = 0
local PingFen = GetMissionData( sceneId, selfId, 400 )
local str1 = LuaFnGetGuildName( sceneId, selfId )
local nyols = openfile("./txt/JuDian/BaoMing.txt", "r")
if nyols ~= nil then

for i=1, 60 do
local line = read(nyols, "*l") --ID
if line == nil then
break
end
if strfind(line,str1) ~= nil and strfind(line,str1) ~= "" then
local changdu = strlen(str1)--帮会名称长度
local nnnn = strfind(line,str1)--帮会名称起始位置

--取评分值
local sssss = strfind(line,",",1)
local changdua = strlen(line)--整体长度

--
local MyGuildName =  strsub( line,changdu+2,changdu+changdua )--取值

local ddddd = strfind(MyGuildName,",",1)

MyGuildNamea =  strsub( MyGuildName,ddddd-1000,ddddd-1 )--取值评分

line = str1..","..tonumber(MyGuildNamea) + PingFen..",雁南"
sssscce = 1
end
handle1 = handle1..line.."\n"


		
end


if sssscce == 1 then
x990012_SSSt(sceneId, selfId,handle1)
end				
closefile(nyols)			
end



	SetMissionData(sceneId,selfId,MD_DAOJISHIDATI_EXP,1)
	 x990012_NotifyTip(sceneId,selfId,"恭喜您报名成功")
	 
	 end

end

end

function x990012_SSSt(sceneId, selfId,owosstring)
	local wowoewe = openfile("./txt/JuDian/BaoMing.txt", "wb")
	if nil ~= wowoewe then
	    if owosstring == nil then
		owosstring = "" 
		end
		write(wowoewe, owosstring)
		closefile(wowoewe)
	end
end	
------**********************************
------提示函数
------**********************************

function x990012_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId )
end
