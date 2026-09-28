--  nhân v§t 2.5 kinh nghi®m th¶i gian nß¾c thu¯c 

-- chân v¯n s¯ 
x990011_g_scriptId  =  990011
x990011_g_ItemId  =  30008000


--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x990011_OnDefaultEvent(  sceneId,  selfId,  nItemIndex  )


	 x990011_UseItem(  sceneId,  selfId,  nItemIndex)
end

function  x990011_IsSkillLikeScript(  sceneId,  selfId)
	 return  0
end

--**********************************
--
--**********************************
function  x990011_EatMe(  sceneId,  selfId,  nItemIndex)
	 x990011_UseItem(  sceneId,  selfId,  nItemIndex)
end

--**********************************
--  
--**********************************
function  x990011_UseItem(  sceneId,  selfId,  nItemIndex)
	 --  trß¾c ki¬m tr¡c cái này   nItemIndex  ðích v§t ph¦m là không phäi là cùng trß¾c m£t ðích ð¯i Ñng , 
	 if  GetItemTableIndexByIndex(sceneId,  selfId,  nItemIndex)  ~=  x990011_g_ItemId    then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,"    bên trong túi ðeo lßng bµ sai l¥m ")
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end

	 --  tr× mµt tài li®u 
	 local  ret  =  EraseItem(sceneId,  selfId,  nItemIndex)

	 if  ret  ==  1      then
	     LuaFnAwardTitle(  sceneId,  selfId,    7,117)    -- ðem nguyên là ðích danh hi®u thay thª       7  117  mÛ næ danh hi®u 
	     SetCurTitle(sceneId,selfId,7,117)                  -- cho danh hi®u 	 
	     LuaFnDispatchAllTitle(sceneId,  selfId)    -- cà m¾i khách hàng bßng danh hi®u 
	 	 
	 else
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId," v§t ph¦m không th¬ sØ døng ")
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 
	 end
end