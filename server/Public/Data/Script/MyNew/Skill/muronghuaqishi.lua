x808239_g_scriptId  =  808239

x808239_g_Other65  =  {[0]=906,[1]=907,[2]=908,[3]=909,[4]=910,[5]=911,[6]=912,[7]=913,[8]=914,[9]=0,[10]=0,[11]=915,[12]=916}
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x808239_OnImpactFadeOut(  sceneId,  selfId,  impactId  )
	 local  targetId  =  LuaFnGetTargetObjID(sceneId,  selfId)
	 local  objType  =  GetCharacterType(  sceneId,  targetId  )
	 local  mymenpai  =  GetMenPai(  sceneId,  selfId  )

                if  LuaFnIsObjValid(sceneId,  targetId)  ~=  1  then
                      return
                end

                if  mymenpai  ~=  10  then
                      return
                end

                -- tình hu¯ng ð£c bi®t 
	 if  GetHp(  sceneId,  selfId  )  ==  0    or  GetHp(  sceneId,  targetId  )  ==  0  or  selfId  ==  targetId  or  (LuaFnUnitIsEnemy(sceneId,  selfId,  targetId)  ~=  1  )    then
	       x808239_NotifyTip(  sceneId,  selfId,  " không th¬ công kích này møc tiêu ")
	       return
	 end

                local  menpai  =  -1

                if  objType  ==  1  then        -- ð¯i phß½ng là ngß¶i 
                      menpai  =  GetMenPai(sceneId,  targetId)
                      if  menpai  ==  9  or  menpai  ==  10  then
                            menpai  =  random(8)
                      end
                else
                      menpai  =  random(12)
                      if  menpai  ==  9  or  menpai  ==  10  then
                            menpai  =  random(8)
                      end
                end

                BeginUICommand(sceneId)
	     UICommand_AddInt(sceneId,x808239_g_Other65[menpai])
	     UICommand_AddString(sceneId,"ski13")
	     EndUICommand(sceneId)
                DispatchUICommand(sceneId,selfId,2014092002)
end


--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x808239_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end