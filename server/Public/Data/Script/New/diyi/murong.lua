--  dçn tß·ng NPC
-- thª gi¾i t±   80    LuaFnGetWorldGlobalData(85)  vì xingxiu
x014109_g_scriptId  =  014109


--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x014109_OnDefaultEvent(  sceneId,  selfId,  targetId  )

	 local  CurLevel  =  LuaFnGetLevel(  sceneId,  selfId  )
	 local  szName  =  GetName(sceneId,targetId)	     -- nhân v§t   
	         BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "#Y Mµ Dung Ð® Nh¤t BOSS :#G"..szName  )
	 	 AddText(  sceneId,  "#r#Y        Mµ Dung phái pho tßþng #W là tri«u ðình vì #G Mµ Dung Ð® Nh¤t BOSS #W tï mï chª tÕo ðích dành riêng pho tßþng , truy«n thuyªt ngß¶i này ðem Mµ Dung võ h÷c phát huy ðªn mÑc t§n cùng , ðã tiªn vào không ngß¶i cänh , Mµ Dung pho tßþng tßþng trßng cho Mµ Dung võ h÷c lînh vñc ðích vinh dñ cao nh¤t , ngß¶i chü s¨ b¸ vînh tái #G biên nåm sØ môn phái anh hùng danh nhân ðß¶ng #W bên trong , lßu danh bách thª . "  )
	 	 AddNumText(  sceneId,  x014109_g_scriptId,  "#G C§p Nh§t Danh Sách ",  6,  1  )
                                AddNumText(  sceneId,  x014109_g_scriptId,  "#cFF0000 Cao Thü Mµ Dung ",6,2)
                                AddNumText(  sceneId,  x014109_g_scriptId,  "#W liên quan t¾i môn phái danh nhân ðß¶ng ",11,3)
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
            x014109_JJKKLL(  sceneId,  selfId,  targetId  )
end

------**********************************
------  pho tßþng ki¬m tr¡c 
------**********************************
function  x014109_JJKKLL(  sceneId,  selfId,  targetId  )

          local  mingren  =  GetMingRenTANGPaiming(sceneId,10)  

          if  mingren[1]  ~=nil  then  
                local  CheckNam  =  mingren[1].Guildnam
                local  CheckLev  =  mingren[1].Guildlve
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	         local  MonsterId  =  GetMonsterObjID(sceneId,i)
	         local  MosDataID  =  GetMonsterDataID(sceneId,  MonsterId  )

	         if  MosDataID  ==  14922  or  MosDataID  ==  14923  then
                              local  NPCLev  =  LuaFnGetLevel(  sceneId,  MonsterId  )
                              local  NPCName  =  GetName(sceneId,MonsterId)

	               local  x,  z  =  GetWorldPos(sceneId,MonsterId)  

                              if  NPCLev  ~=  mingren[1].Guildlve  then
                                    SetCharacterDieTime(  sceneId,MonsterId,  10  )  

                                  if  mingren[1].Guildsex  ==  0  then
                                        NPCId=14922
                                  elseif  mingren[1].Guildsex  ==  1  then                --14912 næ , 14913 nam 
                                        NPCId=14923
                                  end

	             local  nMonsterId1  =  LuaFnCreateMonster(sceneId,  NPCId,  x,  z,  3,  20,  014109)
	             SetLevel(sceneId,nMonsterId1,  CheckLev  )
  	             SetCharacterName(sceneId,  nMonsterId1,  "#G"..CheckNam.."")
  	             SetCharacterTitle(sceneId,nMonsterId1," Mµ Dung Ð® Nh¤t BOSS ")
	             SetObjDir(sceneId,nMonsterId1,  18  )
	             LuaFnSendSpecificImpactToUnit(sceneId,  nMonsterId1,  nMonsterId1,  nMonsterId1,  152,  0)
                      end
                end
          end
      end
end
------**********************************
------  màn änh trung gian tin tÑc ð« kÏ 
------**********************************
function  x014109_NotifyFailTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
function  x014109_Coel(  sceneId,  selfId)
	 	 BeginUICommand(  sceneId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,1000)
end

function  x014109_NotifyFailBoxq(  sceneId,  selfId,  str)
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end	 
--**********************************PrintStr
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x014109_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 local  Name  =  GetName(sceneId,selfId)
	 local  CurLevel  =  LuaFnGetLevel(  sceneId,  selfId  )

	 if  GetNumText()  ==  2  then
                      CallScriptFunction(  014036,  "Coel",  sceneId,selfId,  10)

	 elseif  GetNumText()  ==  3  then
	 	 BeginEvent(sceneId)	 	 	 	 	 
	 	 	 AddText(  sceneId,  " chu¦n b¸ m· ra "  )	 	 	 	 	 	 	 
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 
	 elseif  GetNumText()  ==  1  then
                if	 GetMenPai(sceneId,  selfId)  	   ~=  10  then
	 	 BeginEvent(sceneId)	 	 	 	 	 
	 	 	 AddText(  sceneId,  " chï có #G Mµ Dung #W ð® tØ có th¬ thân thïnh ! "  )	 	 	 	 	 	 	 
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 return
	 end  
	 	 
	 	 
	   if  CurLevel  <90  then
	 	 BeginEvent(sceneId)	 	 	 	 	 
	 	 	 AddText(  sceneId,  "90 c¤p ð«u không có cûng ð×ng t¾i qu¤y r¯i "  )	 	 	 	 	 	 	 
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	   end
	 
                local  ret  =  CallScriptFunction(  014036,  "MingRenTangCheck",  sceneId,selfId,  10)

                                if  ret  >  0  then
                                      local  TitleId  =  0
                                      local  Title  =  ""
                                      local  nam  =  LuaFnGetName(  sceneId,  selfId  )
                                      if  CurLevel  >  110  then
                                            TitleId  =  116
                                            Title  =  "#gffff00 Hùng Bá Thiên HÕ · Th¥n Uy Võ Thánh "
                                      else
                                            TitleId  =  117
                                            Title  =  "#gffff00 Hùng Bá Thiên HÕ "
                                      end
	 	       BroadMsgByChatPipe(  sceneId,  selfId,  "#gff00f0 chúc m×ng ngß¶i ch½i #gffff00"..nam.."#gff00f0 träi qua không giäi c¯ g¡ng , r¯t cøc tr· thành Mµ Dung Ð® Nh¤t BOSS , · ÐÕi Lý quäng trß¶ng thân thïnh thuµc v« mình ðích pho tßþng , ð°ng th¶i ðÕt ðßþc "..Title.."#gff00f0 ðích danh hi®u cùng dành riêng th¶i trang cÞi ngña , giang h° t× nay lÕi thêm mµt truy«n thuyªt ",  4  )
                                          LuaFnAwardTitle(  sceneId,  selfId,0,TitleId,1*24)
	                           SetCurTitle(sceneId,selfId,1,TitleId)
	                           LuaFnDispatchAllTitle(sceneId,  selfId)
                                          x014109_NotifyFailTips(  sceneId,  selfId,  " thân thïnh thành công , chúc m×ng ðÕt ðßþc lÕp phong danh hi®u ! "  )
	                           LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)
	               end
                              x014109_JJKKLL(  sceneId,  selfId,  targetId  )
	 end
end	 