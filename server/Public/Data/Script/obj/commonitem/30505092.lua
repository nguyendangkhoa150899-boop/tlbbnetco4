--Hµp Quà
--Script m· quà
--Code by YanBi 30505092

x332002_g_scriptId = ;332002
x332002_g_HopQua = 30505092

x332002_g_1 = 30700232
x332002_g_2 = 30700230
x332002_g_3 = 30700226
x332002_g_4 = 30309976
x332002_g_5 = 30309977
x332002_g_6 = 30309978
x332002_g_7 = 30309979
x332002_g_8 = 30309980
x332002_g_9 = 30309981
x332002_g_10 = 30309982
x332002_g_11 = 30309983
x332002_g_12 = 30309984
x332002_g_13 = 30309985
x332002_g_14 = 30309986
x332002_g_15 = 50601001
x332002_g_16 = 30900016
x332002_g_17 = 50601002
x332002_g_18 = 50602005
x332002_g_19 = 50602006
x332002_g_20 = 50602007
x332002_g_21 = 50602008
x332002_g_22 = 50603001
x332002_g_23 = 50604002
x332002_g_24 = 50611001
x332002_g_25 = 50611002
x332002_g_26 = 50612005
x332002_g_27 = 50612006
x332002_g_28 = 50612007
x332002_g_29 = 50612008
x332002_g_30 = 50613001
x332002_g_31 = 50613002
x332002_g_32 = 50613003
x332002_g_33 = 50613004
x332002_g_34 = 50613005
x332002_g_35 = 50613006
x332002_g_36 = 10158001
x332002_g_37 = 38000184
x332002_g_38 = 30700231
x332002_g_39 = 30700229
x332002_g_40 = 30700225
x332002_g_41 = 30700231
x332002_g_42 = 30700229
x332002_g_43 = 30700225
x332002_g_44 = 30309961
x332002_g_45 = 30309960
x332002_g_46 = 30309962
x332002_g_47 = 30309963
x332002_g_48 = 30309964
x332002_g_49 = 30309975
x332002_g_50 = 30309976
x332002_g_51 = 30309977
x332002_g_52 = 30309978
x332002_g_53 = 30309979
x332002_g_54 = 30309980
x332002_g_55 = 30309981
x332002_g_56 = 30309982
x332002_g_57 = 30309983
x332002_g_58 = 30309984
x332002_g_59 = 30309985
x332002_g_60 = 30309986
x332002_g_61 = 38000287
x332002_g_62 = 20310117
x332002_g_63 = 38000184
x332002_g_64 = 38000287
x332002_g_65 = 30308111
x332002_g_66 = 30308112
x332002_g_67 = 30308113
x332002_g_68 = 30308114
x332002_g_69 = 30308115
x332002_g_70 = 30308116
x332002_g_71 = 30308117
x332002_g_72 = 30308118
x332002_g_73 = 30308119
x332002_g_74 = 30308121
x332002_g_75 = 30308122
x332002_g_76 = 30308123
x332002_g_77 = 30308124
x332002_g_78 = 30308125
x332002_g_79 = 30308126
x332002_g_80 = 30308127
x332002_g_81 = 30308128
x332002_g_82 = 30308129
x332002_g_83 = 30008014
x332002_g_84 = 30008014
x332002_g_85 = 30008014
x332002_g_86 = 30008014
x332002_g_87 = 30008018
x332002_g_88 = 30008018
x332002_g_89 = 30008018
x332002_g_90 = 30008018
x332002_g_91 = 30008019
x332002_g_92 = 30008019
x332002_g_93 = 10141494
x332002_g_94 = 10141493
x332002_g_95 = 10141495

--**********************************
--M· bäo sß½ng--
--**********************************
function x332002_OnDefaultEvent(sceneId,selfId,BagPos)

	--Ki¬m tra ô ðÕo cø
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then
		x332002_NotifyFailTips(sceneId,selfId,"Hãy s¡p xªp lÕi 2 ô tr¯ng trong ô ÐÕo Cø.")
	    return 0
	end
	--Xóa ðÕo cø
	LuaFnDelAvailableItem(sceneId,selfId,x332002_g_HopQua,1)
	--Random v§t ph¦m
	local nRet = random(95)
	if nRet<=1 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_1,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!." )
	elseif nRet<=2 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_2,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=3 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_3,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=4 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_4,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=5 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_5,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=6 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_6,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=7 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_7,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=8 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_8,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=9 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_9,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=10 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_10,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=11 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_11,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=12 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_12,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=16 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_16,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=21 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_21,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=26 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_26,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=31 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_31,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=32 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_32,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=33 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_33,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=34 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_34,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=35 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_35,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=36 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_36,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=37 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_37,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=38 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_38,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=39 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_39,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=40 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_40,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=41 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_41,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=42 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_42,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=43 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_43,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=44 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_44,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=45 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_45,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=46 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_46,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=47 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_47,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=48 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_48,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=49 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_49,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=50 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_50,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=51 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_51,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=52 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_52,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=53 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_53,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=54 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_54,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=55 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_55,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=56 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_56,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=57 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_57,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=58 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_58,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=59 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_59,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=60 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_60,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=61 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_61,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=62 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_62,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=63 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_63,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=64 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_64,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=65 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_65,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=66 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_66,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=67 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_67,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=68 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_68,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=69 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_69,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=70 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_71,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=72 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_72,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=73 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_73,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=74 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_74,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=75 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_75,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=76 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_76,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=77 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_77,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=78 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_78,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=79 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_79,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=80 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_80,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=81 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_81,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=82 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_82,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=83 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_83,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=84 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_84,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=85 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_85,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=86 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_86,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=87 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_87,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=88 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_88,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=89 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_89,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=90 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_90,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=91 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_91,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=92 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_92,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=93 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_93,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=94 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_94,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )
	elseif nRet<=95 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x332002_g_95,1)
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		x332002_NotifyFailTips( sceneId, selfId,"Chúc m×ng ban nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!" )	
	
	end
	
	local nam = GetName(sceneId,selfId)
	BroadMsgByChatPipe(sceneId, selfId,""..nam.."#R ðã m· #GLong bài#R, nh§n ðßþc nhi«u ph¥n thß·ng quý giá. Chúc m×ng!",4)
	
end
--**********************************
--Ghi tên Tip--
--**********************************
function x332002_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end