
--MisDescBegin
--½Å±¾ºÅ
x050061_g_ScriptId	= 050061

--½ÓÊÜÈÎÎñNPCÊôĞÔ
x050061_g_Position_X=78
x050061_g_Position_Z=95
x050061_g_SceneID=12
x050061_g_AccomplishNPC_Name="Trß½ng Trung Hành"

--µ±Ç°ÈÎÎñºÅ
x050061_g_MissionId			= 1150
--ÏÂÒ»¸öÈÎÎñµÄID
x050061_g_MissionIdNext	= -1
--ÈÎÎñÄ¿±ênpc
x050061_g_Name 					= ""
--ÈÎÎñ¹éÀà
x050061_g_MissionKind			= 3
--ÈÎÎñµÈ¼¶
x050061_g_MissionLevel		= 10000
--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x050061_g_IfMissionElite	= 0
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x050061_g_IsMissionOkFail	= 0		--ÈÎÎñ²ÎÊıµÄµÚ0Î»

--x050059_g_MissionRound = 249

--ÊÇ·ñÏÔÊ¾ÈÎÎñÍê³É
x050061_g_AccomplishCircumstance = 0

--ÈÎÎñÎÄ±¾ÃèÊö
x050061_g_MissionName			= "Môn phái hàng tªt ğÕi mua ğ°"
--ÈÎÎñÃèÊö
x050061_g_MissionInfo			= ""
--ÈÎÎñÄ¿±ê
x050061_g_MissionTarget		= "%f"
--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x050061_g_ContinueInfo		= ""
--Íê³ÉÈÎÎñnpcËµµÄ»°
x050061_g_MissionComplete	= ""
--Ã¿´Î»î¶¯¿ÉÒÔÍê³ÉµÄ´ÎÊı
x050061_g_MaxRound	= 3

--ÓÃÀ´±£´æ×Ö·û´®¸ñÊ½»¯µÄÊı¾İ
x050061_g_FormatList = {
								"#{SMCJ_081021_29}",
								"#{SMCJ_081021_30}",
								"#{SMCJ_081021_31}",
								"#{SMCJ_081021_32}",
								"#{SMCJ_081021_33}",
								"#{SMCJ_081021_34}",
								"#{SMCJ_081021_35}",
								"#{SMCJ_081021_36}",
								"#{SMCJ_081021_37}",
								"#{SMCJ_081021_38}",
								"#{SMCJ_081021_39}",
								"#{SMCJ_081021_40}",
								"#{SMCJ_081021_41}",
								"#{SMCJ_081021_42}",
								"#{SMCJ_081021_43}",
								"#{SMCJ_081021_44}",
								"#{SMCJ_081021_45}",
								"#{SMCJ_081021_46}",
								}


-- ÈÎÎñÍê³ÉÇé¿ö,ÄÚÈİ¶¯Ì¬Ë¢ĞÂ,Õ¼ÓÃÈÎÎñ²ÎÊıµÄµÚ1,2Î»
x050061_g_Custom	=  { {id="#YNhi®m vø ğ¥y",num=8}}
--MisDescEnd

x050061_G_RefID = 050059


function x050061_GetStrIndexByStrValue(stringV)
	for i, v in x050061_g_StrList do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("Phäi ğem %s ğång kí ğªn StrList giao", stringV)
	----PrintStr(strText)
	return 0;
end

function x050061_OnEnumerate( sceneId, selfId, targetId )
	CallScriptFunction(x050061_G_RefID,"OnEnumerate",sceneId,selfId,targetId,x050061_g_ScriptId)
end

function x050061_OnDefaultEvent( sceneId, selfId, targetId,MenPai)
	CallScriptFunction(x050061_G_RefID,"OnDefaultEvent",sceneId, selfId, targetId,MenPai,x050061_g_MissionId,x050061_g_ScriptId)
end

function x050061_OnContinue( sceneId, selfId, targetId )
	CallScriptFunction( x050061_G_RefID, "OnContinue",sceneId, selfId, targetId,x050061_g_MissionId,x050061_g_ScriptId)
end

--**********************************
--Ìá½»
--**********************************
function x050061_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	CallScriptFunction( x050061_G_RefID, "OnSubmit",sceneId, selfId, targetId, selectRadioId,x050061_g_MissionId,x050061_g_ScriptId)
end

function x050061_OnItemChanged( sceneId, selfId, itemdataId )
	CallScriptFunction( x050061_G_RefID, "OnItemChanged",sceneId, selfId, itemdataId,x050061_g_MissionId,x050061_g_ScriptId)
end

--**********************************
--¼ÌĞø
--**********************************
function x050061_OnContinue( sceneId, selfId, targetId)
	CallScriptFunction(x050061_G_RefID,"OnContinue",sceneId, selfId, targetId,x050061_g_MissionId,x050061_g_ScriptId)
end

--**********************************
--·ÅÆú
--**********************************
function x050061_OnAbandon( sceneId, selfId)
	CallScriptFunction(x050061_G_RefID,"OnAbandon",sceneId, selfId,x050061_g_MissionId)
end

