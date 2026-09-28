-- 890097 Vong quay may man - viet lai cho NetCo4 (28/09/2026).
-- Ban cu: client tu gui "biaoji" nen tu chon duoc mon, va gui checknum=0 thi nhan lai vo han.
-- Ban nay: SERVER tu chon mon theo ty le trong x890097_g_Pool va phat ngay khi quay (index 1).
-- Buoc "nhan" (index 3) do client gui len bi bo qua. Ban goc: xem lich su git.
-- Chi ky tu ASCII; chu tieng Viet = escape VISCII (tools/vn.py).

x890097_g_ScriptId = 890097
x890097_g_Cost = 30070501   -- Hanh Van Qua, mat 1 cai moi luot quay

-- { ID vat pham, so luong, ty le (tong = 100), bao toan server }
x890097_g_Pool = {
	{ 20310166, 1, 30, 0 },  -- Kim Tam Ti
	{ 39999901, 1, 20, 0 },  -- Cong Luc Dan
	{ 38000397, 1, 15, 0 },  -- Chan Nguyen Tinh Phach
	{ 38002067, 1, 10, 0 },  -- Ngung Tuc Hoan
	{ 38002049, 1,  8, 0 },  -- Phuc Hi Ngoc
	{ 38002041, 1,  7, 0 },  -- Menh Hon Ngoc
	{ 50301001, 1,  5, 0 },  -- Mieu Nhan Thach cap 3
	{ 39910001, 1,  3, 1 },  -- Nguyen Bao Phieu 1000
	{ 30070501, 1,  1, 0 },  -- Hanh Van Qua (quay them)
	{ 10423024, 1,  1, 1 },  -- Trung Lau Ngoc
}

function x890097_Pick()
	local r = random( 1, 100 )
	local acc = 0
	for i = 1, getn( x890097_g_Pool ) do
		acc = acc + x890097_g_Pool[i][3]
		if r <= acc then
			return x890097_g_Pool[i]
		end
	end
	return x890097_g_Pool[1]
end

function x890097_GetItemHCJ( sceneId, selfId, index, itm, biaoji, checknum )
	if index ~= 1 then
		-- index 2 (doi mon tren vong) va 3 (client xin nhan mon) khong con dung
		if index == 2 then
			x890097_Tips( sceneId, selfId, "Ch\209c n\229ng n\224y \240\227 t\161t" )
		end
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 or LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1 then
		x890097_Tips( sceneId, selfId, "T\250i \240\176 \240\165y, c\165n \237t nh\164t 1 \244 tr\175ng" )
		return
	end
	if LuaFnDelAvailableItem( sceneId, selfId, x890097_g_Cost, 1 ) < 1 then
		x890097_Tips( sceneId, selfId, "Kh\244ng c\243 H\213nh V\167n Qu\228" )
		return
	end

	local p = x890097_Pick()
	local pos = -1
	for k = 1, p[2] do
		pos = TryRecieveItem( sceneId, selfId, p[1], 1 )
	end

	-- Cho giao dien vong quay chay hieu ung (o dung hien thi chi la ngau nhien, mon that da vao tui)
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, random( 1, 24 ) )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 20120817 )

	x890097_Tips( sceneId, selfId, "V\242ng quay NetCo4: b\213n nh\167n \240\223\254c ph\165n th\223\183ng" )
	if p[4] == 1 and pos ~= nil and pos >= 0 then
		local link = GetBagItemTransfer( sceneId, selfId, pos )
		local msg = "#Y" .. "Ch\250c m\215ng " .. "#{_INFOUSR" .. GetName( sceneId, selfId ) .. "}#Y \240\227 quay \240\223\254c #{_INFOMSG" .. link .. "}"
		BroadMsgByChatPipe( sceneId, selfId, msg, 4 )
	end
end

function x890097_Tips( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
