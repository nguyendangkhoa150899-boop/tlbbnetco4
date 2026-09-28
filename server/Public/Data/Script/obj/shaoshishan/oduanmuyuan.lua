-- Phiªu Mi¬u Phong phó bän ....
-- ðoan mµc nguyên ð¯i thoÕi chân v¯n ....

-- chân v¯n s¯ 
x890074_g_ScriptId	 =  890074

-- phó bän suy lu§n chân v¯n s¯ ....
x890074_g_FuBenScriptId  =  890063

--**********************************
-- tØ vong ....
--**********************************
function  x890074_OnDie(  sceneId,  selfId,  killerId  )

	 -- nªu nhß còn không có khiêu chiªn quá lý thu thüy là có th¬ khiêu chiªn lý thu thüy ....
	 if  2  ~=  CallScriptFunction(  x890074_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "DingChunQiu"  )	 then
	 	 CallScriptFunction(  x890074_g_FuBenScriptId,  "SetBossBattleFlag",  sceneId,  "DingChunQiu",  1  )
	 end
	 --  zchw  toàn c¥u thông báo 
	 local	 playerName	 =  GetName(  sceneId,  killerId  )
	 
	 -- giªt chªt quái v§t chính là süng v§t là l¤y ðßþc kÏ chü tên cüa ngß¶i ....
	 local  playerID  =  killerId
	 local  objType  =  GetCharacterType(  sceneId,  killerId  )
	 if  objType  ==  3  then
	 	 playerID  =  GetPetCreator(  sceneId,  killerId  )
	 	 playerName  =  GetName(  sceneId,  playerID  )
	 end
	 
	 -- nªu nhß nhà ch½i h÷p thành ðµi li­u là l¤y ðßþc ðµi trß·ng tên ....
	 local  leaderID  =  GetTeamLeader(  sceneId,  playerID  )
	 if  leaderID  ~=  -1  then
	 	 playerName  =  GetName(  sceneId,  leaderID  )
	 end
	 
	 if  playerName  ~=  nil  then
	 	 str  =  format(" Thiªu Th¤t S½n #{_INFOUSR%s} Lãnh ðÕo ðµi ngû ðánh bÕi #Y Phiên Tång Ch¤p Sñ #W, thª là #{_INFOUSR%s} tiªn bß¾c cùng ð°ng ðµi ngày càng tiªp c§n Ðinh Xuân Thu...",  playerName,playerName);  -- ðäm nhi®m bình sanh 
	 	 AddGlobalCountNews(  sceneId,  str  )
	 end
end