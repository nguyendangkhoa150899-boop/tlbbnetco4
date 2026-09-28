--Đại lý NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
--function x760562_OnDefaultEvent(sceneId, selfId,targetId)
	--BeginEvent(sceneId)
		--AddText(sceneId,"#{173LJ_121009_02}");
--	EndEvent(sceneId)
	--DispatchEventList(sceneId,selfId,targetId)
--end

x760562_g_scriptId = 760562

x760562_g_MaxBagSize = 60        
x760562_g_Key = {
                1234567891,
                }


--**********************************
-- ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x760562_OnDefaultEvent( sceneId, selfId )
    if GetNumText() ==100 then
        x760562_Check(sceneId, selfId, 0,0)
    end
end

--**********************************
--×°±¸¹¦ÄÜ
--**********************************
function x760562_BackToIndex( sceneId, selfId )
    x399999_OnDefaultEvent( sceneId, selfId, -1 )
end
--**********************************
--Íæ¼ÒÆÁÄ»ÖÐ¼äÌáÊ¾
--**********************************
function x760562_Tips( sceneId, selfId, str )
    BeginEvent( sceneId )
        AddText( sceneId, str )
    EndEvent( sceneId )
    DispatchMissionTips( sceneId, selfId )
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x760562_MsgBox( sceneId, selfId, msg )
    BeginEvent( sceneId )
        AddText( sceneId, msg )
    EndEvent( sceneId )
    DispatchEventList( sceneId, selfId, -1 )
end
--**********************************
--¹Ø±Õ¶Ô»°¿ò
--**********************************
function x760562_CloseMe(sceneId, selfId)
    BeginUICommand(sceneId)
    EndUICommand(sceneId)
    DispatchUICommand(sceneId,selfId, 1000)
end
--**********************************
--ËæÉí¹¦ÄÜ
--**********************************
function x760562_Check(sceneId,selfId,key,isNPC)
    if key==0 then
        key=GetNumText()    
    end
    if key==100 then
    local strGUID = LuaFnGetGUID( sceneId, selfId )
    local Is_Active = GetMissionData(sceneId, selfId, MD_ACTIVE_CODE)    
        BeginEvent(sceneId)


            AddText(sceneId, "  #GXin chào các hÕ! #r#WM¶i ch÷n nhæng chÑc nång h² trþ các hÕ c¥n.")        
            if (Is_Active <= 190000000) then
                AddNumText(sceneId, x760562_g_scriptId,"#b#GNh§p Gift Code (C¥n 4 Ô tr¯ng)", 4, 114)
            end            
            if isNPC==0 then
                AddNumText(sceneId, x760562_g_scriptId,"Quay lÕi", 8, 8888)
            else    
            end    
            
        EndEvent(sceneId)
        DispatchEventList(sceneId,selfId,-1)
            

    elseif key==114  then --doi gift code
        BeginUICommand( sceneId )
            UICommand_AddInt( sceneId, selfId )
        EndUICommand( sceneId )
        DispatchUICommand( sceneId, selfId, 12125185 )        
            
    end
end

--**********************************
--Gift Code
--**********************************
function x760562_GiftCode( sceneId, selfId, GiftCode)
    local    nam    = LuaFnGetName( sceneId, selfId )
    local Code=GiftCode;
    local Is_Active = GetMissionData(sceneId, selfId, MD_ACTIVE_CODE)
    --i=1;
    local FreeSpace1 = LuaFnGetMaterialBagSpace( sceneId, selfId )
    local FreeSpace2 = LuaFnGetPropertyBagSpace( sceneId, selfId )
    if( FreeSpace1 < 2 ) then
       x760562_NotifyFailTips( sceneId, selfId,"Khu nguyên li®u cüa bÕn không ðü ch² tr¯ng.");
       x760562_CloseMe(sceneId, selfId)
    elseif( FreeSpace2 < 7 ) then
       x760562_NotifyFailTips( sceneId, selfId,"Khu v§t ph¦m cüa bÕn không ðü ch² tr¯ng.");
    else
        if(Is_Active <= 190000000) then
            for i = 1,10 do
                if (Code == x760562_g_Key[i]) then
                    local BindBagIndex1 = TryRecieveItem( sceneId, selfId, 39999901, QUALITY_CREATE_DEFAULT ) -- Vat pham
                    SetMissionData(sceneId, selfId, MD_ACTIVE_CODE, 200000001 )
                    x760562_NotifyFailTips( sceneId, selfId,"Chúc m×ng "..nam.." nh§n thß·ng thành công v¾i Code "..Code.." .");            
                    return
                end
            end
            x760562_NotifyFailTips( sceneId, selfId,"BÕn ðã nh§p sai Code");

        else
            x760562_NotifyFailTips( sceneId, selfId,"BÕn ðã nh§n thß·ng r°i!");
        end    
   end        

end

function x760562_MsgBox( sceneId, selfId, msg )
    BeginEvent( sceneId )
        AddText( sceneId, msg )
    EndEvent( sceneId )
    DispatchEventList( sceneId, selfId, -1 )
end

function x760562_NotifyFailTips( sceneId, selfId, Tip )
    BeginEvent( sceneId )
        AddText( sceneId, Tip )
    EndEvent( sceneId )
    DispatchMissionTips( sceneId, selfId )
end

function x760562_Restore_hpmp( sceneId, selfId, targetId )
    RestoreHp( sceneId, selfId )
    RestoreMp( sceneId, selfId )
    RestoreRage( sceneId, selfId )
end