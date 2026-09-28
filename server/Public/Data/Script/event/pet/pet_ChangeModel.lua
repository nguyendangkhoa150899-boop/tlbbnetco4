-- trân thú biªn äo -- trân thú sØa ð±i m£t ngoài 

--  chuy¬n tính ðan 

--  chân v¯n s¯ 
x800124_g_ScriptId  =  800124;

x800124_zhuanXingdian_ItemDataID  =  30502003;	 -- chuy¬n tính ðan 

--**********************************
--  nhi®m vø nh§p kh¦u hàm s¯ 
--**********************************
function  x800124_OnDefaultEvent(sceneId,  selfId,  targetId)

	 if  GetNumText()  ==  1  then
	       BeginUICommand(sceneId);
	       UICommand_AddInt(sceneId,  targetId);
	       EndUICommand(sceneId);
                      DispatchUICommand(sceneId,  selfId,  20090804);

        elseif  GetNumText()  ==  2  then
	       BeginUICommand(sceneId);
	       UICommand_AddInt(sceneId,  targetId);
	       EndUICommand(sceneId);
                      DispatchUICommand(sceneId,  selfId,  20101029);
                end
end

--**********************************
--  nhóm gi½ sñ ki®n 
--**********************************
function  x800124_OnEnumerate(sceneId,  selfId,  targetId)
	 AddNumText(sceneId,  x800124_g_ScriptId,  "Äo hóa trân thú"  ,  6,  1);
	 AddNumText(sceneId,  x800124_g_ScriptId,  "Thay ð±i ngoÕi hình trân thú"  ,  6,  2);
end

--**********************************
--  chuy¬n tính ðan quy t¡c 
--  0  -  nhát gan 
--  1  -  c¦n th§n 	 
--  2  -  trung thành 
--  3  -  khôn khéo 
--  4  -  dûng mãnh 
--**********************************

function  x800124_Pet_ChangeModel(sceneId,  selfId,  petGUID_H,  petGUID_L)


end



function  x800124_Pet_HH(sceneId,  selfId,  petGUID_H,  petGUID_L)

	 if  not  sceneId  or  not  selfId  or  not  petGUID_H  or  not  petGUID_L  then
	 	 x800124_ShowTips(sceneId,  selfId,  " sai l¥m thao tác . ");
	 	 return  0;
	 end
	 
	 local  zhuanXingdianItemName  =  GetItemName(sceneId,  x800124_zhuanXingdian_ItemDataID);
	 if  not  zhuanXingdianItemName  then
	 	 x800124_ShowTips(sceneId,  selfId,  " không m· ra v§t ph¦m . ");
	 	 return  0;
	 end

	 local  curAIType  =  LuaFnGetPetAITypeByGUID(sceneId,  selfId,  petGUID_H,  petGUID_L);
	 if  not  curAIType  or  curAIType  ==  -1  then
	 	 x800124_ShowTips(sceneId,  selfId,  " ngß½i chï ð¸nh trân thú không t°n tÕi . ");
	 	 return  0;
	 end

	 local  petAvailableFlag  =  LuaFnIsPetAvailableByGUIDNoPW(sceneId,  selfId,  petGUID_H,  petGUID_L);
	 if  not  petAvailableFlag  or  petAvailableFlag  ~=  1  then
	 	 x800124_ShowTips(sceneId,  selfId,  " không th¬ ð¯i v¾i phong töa ðích trân thú tiªn hành thao tác . ");
	 	 return  0;
	 end
	 
	 local  availableItemCount  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  x800124_zhuanXingdian_ItemDataID);
	 if  not  availableItemCount  or  availableItemCount  <  1  then
	 	 x800124_ShowTips(sceneId,  selfId,  " c¥n "..zhuanXingdianItemName.." . ");
	 	 return  0;
	 end
	 
	 local  delRet  =  LuaFnDelAvailableItem(sceneId,  selfId,  x800124_zhuanXingdian_ItemDataID,  1);
	 if  not  delRet  or  delRet  ~=  1  then
	 	 x800124_ShowTips(sceneId,  selfId,  " kh¤u tr× "..zhuanXingdianItemName.." th¤t bÕi . ");
	 	 return  0;
	 end

	 --AI loÕi hình t¤t sØa ð±i , h½n næa m²i loÕi ky tÖ s¯ là gi¯ng nhau 
	 local  toAIType  =  random(4)  -  1;
	 if  toAIType  >=  curAIType  then
	 	 toAIType  =  toAIType  +  1;
	 end

	 local  ret  =  LuaFnSetPetAITypeByGUID(sceneId,  selfId,  petGUID_H,  petGUID_L,  toAIType);
	 if  not  ret  or  ret  ~=  1  then
	 	 x800124_ShowTips(sceneId,  selfId,  " ngß½i chï ð¸nh trân thú không t°n tÕi . ");
	 	 return  0;
	 end

	 x800124_ShowTips(sceneId,  selfId,  " ngài ðích trân thú ðích tính tình ðã sØa ð±i thành công . ");
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  18,  0);
	 return  1;
end

--**********************************
--  ð« kÏ tin tÑc 
--**********************************
function  x800124_ShowTips(sceneId,  selfId,  tipMsg)
	 BeginEvent(sceneId);
	 	 AddText(sceneId,  tipMsg);
	 EndEvent(sceneId);
	 DispatchMissionTips(sceneId,  selfId);
end