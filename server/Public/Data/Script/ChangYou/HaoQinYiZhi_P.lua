--------豪情一掷个人时钟调用脚本
--------豪情一掷个人时钟调用脚本
---------必须要当时时间在线的玩家----
---------正点得到所有在线玩家的名字。
---------次点随机抽出一个记录下来。
---------领取的时候，按名字领。
x892371_g_ScriptId	= 892371
function x892371_ChouJiangTimer( sceneId,selfId )----系统抽奖
	if LuaFnIsObjValid(sceneId,selfId) ~=1 then
		return
	end
	local StarTime = CallScriptFunction(892370,"HQYZTimerRet",sceneId)
	local NowH = GetHour()*100+GetMinute()
	if NowH <StarTime-2 or NowH >StarTime+60 then
		return
	end	
	if NowH ==StarTime-2 then
		x892371_IntCJTxt(sceneId,selfId,1)
		return
	elseif  NowH==StarTime+14  then
		x892371_IntCJTxt(sceneId,selfId,2)
		return
	elseif  NowH==StarTime+29  then
		x892371_IntCJTxt(sceneId,selfId,3)
		return
	end
	
	
	if NowH >=StarTime+30 and NowH <StarTime+60 then
		x892371_IntNameTxt(sceneId,selfId,3)
		return
	elseif  NowH >=StarTime+15 then
		x892371_IntNameTxt(sceneId,selfId,2)
		return
	elseif  NowH >=StarTime then
		x892371_IntNameTxt(sceneId,selfId,1)
		return
	end
	
	
end

function x892371_IntCJTxt(sceneId,selfId,hdex)
	local NowDay =  GetTime2Day() ---今天日期
	local myName = LuaFnGetName( sceneId, selfId)
	local isBaoMing = GetMissionData(sceneId,selfId,MD_HQYZ_DATA)
	local isBaoMingOK  =  mod(isBaoMing, 10) ---个位，是否参加了活动，
	local nPrizeFlag = floor(mod(isBaoMing, 100)/10) ---十位（获得哪种奖励123）
	local nRevPrizeFlag = floor(mod(isBaoMing, 1000)/100)---百位，是否领取
	local nSaveDate = floor(isBaoMing/1000) ---参加的日期
	local nowd = GetTodayDate() ---今天的日期
	local TxtCjMulv =  -----参与抽奖存放
	{
	"./txt/HQYZ/CJ"..NowDay.."2100",
	"./txt/HQYZ/CJ"..NowDay.."2115",
	"./txt/HQYZ/CJ"..NowDay.."2130",
	}
	if nowd~=nSaveDate or isBaoMingOK==0 then ---不是同一天或没有报名
		x892371_Tips( sceneId, selfId, "你今日未报名豪情一掷赢大奖，将无法参与抽奖。" )
		return
	end
	if nPrizeFlag==0 and  nRevPrizeFlag==0 then ------必须要没有获奖的或没有领奖的人
		x892371_SaveTxt( sceneId, selfId,TxtCjMulv[hdex],myName )------各人时钟写入名字
	end
	
end




function x892371_IntNameTxt(sceneId,selfId,hdex)
	local NowDay =  GetTime2Day() ---今天日期
	local myName = LuaFnGetName( sceneId, selfId)
	local isBaoMing = GetMissionData(sceneId,selfId,MD_HQYZ_DATA)
	local isBaoMingOK  =  mod(isBaoMing, 10) ---个位，是否参加了活动，
	local nPrizeFlag = floor(mod(isBaoMing, 100)/10) ---十位（获得哪种奖励123）
	local nRevPrizeFlag = floor(mod(isBaoMing, 1000)/100)---百位，是否领取
	local nSaveDate = floor(isBaoMing/1000) ---参加的日期
	local nowd = GetTodayDate() ---今天的日期
	local TxtHjName =  -----获奖人名字存放
	{
	"./txt/HQYZ/Name"..NowDay.."2100",
	"./txt/HQYZ/Name"..NowDay.."2115",
	"./txt/HQYZ/Name"..NowDay.."2130",
	}
	if hdex==0 then
		return
	end
	if nowd~=nSaveDate or isBaoMingOK==0 then ---不是同一天或没有报名
		x892371_Tips( sceneId, selfId, "你今日未报名豪情一掷赢大奖，将无法参与抽奖。" )
		return
	end
	
	if nPrizeFlag~=0 or nRevPrizeFlag~=0 then ---必须要没有获奖的或没有领奖的人
		return
	end
	
	local HJName = x892371_readTxt(sceneId,TxtHjName[hdex] ) ---读获奖人的信息
	if HJName ==nil  then
		return
	end
	local haoliName = { "侠影留痕","江海神扬","冠绝四方" }
	if HJName==myName then -----如果是同一个人
		SetMissionData(sceneId,selfId,MD_HQYZ_DATA,isBaoMing+hdex*10)
		AddGlobalCountNews(sceneId, "豪情一掷:恭喜恭喜少侠#{_INFOUSR"..GetName(sceneId,selfId).."}被幸运女神选中，获得："..haoliName[hdex].."豪礼一份。 ")
		LuaFnSendSystemMail( sceneId,myName , "#Y新服七日大礼赠，豪情一掷满江湖。#r#r    #W恭喜少侠获赠豪礼#W，请于#G今日24时前#W在#G新服欢乐月#W-#G豪情一掷满江湖#W点击按钮领取奖励。#r    若#G超过24时#W未领取奖励，则#G无法补领#W。" )
	end
	
end

function x892371_readTxt(sceneId,TxtHead)
	local reta =nil
	local savetxt = openfile(TxtHead, "r")
	if savetxt and nil ~= savetxt then
		local line1=read(savetxt, "*l")
		if line1~=nil then
			reta = line1
		end
		closefile(savetxt)
	end
	return reta
end

function x892371_SaveTxt( sceneId, selfId,TxtHead,ShuJuData )------各人时钟写入名字
	if TxtHead then
		local handle = openfile(TxtHead,"a+")
		if nil ~= handle then
			write(handle,ShuJuData)
			write(handle,tostring("\n"))
			closefile(handle)
		else
			handle = openfile(TxtHead,"wb")
			write(handle,ShuJuData)
			write(handle,tostring("\n"))
			closefile(handle)
		end
	end
end


function x892371_Tips( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	if Msg ==nil then
		AddText( sceneId, "MSG为空值" )
	else
		AddText( sceneId, Msg )
	end
	
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--BQR开代上了要发我些展5815
