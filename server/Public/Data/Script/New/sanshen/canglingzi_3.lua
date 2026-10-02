-- Phiªu Mi¬u Phong phó bän ....
-- h¡c ðÕi phách ð¯i thoÕi chân v¯n ....

-- chân v¯n s¯ 
x894003_g_ScriptId  =  894003

-- phó bän suy lu§n chân v¯n s¯ ....
x894003_g_FuBenScriptId  =  894000

--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x894003_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 BeginEvent(sceneId)
	     local  bossId  =  CallScriptFunction(  x894003_g_FuBenScriptId,  "FindBOSS",  sceneId,  "HUAYAO_FENGYIN"  )
                    if  bossId  >=  0  then
	 	 AddText( sceneId, "Ch\239 c\242n m\181t th\165n th\250: #RNhi\170p Linh C\177 Hoa#W, \240\181c c\252a n\243 ch\164n nhi\170p thi\234n \240\184a, ch\239 ng\223\182i v\245 ngh\174 si\234u qu\165n m\190i \240\184ch n\177i. H\213 \240\223\254c n\243 l\224 Ng\251 H\224nh Chi B\228o \183 ngay tr\223\190c m\161t, v\213n l\165n \240\215ng l\189 l\224!" )   -- [NetCo4 02/10] cu dai 477 byte
	 	 AddNumText(  sceneId,  x894003_g_ScriptId,  "Khiêu chiªn",  6,  1  )
	 	 AddNumText(  sceneId,  x894003_g_ScriptId,  "R¶i ði ",  6,  2  )
                    else
	 	 AddText( sceneId, "Qu\228 kh\244ng h\177 l\224 h\167u nh\226n \208\213i V\251, ki\234u d\251ng phi th\223\182ng! H\244m nay thi\170u hi\174p \240\227 t\213o ph\250c cho v\213n d\226n. Mong thi\170u hi\174p ti\170p t\248c tinh ti\170n, ti\171n \240\176 \161t kh\244ng th\172 h\213n l\223\254ng!" )   -- [NetCo4 02/10]
	 	 AddNumText(  sceneId,  x894003_g_ScriptId,  "R¶i ði",  6,  2  )
                    end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x894003_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 if  GetNumText()  ==  2  then
                      NewWorld(sceneId,  selfId,580,286,81)
                return
                end

	 -- nªu nhß ðang kích hoÕt BOSS là tr· v« ....
	 if  1  ==  CallScriptFunction(  x894003_g_FuBenScriptId,  "IsPMFTimerRunning",  sceneId  )  then
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
	 local  ret,  msg  =  CallScriptFunction(  x894003_g_FuBenScriptId,  "CheckHaveBOSS",  sceneId  )
	 if  1  ==  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  msg  )
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end

	 -- m· ra Phiªu Mi¬u Phong tính gi¶ khí t¾i kích hoÕt mình ....
	 CallScriptFunction(  x894003_g_FuBenScriptId,  "OpenPMFTimer",  sceneId,  7,  x894003_g_ScriptId,  -1  ,-1  )

	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

end

--**********************************
-- Phiªu Mi¬u Phong tính gi¶ khí ðích OnTimer....
--**********************************
function  x894003_OnPMFTimer(  sceneId,  step,  data1,  data2  )

	 local  bossId  =  CallScriptFunction(  x894003_g_FuBenScriptId,  "FindBOSS",  sceneId,  "HUAYAO_FENGYIN"  )
                if  bossId  <  0  then
	 	 return        -- n½i này dùng ð¬ ð¯i phó thao ðän nhà ch½i 
	 end

	 if  7  ==  step  then
	 	 -- thü tiêu NPC....
	 	 --CallScriptFunction(  x894003_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "CANGLINGZI_3"  )
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 5 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  6  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 4 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  5  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 3 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  4  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 2 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  3  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 1 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  2  ==  step  then
	 	 -- ð« kÏ chiªn ð¤u b¡t ð¥u ....
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u b¡t ð¥u "  )
	 	 return
	 end

	 if  1  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "HUAYAO_FENGYIN"  )
	 	 -- thành l§p BOSS....
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "HUAYAO_BOSS",  -1,  -1  )
	 	 return
	 end

end