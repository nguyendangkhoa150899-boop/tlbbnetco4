--Ñ§Ï°¼¼ÄÜ
--¾Å´óÃÅÅÉ¼¼ÄÜ´«ÊÚ

--MisDescBegin
--½Å±¾ºÅ
x210209_g_ScriptId = 210209

--ÈÎÎñºÅ
x210209_g_MissionId = 449

--ÈÎÎñ¹éÀà
x210209_g_MissionKind = 13

--ÈÎÎñµÀ¾ß±àºÅ
x210209_g_ItemId = 40002108

--ÈÎÎñµÈ¼¶
x210209_g_MissionLevel = 1

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x210209_g_IfMissionElite = 0

--ÈÎÎñÃû
x210209_g_MissionName="KÛ nång h÷c t§p"
x210209_g_MissionInfo="  Hãy ği tìm ğ® tØ cØu ğÕi môn phái ğ¬ h÷c kÛ nång này"
x210209_g_MissionTarget="KÛ nång h÷c t§p"
x210209_g_MissionComplete="  Các hÕ ğã c¥m theo thß gi¾i thi®u t¾i, v§y ta s¨ dÕy cho các hÕ 1 kÛ nång tân thü, phäi h÷c cho t¯t, luy®n nhi«u m¾i ğßşc."
x210209_g_Name_0="Tri®u Thiên Sß"

--hzp 2009-2-18 begin<<
--x210209_g_Name_1="»ÛÒ×"
--x210209_g_Name_2="Ê¯±¦"
--x210209_g_Name_3="¼òÄş"
--x210209_g_Name_4="ÕÅ»ñ"
--x210209_g_Name_5="Â·ÈıÄï"
--x210209_g_Name_6="º£·ç×Ó"
--x210209_g_Name_7="ÆÆÌ°"
--x210209_g_Name_8="³ÌÇàËª"
--x210209_g_Name_9="å£Ì¨×ÓÓğ"

x210209_g_XinShouJiNeng = {
{name="»ÛÒ×",			skill="Ñ§Ï°Íâ¹¦»¤Ìå"},
{name="Ê¯±¦",			skill="Ñ§Ï°·ÜÁ¦´ò»÷"},
{name="¼òÄş",			skill="Ñ§Ï°Òªº¦¹¥»÷"},
{name="ÕÅ»ñ",			skill="Ñ§Ï°ÄÚ¾¢¹¥»÷"},
{name="Â·ÈıÄï",		        skill="Ñ§Ï°³õ¼¶ÖÎÁÆ"},
{name="º£·ç×Ó",		        skill="Ñ§Ï°ÄÚ¹¦»¤Ìå"},
{name="ÆÆÌ°",			skill="Ñ§Ï°ÆÆÕÀ¹¥»÷"},
{name="³ÌÇàËª",		        skill="Ñ§Ï°³õ¼¶Òş¶İ"},
{name="å£Ì¨×ÓÓğ",	        skill="Ñ§Ï°È¼ÉÕÏİÚå"},
{name="Ä½Èİ´«",	                skill="Ñ§Ï°ĞÇè¯·´»÷"},
{name="ÌÆêÅ",	                skill="Ñ§Ï°²ÔÓ¥ÆæÏ®"},
{name="ËÕÜË",	                skill="Ñ§Ï°ÆøÑªÏàÉú"},

}
-->>end
--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x210209_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName(sceneId,targetId) ~= x210209_g_Name_0 then
		x210209_OnContinue( sceneId, selfId, targetId )
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x210209_OnEnumerate( sceneId, selfId, targetId )
	
	if x210209_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[1].name then
			if	HaveSkill(  sceneId, selfId, 241)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[1].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[2].name	 then
			if	HaveSkill(  sceneId, selfId, 242)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[2].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[3].name	 then
			if	HaveSkill(  sceneId, selfId, 243)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[3].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[4].name	then
			if	HaveSkill(  sceneId, selfId, 244)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[4].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[5].name then
			if	HaveSkill(  sceneId, selfId, 245)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[5].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[6].name then
			if	HaveSkill(  sceneId, selfId, 246)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[6].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[7].name then
			if	HaveSkill(  sceneId, selfId, 247)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[7].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[8].name then
			if	HaveSkill(  sceneId, selfId, 248)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[8].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[9].name then
			if	HaveSkill(  sceneId, selfId, 249)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[9].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[10].name then
			if	HaveSkill(  sceneId, selfId, 239)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[10].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[11].name then
			if	HaveSkill(  sceneId, selfId, 279)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[11].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[12].name then
			if	HaveSkill(  sceneId, selfId, 280)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[12].skill,6,-1);
			end
		end
	end
	
	if GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[1].name then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"ÉÙÁÖÅÉÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"ÉÙÁÖÅÉÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"ÉÙÁÖÅÉÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"ÉÙÁÖ¹ÅÉ²",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[2].name	 then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"Ã÷½ÌÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"Ã÷½ÌÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"Ã÷½ÌÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"´ó¹âÃ÷µî",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[3].name	 then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"Ø¤°ïÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"Ø¤°ïÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"Ø¤°ïÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"Ø¤°ï×Ü¶æ",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[4].name	then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"Îäµ±ÅÉÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"Îäµ±ÅÉÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"Îäµ±ÅÉÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"Îäµ±ÏÉ·ç",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[5].name then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"¶ëáÒÅÉÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"¶ëáÒÅÉÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"¶ëáÒÅÉÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"¶ëáÒÌìÏÂĞã",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[6].name then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"ĞÇËŞÅÉÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"ĞÇËŞÅÉÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"ĞÇËŞÅÉÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"ĞÇËŞ´ºÇï",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[7].name then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"ÌìÁúÅÉÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"ÌìÁúÅÉÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"ÌìÁúÅÉÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"ÌìÁú·çÇé",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[8].name then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"ÌìÉ½ÅÉÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"ÌìÉ½ÅÉÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"ÌìÉ½ÅÉÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"çÎç¿ÌìÉ½",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[9].name then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"åĞÒ£ÅÉÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"åĞÒ£ÅÉÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"åĞÒ£ÅÉÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"œR²¨åĞÒ£",11,13);

	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[10].name then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"Ä½ÈİÅÉÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"Ä½ÈİÅÉÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"Ä½ÈİÅÉÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"¹ÃËÕÄ½Èİ",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[11].name then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"ÌÆÃÅÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"ÌÆÃÅÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"ÌÆÃÅÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"ÊñÖĞÌÆÃÅ",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[12].name then
		--Ìí¼ÓÃÅÅÉ½éÉÜ
		AddNumText(sceneId, x210209_g_ScriptId,"¹í¹ÈÀ´ÓÉ",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"¹í¹ÈÕ½¶·ÌØÉ«",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"¹í¹ÈÉú»îÌØÉ«",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"ÌìÃÅ¹í¹È",11,13);
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x210209_CheckAccept( sceneId, selfId )
	--ĞèÒªÓĞµÀ¾ß²ÅÄÜ½Ó
	if	HaveItemInBag ( sceneId, selfId, x210209_g_ItemId)>0	then
		return 1
	else
		--return 0
		return 1
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x210209_OnAccept( sceneId, selfId )
	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	AddMission( sceneId,selfId, x210209_g_MissionId, x210209_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y½ÓÊÜÈÎÎñ£ºÑ§Ï°¼¼ÄÜ",MSG2PLAYER_PARA )
end

--**********************************
--·ÅÆú
--**********************************
function x210209_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
    DelMission( sceneId, selfId, x210209_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, g_SignPost.tip )
end

--**********************************
--¼ÌĞø
--**********************************
function x210209_OnContinue( sceneId, selfId, targetId )
    --Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
    BeginEvent(sceneId)
		AddText(sceneId,x210209_g_MissionName)
		AddText(sceneId,x210209_g_MissionComplete)
		AddText(sceneId,"Äã½«Ñ§»áÒ»ÏîĞÂµÄ¼¼ÄÜ")
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210209_g_ScriptId,x210209_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x210209_CheckSubmit( sceneId, selfId, selectRadioId )
	if	HaveItemInBag (  sceneId, selfId, x210209_g_ItemId)==1	then
		return 1
	else
		--return 0
		return 1
	end
end

--**********************************
--Ìá½»
--**********************************
function x210209_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210209_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--Ìí¼ÓÈÎÎñ½±Àø
		DelMission( sceneId, selfId, x210209_g_MissionId )
		MissionCom( sceneId, selfId, x210209_g_MissionId )
		if  GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[1].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 241) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 241)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºÉÙÁÖĞÂÊÖ¼¼ÄÜ£ºÍâ¹¦»¤Ìå"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[2].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 242) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 242)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºÃ÷½ÌĞÂÊÖ¼¼ÄÜ£º·ÜÁ¦´ò»÷"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[3].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 243) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 243)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºØ¤°ïĞÂÊÖ¼¼ÄÜ£ºÒªº¦¹¥»÷"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[4].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 244) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 244)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºÎäµ±ĞÂÊÖ¼¼ÄÜ£ºÄÚ¾¢¹¥»÷"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[5].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 245) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 245)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£º¶ëáÒĞÂÊÖ¼¼ÄÜ£º³õ¼¶ÖÎÁÆ"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[6].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 246) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 246)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºĞÇËŞĞÂÊÖ¼¼ÄÜ£ºÄÚ¹¦»¤Ìå"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[7].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 247) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 247)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºÌìÁúÅÉĞÂÊÖ¼¼ÄÜ£ºÆÆÕÀ¹¥»÷"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[8].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 248) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 248)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºÌìÉ½ĞÂÊÖ¼¼ÄÜ£º³õ¼¶Òş¶İ"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[9].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 249) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 249)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºåĞÒ£ĞÂÊÖ¼¼ÄÜ£ºÈ¼ÉÕÏİÚå"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[10].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 239) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 239)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºÄ½ÈİĞÂÊÖ¼¼ÄÜ£ºĞÇè¯·´»÷"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[11].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 279) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 279)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£ºÌÆÃÅĞÂÊÖ¼¼ÄÜ£º²ÔÓ¥ÆæÏ®"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[12].name	then
			--ÅĞ¶¨Íæ¼ÒÊÇ²»ÊÇÒÑ¾­Ñ§»áÁËÕâ¸ö¼¼ÄÜ£¬»áÁË¾Í²»ÈÃÔÚÑ§Ï°ÁË
			if  HaveSkill(sceneId, selfId, 280) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 280)
			BeginEvent(sceneId)
				strText = "ÄãÑ§µ½ĞÂµÄ¼¼ÄÜ£º¹í¹ÈĞÂÊÖ¼¼ÄÜ£ºÆøÑªÏàÉú"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
		--¿Û³ıÈÎÎñÎïÆ·
		DelItem( sceneId, selfId, x210209_g_ItemId, 1 )
		--Ñ§Ï°³É¹¦²¥·ÅÌØĞ§
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	end
	Msg2Player(  sceneId, selfId,"#YÍê³ÉÈÎÎñ£ºÑ§Ï°¼¼ÄÜ",MSG2PLAYER_PARA )
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x210209_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x210209_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x210209_OnItemChanged( sceneId, selfId, itemdataId )
end
