-- NetCo4 950000: phat qua do admin gui tu panel.
-- Panel ghi hang doi vao Server/txt/NetCo4Qua/<GUID>.txt, moi dong 1 lenh:
--   item <ID vat pham> <so luong>
--   knb <so KNB>
--   vang <so vang>
--   diemtang <so Diem Tang>
--   level <cap 1-119>   (chi len cap, khong ha cap)
--   xoa <ID vat pham> <so luong>   (admin xoa khoi tui, vd do khong vut duoc)
--   doi <ID cu> <ID moi>   (doi TAT CA ID cu trong tui sang ID moi, giu so luong - vd nang cap ngoc)
--   vip <cap 0-10>
-- Duoc goi tu scene.lua: x888888_OnScenePlayerLogin (dang nhap) va x888888_OnScenePlayerEnter (doi ban do).
-- Tui day: phan chua nhan duoc ghi lai, nhan tiep o lan dang nhap sau.
-- File nay chi dung ky tu ASCII; chu tieng Viet viet bang escape VISCII (tools/vn.py).

x950000_g_ScriptId = 950000
x950000_g_Dir = "./txt/NetCo4Qua/"

-- Cap toi thieu toan server: panel ghi so cap vao _capmin.txt (0 = tat). Nhan vat duoi cap nay
-- thi len cap khi dang nhap/doi ban do, ke ca nhan vat moi tao (khong can vao phai).
-- KHONG dat DefaultChar.ini level >= 100: scene.lua x888888_OnScenePlayerFirstLogin coi nhan vat moi
-- cap >= 100 la hack va SetLevel 0. Ham nay chay trong OnScenePlayerLogin, SAU buoc kiem tra do.
function x950000_CapMin( sceneId, selfId )
	local h = openfile( x950000_g_Dir.."_capmin.txt", "r" )
	if h == nil then
		return
	end
	local s = read( h, "*l" )
	closefile( h )
	if s == nil then
		return
	end
	local n = tonumber( s )
	if n == nil or n < 1 or n > 119 then
		return
	end
	if GetLevel( sceneId, selfId ) < n then
		SetLevel( sceneId, selfId, n )
		x950000_Tip( sceneId, selfId, "B\213n \240\227 \240\223\254c n\226ng l\234n c\164p "..n )
	end
end

function x950000_NhanQua( sceneId, selfId )
	x950000_CapMin( sceneId, selfId )
	CallScriptFunction( 999999, "NhanWeb", sceneId, selfId )   -- KNB chuyen tu web mini game (CDK/CDK.lua)
	local guid = LuaFnGetGUID( sceneId, selfId )
	local path = x950000_g_Dir..guid..".txt"
	local h = openfile( path, "r" )
	if h == nil then
		return
	end
	local lines = {}
	local line = read( h, "*l" )
	while line do
		tinsert( lines, line )
		line = read( h, "*l" )
	end
	closefile( h )
	if getn( lines ) == 0 then
		return
	end

	local left = {}
	local got = 0
	for i = 1, getn( lines ) do
		local s, e, kind, a, b = strfind( lines[i], "^(%a+)%s+(%d+)%s*(%d*)" )
		local n = tonumber( b )
		if n == nil or n < 1 then
			n = 1
		end
		if kind == "item" then
			local id = tonumber( a )
			local k = 0
			while k < n do
				local r = TryRecieveItem( sceneId, selfId, id, 1 )
				if r == nil or r < 0 then
					break
				end
				k = k + 1
			end
			got = got + k
			if k < n then
				tinsert( left, "item "..id.." "..( n - k ) )
			end
		elseif kind == "knb" then
			YuanBao( sceneId, selfId, -1, 1, tonumber( a ) )
			got = got + 1
		elseif kind == "vang" then
			AddMoney( sceneId, selfId, tonumber( a ) )
			got = got + 1
		elseif kind == "diemtang" then
			ZengDian( sceneId, selfId, -1, 1, tonumber( a ) )
			got = got + 1
		elseif kind == "level" then
			-- SetLevel giong qua Tan Thu 8887 (obj/loulangucheng/oloulan_malan.lua)
			if GetLevel( sceneId, selfId ) < tonumber( a ) then
				SetLevel( sceneId, selfId, tonumber( a ) )
			end
			got = got + 1
		elseif kind == "xoa" then
			-- Xoa toi da n cai, co bao nhieu xoa bay nhieu. Khong tinh la "nhan qua" (khong hien thong bao)
			local id = tonumber( a )
			local co = LuaFnGetAvailableItemCount( sceneId, selfId, id )
			if co > n then
				co = n
			end
			if co > 0 then
				LuaFnDelAvailableItem( sceneId, selfId, id, co )
			end
		elseif kind == "doi" then
			-- Dem ID cu trong tui -> xoa dung so do -> phat lai dung so do bang ID moi (1 luot, khong lech so).
			-- Tui day giua chung: phan chua phat duoc xep lai "item <ID moi> <con lai>" nhan lan sau.
			local cu = tonumber( a )
			local moi = tonumber( b )
			local co = 0
			if moi ~= nil and moi > 0 then
				co = LuaFnGetAvailableItemCount( sceneId, selfId, cu )
			end
			if co > 0 then
				LuaFnDelAvailableItem( sceneId, selfId, cu, co )
				local k = 0
				while k < co do
					local r = TryRecieveItem( sceneId, selfId, moi, 1 )
					if r == nil or r < 0 then
						break
					end
					k = k + 1
				end
				got = got + k
				if k < co then
					tinsert( left, "item "..moi.." "..( co - k ) )
				end
			end
		elseif kind == "vip" then
			-- Cap VIP = CHONG_ZHI_CHONGSHU (ScriptGlobal.lua). VIP>=1 mo phuc loi ngay (shengjjll.lua
			-- index 20-37), so luong qua tang theo cap. Ban goc chi len VIP bang nap tien.
			SetMissionData( sceneId, selfId, CHONG_ZHI_CHONGSHU, tonumber( a ) )
			got = got + 1
		end
	end

	-- Ghi lai phan chua nhan (file rong = da nhan het)
	h = openfile( path, "w" )
	if h then
		for i = 1, getn( left ) do
			write( h, left[i].."\n" )
		end
		closefile( h )
	end

	if got > 0 then
		x950000_Tip( sceneId, selfId, "B\213n \240\227 nh\167n qu\224 t\215 admin NetCo4" )
	end
	if getn( left ) > 0 then
		x950000_Tip( sceneId, selfId, "T\250i \240\165y, ph\165n c\242n l\213i s\168 nh\167n \183 l\165n \240\229ng nh\167p sau" )
	end
end

function x950000_Tip( sceneId, selfId, msg )
	BeginEvent( sceneId )
	AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
