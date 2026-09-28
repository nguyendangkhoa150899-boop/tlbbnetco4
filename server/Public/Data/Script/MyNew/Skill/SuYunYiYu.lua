--Script skill Súc Vân Døc Vû
--Mµ Dung

--***********************--
x808247_g_scriptId=808247
--***********************--
x808247_g_Impact_List={
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	978,				--Súc khí - Ð¸nh thân
	979,				--Súc khí - Tän công
	979,				--Súc khí - Tän công
	979,				--Súc khí - Tän công
	979,				--Súc khí - Tän công
	979,				--Súc khí - Tän công
	979,				--Súc khí - Tän công
	979,				--Súc khí - Tän công
	979,				--Súc khí - Tän công
	979,				--Súc khí - Tän công
	980,				--Súc khí - Phong huy®t
	980,				--Súc khí - Phong huy®t
	980,				--Súc khí - Phong huy®t
	980,				--Súc khí - Phong huy®t
	980,				--Súc khí - Phong huy®t
	980,				--Súc khí - Phong huy®t
	981,				--Súc khí - Th¤t minh
	981,				--Súc khí - Th¤t minh
	981,				--Súc khí - Th¤t minh
	981,				--Súc khí - Th¤t minh
	981,				--Súc khí - Th¤t minh
	981,				--Súc khí - Th¤t minh
	982,				--Súc khí - Ma tý
	982,				--Súc khí - Ma tý
	982,				--Súc khí - Ma tý
}
--***********************--

--************************************--
--*        On Impact Fade Out        *--
--************************************--
function x808247_OnImpactFadeOut(sceneId,selfId,impactId)

	--***********************--
	if GetHp(sceneId,selfId)==0 then
		return
	end	
	--***********************--
	local ran=random(getn(x808247_g_Impact_List))
	--***********************--
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x808247_g_Impact_List[ran],0)
	--***********************--
	
end