x800119_g_ScriptId	= 800119

--**********************************
--½Å±¾Èë¿Úº¯Êý
--**********************************
function x800119_DoMoneyToJiaozi( sceneId, selfId , money )
         if nil == money or 0 >= money then
		 return
		 end
	 local mymoney = GetMoney( sceneId, selfId )
         if mymoney < money then
		BeginEvent(sceneId)
		AddText(sceneId,"Ti«n Vàng chßa ðü");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	   end
	 local mymoneyjz = GetMoneyJZ( sceneId, selfId )
         if mymoneyjz >= 144000000 then
         	BeginEvent(sceneId)
		AddText(sceneId,"#{JBJZ_090407_6}");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	   end
   local koqian = LuaFnCostMoney( sceneId, selfId, money )
                if koqian > 0 then
                AddMoneyJZ(sceneId, selfId,money )
		BeginEvent(sceneId)
		AddText(sceneId,"Các hÕ thành công ðem #{_EXCHG"..money.."} ti«n vàng ð±i thành #{_EXCHG"..money.."} Giao TØ");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
                else
		BeginEvent(sceneId)
		AddText(sceneId,"Ti«n Vàng chuy¬n ð±i th¤t bÕi");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
               end
              end

