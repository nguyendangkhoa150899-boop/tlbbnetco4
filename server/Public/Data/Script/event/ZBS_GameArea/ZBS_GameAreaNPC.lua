--ÃËÕ½main½Å±¾
--Author UK 
--½Å±¾ºÅ
x600054_g_scriptId = 600054
x600054_g_mainscriptId = 600053
x600054_g_OutScene, x600054_g_Outx, x600054_g_Outz = 317,100,100



--**********************************
--
--**********************************
function x600054_OnDefaultEvent( sceneId, selfId,targetId)
	BeginEvent(sceneId)
        AddText( sceneId, "  #P Cä nß¾c tranh bá s¨ ·, m²i tu¥n mµt, ba, nåm ban ðêm #G19:30#P M· ra, m²i l¥n tiªp tøc 1 Gi¶, th¡ng lþi bang hµi có th¬ ðÕt ðßþc #Y50 VÕn #P Nguyên bäo" ) 
		AddText( sceneId, "  #W Báo danh th¶i gian vì m²i ngày #G8:00-19:29" ) 
        --AddNumText(sceneId,600054,"Tiªn v« bang chiªn ð¸a ð°",6,1) 
		--AddNumText(sceneId,600054,"Cä nß¾c tranh bá báo danh",6,2)
       -- AddNumText(sceneId,600054,"Nh§n l¤y ban thß·ng",6,3)		
	EndEvent(sceneId)
 	DispatchEventList(sceneId,selfId,targetId) 
	
 end
 
--**********************************
--
--**********************************
function x600054_OnEventRequest( sceneId, selfId, targetId, eventId)
if GetNumText() == 1 then
local GetHuDongTime = CallScriptFunction((x600054_g_mainscriptId), "GetTimer",sceneId)
if GetHuDongTime == 0 then
x600054_BoxTip( sceneId, selfId, targetId,"Không phäi th¶i gian hoÕt ðµng không th¬ tiªn vào!!")
return
end
local sismyguildid 		= GetHumanGuildID(sceneId,selfId)
local GuildName = LuaFnGetGuildName(sceneId, selfId)
if sismyguildid == nil or sismyguildid == -1 or GuildName == nil or GuildName == "" then
x600054_BoxTip( sceneId, selfId, targetId,"Nh¤t ð¸nh phäi có mµt cái bang hµi m¾i có th¬ vào bên trong!")
return
end
if x600054_Getbiaomin( sceneId, selfId, targetId) ~= 1 then
x600054_BoxTip( sceneId, selfId, targetId,"Ngài không có báo danh, không th¬ tham gia cä nß¾c tranh bá thi ð¤u!!")
return
end
CallScriptFunction((400900), "TransferFunc",sceneId, selfId, x600054_g_OutScene, x600054_g_Outx, x600054_g_Outz)
elseif  GetNumText() == 2  then
x600054_biaomin( sceneId, selfId, targetId)




elseif  GetNumText() == 30  then
local GetHuDongTime0,GetHuDongTime = CallScriptFunction((x600054_g_mainscriptId), "GetTimer",sceneId)
if GetHuDongTime == 0 and GetHuDongTime0 == 0 then 
x600054_BoxTip( sceneId, selfId, targetId,"Không phäi hoÕt ðµng cùng báo danh th¶i gian không cách nào xem xét báo danh danh sách!!")
return
end
x600054_ReadBangZhanName(sceneId, selfId)
local maxlisplayer = 0
if biaominlist ~= nil then
maxlisplayer = getn(biaominlist)
end
local jisu = floor(maxlisplayer/3)
if mod(maxlisplayer,3) ~= 0 then
jisu = jisu + 1
end
BeginUICommand( sceneId )
UICommand_AddInt( sceneId, targetId )
UICommand_AddInt( sceneId, jisu )
EndUICommand( sceneId )
DispatchUICommand( sceneId, selfId,  "20140927")
end
end
--**********************************
--
--**********************************
function x600054_Getbiaomin( sceneId, selfId, targetId)
local isok = 0
x600054_ReadBangZhanName(sceneId, selfId)
if getn(biaominlist) > 0 then
for i = 1,getn(biaominlist) do
if biaominlist[i] == GetName(sceneId, selfId) then
isok = 1
break
end
end
end
return isok
end
--**********************************
--
--**********************************
function x600054_biaomin( sceneId, selfId, targetId)
local _,GetHuDongTime = CallScriptFunction((x600054_g_mainscriptId), "GetTimer",sceneId)
if GetHuDongTime == 0 then 
x600054_BoxTip( sceneId, selfId, targetId,"Không phäi báo danh th¶i gian c¤m chï báo danh!")
return
end
local sismyguildid 		= GetHumanGuildID(sceneId,selfId)
local GuildName = LuaFnGetGuildName(sceneId, selfId)
if sismyguildid == nil or sismyguildid == -1 or GuildName == nil or GuildName == "" then
x600054_BoxTip( sceneId, selfId, targetId,"Nh¤t ð¸nh phäi có mµt cái bang hµi m¾i có th¬ báo danh!!")
return
end
local myHPmax = GetMaxHp(sceneId,selfId)
if myHPmax < 300000 then
x600054_BoxTip( sceneId, selfId, targetId,"Máu hÕn mÑc cao nh¤t không ðü 300000, Ngß¶i ch½i c¤m chï báo danh")
return
end
local myLv = GetLevel(sceneId, selfId)
if myLv < 95 then
x600054_BoxTip( sceneId, selfId, targetId,"C¤p b§c chßa ðü 95 C¤p ngß¶i ch½i c¤m chï báo danh")
return
end
x600054_ReadBangZhanName(sceneId, selfId)
local isok = 1
if getn(biaominlist) > 0 then
for i = 1,getn(biaominlist) do
if biaominlist[i] == GetName(sceneId, selfId) then
isok = 0
break
end
end
end
if isok ~= 1 then
x600054_BoxTip( sceneId, selfId, targetId,"Ngài ðã báo danh, xin ð×ng nên l£p lÕi báo danh")
return
end
biaominlist[getn(biaominlist)+1] = GetName(sceneId, selfId)
if x600054_IsRegBangZhan(sceneId, selfId) == 0 then
x600054_SetBangZhanBaoMin(sceneId, selfId)
end
x600054_BoxTip( sceneId, selfId, targetId,"Báo danh thành công, m¶i tÕi hoÕt ðµng lúc b¡t ð¥u t¾i tìm ta")
end
--**********************************
--
--**********************************
function x600054_UpSuJi( sceneId, selfId, targetId, eventId)
if eventId == nil or eventId <= 0 or eventId*3 > getn(biaominlist)+2 then
return
end
local srtingiuis = ""
for i =((eventId-1)*3+1),(eventId*3) do
if biaominlist[i] ~= nil then
if i ~= ((eventId-1)*3+1) then
srtingiuis = srtingiuis.."¡¢["..biaominlist[i].."]"
else
srtingiuis = srtingiuis.."["..biaominlist[i].."]"
end
end
end
if srtingiuis == "" then
return
end
BeginUICommand( sceneId )
UICommand_AddInt( sceneId, eventId )
UICommand_AddString( sceneId, srtingiuis.."#r" )
EndUICommand( sceneId )
DispatchUICommand( sceneId, selfId,  "20140928")
end
--**********************************
-- °ÑÃûµ¥Ð´µ½Êý×éÀï
--**********************************
function x600054_ReadBangZhanName(sceneId, selfId)
	if biaominlist == nil then
	biaominlist = {}
	local handle = openfile("../Server/Log1/BangzhanBaoMin.txt", "r")
	if nil ~= handle then
		for i =1,20000 do
			local line=read(handle, "*l")
			if line==nil then
				break
			end
			if line~=nil then
			if mod(i,2) == 1 then
            biaominlist[getn(biaominlist)+1] = line
			end
			end
		end
	closefile(handle)	
	end
	end	
end
--**********************************
-- »ñÈ¡±¨ÃûµÄÈËÊý
--**********************************
function x600054_GetBangZhanBMnum(sceneId, selfId)
	local handle = openfile("../Server/Log1/BangzhanBaoMin.txt", "r")
	local biaominmun = 0
	if nil ~= handle then
		for i=1, 20000 do
			local line=read(handle, "*l")
		biaominmun = biaominmun + 1		
			if line==nil then
				break
			end
		end
	closefile(handle)	
	end
	biaominmun = floor(biaominmun/2)
	if biaominmun == nil then
	biaominmun = 0
	end
	return biaominmun
end

--**********************************
-- ×¢²á±¨ÃûµÄÍæ¼Ò
--**********************************
function x600054_SetBangZhanBaoMin(sceneId, selfId)
		local handle = openfile("../Server/Log1/BangzhanBaoMin.txt", "a+")
		local MyName = GetName(sceneId, selfId)	
		if nil ~= handle then
			write(handle, MyName)
			write(handle,tostring("\n"))
			closefile(handle)
		end
end		
--**********************************
-- ÊÇ·ñÊÇÒÑ¾­Ìá½»×¢²áµÄÍæ¼Ò
--**********************************
function x600054_IsRegBangZhan(sceneId, selfId)
	local flag=0
	local handle = openfile("../Server/Log1/BangzhanBaoMin.txt", "r")
	local MyName = GetName(sceneId, selfId)
	if nil ~= handle then
		for i=1, 20000 do
			local line=read(handle, "*l")
			if line==nil then
				break
			end
			if line==MyName then
				flag=1
				break
			end
		end
	closefile(handle)	
	end
	return flag
end

--**********************************
-- ÖØÖÃÒÑ¾­Ìá½»×¢²áµÄÍæ¼Ò
--**********************************
function x600054_ReSetRegBangZhan(sceneId)
	--#×¢²á°ïÕ½µÄÍæ¼Ò
	local handle = openfile("../Server/Log1/BangzhanBaoMin.txt", "w")
	if nil ~= handle then
		write(handle, "")
		closefile(handle)
	end
end
--**********************************
--
--**********************************
function x600054_BoxTip( sceneId, selfId, targetId,txt)
	BeginEvent(sceneId)
    AddText( sceneId, txt )       
	EndEvent(sceneId)
 	DispatchEventList(sceneId,selfId,targetId) 
end	