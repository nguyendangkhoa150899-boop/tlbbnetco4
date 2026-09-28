-- chân v¯n s¯ 
x920201_g_scriptId  =  920201
x920202_g_scriptId  =  920202
xiaoxiang={
str={[1]=" ta nên ði n½i nào luy®n c¤p ",[2]=" không tiêu ti«n ta nên ngß¶i ch½i ",[3]="BOSS th¶i gian bi¬u ",[4]=" trß¾c m£t phøc vø khí th¶i gian ",},
}
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x920201_OnDefaultEvent(  sceneId,  selfId)
	 local  num  =  getn(xiaoxiang.str)
	 BeginEvent(sceneId)          
	 	 AddText(sceneId,  "   nh¾ m²i ðªn mµt m¾i c¤p b§c li«n m· ra ta t¾i xem mµt chút , ta s¨ nói cho ngß½i biªt r¤t nhi«u giang h° trong chuy®n cüa tình . ")
	 	 	   for  i=1,num  do
	 	 	 	   AddNumText(sceneId,  x920202_g_scriptId,xiaoxiang.str[i],  8,i)
	 	 	   end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,-1)
end
--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x920201_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
--by tiêu tß½ng Q1400003003
--**********************************
--  
--**********************************
function  x920201_IsSkillLikeScript(  sceneId,  selfId)
	 return  0
end