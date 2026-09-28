-- ÄêÊÞBOSSËÀÍö£¬µôÂä±¦Ïä

x050051_g_ScriptId	= 050051
--x050051_g_strDieNotice = "ÄêÊÞ£¬ÄêÊÞ£¬ÄêÄêÓÐ×ïÊÜ¡£½ñÄê£¬Ð×ÃÍÏùÕÅ¿ñÍý¿ÉÁ¯µÄÄêÊÞ±»%s¡°Pia¡±µÄÒ»¼Ç±ÞÅÚ»÷ÖÐÍ·²¿£¬Õ¨µÃÊÇ»èÌìÓÖ°µµØ£¬ÈÌ²»×¡µÄÁ÷ÐÇ£¡Ö»ºÃÈçÍùÄêÒ»Ñù£¬Âä»Ä¶øÌÓ£¡"
x050051_g_strDieNotice = ""
x050051_g_strDieNotice0 = "#{NSBS_20071228_08}"
x050051_g_strDieNotice1 = "#{NSBS_20071228_09}"

--x050051_g_strDropNotice = "#{NSBS_20071228_12}"

x050051_g_PosTbl = {

	--{{147,129},{140,129}},
	{155,57},	{141,43},
	{65,60},	{117,85},
	{198,75},	{239,51},
	{63,111},	{111,106},
	{180,120},{51,165},
	{139,152},{193,152},
	{72,195}, {127,201},
	{176,191},{52,263},
	{102,241},{155,255},
	{189,235},{240,241},
}

x050051_g_DropNum = 0;

--Éú³¤µãid
x050051_g_GrowPointID = 780
--**********************************
--Éú³É±¦Ïä
--**********************************
function x050051_DropNianShouBox( sceneId)
	
	local index = random(20)
	
	local Pos = x050051_g_PosTbl[index]
	--¸øÎïÆ·
	x050051_DropNianShouBoxEx(sceneId, Pos)
	
end


function x050051_DropNianShouBoxEx( sceneId, Pos)

	x050051_g_DropNum = x050051_g_DropNum + 1
	
	if x050051_g_DropNum > 60 then 
		return
	end
	
	local strMsg0 = "#{NSBS_20071228_14}"
	local strMsg1 = format("(%d, %d)", Pos[1], Pos[2])
	local strMsg2 = "#{NSBS_20071228_15}"
	local strMsg = strMsg0..strMsg1..strMsg2
	MonsterTalk(sceneId, -1, "Vô Lßþng S½n", strMsg)
			
	local ItemBoxId = ItemBoxEnterScene( Pos[1], Pos[2], x050051_g_GrowPointID, sceneId, QUALITY_MUST_BE_CHANGE, 1, 30501157 )
	
	AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501158)
	
	local rand = random(100)
	if rand < 26 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30505107)
	end
	
	rand = random(100)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501159)
	end
	
	rand = random(100)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501160)
	end
	
	rand = random(1000)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141105)
	end
	
	rand = random(1000)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141106)
	end
	
	rand = random(1000)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141107)
	end
	
	rand = random(1000)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141108)
	end
	
	rand = random(1000)
	if rand < 7 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141109)
	end
		
	rand = random(1000)
	if rand < 7 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141110)
	end
	
	SetItemBoxMaxGrowTime( sceneId, ItemBoxId, 5400000 )
end

function x050051_OnDie( sceneId, selfId, killerId )
	--1.¸øÉ±ËÀÕß¼Ó¾­Ñé
	local level = GetLevel( sceneId, killerId )
	local expkill = (level*80-326)*10
	AddExp(sceneId, killerId, expkill)
	
	--·¢ËÍÐÑÄ¿ÌáÊ¾
--	BeginEvent( sceneId )
		--local str = format("Các hÕ nh§n ðßþc %d kinh nghi®m", expkill)
		--AddText( sceneId,  str)
	--EndEvent( sceneId )
	--DispatchMissionTips( sceneId, selfId )
	
	--2.ÐèÒª¸øËùÓÐÈË¼Ó¾­Ñé£¬É±bossÕß¸ü¶à¾­Ñé
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		local level = GetLevel( sceneId, nHumanId )
		
		if nHumanId ~= killerId and level >= 10 then
		
			local expother = (level*80-326)*4
			AddExp(sceneId, nHumanId, expother)
		
			--·¢ËÍÐÑÄ¿ÌáÊ¾
			--BeginEvent( sceneId )
			--	local str1 = format("Các hÕ nh§n ðßþc %d kinh nghi®m", expother)
			--	AddText( sceneId,  str1)
		--	EndEvent( sceneId )
		--	DispatchMissionTips( sceneId, nHumanId)
		end
	end
	
	--3.µôÂä±¦Ïä£¬Éú³ÉÉú³¤µã
	local index = random(20)
	local index1 = random(20)
	
	--Ëæ»ú³öÁ½¸öÏàµÈµÄÉú³¤µã£¬´¦ÀíÒ»ÏÂ
	if index == index1 then 
		if index < 20 then
	   	index1 = index+1
	  else
	  	index1 = index-1
	  end
	end
	
	--Éú³ÉµÚÒ»¸ö±¦Ïä
	local Pos = x050051_g_PosTbl[index]
	x050051_DropNianShouBoxEx(sceneId, Pos)
	--Éú³ÉµÚ¶þ¸ö±¦Ïä
	local Pos1 = x050051_g_PosTbl[index1]
	x050051_DropNianShouBoxEx(sceneId, Pos1)
	
	--ËÀÍö¹«¸æ
	local str = format( "#{_INFOUSR%s}", GetName(sceneId,killerId))
	str = x050051_g_strDieNotice0..str..x050051_g_strDieNotice1
	
	BroadMsgByChatPipe( sceneId, killerId, str, 4 )
	
	--µôÂä¹«¸æ
	--BroadMsgByChatPipe( sceneId, killerId, x050051_g_strDropNotice, 4 )
end

function x050051_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--LuaFnNpcChat(sceneId, selfId, 0, "Không biªt s¯ng chªt, thü hÕ cüa ta có th¬ xØ lý ngß½i")
end

function x050051_OnInit(sceneId, selfId)

end

function x050051_OnKillCharacter(sceneId, selfId, targetId)
	--LuaFnNpcChat(sceneId, selfId, 0, "Ta giªt chªt mµt ngß¶i....Ði tìm chªt ði ngß½i....")
end

function x050051_OnEnterCombat(sceneId, selfId, enmeyId)
	--LuaFnNpcChat(sceneId, selfId, 0, "Ta tiªn vào chiªn ð¤u....Các ngß½i ch¶ ði tìm mÕnh bà ði....")
	
end

function x050051_OnLeaveCombat(sceneId, selfId)
	--LuaFnNpcChat(sceneId, selfId, 0, "Ta r¶i ði chiªn ð¤u....M÷i ngß¶i trß¾c d×ng lÕi u¯ng thu¯c ði....")
	
end

--´´½¨Ò»¸öÐ¡¹Ö....
--function x050051_CreateChildMonster(sceneId, selfId, CreateData)

	--local PosX, PosY = LuaFnGetWorldPos( sceneId, selfId )
	--local PosNum = getn( x050051_MonsterPosTbl )
--	local PosIndex = random( PosNum )
	--PosX = PosX + x050051_MonsterPosTbl[PosIndex].x
	---PosY = PosY + x050051_MonsterPosTbl[PosIndex].y

	--MonId = LuaFnCreateMonster(sceneId, CreateData.ChildID, PosX, PosY, CreateData.BaseAI, CreateData.ExtAIScript, CreateData.ScriptID )
	--if CreateData.LifeTime > 0 then
	--	SetCharacterDieTime(sceneId, MonId, CreateData.LifeTime )
	--end

--end
