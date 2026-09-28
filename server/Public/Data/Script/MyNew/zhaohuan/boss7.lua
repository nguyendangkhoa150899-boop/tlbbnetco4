-- chân v¯n s¯ 
x100120_g_ScriptId  =  100120

-- tiªn vào v§t ph¦m ID

x100120_g_ItemId  =  20700047

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x100120_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 BeginEvent(  sceneId  )
	 	 AddText(sceneId,"        #W n½i này vì c×u lê tª ðàn , dùng cho #G c×u lê ð¥u lînh #W · ch² này phát hi®u l®nh . #G chú : · ch² này ð« giao 12 cá c×u lê sÑc v§t nhßng cho g÷i c×u lê ð¥u lînh ")  
	 	 AddNumText(  sceneId,  x100120_g_scriptId,  " quyªt chiªn c×u lê ",  6,  10)
	 	 AddNumText(  sceneId,  x100120_g_scriptId,  " liên quan t¾i quyªt chiªn c×u lê ",  11,  11)
	 	 AddNumText(  sceneId,  x100120_g_ScriptId,  " liên quan t¾i truy tìm Næ Oa thÕch ",  11,  12  )
	 	 AddNumText(  sceneId,  x100120_g_scriptId,  " liên quan t¾i truy tìm Næ Oa th¥n thÕch ",  11,  13)
                EndEvent(sceneId)
                DispatchEventList(sceneId,selfId,targetId)

    end


--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x100120_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
    
    if  GetNumText()    ==  10  then
	     -- ki¬m tra túi bên trong có hay không có v¸ ðßa 
	 if  GetItemCount(sceneId,  selfId,  x100120_g_ItemId)  <  12    then
	 BeginEvent(  sceneId  )
	 	 AddText(sceneId," trên ngß¶i ngß½i nh¤t ð¸nh phäi có 12 cá #cFF0000 c×u lê sÑc v§t , #W m¾i có th¬ h¤p dçn #cff99cc c×u lê ð¥u lînh #W ðích t¾i trß¾c ")
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 return
	 end

	 if  LuaFnDelAvailableItem(sceneId,selfId,x100120_g_ItemId,12)  <  1    then
	       BeginEvent(  sceneId  )
	 	 AddText(sceneId,"        #W trên ngß¶i ngß½i ðích #G c×u lê sÑc v§t #W ðã b¸ phong töa , kh¤u tr× không thành công ! ")
	       EndEvent(  sceneId  )
	       DispatchEventList(  sceneId,  selfId,  targetId  )
	       return
	 end


-- b¡t ð¥u thi hành ngçu nhiên sñ ki®n 
	 	 BeginEvent(  sceneId  )
	 	 local  bossId  =  LuaFnCreateMonster(sceneId,  15707,  70,  189,  17,  0,  402030)
                                MonsterTalk(sceneId,  bossId,  " huy«n häi ",  "        là ai , ðem ta t× trong ngü mê ðánh thÑc ? lÕi dám ðánh nhi­u ta ngü , các ngß½i s¨ vì này trä giá th§t l¾n ðích ")
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 end

    if  GetNumText()    ==  11  then
	 BeginEvent(  sceneId  )
	 	             AddText(  sceneId,  "      xi vßu h§u du® #G c×u lê bµ lÕc #W xâm l¤n #G huy«n häi #W, b÷n h÷ hy v÷ng thu t§p tán lÕc · n½i này phiªn khu vñc trung , t× #G ngû thäi th¥n thÕch #W s· tß dßÞng ra ðích #Y huy«n binh thÕch #W t¾i chª tÕo m¾i #G th¥n khí #W, cûng gØi hy v÷ng vào tìm kiªm xi vßu chi phü t¾i s¯ng lÕi xi vßu , l¥n næa xâm l¤n CØu châu ðÕi løc . mà tan biªn b÷n h÷ ý ð° ðích trách nhi®m n£ng n« chï có th¬ t× ðâu t¾i tñ Trung Nguyên ðích các v¸ hi®p sî t¾i gánh n±i . "  )
	 	             AddText(  sceneId,  "      m²i ngày #G10 lúc t¾i 10 lúc 30 phân #W?#G16 lúc t¾i 16 lúc 30 phân #W?#G20 lúc t¾i 20 lúc 30 phân #W, · trên tr¶i hoang c± cänh ðích #G huy«n häi #W trung cûng s¨ xu¤t hi®n ðÕi lßþng #cff99cc c×u lê chiªn sî #W . ðánh chªt #cff99cc c×u lê chiªn sî sau nhßng ðÕt ðßþc #Y c×u lê sÑc v§t #W cùng v¾i #Y huy«n binh thÕch #W . tích toàn #Y huy«n binh thÕch #W nhßng ði trß¾c #G thành LÕc Dß½ng #cff99cc vô nhai tØ #W ch² ðem #G th¥n khí #W luy®n hóa vì #G thßþng c± th¥n khí . "  )
	 	             AddText(  sceneId,  "      ð°ng th¶i , ðánh chªt #cff99cc c×u lê chiªn sî #W nhßng ðÕt ðßþc #Y c×u lê sÑc v§t #W . sØ døng tích toàn ðích #Y c×u lê sÑc v§t #W có th¬ tùy th¶i · #G huy«n häi #W trung ðích #cff99cc c×u lê tª ðàn #W cùng v¾i #cff99cc c×u lê thßþng c± tª ðàn #W ch² cho g÷i #cff99cc c×u lê ð¥u lînh #W cùng #cff99cc c×u lê tµc trß·ng #W, ðánh chªt #cff99cc c×u lê ð¥u lînh #W cùng #cff99cc c×u lê tµc trß·ng #W nhßng ðÕt ðßþc ðÕi lßþng #Y huy«n binh thÕch #W . "  )
	 	             AddText(  sceneId,  " · #cff99cc c×u lê trung tª ðàn #W ch² sØ døng #G10 cá #Y c×u lê sÑc v§t #W là ðßþc ðem cho g÷i #cff99cc c×u lê ð¥u lînh #W t¾i trß¾c nghênh chiªn , mà · #cff99cc c×u lê ðÕi tª ðàn #W ch² là c¥n sØ døng #G50 cá #Y c×u lê sÑc v§t #W ðem nhßng cho g÷i #cff99cc c×u lê tµc trß·ng #W t¾i trß¾c nghênh chiªn . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 	 if  GetNumText()    ==  12  then
	 BeginEvent(  sceneId  )
	 	   AddText(  sceneId,  "#Y liên quan t¾i truy tìm Næ Oa thÕch : "  )
	 	   AddText(  sceneId,  "            "  )
	 	   AddText(  sceneId,  "    #Y Næ Oa thÕch #W làm th¥n khí #G sáu sao thång th¤t tinh #W ðích lên c¤p chü yªu tài li®u , nhà ch½i chï có t¾i #G huy«n häi #W trung , · #cff99cc ki«n nguyên c×u lê ð¥u lînh #W?#cff99cc quá khôn c×u lê ð¥u lînh #W?#cff99cc hoang ngày c×u lê ð¥u lînh #W?#cff99cc c± tháng c×u lê ð¥u lînh #W?#cff99cc tuy®t tinh c×u lê ð¥u lînh #W?#cff99cc thß½ng vân c×u lê ð¥u lînh #W tØ vong sau , c¥n chia ra thu t§p kÏ bÕi sau r½i xu¯ng c×u lê nguyên khí . "  )
	 	   AddText(  sceneId,  "#W thu t§p nhß thßþng #G sáu loÕi c×u lê nguyên khí #W v×a nhßng tr· v« #G LÕc Dß½ng quäng trß¶ng #W, ch² ð±i l¤y #Y Næ Oa thÕch "  )
	 	   EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 	 if  GetNumText()    ==  13  then
	 BeginEvent(  sceneId  )
	 	   AddText(  sceneId,  "#Y liên quan t¾i truy tìm Næ Oa th¥n thÕch : "  )
	 	   AddText(  sceneId,  "            "  )
	 	   AddText(  sceneId,  "      #Y Næ Oa th¥n thÕch #W làm th¥n khí #G th¤t tinh thång tám sao #W ðích lên c¤p chü yªu tài li®u , nhà ch½i chï có t¾i #G huy«n häi #W trung , · #cff99cc ki«n nguyên c×u lê ð¥u lînh #W?#cff99cc quá khôn c×u lê ð¥u lînh #W?#cff99cc hoang ngày c×u lê ð¥u lînh #W? c± tháng c×u lê ð¥u lînh #W? tuy®t tinh c×u lê ð¥u lînh #W? thß½ng vân c×u lê ð¥u lînh #W tØ vong sau , c¥n chia ra thu t§p kÏ bÕi sau r½i xu¯ng c×u lê nguyên khí . "  )
	 	   AddText(  sceneId,  "#W thu t§p nhß thßþng #G sáu loÕi c×u lê nguyên khí #W v×a nhßng tr· v« #G LÕc Dß½ng quäng trß¶ng #W, ch² ð±i l¤y #Y Næ Oa th¥n thÕch "  )
	 	   AddText(  sceneId,  "#W sØ døng #Y Næ Oa th¥n thÕch #W lên c¤p ðªn tám sao ðích #G th¥n khí #W, có th¬ sØ døng #Y tø linh thÕch #W, · #G LÕc Dß½ng #W, tiªn hành th¥n khí #G thông linh #W , #G thông linh #W sau ðích th¥n khí , ðem lên c¤p cao h½n mµt c¤p b§c #G th¥n khí #W, ð°ng th¶i m£t ngoài cûng ðem biªn thành #G b¯n ð¶i 102 c¤p #W ðích th¥n khí m£t ngoài , thuµc tính càng cß¶ng ðÕi h½n "  )
	 	   EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end
    
  end