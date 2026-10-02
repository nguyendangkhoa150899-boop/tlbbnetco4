-- Phiªu Mi¬u Phong phó bän ....
-- h¡c ðÕi phách ð¯i thoÕi chân v¯n ....

-- chân v¯n s¯ 
x894002_g_ScriptId  =  894002

-- phó bän suy lu§n chân v¯n s¯ ....
x894002_g_FuBenScriptId  =  894000

--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x894002_OnDefaultEvent(  sceneId,  selfId,  targetId  )

                --RestoreHp(  sceneId,  selfId  )  ------ mãn máu 
                --RestoreMp(  sceneId,  selfId  )  ------ mãn khí 
                --RestoreRage(  sceneId,  selfId  )  ------ mãn gi§n 

	 BeginEvent(sceneId)
	     local  bossId  =  CallScriptFunction(  x894002_g_FuBenScriptId,  "FindBOSS",  sceneId,  "HUOFENG_FENGYIN"  )
                    if  bossId  >=  0  then
	 	 AddText( sceneId, "Ng\251 H\224nh Chi B\228o \240\227 g\165n th\234m m\181t b\223\190c. Th\165n th\250 k\170 ti\170p l\224 #RLuy\174n Ng\248c Ph\223\254ng Ho\224ng#W - n\229m x\223a n\243 xu\164t hi\174n th\236 thi\234n h\213 \240\213i h\213n, \240\164t \240\246 ng\224n d\163m. Thi\170u hi\174p h\227y c\166n th\167n!" ) AddText( sceneId, "N\170u kh\244ng ch\175ng n\177i, t\213i h\213 c\243 th\172 #G\240\223a ch\223 v\184 v\171 th\224nh#W." )   -- [NetCo4 02/10] cu dai 482 byte
	 	 AddNumText(  sceneId,  x894002_g_ScriptId,  "Khiêu chiªn",  6,  1  )
                    end
	 	 AddNumText(  sceneId,  x894002_g_ScriptId,  "R¶i ði",  6,  2  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x894002_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )


	 if  GetNumText()  ==  2  then
                      NewWorld(sceneId,  selfId,580,286,81)
                return
                end


	 -- nªu nhß ðang kích hoÕt BOSS là tr· v« ....
	 if  1  ==  CallScriptFunction(  x894002_g_FuBenScriptId,  "IsPMFTimerRunning",  sceneId  )  then
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
	 local  ret,  msg  =  CallScriptFunction(  x894002_g_FuBenScriptId,  "CheckHaveBOSS",  sceneId  )
	 if  1  ==  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  msg  )
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end

	 -- m· ra Phiªu Mi¬u Phong tính gi¶ khí t¾i kích hoÕt mình ....
	 CallScriptFunction(  x894002_g_FuBenScriptId,  "OpenPMFTimer",  sceneId,  7,  x894002_g_ScriptId,  -1  ,-1  )

	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

end

--**********************************
-- Phiªu Mi¬u Phong tính gi¶ khí ðích OnTimer....
--**********************************
function  x894002_OnPMFTimer(  sceneId,  step,  data1,  data2  )

	 local  bossId  =  CallScriptFunction(  x894002_g_FuBenScriptId,  "FindBOSS",  sceneId,  "HUOFENG_FENGYIN"  )
                if  bossId  <  0  then
	 	 return        -- n½i này dùng ð¬ ð¯i phó thao ðän nhà ch½i 
	 end

	 if  7  ==  step  then
	 	 -- thü tiêu NPC....
	 	 --CallScriptFunction(  x894002_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "CANGLINGZI_2"  )
	 	 CallScriptFunction(  x894002_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 5 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  6  ==  step  then
	 	 CallScriptFunction(  x894002_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 4 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  5  ==  step  then
	 	 CallScriptFunction(  x894002_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 3 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  4  ==  step  then
	 	 CallScriptFunction(  x894002_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 2 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  3  ==  step  then
	 	 CallScriptFunction(  x894002_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 1 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  2  ==  step  then
	 	 -- ð« kÏ chiªn ð¤u b¡t ð¥u ....
	 	 CallScriptFunction(  x894002_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u b¡t ð¥u "  )
	 	 return
	 end

	 if  1  ==  step  then
	 	 CallScriptFunction(  x894002_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "HUOFENG_FENGYIN"  )
	 	 -- thành l§p BOSS....
	 	 CallScriptFunction(  x894002_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "HUOFENG_BOSS",  -1,  -1  )
	 	 return
	 end

end
