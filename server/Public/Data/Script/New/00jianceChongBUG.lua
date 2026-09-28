
x402314_g_scriptId = 402314
--脚本号--蝎子最新改进，增加全场景检测，增加00坐标附近检测，QQ-718805400
--**********************************
-- OnTime
--**********************************
function x402314_JianCeSceneTimer(sceneId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		x402314_DoAutoGetExpLogic( sceneId, nHumanId )
	end

end

--**********************************
-- 挂机加经验逻辑
--**********************************
function x402314_DoAutoGetExpLogic( sceneId, selfId )

        local mynam = GetName(sceneId, selfId )
	local level = GetLevel( sceneId, selfId )

	if level>=120 then
	   BeginEvent(sceneId)
	        AddText(sceneId,"你个二货，来我服里卡等级，是不是想死啊！")
	   EndEvent( sceneId )
	   DispatchEventList(sceneId,selfId) 
	end

   --**************
        --蝎子原创修改，不只是检测0坐标，而是0坐标附近也会受到检测。比较完美。转载请注明出处，这是对作者最起码的尊重！
	treasureX = 0
	treasureZ = 0

	--取得玩家当前坐标，蝎子
	PlayerX = GetHumanWorldX(sceneId,selfId)
	PlayerZ = GetHumanWorldZ(sceneId,selfId)
	
	--取得检测坐标与玩家距离，蝎子--暂时不要使用此方法
	--Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))

	--if Distance <= 5 then
	if PlayerX ==0 or PlayerZ==0 or PlayerX ==1 or PlayerZ==1 then 

		local strText = format("#cFF0000通告：#B玩家#G"..mynam.."#B因使用非法工具卡东西已被系统永久封角色，请大家健康游戏，不要动歪脑筋，一经发现，永久封号、封ip。")
                BroadMsgByChatPipe(sceneId, selfId, strText, 4);
		NewWorld(sceneId,selfId,77,17,56)--地府这个坐标进去出不来
	        SetLevel( sceneId, selfId, 0)--减为0级

		BeginEvent(sceneId)		
		AddText(sceneId,"    您由于卡#G0坐标已#W被系统检测到，已经对您进行封号处理，此账号退出后将不可再登录。请勿使用外挂，文明游戏，创造健康的游戏环境。")			  
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )   
	end


   --**************
	local nam = LuaFnGetName( sceneId, selfId)
	res = strfind(nam, "#") 
	ret = strfind(nam, "")        
	--res_H = strfind(nam, "H42510078H")

	if res ~=nil or ret ~= nil then 
		--if res_H ~=nil then	
		   --return
		--else
		        local strText = format("#cFF0000通告：#B玩家#G"..mynam.."#B因使用非法工具卡东西已被系统永久封角色，请大家健康游戏，不要动歪脑筋，一经发现，永久封号、封ip。")
                        BroadMsgByChatPipe(sceneId, selfId, strText, 4);
                        NewWorld(sceneId,selfId,77,17,56)--地府这个坐标进去出不来
	                SetLevel( sceneId, selfId, 0)--减为0级	

			BeginEvent(sceneId)		
			AddText(sceneId,"    您由于使用外挂卡#G彩名#W已被系统检测到，已经对您进行封号处理，此账号退出后将不可再登录。请勿使用外挂，文明游戏，创造健康的游戏环境。")			  
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, -1 )          	
		--end
	end
end

--**********************************
--消息提示
--**********************************
function x402314_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--技能检测
--**********************************
function x402314_SkillCheck(sceneId,selfId)

     --检测是否有附体技能
     if HaveSkill(sceneId,selfId,238) < 1 then
        AddSkill(sceneId,selfId,238)
     end

     --检测是不是慕容
     if GetMenPai(sceneId,selfId) == 10 then
        for i = 906,916 do
              if HaveSkill( sceneId, selfId, i ) < 1 then
                 AddSkill(sceneId, selfId, i)
              end
        end
     end
end
