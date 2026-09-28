--------豪情一掷系统时钟调用脚本
--------豪情一掷系统时钟调用脚本

---------必须要当时时间在线的玩家----
---------正点得到所有在线玩家的名字。
---------次点随机抽出一个记录下来。
---------领取的时候，按名字领。
x892370_g_ScriptId	= 892370
function x892370_HQYZTimerRet( sceneId )----系统抽奖
	local a = 2100
	return a
end
function x892370_DoHanYuLogic( sceneId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnGetLevel(sceneId, nHumanId) > 119 then
			NewWorld(sceneId,nHumanId,77,20,38)
		end
	end
end
function x892370_ChouJiangTimer( sceneId,pid )----系统抽奖
	x892370_DoHanYuLogic( sceneId )-------泡点系统
	local NowH = GetHour()*100+GetMinute()
	local NowDay =  GetTime2Day() ---今天日期
	local TxtCjMulv =  -----抽奖存放
	{
	"./txt/HQYZ/CJ"..NowDay.."2100",
	"./txt/HQYZ/CJ"..NowDay.."2115",
	"./txt/HQYZ/CJ"..NowDay.."2130",
	}
	local TxtHjName =  -----获奖人名字存放
	{
	"./txt/HQYZ/Name"..NowDay.."2100",
	"./txt/HQYZ/Name"..NowDay.."2115",
	"./txt/HQYZ/Name"..NowDay.."2130",
	}
	local hdex = 0
	local StarTime= x892370_HQYZTimerRet( sceneId )
	if NowH==StarTime then
		hdex = 1
	elseif  NowH==StarTime+15 then
		hdex = 2
	elseif  NowH==StarTime+30 then
		hdex = 3
	end
	if  hdex >0 then
		local Cjdata, CjNum = x892370_readTxt(sceneId,TxtCjMulv[hdex] )
		if CjNum  <5 then
			AddGlobalCountNews(sceneId,"因参加本轮豪情一掷抽奖当前在线人数只有"..CjNum.."人，人数过少，本轮抽奖取消。")
			return
		end
		local shuijiid = random(CjNum)
		x892370_WirTxt( sceneId,TxtHjName[hdex],Cjdata[shuijiid] )---写入文件
	end
	
	if NowH == 2105 then
		x892370_CreatMonster(sceneId)
		x892370_ClearMonster(sceneId)
	end
	
end

function x892370_readTxt(sceneId,TxtHead)
	local savetxt = openfile(TxtHead, "r")
	local CJGuid = {}
	local jishu = 0
	if savetxt and nil ~= savetxt then
		for i=1, 500  do
			local line1=read(savetxt, "*l")
			if line1==nil then
				break
			end
			jishu = jishu+1
			CJGuid[jishu]=line1
		end
		closefile(savetxt)
	end
	return CJGuid,jishu
end


function x892370_WirTxt( sceneId,TxtHead,intStr )
	if TxtHead then
		local handle = openfile( TxtHead, "wb")
		if nil ~= handle then
			write(handle,intStr)
			closefile(handle)
		end
	end
end

function x892370_CreatMonster(sceneId) --------刷聚宝盆和翡翠堆
	local CreateTable = {
	{855,256,272},
	{856,292,244},
	{857,215,241},
	{858,256,250},
	}
	
	for i ,data in CreateTable do
		LuaFnItemBoxEnterSceneEx(sceneId, data[2], data[3], data[1], 1500*1000);
	end
	local MstId = LuaFnCreateMonster(sceneId, 42553, 256, 246, 3,-1,890841 )
	if  MstId >0  then
		SetCharacterDieTime(sceneId, MstId, 1800000) ----存在时间，半小时
		local mysj = GetMinute()
		LuaFnSetLifeTimeAttrRefix_AttackPhysics( sceneId, MstId, mysj )----把时间保存下来
		AddGlobalCountNews(sceneId,"洛阳聚宝盆活动已经开启，请广大玩家回城参加活动，有丰厚的奖励等着你！！！")
	end
end
function x892370_ClearMonster(sceneId)
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=1, nMonsterNum do
		local nMonsterId = GetMonsterObjID(sceneId,i-1)
		if GetName(sceneId,nMonsterId)=="周天师"  or GetName(sceneId,nMonsterId)=="夏候仁" then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end
end

--JZBQR开代上了要发我些展58
