-- Phiªu Mi¬u Phong phó bän ....
-- h¡c ðÕi phách ð¯i thoÕi chân v¯n ....

-- chân v¯n s¯ 
x894001_g_ScriptId  =  894001

-- phó bän suy lu§n chân v¯n s¯ ....
x894001_g_FuBenScriptId  =  894000

--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x894001_OnDefaultEvent(  sceneId,  selfId,  targetId  )

                --RestoreHp(  sceneId,  selfId  )  ------ mãn máu 
                --RestoreMp(  sceneId,  selfId  )  ------ mãn khí 
                --RestoreRage(  sceneId,  selfId  )  ------ mãn gi§n 

	 BeginEvent(sceneId)
	     local  bossId  =  CallScriptFunction(  x894001_g_FuBenScriptId,  "FindBOSS",  sceneId,  "XUANXI_FENGYIN"  )
                    if  bossId  >=  0  then
	 	 AddText(  sceneId,  "Tam Th¥n äo cänh ðã thành , tÕi hÕ ð£c phøng m®nh · ch² này duy trì äo cänh ±n ð¸nh . #r        này äo cänh th×a tái ba th¥n thú chi huy­n tßþng , thiªu hi®p mu¯n l¤y #G ngû hành chi bäo #W , không ngÕi trß¾c ðánh bÕi này #R rách häi huy«n tích #W , kÏ bän th¬ có ðóng bång ngàn d£m khä nång , huy­n tßþng cûng không nhßng khinh thß¶ng , kính xin c¦n th§n kÏ hàn bång lñc . #r        nªu Ñng phó không ðßþc , tÕi hÕ có th¬ ðem chß v¸ #G truy«n t¯ng tr· v« thành #W , l¤y hµ các v¸ chu toàn . "  )
	 	 AddNumText(  sceneId,  x894001_g_ScriptId,  "Khiêu chiªn",  6,  1  )
                    end
	 	 AddNumText(  sceneId,  x894001_g_ScriptId,  "R¶i ði ",  6,  2  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x894001_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 if  GetNumText()  ==  2  then
                      NewWorld(sceneId,  selfId,580,286,81)
                return
                end

	 -- nªu nhß ðang kích hoÕt BOSS là tr· v« ....
	 if  1  ==  CallScriptFunction(  x894001_g_FuBenScriptId,  "IsPMFTimerRunning",  sceneId  )  then
	 	 return
	 end

	 -- có phäi hay không ðµi trß·ng ....
	 if  GetTeamLeader(sceneId,selfId)  ~=  selfId  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  "#{PMF_20080521_07}"  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end

	 -- nªu nhß ðang cùng khác BOSS chiªn ð¤u là tr· v« ....
	 local  ret,  msg  =  CallScriptFunction(  x894001_g_FuBenScriptId,  "CheckHaveBOSS",  sceneId  )
	 if  1  ==  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  msg  )
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end

	 -- m· ra Phiªu Mi¬u Phong tính gi¶ khí t¾i kích hoÕt mình ....
	 CallScriptFunction(  x894001_g_FuBenScriptId,  "OpenPMFTimer",  sceneId,  7,  x894001_g_ScriptId,  -1  ,-1  )

	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

end

--**********************************
-- Phiªu Mi¬u Phong tính gi¶ khí ðích OnTimer....
--**********************************
function  x894001_OnPMFTimer(  sceneId,  step,  data1,  data2  )

	 local  bossId  =  CallScriptFunction(  x894001_g_FuBenScriptId,  "FindBOSS",  sceneId,  "XUANXI_FENGYIN"  )
                if  bossId  <  0  then
	 	 return        -- n½i này dùng ð¬ ð¯i phó thao ðän nhà ch½i 
	 end

	 if  7  ==  step  then
	 	 -- thü tiêu NPC....
	 	 --CallScriptFunction(  x894001_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "CANGLINGZI_1"  )
	 	 CallScriptFunction(  x894001_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 5 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  6  ==  step  then
	 	 CallScriptFunction(  x894001_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 4 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  5  ==  step  then
	 	 CallScriptFunction(  x894001_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 3 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  4  ==  step  then
	 	 CallScriptFunction(  x894001_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 2 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  3  ==  step  then
	 	 CallScriptFunction(  x894001_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 1 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  2  ==  step  then
	 	 -- ð« kÏ chiªn ð¤u b¡t ð¥u ....
	 	 CallScriptFunction(  x894001_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u b¡t ð¥u "  )
	 	 return
	 end

	 if  1  ==  step  then
	 	 CallScriptFunction(  x894001_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "XUANXI_FENGYIN"  )
	 	 -- thành l§p BOSS....
	     local  MstId  =  CallScriptFunction(  x894001_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "XUANXI_BOSS",  -1,  -1  )
	     LuaFnNpcChat(sceneId,  MstId,  0,  "        là ai ðem ta ðánh thÑc ? v§y ta li«n l¤y ngß½i t¾i làm thÑc ån ngon ån no mµt bæa ði ! ")
	 	 return
	 end

end