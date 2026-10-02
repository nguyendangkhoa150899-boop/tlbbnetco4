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
	 	 AddText( sceneId, "Tam Th\165n \196o C\228nh \240\227 th\224nh, t\213i h\213 ph\248ng m\174nh gi\230 cho \228o c\228nh \177n \240\184nh. Mu\175n l\164y #GNg\251 H\224nh Chi B\228o#W, h\227y \240\225nh b\213i #RN\209t H\228i Huy\171n T\237ch#W - h\224n b\229ng c\252a n\243 \240\243ng b\229ng ng\224n d\163m, xin c\166n th\167n!" ) AddText( sceneId, "N\170u kh\244ng ch\175ng n\177i, t\213i h\213 c\243 th\172 #G\240\223a ch\223 v\184 v\171 th\224nh#W." )   -- [NetCo4 02/10] cu dai 492 byte -> client cat
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