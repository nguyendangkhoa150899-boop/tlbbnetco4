--Sinh linh 
--Con bò cÕp 
--QQ718805400
x391060_g_ScriptId	= 391060
function x391060_OnDefaultEvent(sceneId, actId)
end
function x391060_MsgBox(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

function x391060_MsgBox18(sceneId, selfId,y,o,p,l,k)
	SetMissionData(sceneId, selfId, 400,y)
	SetMissionData(sceneId, selfId, 401,o)
	SetMissionData(sceneId, selfId, 402,p)
	SetMissionData(sceneId, selfId, 403,l)
	SetMissionData(sceneId, selfId, 404,k)
end

function x391060_MsgBox33(sceneId, selfId)
local Aaaa,Aaaa1,Bbbb,Bbbb1,WQnum,TDnum =0,0,0,0,0,0
for sd=100,118 do
	if sd ~= 102 then
		Aaaa1 = x391060_level(sceneId, selfId, sd)
		if Aaaa1> 0 then
			local sldjbsx1={1,2,3,4,5,6,7,8,9}
			Aaaa = Aaaa + sldjbsx1[Aaaa1]
            WQnum = WQnum + 1
		end
		Bbbb1 = x391060_level2(sceneId, selfId, sd)
		if Bbbb1> 0 then
			local sldjbsx2={11,12,13,14,15,16,17,18,19}
			Bbbb = Bbbb + sldjbsx2[Bbbb1]
            TDnum = TDnum + 1
        end
	end
end
	if (Aaaa+Bbbb)>=0 and (Aaaa+Bbbb) <= 999 then
	   SetMissionData(sceneId, selfId, XIEZI_SL, TDnum*10^5+WQnum*10^3+Aaaa+Bbbb)
        --x391060_NotifyTip(sceneId, selfId,"Ki¬m tra ðo lß¶ng Thành công , Ngài Trên ngß¶i có  Thiên ÐÕo Trang b¸"..TDnum.."Ki®n  Vß½ng quy«n Trang b¸"..WQnum.."Ki®n  Ký løc Tiªp l¶i"..GetMissionData(sceneId,selfId,XIEZI_SL).."")
        x391060_XIEZI(sceneId, selfId)
	end
end
	

function x391060_level(sceneId, selfId, arg1)
	local_, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
	local myname2 ="0"
	if(myname ~= nil) then
		local sree1 = strfind(myname,"w#p")
		if sree1 == nil then
			sree1 = 0
		end
			if sree1>= 1 then
			myname2 = strsub(myname, sree1+3,sree1+3)
			end
		end
	return tonumber(myname2)
end

function x391060_level2(sceneId, selfId, arg1)
	local_, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
	local myname2 ="0"
	if(myname ~= nil) then
		local sree1 = strfind(myname,"t#p")
		if sree1 == nil then
			sree1 = 0
		end
			if sree1>= 1 then
			myname2 = strsub(myname, sree1+3,sree1+3)
			end
		end
	return tonumber(myname2)
end

function x391060_MsgBox32(sceneId, selfId,lwIndex,txpp,lwIntex)

	local lw = LuaFnGetItemTableIndexByIndex(sceneId, selfId, lwIndex)
	if lw<10000010 or lw>=10957019 then
		x391060_NotifyTip(sceneId, selfId,"M¶i Ð¬ vào Trang b¸")
		return
	end

  if txpp == 100 then --Con bò cÕp Thí nghi®m Vß½ng quy«n Thång Linh 

	local lw21,lw22,lw23 = x391060_wuhunjb(sceneId, selfId, lwIndex)
	local lw20 = tonumber(lw22)

	if lw20>= 9 then
			x391060_NotifyTip(sceneId, selfId,"Vß½ng Quy«n ðã ðÕt t¯i ða ( C¤p 9 )")
		return
	end
	local EquipType	= LuaFnGetBagEquipType(sceneId, selfId, lwIndex)
		if EquipType == 2 or EquipType == 17 or EquipType == 8 or EquipType == 18 or EquipType == 9 or EquipType == 10 then
			x391060_NotifyTip(sceneId, selfId,"Ám khí Th¶i trang T÷a kÜ Long Vån Võ h°n Không duy trì Thång Linh Thao tác")
		return
	end
	local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 30600084)
	local needMoney2=10*lw20
		if c0>=needMoney2 then
			LuaFnDelAvailableItem(sceneId,selfId,30600084,needMoney2)--C¡t bö V§t ph¦m 
		else
			x391060_NotifyTip(sceneId, selfId,"Yêu c¥u TØ Vi Linh Phách "..needMoney2)
			return
		end

	local reply = CostMoney(sceneId,selfId,50000)
	if reply == -1 then
		x391060_NotifyTip(sceneId, selfId,"Vàng không ðü")
		return
	end

	local_, myname = LuaFnGetItemCreator(sceneId, selfId, lwIndex);
	if(myname == nil) then
		myname=""
	end

	if lw20 == 0 then
		local dwlva1=myname.."w#p1";
		LuaFnSetItemCreator(sceneId, selfId, lwIndex, dwlva1)

	else
		lw20 = lw20 +1
		local dwlva1=lw21..lw20..lw23;
		LuaFnSetItemCreator(sceneId, selfId, lwIndex, dwlva1)

	end
		LuaFnRefreshItemInfo(sceneId, selfId, lwIndex)
	x391060_NotifyTip(sceneId, selfId,"Thång Linh trang b¸ thành công")
    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
  end




  if txpp == 200 then   --Con bò cÕp Thí nghi®m Thiên ÐÕo Thång Linh 

	local lw21,lw22,lw23 = x391060_wuhunjb2(sceneId, selfId, lwIndex)
	local lw20 = tonumber(lw22)

	if lw20 <1 or lw20 == nil then
			x391060_NotifyTip(sceneId, selfId,"Trang b¸ Thång Linh Vß½ng Quy«n ðÕt c¤p 9 m¾i có th¬ Tiªn hành Thiên ÐÕo")
		return
	end

	if lw20>= 9 then
			x391060_NotifyTip(sceneId, selfId,"Thiên ÐÕo Thång Linh ðã ðÕt t¯i ða")
		return
	end
	local EquipType	= LuaFnGetBagEquipType(sceneId, selfId, lwIndex)
		if EquipType == 2 or EquipType == 17 or EquipType == 8 or EquipType == 18 or EquipType == 9 or EquipType == 10 then
			x391060_NotifyTip(sceneId, selfId,"Ám khí Th¶i trang T÷a kÜ Long Vån Võ h°n Không duy trì Thång Linh Thao tác")
		return
	end
	local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 30600084)
	local needMoney2=10*lw20+100
		if c0>=needMoney2 then
			LuaFnDelAvailableItem(sceneId,selfId,30600084,needMoney2)--C¡t bö V§t ph¦m 
		else
			x391060_NotifyTip(sceneId, selfId,"Yêu c¥u TØ Vi Linh Phách"..needMoney2)
			return
		end

	local reply = CostMoney(sceneId,selfId,50000)
	if reply == -1 then
		x391060_NotifyTip(sceneId, selfId,"Vàng không ðü")
		return
	end

	local_, myname = LuaFnGetItemCreator(sceneId, selfId, lwIndex);
	if(myname == nil) then
		myname=""
	end

		lw20 = lw20 +1
		local dwlva1=lw21..lw20..lw23;
		LuaFnSetItemCreator(sceneId, selfId, lwIndex, dwlva1)

		LuaFnRefreshItemInfo(sceneId, selfId, lwIndex)
	x391060_NotifyTip(sceneId, selfId,"Thång Linh Thiên ÐÕo thành công")
    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
   if lw20 == 9 then
    local BAGindex = GetBagItemTransfer(sceneId, selfId, lwIndex)
    local str =""
    --str = format("#HVî ðÕi Cüa Anh hùng #{_INFOUSR%s}#HTÕi Phßþng minh Tr¤n Cüa #GTiêu H± (151,76)#HXØ Chª tÕo ra #ccc33ccMãn C¤p Thiên ÐÕo Trang b¸ #{_INFOMSG%s1}#H#LÕi mµt Th¥n binh lþi khí Kinh Hi®n thª Gian !",GetName(sceneId,selfId),BAGindex)
    BroadMsgByChatPipe(sceneId, selfId,str, 4)
   end
  end



  if txpp == 300 then   --Con bò cÕp Thí nghi®m Thång Linh Tiªn giäi 
	local lw21,lw22,lw23 = x391060_wuhunjb(sceneId, selfId, lwIndex)
	local lw20 = tonumber(lw22)

	if lw20 ~= 9 then
			x391060_NotifyTip(sceneId, selfId,"Vß½ng Quy«n Thång Linh ðÕt c¤p 9 m¾i có th¬ tiªn hành tiªn c¤p Thiên ÐÕo")
		return
	end
	local EquipType	= LuaFnGetBagEquipType(sceneId, selfId, lwIndex)
		if EquipType == 2 or EquipType == 17 or EquipType == 8 or EquipType == 18 or EquipType == 9 or EquipType == 10 then
			x391060_NotifyTip(sceneId, selfId,"Ám khí Th¶i trang T÷a kÜ Long Vån Võ h°n Không duy trì Thång Linh Thao tác")
		return
	end
	local reply = CostMoney(sceneId,selfId,500000)
	if reply == -1 then
		x391060_NotifyTip(sceneId, selfId,"Ti«n vàng Không ðü , Kh¤u l¤y Th¤t bÕi")
		return
	end

	local_, myname = LuaFnGetItemCreator(sceneId, selfId, lwIndex);
	if(myname == nil) then
		myname=""
	end

	if lw20 == 9 then
      dwlva1 = gsub(myname,"w#p9","t#p1",1)
      --dwlva1 = gsub(myname,"w#p9","",1) ---------------------------N½i này V« sau Có th¬ dùng Vu Th¯i Linh 
	 LuaFnSetItemCreator(sceneId, selfId, lwIndex, dwlva1)
	 LuaFnRefreshItemInfo(sceneId, selfId, lwIndex)
    end

	x391060_NotifyTip(sceneId, selfId,"Tiªn C¤p trang b¸ Vß½ng Quy«n lên Thiên ÐÕo thành công")
    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
    local BAGindex = GetBagItemTransfer(sceneId, selfId, lwIndex)
    local str =""
    --str = format("#HVî ðÕi Cüa Anh hùng #{_INFOUSR%s}#HTÕi Phßþng minh Tr¤n Cüa #GTiêu H± (151,76)#HXØ Chª tÕo ra Thiên ÐÕo Trang b¸ #{_INFOMSG%s1}#HThuµc tính Ðßþc ðªn Trên di®n rµng Tång lên.",GetName(sceneId,selfId),BAGindex)
    BroadMsgByChatPipe(sceneId, selfId,str, 4)
  end



  if txpp == 400 then   --Con bò cÕp Thí nghi®m Thång Linh D¶i ði 
	if lwIndex ==-1 or lwIntex ==-1 then
	 return
	end 
	if LuaFnGetPropertyBagSpace(sceneId, selfId) <1 then
	 x391060_NotifyTip(sceneId, selfId,"Bao vây Không v¸ tØ Không ðü Xin mi­n Thao tác")	
	 return
	end	

	local iio = GetItemEquipPoint(LuaFnGetItemTableIndexByIndex(sceneId, selfId, lwIndex)) --Nguyên Trang b¸ Cüa Trang b¸ Ði¬m 
	local iii = GetItemEquipPoint(LuaFnGetItemTableIndexByIndex(sceneId, selfId, lwIntex)) --Møc tiêu Trang b¸ Cüa Trang b¸ Ði¬m 

	if iio ~= iii then
	x391060_NotifyTip(sceneId, selfId,"Trang b¸ Không phäi Cùng loÕi LoÕi hình không th¬ D¶i ði")	
		return
	end

	local_, myname = LuaFnGetItemCreator(sceneId, selfId, lwIndex); --Nguyên 
	local_, otname = LuaFnGetItemCreator(sceneId, selfId, lwIntex); --Møc tiêu 

    --Tiên Ki¬m tra Møc tiêu Trang b¸ 
    if otname ~=nil then
      local oEquipWQ = strfind(otname,"w#p") 
      local oEquipTD = strfind(otname,"t#p") 
      if oEquipWQ ~= nil or oEquipTD ~= nil then
		x391060_NotifyTip(sceneId, selfId,"Trang b¸ c¥n Di Chuy¬n ðã có Thång Linh - không th¬ thao tác")
		return
	 end
    end

    --B¡t ð¥u Ki¬m tra ðo lß¶ng Nguyên Trang b¸ 
    if myname ~=nil then
      local mEquipWQ = strfind(myname,"w#p") 
      local mEquipTD = strfind(myname,"t#p") 
      if mEquipWQ ~= nil then
	  local reply = CostMoney(sceneId,selfId,500000)
	  if reply == -1 then
		x391060_NotifyTip(sceneId, selfId,"Vàng không ðü")
		return
	  end
       local wSLD = tonumber(strsub(myname,mEquipWQ+3,mEquipWQ+3))
       if wSLD <1 or wSLD> 9 then
	    x391060_NotifyTip(sceneId, selfId,"Vß½ng quy«n S¯ li®u Có sai l¥m , m¶i liên h® GM")
		return
	  end
       --Ði tr× Nguyên Trang b¸ Cüa Thång Linh Ðµ 
       if lwIndex ~= -1 then
         dwlva1 = gsub(myname,"(w#p)".."%w","",1)
	    LuaFnSetItemCreator(sceneId, selfId, lwIndex, dwlva1)
	    LuaFnRefreshItemInfo(sceneId, selfId, lwIndex)
       end
       --Gia tång Møc tiêu Trang b¸ Cüa Thång Linh Ðµ 
       if lwIntex ~= -1 then
         if otname == nil then
          dwlva2 ="w#p"..wSLD..""
         else
          dwlva2 =""..otname.."w#p"..wSLD..""
         end
	    LuaFnSetItemCreator(sceneId, selfId, lwIntex, dwlva2)
	    LuaFnRefreshItemInfo(sceneId, selfId, lwIntex)
	    x391060_NotifyTip(sceneId, selfId,"Di chuy¬n thành công")
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)

         local BAGintex = GetBagItemTransfer(sceneId, selfId, lwIntex)
         local str =""
         --str = format("#{_INFOUSR%s}#HTÕi Phßþng minh Tr¤n Cüa #GTiêu H± (151,76)#HXØ Phân bón hoa 50Kim , Tß½ng Cñu Trang b¸ Cüa Thång Linh Ðµ Thành công Chuy¬n d¶i ðªn #{_INFOMSG%s1}Thßþng !",GetName(sceneId,selfId),BAGintex)
         BroadMsgByChatPipe(sceneId, selfId,str, 4)
       end

      elseif mEquipTD ~= nil then
	  local reply = CostMoney(sceneId,selfId,500000)
	  if reply == -1 then
		x391060_NotifyTip(sceneId, selfId,"Vàng không ðüi")
		return
	  end
       local tSLD = tonumber(strsub(myname,mEquipTD+3,mEquipTD+3))
       if tSLD <1 or tSLD> 9 then
	    x391060_NotifyTip(sceneId, selfId,"Thiên ÐÕo S¯ li®u Có sai l¥m , m¶i liên h® GM")
		return
	  end
       --Ði tr× Nguyên Trang b¸ Cüa Thång Linh Ðµ 
       if lwIndex ~= -1 then
         dwlva1 = gsub(myname,"(t#p)".."%w","",1)
	    LuaFnSetItemCreator(sceneId, selfId, lwIndex, dwlva1)
	    LuaFnRefreshItemInfo(sceneId, selfId, lwIndex)
       end
       --Gia tång Møc tiêu Trang b¸ Cüa Thång Linh Ðµ 
       if lwIndex ~= -1 then
         if otname == nil then
          dwlva2 ="t#p"..tSLD..""
         else
          dwlva2 =""..otname.."t#p"..tSLD..""
         end
	    LuaFnSetItemCreator(sceneId, selfId, lwIntex, dwlva2)
	    LuaFnRefreshItemInfo(sceneId, selfId, lwIntex)
	    x391060_NotifyTip(sceneId, selfId,"Di chuy¬n thành công")
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)

         local BAGintex = GetBagItemTransfer(sceneId, selfId, lwIntex)
         local str =""
         --str = format("#{_INFOUSR%s}#HTÕi Phßþng minh Tr¤n Cüa #GTiêu H± (151,76)#HXØ Phân bón hoa 50Kim , Tß½ng Cñu Trang b¸ Cüa Thång Linh Ðµ Thành công Chuy¬n d¶i ðªn #{_INFOMSG%s1}Thßþng !",GetName(sceneId,selfId),BAGintex)
         BroadMsgByChatPipe(sceneId, selfId,str, 4)
       end
     else
	  x391060_NotifyTip(sceneId, selfId,"Trang b¸ không có Thång Linh - không th¬ di chuy¬n")
	  return
	end
   else
	x391060_NotifyTip(sceneId, selfId,"Trang b¸ không có Thång Linh - không th¬ di chuy¬n")
	return
   end
  end


end


--Con bò cÕp Gia tång Nµi dung Kªt thúc 

function x391060_wuhunjb(sceneId, selfId, arg1)
	local_, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
	local myname1 ="0"
	local myname2 ="0"
	local myname3 ="0"
	if(myname ~= nil) then
		local changdu1 = strlen(myname)
		local sree1 = strfind(myname,"w#p")
		if sree1 == nil then
			sree1 = 0
		end
			if sree1>= 1 then
				if changdu1 == 4 then
					myname1 = strsub(myname, 1,3)
					myname2 = strsub(myname, 4,4)
				else
					myname1 = strsub(myname, 1,sree1+2)
					myname2 = strsub(myname, sree1+3,sree1+3)
					myname3 = strsub(myname, sree1+4,changdu1)
				end
			end
		end
	return myname1,myname2,myname3
end

function x391060_wuhunjb2(sceneId, selfId, arg1)
	local_, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
	local myname1 ="0"
	local myname2 ="0"
	local myname3 ="0"
	if(myname ~= nil) then
		local changdu1 = strlen(myname)
		local sree1 = strfind(myname,"t#p")
		if sree1 == nil then
			sree1 = 0
		end
			if sree1>= 1 then
				if changdu1 == 4 then
					myname1 = strsub(myname, 1,3)
					myname2 = strsub(myname, 4,4)
				else
					myname1 = strsub(myname, 1,sree1+2)
					myname2 = strsub(myname, sree1+3,sree1+3)
					myname3 = strsub(myname, sree1+4,changdu1)
				end
			end
		end
	return myname1,myname2,myname3
end

function x391060_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

function x391060_XIEZI(sceneId, selfId)

  --Ki¬m tra ðo lß¶ng Kim Sí Linh vû 
	local jiance1 = LuaFnGetItemTableIndexByIndex(sceneId, selfId, 117)
    if jiance1 == 10155021 or jiance1>= 10155100 and jiance1 <= 10155139 then
      if HaveSkill(sceneId, selfId, 277) <1 then
       AddSkill(sceneId, selfId, 277)
	  x391060_NotifyTip(sceneId, selfId,"Trang b¸ [#{_ITEM"..jiance1.."}] - kích hoÕt Ám Khí Liên Kích kÛ nång")
      end
      for i = 901,905 do
       if HaveSkill(sceneId, selfId, i) <1 then
         AddSkill(sceneId, selfId, i)
       end
      end
    else
      if HaveSkill(sceneId, selfId, 277) == 1 then
	   DelSkill(sceneId, selfId, 277)
       x391060_NotifyTip(sceneId, selfId,"BÕn tháo xu¯ng Kim Sí Linh Vû - Ám Khí Liên Kích thu h°i")
      end
      for i = 901,905 do
       if HaveSkill(sceneId, selfId, i) == 1 then
         DelSkill(sceneId, selfId, i)
       end
      end
    end

  --Ki¬m tra ðo lß¶ng Thái c± Th¥n Khí 
    local SGSQ = 0
    local_, myname = LuaFnGetItemCreator(sceneId, selfId,100);
    if myname ~= nil then
	 local sree1 = strfind(myname,"#S")
	 if sree1 ~= nil then
        SGSQ = tonumber(strsub(myname,sree1+2,sree1+9))
      end
    end
    SetMissionData(sceneId,selfId,SuperWeapon9_DIYSkill,mod(SGSQ,10^6))
    if floor(SGSQ/10^6)>= 2 then
      if HaveSkill(sceneId, selfId, 930) ~= 1 then
        AddSkill(sceneId, selfId, 930)
      end
    else
      DelSkill(sceneId, selfId, 930)
    end
end
