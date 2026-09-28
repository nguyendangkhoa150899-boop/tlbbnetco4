--Tool GM

--*******************--
x940020_g_scriptId=940020
--*******************--
x940020_g_GMList={
	"Suri",
	"Isleyz",
	"Sad",
	"Cristz",
	"14Azzz",
	"OaOamz",
	"Hiazokz",
	"C½Hoànhhh",	
}
--*******************--

--**********************************--
--*            On Update           *--
--**********************************--
function x940020_GMSun(sceneId,selfId,Request,Param_1,Param_2,Param_3,Param_4)

	--*******************--
	if Request==0 then
		x940020_CheckMyGM(sceneId,selfId)
	end
	--*******************--
	if Request==1 then					
		x940020_GetPlayerInfo(sceneId,selfId,Param_1)
	end
	--*******************--
	if Request==2 then					
		x940020_AddYuanBao(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==3 then					
		x940020_AddZengDian(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==4 then					
		x940020_AddMoney(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==5 then					
		x940020_AddExp(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==6 then					
		x940020_CreateItem(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==7 then					
		x940020_CreateMonster(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==8 then					
		x940020_Transfer(sceneId,selfId,Param_1,Param_2,Param_3,Param_4)
	end
	--*******************--
	if Request==9 then					
		x940020_UpdateMissionData(sceneId,selfId,Param_1,Param_2,Param_3)
	end
	--*******************--
	if Request==10 then					
		x940020_CreatePet(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==11 then					
		x940020_EquipJudgeApt(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==12 then					
		x940020_EquipStrengThen(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==13 then					
		x940020_EquipStileto(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==14 then					
		x940020_EquipBind(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==15 then					
		x940020_EquipGemEmbed(sceneId,selfId,Param_1,Param_2,Param_3)
	end
	--*******************--
	if Request==16 then					
		x940020_EquipDiaoWen(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==17 then					
		x940020_EquipXingZong(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==18 then				
		x940020_XiuLian(sceneId,selfId,Param_1)
	end
	--*******************--
	if Request==19 then					
		x940020_AddImpact(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==20 then					
		x940020_AddYuanXing(sceneId,selfId,Param_1,Param_2)
	end
	--*******************--
	if Request==21 then					
		x940020_BuffGM(sceneId,selfId,Param_1)
	end
	--*******************--
	
end
--**********************************--
--*           Self Is GM           *--
--**********************************--
function x940020_SelfIsGM(sceneId,selfId)

	--*******************--
	local nam = LuaFnGetName(sceneId,selfId)
	--*******************--
	local Is_OK=-1
	--*******************--
	for i,GM in x940020_g_GMList do
		if GM==nam then
			Is_OK=1
			break
		end
	end
	--*******************--
	return Is_OK
	--*******************--

end
--**********************************--
--*          Check My GM           *--
--**********************************--
function x940020_CheckMyGM(sceneId,selfId)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId,15112015)
	--*******************--
	
end
--**********************************--
--*    Check Player Information    *--
--**********************************--
function x940020_CheckPlayerInfo(sceneId,selfId,ObjID)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	local targetId=-1
	--*******************--
	local nHuman=LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHuman-1 do
		local PlayerID=LuaFnGetCopyScene_HumanObjId(sceneId,i)
		local PlayerGUID=LuaFnGetGUID(sceneId,PlayerID)
		if PlayerGUID==ObjID then
			targetId=PlayerID
			break
		end
	end
	--*******************--
	if targetId==-1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Không tìm th¤y thông tin ngß¶i ch½i trong cänh này!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return -1
	end
	--*******************--
	return targetId
	--*******************--

end
--**********************************--
--*     Get Player Information     *--
--**********************************--
function x940020_GetPlayerInfo(sceneId,selfId,ObjID)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	local targetId=x940020_CheckPlayerInfo(sceneId,selfId,ObjID)
	if targetId==-1 then
		return
	end
	--*******************--
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,GetName(sceneId,targetId))
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId,151120151)
	--*******************--
	
end
--**********************************--
--*           Add Yuan Bao         *--
--**********************************--
function x940020_AddYuanBao(sceneId,selfId,targetId,Number)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	YuanBao(sceneId,targetId,selfId,1,Number)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*          Add Zeng Dian         *--
--**********************************--
function x940020_AddZengDian(sceneId,selfId,targetId,Number)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	ZengDian(sceneId,targetId,selfId,1,Number)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*            Add Money           *--
--**********************************--
function x940020_AddMoney(sceneId,selfId,targetId,Number)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	AddMoney(sceneId,targetId,Number)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*             Add Exp            *--
--**********************************--
function x940020_AddExp(sceneId,selfId,targetId,Number)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	AddExp(sceneId,targetId,Number)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*           Create Item          *--
--**********************************--
function x940020_CreateItem(sceneId,selfId,targetId,Item_ID)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	TryRecieveItem(sceneId,targetId,Item_ID,1)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*         Create Monster         *--
--**********************************--
function x940020_CreateMonster(sceneId,selfId,targetId,MonsterId)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	local x,y=GetWorldPos(sceneId,targetId)
	local Monster_Index=LuaFnCreateMonster(sceneId,MonsterId,x+random(2)-random(2),y+random(2)-random(2),27,0,-1)
	SetCharacterDieTime(sceneId,Monster_Index,100000)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*            Transfer            *--
--**********************************--
function x940020_Transfer(sceneId,selfId,targetId,SceneId,Pos_X,Pos_Y)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	NewWorld(sceneId,targetId,SceneId,Pos_X,Pos_Y)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*       Update Mission Data      *--
--**********************************--
function x940020_UpdateMissionData(sceneId,selfId,targetId,Number,Value)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	SetMissionData(sceneId,targetId,Number,Value)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*           Create Pet           *--
--**********************************--
function x940020_CreatePet(sceneId,selfId,targetId,PetID)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	local x,y=GetWorldPos(sceneId,targetId)
	local Pet_Index=CreatePetOnScene(sceneId,PetID,x+random(2)-random(2),y+random(2)-random(2))
	SetCharacterDieTime(sceneId,Pet_Index,100000)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*         Equip Judge Apt        *--
--**********************************--
function x940020_EquipJudgeApt(sceneId,selfId,targetId,Equip_Pos)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	LuaFnReSetItemApt(sceneId,selfId,Equip_Pos)
	LuaFnJudgeApt(sceneId,selfId,Equip_Pos)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*        Equip Streng Then       *--
--**********************************--
function x940020_EquipStrengThen(sceneId,selfId,targetId,Equip_Pos)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	for i=1,200 do
		LuaFnEquipEnhance(sceneId,targetId,Equip_Pos,Equip_Pos)
	end
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*          Equip Stileto         *--
--**********************************--
function x940020_EquipStileto(sceneId,selfId,targetId,Equip_Pos)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	AddBagItemSlotFour(sceneId,targetId,Equip_Pos)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*          Equip Bind         *--
--**********************************--
function x940020_EquipBind(sceneId,selfId,targetId,Equip_Pos)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	LuaFnEquipLock(sceneId,targetId,Equip_Pos)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*         Equip Gem Embed        *--
--**********************************--
function x940020_EquipGemEmbed(sceneId,selfId,targetId,Equip_Pos,Gem_Pos)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	GemEnchasing(sceneId,targetId,Gem_Pos,Equip_Pos)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*       Get Diao Wen Index       *--
--**********************************--
function x940020_GetDiaoWenIndex(sceneId,selfId,str)

	--*******************--
	if type(str)=="string" then
		local x="*%d%d%d%d%d%d%d%d*"
		local y=strfind(str,x)
		if y then
			local str1=strsub(str,y,y+9)
			return strsub(str1,2,9)
		end
	end
	return ""
	--*******************--

end
--**********************************--
--*      Check Diao Wen Type       *--
--**********************************--
function x940020_CheckDiaoWenType(sceneId,selfId,str)

	--*******************--
	if type(str)=="string" then
		local x="*%d%d%d%d%d%d%d%d*"
		local y=strfind(str,x)
		if y then
			local str1=strsub(str,y,y+9)
			return strsub(str1,4,5)
		end
	end
	return "00"
	--*******************--

end
--**********************************--
--*   Check Diao Wen Type Double   *--
--**********************************--
function x940020_CheckDiaoWenType_Double(sceneId,selfId,str)

	--*******************--
	if type(str)=="string" then
		local x="_%d%d%d%d%d%d%d%d_"
		local y=strfind(str,x)
		if y then
			local str1=strsub(str,y,y+9)
			return strsub(str1,4,5)
		end
	end
	return "00"
	--*******************--

end
--**********************************--
--*         Equip Diao Wen         *--
--**********************************--
function x940020_EquipDiaoWen(sceneId,selfId,targetId,Equip_Pos)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	local _,str1=LuaFnGetItemCreator(sceneId,selfId,Equip_Pos)
	local DWStr=x940020_GetDiaoWenIndex(sceneId,selfId,str1)
	if DWStr=="" then
		BeginEvent(sceneId)
			AddText(sceneId,"Trang b¸ này c¥n ðiêu vån trß¾c!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local dwtype=x940020_CheckDiaoWenType(sceneId,selfId,str1)
	local x="*%d%d%d%d%d%d%d%d*"
	str1=gsub(str1,x,"")
	str1=gsub(str1,"*","")
	str1=str1.."*".."10"..dwtype.."0000".."*"
	local y="_%d%d%d%d%d%d%d%d_"
	if strfind(str1,y)~=nil then
		local dwtype1=x940020_CheckDiaoWenType_Double(sceneId,selfId,str1)
		str1=gsub(str1,y,"")
		str1=gsub(str1,"_","")
		str1=str1.."_".."10"..dwtype1.."0000".."_"
	end
	LuaFnSetItemCreator(sceneId,selfId,Equip_Pos,str1)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*         Equip Xing Zong        *--
--**********************************--
function x940020_EquipXingZong(sceneId,selfId,targetId,Equip_Pos)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	local _,str=LuaFnGetItemCreator(sceneId,selfId,Equip_Pos)
	if not str then
		str=""
	end
	--****************--
	local x="~%d%d%d~"
	str=gsub(str,x,"")
	str=gsub(str,"~","")
	str=str.."~100~"
	--****************--
	LuaFnSetItemCreator(sceneId,selfId,Equip_Pos,str)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*             Xiu Lian           *--
--**********************************--
function x940020_XiuLian(sceneId,selfId,targetId)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	SetMissionData(sceneId,targetId,XIULIAN_SKILL_1,0)
	SetMissionData(sceneId,targetId,XIULIAN_SKILL_2,0)
	SetMissionData(sceneId,targetId,XIULIAN_SKILL_3,0)
	SetMissionData(sceneId,targetId,XIULIAN_SKILL_4,0)
	SetMissionData(sceneId,targetId,XIULIAN_SKILL_5,0)
	SetMissionData(sceneId,targetId,XIULIAN_SKILL1_1,0)
	SetMissionData(sceneId,targetId,XIULIAN_SKILL1_2,0)
	SetMissionData(sceneId,targetId,XIULIAN_SKILL1_3,0)
	SetMissionData(sceneId,targetId,XIULIAN_SKILL1_4,0)
	SetMissionData(sceneId,targetId,XIULIAN_SKILL1_5,0)
	SetMissionData(sceneId,targetId,XIULIAN_INFOSKILL,999999)
	SetMissionData(sceneId,targetId,XIULIAN_INFOSKILL1,9999999)
	SetMissionData(sceneId,targetId,XIULIAN_INFOSKILL2,99999)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*            Add Impact          *--
--**********************************--
function x940020_AddImpact(sceneId,selfId,targetId,ImpactID)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	LuaFnSendSpecificImpactToUnit(sceneId,targetId,targetId,targetId,ImpactID,0)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*            Add Impact          *--
--**********************************--
function x940020_AddImpact(sceneId,selfId,targetId,ImpactID)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	LuaFnSendSpecificImpactToUnit(sceneId,targetId,targetId,targetId,ImpactID,0)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*          Add Yuan Xing         *--
--**********************************--
function x940020_AddYuanXing(sceneId,selfId,targetId,Number)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	local Current_YuanXing=GetMissionData(sceneId,targetId,MD_YUANXING)
	SetMissionData(sceneId,targetId,MD_YUANXING,Current_YuanXing+Number)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end
--**********************************--
--*             Buff GM            *--
--**********************************--
function x940020_BuffGM(sceneId,selfId,targetId)

	--*******************--
	local Is_OK=x940020_SelfIsGM(sceneId,selfId)
	if Is_OK==-1 then
		return
	end
	--*******************--
	LuaFnSendSpecificImpactToUnit(sceneId,targetId,targetId,targetId,2690,0)
	--*******************--
	BeginEvent(sceneId)
		AddText(sceneId,"Thao tác thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--*******************--
	
end