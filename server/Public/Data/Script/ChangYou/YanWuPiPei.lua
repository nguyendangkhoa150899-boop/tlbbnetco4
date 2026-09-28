--K¸ch bän g¯c Hào 
x900055_g_scriptId = 900055



--**********************************
--Tim ð§p Nh§p kh¦u 
--**********************************
function x900055_OnCharacterTimer(sceneId, objId, dataId, uTime)
x900055_NotifyTip(sceneId, objId,"Ðang · XÑng ðôi Trung..Xin ð×ng Trên ðß¶ng R¶i ði")
  	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)	
  local Humanlist = {}
	local nHumanNum = 1
	for i=0, nHumanCount-1 do
		nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		Humanlist[nHumanNum] = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		nHumanNum = nHumanNum + 1		
		x900055_OpenUi(sceneId, nHumanId)	
	end


		for i=0, nHumanNum-2 do
			selfIdgo = Humanlist[i]
		end
        local star = GetMissionData(sceneId,nHumanId,MAXDUANWEI1)--Tinh tinh S± 
        local maxd = GetMissionData(sceneId,nHumanId,MAXDUANWEI2)--ÐÕi ÐÆng c¤p Tiªp l¶i 
        local number = GetMissionData(sceneId,nHumanId,MAXDUANWEI3)--ÐoÕn ng¡n Con s¯ 
        local wuyu = GetMissionData(sceneId,nHumanId,MAXDUANWEI4)--Võ Dñ 
			 if maxd>= 7 and star>= 4 then
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI1,4)
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI2,7)
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI3,5)
			 else			 
			 if star> 4 then--L¾n h½n 4Tinh Gia tång ÐoÕn ng¡n Con s¯ 
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI3,number + 1)--ÐoÕn ng¡n Con s¯ +1
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI1,0)--Tr÷ng Trí Tinh tinh Vi 1
			 end        
			 if number>= 5 then--ÐoÕn ng¡n Con s¯ L¾n h½n 5Cüa Th¶i ði¬m 
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI2,maxd+1)--ÐÕi ÐoÕn +1
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI3,1)--Tr÷ng Trí ÐoÕn ng¡n Con s¯ Vi 1
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI1,0)--Tr÷ng Trí Tinh tinh 		 
			 end
			 if wuyu>=1500 then
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI1,star + 1)
			 SetMissionData(sceneId,nHumanId,MAXDUANWEI4,0)
			 end
			 end
			 
			 

			 
		
		local allfirstplayer = GetPaiming(sceneId,8)   	
if nHumanCount <= 1 then
local handle3 = openfile("../Server/Config/Paiming/yanwu.txt","wb")
   if nil ~= handle3 then
		write(handle3,"")
		closefile(handle3)
   end
	
end
if allfirstplayer[1].mynowLevel ~= nil and allfirstplayer[2].mynowLevel == nil then
local handle3 = openfile("../Server/Config/Paiming/yanwu.txt","wb")
   if nil ~= handle3 then
		write(handle3,"")
		closefile(handle3)
   end
return
end

if allfirstplayer[1].mynowLevel ~= nil and allfirstplayer[2].mynowLevel ~= nil then
x900055_SysMsg(sceneId,allfirstplayer[1].mynowLevel,allfirstplayer[2].mynowLevel)
end

		
		--CallScriptFunction(806012,"DoChallenge", sceneId, selfIdgo, Humanlist[nHumanNum -1])

	
	
	--Tim ð§p Nh§p kh¦u 


		
end

--**********************************
--Ð±i m¾i Bäo sß½ng 
--**********************************
function x900055_CreateMonster(sceneId,playerid)	
	BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 2)
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, playerid, 20181116)
end

--**********************************
--Truy«n t¯ng Tiªn vào PKKhu vñc 
--**********************************
function x900055_SysMsg(sceneId, pkoneId,pktowid)
if pkoneId ~= nil and pktowid ~= nil then
x900055_NotifyTip(sceneId, pkoneId,"XÑng ðôi Thành công,Chính — tiªn vào Tái Tràng")
x900055_NotifyTip(sceneId, pktowid,"XÑng ðôi Thành công,Chính — tiªn vào Tái Tràng")
CallScriptFunction(806014,"DoChallenge", sceneId, pkoneId, pktowid)
local handle3 = openfile("../Server/Config/Paiming/yanwu.txt","wb")
   if nil ~= handle3 then
		write(handle3,"")
		closefile(handle3)
   end
end	
end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x900055_MsgBox(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, -1)
end


--**********************************
--B¡t m¡t Ð« kÏ 
--**********************************
function x900055_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Biªn L¸ch Cänh tßþng Nµi Ngß¶i ch½i,Tä LßÞng LßÞng Mµt t± 
--**********************************
function x900055_OpenUi(sceneId, selfId)--Tä IDTiªn Vån bän 
if nHumanId == -1 then
local handle3 = openfile("../Server/Config/Paiming/yanwu.txt","wb")
   if nil ~= handle3 then
		write(handle3,"")
		closefile(handle3)
   end
end	
if nHumanId ~= -1 then
CallScriptFunction((888899),"SetDengji", sceneId, nHumanId,nHumanId,8)
BeginUICommand(sceneId)
UICommand_AddInt(sceneId, 2)
EndUICommand(sceneId)
DispatchUICommand(sceneId, selfId, 20181116)
end

end
