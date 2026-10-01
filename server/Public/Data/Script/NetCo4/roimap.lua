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
}

-- Pho ban (scene tao dong, sceneId moi luot khac nhau): goi tu ham OnDie cua quai pho ban
--   CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, <ID vat pham>, <%> )
-- Dang goi: Lien Hoan Q To Chau (event/xunhuan/sancaixiagunpc_die.lua, quai script 1130) -> Cuu Thien Ngoc Toai 20800034 40%.
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
	[50100] = { 20800034, 40 },   -- Lien Hoan Q To Chau (quai dot 3)
	[50220] = { 20800034, 40 },   -- Lien Hoan Q Lau Lan / Viem Ma Son (quai nho dot 3)
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
