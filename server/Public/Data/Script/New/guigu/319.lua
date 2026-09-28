--CØa hàng 
--Môn phái CØa hàng 
--Tiêu Dao KÏ môn ðµn giáp 

--K¸ch bän g¯c Hào 
x760319_g_ScriptId = 760319

--CØa hàng Hào 
x760319_g_shoptableindex=85

--CØa hàng Tên 
x760319_g_ShopName ="Mua s¡m QuÖ C¯c Bùa chú Ph¯i phß½ng"

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760319_OnDefaultEvent(sceneId, selfId, targetId)	--Ði¬m ðánh Cai Nhi®m vø H§u Ch¤p hành ThØ K¸ch bän g¯c 
	DispatchShopItem(sceneId, selfId,targetId, x760319_g_shoptableindex)
end

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x760319_OnEnumerate(sceneId, selfId, targetId)
	--Phán ðoán Hay không là B±n phái Ð® tØ 
	if GetMenPai(sceneId,selfId) == MP_GUIGU then
		AddNumText(sceneId,x760319_g_ScriptId,x760319_g_ShopName,7,-1)
  end
	return
end

--**********************************
--Ki¬m tra ðo lß¶ng Tiªp thu Ði«u ki®n 
--**********************************
function x760319_CheckAccept(sceneId, selfId)
end

--**********************************
--Tiªp thu 
--**********************************
function x760319_OnAccept(sceneId, selfId)
end

--**********************************
--T× bö 
--**********************************
function x760319_OnAbandon(sceneId, selfId)
end

--**********************************
--Tiªp tøc 
--**********************************
function x760319_OnContinue(sceneId, selfId, targetId)
end

--**********************************
--Ki¬m tra ðo lß¶ng Hay không có th¬ Ð® trình 
--**********************************
function x760319_CheckSubmit(sceneId, selfId)
end

--**********************************
--Ð® trình 
--**********************************
function x760319_OnSubmit(sceneId, selfId, targetId,selectRadioId)
end

--**********************************
--Giªt chªt Quái v§t Ho£c Ngß¶i ch½i 
--**********************************
function x760319_OnKillObject(sceneId, selfId, objdataId,objId)
end

--**********************************
--Tiªn vào Khu vñc Sñ ki®n 
--**********************************
function x760319_OnEnterArea(sceneId, selfId, zoneId)
end

--**********************************
--ÐÕo cø Thay ð±i 
--**********************************
function x760319_OnItemChanged(sceneId, selfId, itemdataId)
end
