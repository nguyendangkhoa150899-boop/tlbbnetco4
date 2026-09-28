--Script skill Bï Hành Ngã Thích

--***********************--
x808248_g_scriptId=808248
--***********************--
x808248_g_Impact_List={
	{	Impact_ID=978,	Effect_ID=983		},	--Súc khí - Ð¸nh thân
	{	Impact_ID=979,	Effect_ID=984		},	--Súc khí - Tän công
	{	Impact_ID=980,	Effect_ID=985		},	--Súc khí - Phong huy®t
	{	Impact_ID=981,	Effect_ID=986		},	--Súc khí - Th¤t minh
	{	Impact_ID=982,	Effect_ID=987		},	--Súc khí - Ma tý
}
--***********************--

--************************************--
--*        On Impact Fade Out        *--
--************************************--
function x808248_OnImpactFadeOut(sceneId,selfId,impactId)

	--***********************--
	if GetHp(sceneId,selfId)==0 then
		return
	end	
	--***********************--
	local targetId=LuaFnGetTargetObjID(sceneId,selfId)
	--***********************--
	if targetId==-1 then
		return
	end
	--***********************--
	for i,Impact in x808248_g_Impact_List do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,Impact.Impact_ID)>0 then
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,targetId,Impact.Effect_ID,0)
		end
	end
	--***********************--
	
end