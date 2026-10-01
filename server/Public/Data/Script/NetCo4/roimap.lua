-- NetCo4 950001: roi do THEO MAP (01/10). Gan script_id=950001 cho diem spawn quai trong Public/Scene/<map>_monster.ini.
-- Ly do khong dung bang roi MonsterDropBoxs: quai cung ID xuat hien o nhieu map (vd Ma Trang Thu Ve 11469 o Han Huyet Linh,
-- Hau Hoa Vien, Thong Thien Thap) -> gan theo ID quai thi do roi lan sang map khac.
-- Moi thanh vien to doi o gan tung nguoi roll rieng (giong luat roi do cua game). Do roi tren xac quai (AddMonsterDropItem).
-- Sua so % o day co hieu luc ngay (Lua), them map moi thi phai sua file _monster.ini + restart.
-- File chi dung ky tu ASCII.

x950001_g_ScriptId = 950001

-- [sceneId] = { ID vat pham, % roi moi nguoi }
x950001_g_Roi = {
	[432] = { 20310166, 30 },   -- Han Huyet Linh: Kim Tam Ti (cuong hoa dieu van)
	[62]  = { 38000571, 30 },   -- Hau Hoa Vien: Chi Ton Cuong Hoa Tinh Hoa (map chi mo theo gio, MyNew/jiarumenpai.lua x990010_g_HHV_Mo/Dong)
	[82]  = { 38000571, 30 },   -- Hau Hoa Vien 2
	[182] = { 38000571, 30 },   -- Hau Hoa Vien 3
	[179] = { 38002049, 30 },   -- [01/10] Tuyet Lang Ho: Phuc Hi Ngoc (533 diem spawn quai thuong + [02/10] 5 con 11299-11303 qua obj/elite/xuelanghu_N_baby.lua).
	                            -- [02/10] Tuyet Lang Ho CHI roi mon nay: 15 loai quai 11154-11163, 11299-11303 da bo het hop trong MonsterDropBoxs.txt
}

-- Pho ban (scene tao dong, sceneId moi luot khac nhau): goi tu ham OnDie cua quai pho ban
--   CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, <ID vat pham>, <%> )
-- Dang goi: Lien Hoan Q To Chau (event/xunhuan/sancaixiagunpc_die.lua, quai script 1130) -> Cuu Thien Ngoc Toai 20800034 30% (02/10: 40 -> 30).
function x950001_RoiDo( sceneId, selfId, killerId, itemId, pct )
	x950001_Chia( sceneId, selfId, killerId, { itemId, pct } )
end

-- [01/10 toi] roll pct% roi BOC 1 trong danh sach (moi nguoi toi da 1 mon). Goi: CallScriptFunction( 950001, "RoiBoc", sceneId, selfId, killerId, <nhom>, <%> )
--   nhom 1 = Mien Bo 6 / Bi Ngan 6 (Q To Chau 1130, Q Lau Lan 1129 + quai dot 3 qua OnDie)
x950001_g_Boc = {
	[1] = { 20501006, 20502006 },   -- 6 cap Mien Bo, 6 cap Bi Ngan
}
function x950001_RoiBoc( sceneId, selfId, killerId, nhom, pct )
	local ds = x950001_g_Boc[nhom]
	if ds == nil then
		return
	end
	x950001_Chia( sceneId, selfId, killerId, { ds, pct } )
end

function x950001_Roll( sceneId, selfId, playerId, r )
	if random( 1, 100 ) <= r[2] then
		local item = r[1]
		if type( item ) == "table" then
			item = item[ random( 1, getn( item ) ) ]   -- boc 1 trong danh sach
		end
		AddMonsterDropItem( sceneId, selfId, playerId, item )
	end
end

-- Pho ban: quai tao bang LuaFnCreateMonster(..., 950001) -> tra theo script cua pho ban (CopySceneData_Param 1)
x950001_g_RoiPhoBan = {
	[50100] = { 20800034, 30 },   -- Lien Hoan Q To Chau (quai dot 3)
	[50220] = { 20800034, 30 },   -- Lien Hoan Q Lau Lan / Viem Ma Son (quai nho dot 3)
}
-- [01/10 toi] roi them (roll rieng): Mien Bo 6 / Bi Ngan 6 10% boc 1
x950001_g_RoiPhoBan2 = {
	[50100] = { x950001_g_Boc[1], 10 },
	[50220] = { x950001_g_Boc[1], 10 },
}

function x950001_OnDie( sceneId, selfId, killerId )
	local r = x950001_g_Roi[sceneId]
	if r == nil and LuaFnGetSceneType( sceneId ) == 1 then
		r = x950001_g_RoiPhoBan[ LuaFnGetCopySceneData_Param( sceneId, 1 ) ]
	end
	if r == nil then
		return
	end
	x950001_Chia( sceneId, selfId, killerId, r )
	if LuaFnGetSceneType( sceneId ) == 1 then
		local r2 = x950001_g_RoiPhoBan2[ LuaFnGetCopySceneData_Param( sceneId, 1 ) ]
		if r2 ~= nil then
			x950001_Chia( sceneId, selfId, killerId, r2 )
		end
	end
end

-- moi thanh vien to doi o gan roll rieng
function x950001_Chia( sceneId, selfId, killerId, r )
	if LuaFnIsObjValid( sceneId, killerId ) ~= 1 then
		return
	end
	local playerId = killerId
	if GetCharacterType( sceneId, killerId ) == 3 then
		playerId = GetPetCreator( sceneId, killerId )
	end
	if LuaFnHasTeam( sceneId, playerId ) == 1 then
		local n = GetNearTeamCount( sceneId, playerId )
		if n >= 1 then
			for i = 0, n - 1 do
				x950001_Roll( sceneId, selfId, GetNearTeamMember( sceneId, playerId, i ), r )
			end
			return
		end
	end
	x950001_Roll( sceneId, selfId, playerId, r )
end

-- ===== [01/10] TUI DO GIET BOSS (dat trong roimap.lua vi 950001 da dang ky, khong can restart) =====
-- "tui do giet boss" (01/10). Ghi lai AI co mat luc BOSS CUOI cua mot hoat dong chet,
-- bot web (repo bialk, BotDoMin/tuiboss.js) doc file nay -> tao tui cho tung nguoi -> nguoi choi bam Nhan tren web
-- -> do vao hang doi qua (nhan khi doi map) + KNB vao vi web.
-- Goi tu ham OnDie cua boss cuoi:   CallScriptFunction( 950001, "TB_Ghi", sceneId, selfId, killerId )
-- hoac tu OnKillObject nhiem vu:     CallScriptFunction( 950001, "TB_GhiId", sceneId, objdataId, selfId )
-- Chi ghi khi ID quai co trong x950001_TB_g_Boss (script chet dung chung cho ca quai thuong).
-- Nguoi nhan: o pho ban (scene tao dong) = MOI nguoi dang trong pho ban; ngoai map = nguoi giet + to doi o gan.
-- Dong ghi:  <unix giay> TAB <sceneId> TAB <ID quai> TAB <GUID1,GUID2,...>
-- Sua bang ID o day co hieu luc ngay (Lua). File chi dung ky tu ASCII.

x950001_TB_g_File = "./txt/NetCo4Web/tuiboss.log"

x950001_TB_g_Boss = {}
function x950001_TB_Them( ds )
	for i = 1, getn( ds ) do
		x950001_TB_g_Boss[ ds[i] ] = 1
	end
end
x950001_TB_Them( { 4130, 4131, 4132, 4133, 4134, 4135, 4136, 4137, 4138, 4139, 34130, 34131, 34132, 34133, 34134, 34135, 34136, 34137, 34138, 34139 } )  -- Q To Chau: Bien Canh Dai Vuong (dot 3)
x950001_TB_Them( { 13220, 13221, 13222, 13223, 13224, 13225, 13226, 13227, 13228, 13229 } )  -- Q Lau Lan / Viem Ma Son: boss dot 5
x950001_TB_Them( { 9430, 9431, 9432, 9433, 9434, 9435, 9436, 9437, 9438, 9439, 39430, 39431, 39432 } )  -- Yen Tu O: Mo Dung Phuc
x950001_TB_Them( { 15175, 15073 } )  -- Binh Thanh Ky Tran lon / nho: boss cuoi
x950001_TB_Them( { 14145 } )         -- Tu Tuyet Trang: Bang Xi
x950001_TB_Them( { 9666, 9546 } )    -- Phieu Mieu Phong thuong / khieu chien: Ly Thu Thuy
x950001_TB_Them( { 13456 } )         -- Sat Tinh (Sinh Tu Loi Dai): CHI Ngo Vinh, 1 tui / luot (xem x950001_TB_SatTinhDuoc)
x950001_TB_Them( { 14234 } )         -- Thieu That Son: Dinh Xuan Thu
x950001_TB_Them( { 11353 } )         -- Long Quy (Thanh Thu Son)
x950001_TB_Them( { 12138, 12139, 12140, 12141, 12142, 12143, 12144, 12145, 12146 } )  -- Lau Lan Tam Bao: Tran Bao Long Vuong
x950001_TB_Them( { 473 } )           -- Ac Tac Tao Phan (su kien Tac binh)
x950001_TB_Them( { 1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919 } )  -- Ac Ba (nhiem vu thanh thi, Thi Tap)

-- [01/10 23:40] Sat Tinh = Sinh Tu Loi Dai, 12 NPC goi 12 tran lan luot (truoc day moi tran 1 tui -> 11 tui / luot).
-- Chu server chot: chi tinh boss cuoi Ngo Vinh 13456. NPC Tong Giang (obj/shengsi/songjiang.lua) CUNG goi ra 13456
-- (loi cua server cu) -> con Ngo Vinh chet khi NPC Ngo Vinh 13552 van con dung = con cua Tong Giang -> khong tinh.
-- NPC bien mat khi bi khieu chien va khong hoi sinh trong luot (respawn 10000 giay). O du lieu pho ban 24 = da ghi luot nay
-- (dat 0 khi tao pho ban: shengsileitai.lua MakeCopyScene).
x950001_TB_g_SatTinhBoss = 13456
x950001_TB_g_SatTinhNpc  = 13552
x950001_TB_g_SatTinhO    = 24

function x950001_TB_SatTinhDuoc( sceneId )
	if LuaFnGetSceneType( sceneId ) ~= 1 then
		return 0
	end
	if LuaFnGetCopySceneData_Param( sceneId, x950001_TB_g_SatTinhO ) == 1 then
		return 0
	end
	local n = GetMonsterCount( sceneId )
	for i = 0, n - 1 do
		local m = GetMonsterObjID( sceneId, i )
		if GetMonsterDataID( sceneId, m ) == x950001_TB_g_SatTinhNpc and LuaFnIsCharacterLiving( sceneId, m ) == 1 then
			return 0
		end
	end
	LuaFnSetCopySceneData_Param( sceneId, x950001_TB_g_SatTinhO, 1 )
	return 1
end

function x950001_TB_Ghi( sceneId, monsterId, killerId )
	if LuaFnIsObjValid( sceneId, monsterId ) ~= 1 then
		return
	end
	local dataId = GetMonsterDataID( sceneId, monsterId )
	if dataId == x950001_TB_g_SatTinhBoss and x950001_TB_SatTinhDuoc( sceneId ) ~= 1 then
		return
	end
	x950001_TB_GhiId( sceneId, dataId, killerId )
end

function x950001_TB_GhiId( sceneId, dataId, killerId )
	if dataId == nil or x950001_TB_g_Boss[ dataId ] == nil then
		return
	end
	local ds = ""
	local n = 0
	if LuaFnGetSceneType( sceneId ) == 1 then
		local c = LuaFnGetCopyScene_HumanCount( sceneId )
		for i = 0, c - 1 do
			local h = LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, h ) == 1 then
				local g = LuaFnGetGUID( sceneId, h )
				if g ~= nil and g > 0 then
					ds = ds .. g .. ","
					n = n + 1
				end
			end
		end
	else
		if LuaFnIsObjValid( sceneId, killerId ) ~= 1 then
			return
		end
		local p = killerId
		if GetCharacterType( sceneId, killerId ) == 3 then
			p = GetPetCreator( sceneId, killerId )
		end
		if LuaFnIsObjValid( sceneId, p ) ~= 1 then
			return
		end
		if LuaFnHasTeam( sceneId, p ) == 1 and GetNearTeamCount( sceneId, p ) >= 1 then
			local c = GetNearTeamCount( sceneId, p )
			for i = 0, c - 1 do
				local m = GetNearTeamMember( sceneId, p, i )
				local g = nil
				if m ~= nil and LuaFnIsObjValid( sceneId, m ) == 1 then
					g = LuaFnGetGUID( sceneId, m )
				end
				if g ~= nil and g > 0 then
					ds = ds .. g .. ","
					n = n + 1
				end
			end
		else
			local g = LuaFnGetGUID( sceneId, p )
			if g ~= nil and g > 0 then
				ds = g .. ","
				n = 1
			end
		end
	end
	if n == 0 then
		return
	end
	local h = openfile( x950001_TB_g_File, "a" )
	if h then
		write( h, LuaFnGetCurrentTime() .. "\t" .. sceneId .. "\t" .. dataId .. "\t" .. ds .. "\n" )
		closefile( h )
	end
end
