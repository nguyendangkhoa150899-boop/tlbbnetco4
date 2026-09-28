--CØa hàng 
--Môn phái CØa hàng 
--Tiêu Dao KÏ môn ðµn giáp 

--K¸ch bän g¯c Hào 
x760621_g_ScriptId = 760621

--CØa hàng Hào 
x760621_g_shoptableindex=271

--CØa hàng Tên 
x760621_g_ShopName ="Mua s¡m Truy nguyên Chi thu§t Ph¯i phß½ng"

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760621_OnDefaultEvent(sceneId, selfId, targetId)	--Ði¬m ðánh Cai Nhi®m vø H§u Ch¤p hành ThØ K¸ch bän g¯c 
	DispatchShopItem(sceneId, selfId,targetId, x760621_g_shoptableindex)
end

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x760621_OnEnumerate(sceneId, selfId, targetId)
	--Phán ðoán Hay không là B±n phái Ð® tØ 
	if GetMenPai(sceneId,selfId) == 9 then
		AddNumText(sceneId,x760621_g_ScriptId,x760621_g_ShopName,7,-1)
  end
	return
end

--**********************************
--Ki¬m tra ðo lß¶ng Tiªp thu Ði«u ki®n 
--**********************************
function x760621_CheckAccept(sceneId, selfId)
end

--**********************************
--Tiªp thu 
--**********************************
function x760621_OnAccept(sceneId, selfId)
end

--**********************************
--T× bö 
--**********************************
function x760621_OnAbandon(sceneId, selfId)
end

--**********************************
--Tiªp tøc 
--**********************************
function x760621_OnContinue(sceneId, selfId, targetId)
end

--**********************************
--Ki¬m tra ðo lß¶ng Hay không có th¬ Ð® trình 
--**********************************
function x760621_CheckSubmit(sceneId, selfId)
end

--**********************************
--Ð® trình 
--**********************************
function x760621_OnSubmit(sceneId, selfId, targetId,selectRadioId)
end

--**********************************
--Giªt chªt Quái v§t Ho£c Ngß¶i ch½i 
--**********************************
function x760621_OnKillObject(sceneId, selfId, objdataId,objId)
end

--**********************************
--Tiªn vào Khu vñc Sñ ki®n 
--**********************************
function x760621_OnEnterArea(sceneId, selfId, zoneId)
end

--**********************************
--ÐÕo cø Thay ð±i 
--**********************************
function x760621_OnItemChanged(sceneId, selfId, itemdataId)
end
