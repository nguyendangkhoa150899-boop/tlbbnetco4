--脚本
x808231_g_scriptId = 808231

x808231_PoTian =250

function x808231_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then
		return
	end	
	local x,z = GetWorldPos( sceneId, selfId )
	local nX=random(0.5,5.1)
	local nR=random(sqrt(nX*nX),5.1)
	local nZ = sqrt(nR*nR-nX*nX)
	local type=random(1,4)
	if type== 1 then
		x=x+nX
		z=z+nZ
	elseif type==2 then
		x=x+nX
		z=z-nZ
	elseif type==3 then
		x=x-nX
		z=z-nZ
	elseif type==4 then
		x=x-nX
		z=z+nZ
	end
	CreateSpecialObjByDataIndex(sceneId, selfId, 250+x808231_XinFaAddition( sceneId, selfId ), x, z, 0)
end

--**********************************
-- 心法加成
--**********************************
function x808231_XinFaAddition( sceneId, selfId )
	local nP4 = 0
	local nP3 = GetHumanAttr(sceneId, selfId, 2)
	if nP3>=180000 then
		nP4 = 15
	elseif nP3>=120000 and nP3<140000 then
		nP4 = 14
	elseif nP3>=95000 and nP3<120000 then
		nP4 = 13
	elseif nP3>=75000 and nP3<95000 then
		nP4 = 12
	elseif nP3>=65000 and nP3<75000 then
		nP4 = 11
	elseif nP3>=55000 and nP3<65000 then
		nP4 = 10
	elseif nP3>=45000 and nP3<55000 then
		nP4 = 9
	elseif nP3>=35000 and nP3<45000 then
		nP4 = 8
	elseif nP3>=30000 and nP3<35000 then
		nP4 = 7
	elseif nP3>=25000 and nP3<30000 then
		nP4 = 6
	elseif nP3>=20000 and nP3<25000 then
		nP4 = 5
	elseif nP3>=15000 and nP3<20000 then
		nP4 = 4
	elseif nP3>=10000 and nP3<15000 then
		nP4 = 3
	elseif nP3>=5000 and nP3<10000 then
		nP4 = 2
	elseif nP3<5000 then
		nP4 = 1
	end
	return nP4
end