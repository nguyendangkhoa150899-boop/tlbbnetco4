--Huy«n Vû Ðäo BOSSQu¥n Ð±i m¾i K¸ch bän g¯c 

--K¸ch bän g¯c Hào 
x807006_g_ScriptId	= 807006

--Ð±i m¾i Phß½ng thÑc Vi:
--Kích hoÕt ThØ K¸ch bän g¯c Th¶i Xác ð¸nh ð¸a ði¬m Xoát Xu¤t 10 Cái BOSS....
x807006_g_sceneName={}
x807006_g_sceneName[3]="Tung S½n"
x807006_g_sceneName[4]="Thái H°"
x807006_g_sceneName[5]="Kính H°"
x807006_g_sceneName[6]="Vô lßþng S½n"
x807006_g_sceneName[7]="Kiªm Các"
x807006_g_sceneName[8]="Ðôn Hoàng"
x807006_g_sceneName[18]="NhÕn Nam"
x807006_g_sceneName[19]="NhÕn B¡c"
x807006_g_sceneName[20]="Thäo nguyên"
x807006_g_sceneName[24]="Nh¸ Häi"
x807006_g_sceneName[25]="Thß½ng S½n"
x807006_g_sceneName[30]="Tây H°"
x807006_g_sceneName[31]="Long Tuy«n"


--##Cänh tßþng Bän ð° Mu¯n thêm Mµt  Cái NPC,Lai Xúc phát K¸ch bän g¯c,Nhß yannan_monster.ini,scripttimerTh¸ K¸ch bän g¯c H°i Ði«u Th¶i gian , 60000Vi 60Mi¬u Thuyên chuy¬n Mµt l¥n K¸ch bän g¯c 
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=807006
-- respawn_time=1800000
-- base_ai=3
-- scripttimer=60000		
-- group_id=-1
-- team_id=-1
-- patrol_id=-1
-- shop0=-1
-- shop1=-1
-- shop2=-1
-- shop3=-1
-- ReputationID=-1
--**********************************
--Xoát Quái Logic 
--**********************************
function x807006_OnCharacterTimer(sceneId, objId, dataId, uTime)
    local DiTuNum = {3,4,5,6,7,8,18,19,20,24,25,30,31}
	local nHour	= GetHour()--Gi¶ 
	local nMinute = GetMinute()-- Phút 

    if nHour == 19 then 
      if mod(tonumber(nMinute)/1,10) == 0 then
       if sceneId == DiTuNum[random(13)] then
          BroadMsgByChatPipe(sceneId, selfId,"Tri«u ðình Chiªu l®nh: Mµt ðám Khiªt Ðan Thích khách , Tùy thân Mang theo [Kim T½ t¢m]Xu¤t hi®n ·  ÐÕi T¯ng Cüa"..x807006_g_sceneName[sceneId]..",Ý ð° Dò höi Tình báo , V÷ng Có Chí Chi Sî Tiªn ðªn Tiêu di®t , Ch¡c ch¡n có Tr÷ng thß·ng !", 4)
	     --Trùng kiªn Nhu Mu¯n trùng kiªn BOSS....
          local cikenum = random(15,20)
          for i = 1,cikenum do
            local cikeId = random(14548,14551)
	       local MonsterID = LuaFnCreateMonster(sceneId, cikeId, random(45,255), random(45,255), 0, 268, 807003)
	       SetCharacterTitle(sceneId, MonsterID,"Ngh¸ch t§p")
            SetUnitReputationID(sceneId, MonsterId, 0)
            SetCharacterDieTime(sceneId, MonsterID, 1800000)
          end
       end
      end
    end
end

--**********************************
--H® th¯ng Thông cáo 
--**********************************
function x807006_SysMsg(sceneId, groupId)
	if x807006_g_BossSysMsgByGroupID[groupId].isSended==0 then
		AddGlobalCountNews(sceneId, x807006_g_BossSysMsgByGroupID[groupId].Msg)
		x807006_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x807006_MsgBox(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, -1)
end


--**********************************
--B¡t m¡t Ð« kÏ 
--**********************************
function x807006_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Ðóng cØa Ð¯i thoÕi Khuông 
--**********************************
function x807006_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
