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

function x950001_Roll( sceneId, selfId, playerId, r )
	if random( 1, 100 ) <= r[2] then
		AddMonsterDropItem( sceneId, selfId, playerId, r[1] )
	end
end

function x950001_OnDie( sceneId, selfId, killerId )
	local r = x950001_g_Roi[sceneId]
	if r == nil then
		return
	end
	x950001_Chia( sceneId, selfId, killerId, r )
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
