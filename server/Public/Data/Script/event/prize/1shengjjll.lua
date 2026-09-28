x890096_g_ScriptId  =  890096

function  x890096_GetGiftsForUI(  sceneId,  selfId,  index,idbox,iop    )

                if  sceneId  ==  77    then
	         x890096_Tips(  sceneId,  selfId," ð¸a phü c¤m chï sØ døng thØ công nång ")
	 	 return
	 end

	 if  index  ==  nil  or  index  <0  then
	 	 return
	 end
	 
	 if  index  ==  10  then    -- täo ðãng 
g_FuBens  =  {}-- phó bän danh tñ 	 	 ðÆng c¤p 	 nhu yªu v§t ph¦m 	 	 nhu cá s± 	 t±ng thÑ s± 	 	 phó bän tiêu chí 1_ ký løc thÑ s± 	 	 	 	 phó bän tiêu chí 2_ thì gian 	 	 	 	 kinh nghi®m ( ðan v¸ vi vÕn )	 phó bän tiêu chí ( b¤t yªu loÕn ðµng )	 	 hoÕch ð¡c kim ti­n 10000  =  1 kim 
g_FuBens[1]  =  {"Túc C¥u"	 	 ,90	 	 ,30501354	 	 ,1	 	 ,1	 	 	 ,MD_CUJU_PRE_TIME	 	 	 	 ,0	 	 	 	 	 	 	 ,10	 	 	 	 	 ,1	 	 	 	 	 	 	 ,500000}
g_FuBens[2]  =  {"TrÕn Long KÏ Cuµc "	 ,90	 	 ,30501354	 	 ,1	 	 ,3	 	 	 ,MD_LAST_QIJU_DAY	 	 	 	 ,0	 	 	 	 	 	 	 ,10	 	 	 	 	 ,2	 	 	 	 	 	 	 ,500000}
g_FuBens[3]  =  {"Thüy Lao"	 	 ,90	 	 ,30501354	 	 ,1	 	 ,-1	 	 	 ,MD_SHUILAO_HUAN	 	 	 	 ,MD_SHUILAO_DAYCOUNT	 	 ,10	 	 	 	 	 ,3	 	 	 	 	 	 	 ,500000}
g_FuBens[4]  =  {"Lâu Lan T¥m Bäo "	 ,90	 	 ,30501354	 	 ,1	 	 ,1	 	 	 ,MD_SEEK_TREASURE	 	 	 	 ,0	 	 	 	 	 	 	 ,10	 	 	 	 	 ,4	 	 	 	 	 	 	 ,500000}
g_FuBens[5]  =  {"Phiêu Mi­u Phong "	 	 ,90	 	 ,30501354	 	 ,1	 	 ,3	 	 	 ,MD_PIAOMIAOFENG_LASTTIME	 	 ,0	 	 	 	 	 	 	 ,10	 	 	 	 	 ,5	 	 	 	 	 	 	 ,500000}
g_FuBens[6]  =  {"Thiªu Th¤t S½n "	 	 ,90	 	 ,30501354	 	 ,1	 	 ,3	 	 	 ,MD_SHUANGXIANGPAO_LASTTIME	 	 ,0	 	 	 	 	 	 	 ,10	 	 	 	 	 ,6	 	 	 	 	 	 	 ,500000}
g_FuBens[7]  =  {"Tô Châu tam hoàn "	 	 ,90	 	 ,30501354	 	 ,1	 	 ,10	 	 	 ,MD_XINSANHUAN_1_DAYTIME	 	 ,0	 	 	 	 	 	 	 ,10	 	 	 	 	 ,7	 	 	 	 	 	 	 ,500000}
g_FuBens[8]  =  {"Lâu Lan tam hoàn "	 	 ,90	 	 ,30501354	 	 ,1	 	 ,10	 	 	 ,MD_ROUNDMISSION1_TIMES	 	 	 ,0	 	 	 	 	 	 	 ,10	 	 	 	 	 ,8	 	 	 	 	 	 	 ,500000}
g_FuBens[9]  =  {"TÑ Tuy®t Trang "	 	 ,90	 	 ,30501354	 	 ,1	 	 ,3	 	 	 ,MD_SPRING07DENGMI_DAYTIME	 	 ,0	 	 	 	 	 	 	 ,10	 	 	 	 	 ,9	 	 	 	 	 	 	 ,500000}
g_FuBens[10]  =  {"Yªn TØ Ô "	 ,90	 	 ,30501354	 	 ,1	 	 ,3	 	 	 ,MD_YANZIWU_TIMES	 	 	 	 ,MD_PRE_YANZIWU_TIME	 	 ,10	 	 	 	 	 ,10	 	 	 	 	 	 	 ,500000}
g_FuBens[11]  =  {"Binh Thánh KÏ Tr§n "	 ,90	 	 ,30501354	 	 ,1	 	 ,3	 	 	 ,MD_YURENJIE_LASTTIME	 	 	 ,0	 	 	 	 	 	 	 ,10	 	 	 	 	 ,11	 	 	 	 	 	 	 ,500000}	 

	 	 
	 BeginUICommand(  sceneId  )
	         for  i=1  ,  11  do
                                UICommand_AddInt(  sceneId,  mod(GetMissionData(sceneId,selfId,g_FuBens[i][6]),100)  )
	         end
	         UICommand_AddInt(  sceneId,GetMissionData(  sceneId,  selfId,  FUBEN_SDDS))-- täo ðãng ði¬m s± 

	         EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,2015101902  )	 
          return	 
end	 	 
	 
	 
if  index  ==  20  then    -- ðÆng c¤p 
BeginUICommand(  sceneId  )	 
local  allfirstplayer  =  GetPaiming(sceneId,4)
for  i  =  1,10  do
if  allfirstplayer[i]  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].Guid  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].mynowLevel  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end	 
if  allfirstplayer[i].mymenpai  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=""}
end
if  allfirstplayer[i].mysex  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=" vô ",mysex=" vô "}
end	 
	 UICommand_AddString(  sceneId,  allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	 end
	 UICommand_AddString(  sceneId,  "        1. ðÆng c¤p bài hành bäng thñc thì ký løc ngoÕn gia ðÆng c¤p , bài danh ti«n 10 ðích ngoÕn gia khä dî thßþng bäng ;#r        2. ðÆng c¤p bài hành bäng ti«n tam danh ngoÕn gia khä dî lînh thü chuyên chúc chuyên chúc huy­n thäi xßng hào ;#r        3. ðÆng c¤p bài danh ti«n tam ðích ngoÕn gia phân bi®t tång gia s· hæu chúc tính 300?200?100 ði¬m , trì tøc 24 ti¬u thì . #r        chú : m²i 24 ti¬u thì chích nång lînh thü nh¤t thÑ , c§n hÕn ðÆng c¤p b¤t ðê vu 80 ðích ti«n tam danh ngoÕn gia lînh thü . ")
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,20160711  )--2015101901
	 return	 
	 end	 
	 
if  index  ==  21  then    -- sung tr¸ 
BeginUICommand(  sceneId  )	 
local  allfirstplayer  =  GetPaiming(sceneId,1)
for  i  =  1,10  do
if  allfirstplayer[i]  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].Guid  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].mynowLevel  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end	 
if  allfirstplayer[i].mymenpai  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=""}
end	 
if  allfirstplayer[i].mysex  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=" vô ",mysex=" vô "}
end	 
	 UICommand_AddString(  sceneId,  allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	 end
	 UICommand_AddString(  sceneId,  "        1. phú hào bài hành bäng thñc thì ký løc ngoÕn gia sung tr¸ ði¬m s± , bài danh ti«n 10 ðích ngoÕn gia khä dî thßþng bäng ;#r        2. ðÆng c¤p bài hành bäng ti«n tam danh ngoÕn gia khä dî lînh thü chuyên chúc huy­n thäi xßng hào ;#r        3. danh ðµng ti«n tam danh phân bi®t tång gia huyªt thßþng hÕn 20 vÕn ?15 vÕn ?10 vÕn , trì tøc 24 ti¬u thì . #r        chú : m²i 24 ti¬u thì chích nång lînh thü nh¤t thÑ , c§n hÕn sung tr¸ b¤t ðê vu 500 ði¬m ðích ti«n tam danh ngoÕn gia lînh thü . ")
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,20160712  )
	 return	 
end	 	 
if  index  ==  22  then    -- lÕt bá 
BeginUICommand(  sceneId  )	 
local  allfirstplayer  =  GetPaiming(sceneId,5)
for  i  =  1,10  do
if  allfirstplayer[i]  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].Guid  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].mynowLevel  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end	 
if  allfirstplayer[i].mymenpai  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=""}
end	 
if  allfirstplayer[i].mysex  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=" vô ",mysex=" vô "}
end	 
	 UICommand_AddString(  sceneId,  allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	 end
	 UICommand_AddString(  sceneId,  "        1. lÕt bá bài hành bäng thñc thì ký løc ngoÕn gia xoát lÕt bá s± lßþng , bài danh ti«n 10 ðích ngoÕn gia khä dî thßþng bäng ;#r        2. lÕt bá bài hành bäng ti«n tam danh ngoÕn gia khä dî lînh thü chuyên chúc huy­n thäi xßng hào ;#r        3. lÕt bá ti«n tam danh phân bi®t tång gia tÑ chúc tính kháng 1000?500?300 ði¬m , trì tøc 24 ti¬u thì . #r        chú : m²i 24 ti¬u thì chích nång lînh thü nh¤t thÑ , c§n hÕn xoát lÕt bá s± lßþng b¤t ðê vu 10 cá ðích ti«n tam danh ngoÕn gia lînh thü . ")
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,20160713  )
	 return	 
end	 
if  index  ==  23  then    -- t¯ng hoa 
BeginUICommand(  sceneId  )	 
local  allfirstplayer  =  GetPaiming(sceneId,2)
for  i  =  1,10  do
if  allfirstplayer[i]  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].Guid  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].mynowLevel  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end	 
if  allfirstplayer[i].mymenpai  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=""}
end	 
if  allfirstplayer[i].mysex  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=" vô ",mysex=" vô "}
end	 
	 UICommand_AddString(  sceneId,  allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	 end
	 UICommand_AddString(  sceneId,  "        1. t¯ng hoa bài hành bäng thñc thì ký løc ngoÕn gia t¯ng hoa s± lßþng , bài danh ti«n 10 ðích ngoÕn gia khä dî thßþng bäng ;#r        2. t¯ng hoa bài hành bäng ti«n tam danh ngoÕn gia khä dî lînh thü chuyên chúc huy­n thäi xßng hào ;#r        3. t¯ng hoa ti«n tam danh phân bi®t tång gia 15%?10%?5% nµi ngoÕi công công kích , trì tøc 24 ti¬u thì . #r        chú : m²i 24 ti¬u thì chích nång lînh thü nh¤t thÑ , c§n hÕn t¯ng hoa (999 mân côi ) s± lßþng b¤t ðê vu 10 cá ðích ti«n tam danh ngoÕn gia lînh thü . ")
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,20160714  )
	 return	 
end	 
if  index  ==  24  then    -- thu hoa 
BeginUICommand(  sceneId  )	 
local  allfirstplayer  =  GetPaiming(sceneId,6)
for  i  =  1,10  do
if  allfirstplayer[i]  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].Guid  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].mynowLevel  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end	 
if  allfirstplayer[i].mymenpai  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=""}
end	 
if  allfirstplayer[i].mysex  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=" vô ",mysex=" vô "}
end	 
	 UICommand_AddString(  sceneId,  allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	 end
	 UICommand_AddString(  sceneId,  "        1. thu hoa bài hành bäng thñc thì ký løc ngoÕn gia thu hoa s± lßþng , bài danh ti«n 10 ðích ngoÕn gia khä dî thßþng bäng ;#r        2. t¯ng hoa bài hành bäng ti«n tam danh ngoÕn gia khä dî lînh thü chuyên chúc huy­n thäi xßng hào ;#r        3. thu hoa ti«n tam danh phân bi®t tång gia 15%?10%?5% nµi ngoÕi công phòng ngñ , trì tøc 24 ti¬u thì . #r        chú : m²i 24 ti¬u thì chích nång lînh thü nh¤t thÑ , c§n hÕn thu hoa (999 mân côi ) s± lßþng b¤t ðê vu 10 cá ðích ti«n tam danh ngoÕn gia lînh thü . ")
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,20160715  )
	 return	 
end	 
if  index  ==  25  then    -- sát nhân 
BeginUICommand(  sceneId  )	 
local  allfirstplayer  =  GetPaiming(sceneId,3)
for  i  =  1,10  do
if  allfirstplayer[i]  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].Guid  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end
if  allfirstplayer[i].mynowLevel  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  ""}
end	 
if  allfirstplayer[i].mymenpai  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=""}
end	 
if  allfirstplayer[i].mysex  ==  nil  then
allfirstplayer[i]  =  {Guid  =  " hß v¸ dî ðãi ",mynowLevel  =  "",mymenpai=" vô ",mysex=" vô "}
end	 
	 UICommand_AddString(  sceneId,  allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	 end
	 UICommand_AddString(  sceneId,  "        1. sát thü bài hành bäng thñc thì ký løc ngoÕn gia sát nhân s± lßþng , bài danh ti«n 10 ðích ngoÕn gia khä dî thßþng bäng ;#r        2. sát thü bài hành bäng ti«n tam danh ngoÕn gia khä dî lînh thü chuyên chúc huy­n thäi xßng hào ;#r        3. sát thü ti«n tam danh phân bi®t tång gia tÑ chúc tính công kích 1000?500?300 ði¬m , trì tøc 24 ti¬u thì .   #r        chú : kích sát nhân s± b¤t ðê vu 10 nhân , s· kích sát ngoÕn gia ðÆng c¤p b¤t nång ðê vu 85 c¤p . sát nhân tràng cänh vi giáo tràng ho£c PVP tràng ð¸a , t¡c b¤t kª nh§p sát nhân s± . ")
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,20160716  )
	 return	 
end	 

	 if  index  ==  11  then    -- thü thÑ 
	 local  g_Pointt  =  GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU)
	 local  g_Pointtb  =  GetMissionData(  sceneId,  selfId,  CHONG_ZHI_YILINGQI)	 
	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,g_Pointt)
	 	 UICommand_AddInt(  sceneId,  g_Pointtb)
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,  8909334  )	 	 	 	 	 	 -- thü thÑ sung tr¸ 	 
	 	 return
	 end


	 if  index  ==  12  then    -- tr×u tß·ng ð« kÏ 
	       BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,  x890096_g_ScriptId);
	             UICommand_AddInt(sceneId,  36);
	             UICommand_AddString(sceneId,  "GetGiftsForUI");
	             UICommand_AddString(sceneId,  "#W m²i thÑ #G ðä khai #W tr×u tß·ng gi¾i di®n , nhu yªu #G kh¤u tr× 2000 nguyên bäo #W , m²i thÑ #G tr×u tß·ng tiêu háo 1000 nguyên bäo #W, m²i thÑ #G canh hoán tr×u tß·ng gi¾i di®n hoa phí 2000 nguyên bäo #W . nhî xác nh§n yªu ðä khai mÕ ? ");
	             EndUICommand(sceneId)
	       DispatchUICommand(sceneId,selfId,  24)
	       return
	 end


	 if  index  ==  13  then    -- kÏ phúc 
	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  0)
	 	 UICommand_AddInt(  sceneId,  3)
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,  890509  )	 
	 return
	 end
	 
	 if  index  ==  14  then    --VIP
	 if  (sceneId  >=  580  and  sceneId  <=  585)  or  (sceneId  >=  496  and  sceneId  <=  503)  or  (sceneId  >=  573  and  sceneId  <=  575)  or  (sceneId  >=  561  and  sceneId  <=  563)    then
	 x890096_Tips(  sceneId,  selfId," thïnh chú ý : ðß½ng nâm tÕi thiên hoang c± cänh ð¸a ð° , khä nång ðÕo trí bµ phân VIP công nång thø änh hß·ng "    )
                end
	 local  PlayerName=GetName(sceneId,selfId)
	 local  UUUU  =  GetMissionData(  sceneId,  selfId,CHONG_ZHI_CHONGSHU)
                if  UUUU  <  1  then
	       x890096_Tips(  sceneId,  selfId," nâm b¤t th¸ VIP hµi viên , b¤t nång sØ døng thØ công nång . sung tr¸ thành vi VIP , khä hß·ng thø chß ða ßu hu® ! "    )
	 	 return
	 end
	 BeginUICommand(  sceneId  )
	 UICommand_AddInt(  sceneId,  UUUU)
	 UICommand_AddString(sceneId,tostring("    #W tôn kính ðích #G"..PlayerName.."#W , cäm tÕ nâm ð¯i #G“ li®t di­m thiên long ”#W trß¶ng cØu dî lai ðích ðÕi lñc chi trì . ngã môn tß½ng vi nâm ð« cung canh ßu ch¤t ðích phøc vø . #r    #e6600FF#g2fff7c nâm ðß½ng ti«n vi li®t di­m thiên long VIP"..UUUU.." c¤p .         #e#g#W        #Y#u ði¬m kích thØ xØ tra khán hÕ nh¤t c¤p ð£c quy«n công nång #r#Y#u    #W thông quá thØ gi¾i di®n nâm khä dî hß·ng thø nh¤t h® li®t VIP ð£c quy«n công nång .     #Y#u ði¬m kích thØ xØ tra khán toàn bµ VIP ð£c quy«n "))
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,20131231)
	 return
	 end
	 
              if  index  ==  15  then
                    if  idbox  <1  or  idbox  >2  then
                          return
                    end
                    if  idbox  ==  1  then
	           CallScriptFunction(  000045,  "MyCallScript",  sceneId,  selfId,1  )
                    elseif  idbox  ==  2  then
	           CallScriptFunction(  000045,  "MyCallScript",  sceneId,  selfId,2  )
                    return
                    end
              end


	 if  index  ==  16  then    -- thång c¤p 
	 local  UUUU  =  GetMissionData(  sceneId,  selfId,  SHENG_JIJIANGLI)
	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  UUUU)
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,  8909333  )	 
	 	 return
	 end

	 if  index  ==  17  then    -- lý tài 	 
	 	 CallScriptFunction(  920032,  "GetGiftsForLevel",  sceneId,  selfId,1  )
	 	 return
	 end

	 if  index  ==  18  then    -- t¯ng liêu tích phân bän 
                                CallScriptFunction(  300113,  "XieziPaiming",  sceneId,  selfId)	 	 	 
	 	 return
	 end
	 
	 if  index  ==  19  then    -- tø bäo b°n UI tr¡c thí 
                                CallScriptFunction(  002102,"XieziDongtai",sceneId,selfId,111)
	 	 return
	 end

	 if  index  ==  35  then    -- công tß tiªn ðµ 
                                CallScriptFunction(  181000,"UK_Call_YuanBao",sceneId,  selfId)
	 	 return
	 end

	 if  index  ==  36  then    -- tr×u tß·ng 
                      local  zd  =  YuanBao(sceneId,selfId,targetId,3,0)
	       if  zd  <  2000  then
                            x890096_Tips(  sceneId,  selfId," nâm nguyên bäo b¤t túc 2000 ði¬m "  )	 
                          return
                      end	 
                      local  strun  =    YuanBao(sceneId,selfId,targetId,2,2000)
	       if  strun  ~=  0  then
	             x890096_Tips(  sceneId,  selfId," nguyên bäo kh¤u tr× th¤t bÕi , thïnh liên h® GM"  )	 
	         return
	       end
	 BeginUICommand(  sceneId  )
	       UICommand_AddInt(  sceneId,  0)
	       EndUICommand(  sceneId  )
	 --DispatchUICommand(  sceneId,  selfId,  2012816  )    -- nguyên bän ðích , hÕt tØ bình tª , hæu bug
	 DispatchUICommand(  sceneId,  selfId,  2012817  )
	 x890096_Tips(  sceneId,  selfId," thành công ðä khai tr×u tß·ng gi¾i di®n , dî kh¤u tr× 2000 nguyên bäo "  )	 
	 return
	 end

	 if  index  ==  37  then    -- công tß tiªn ðµ 
                                CallScriptFunction(  002102,"ChaKanGongZiJinDu",sceneId,  selfId)
	 	 return
	 end

	 if  index  ==  38  then    -- d¸ch dung các 
	       BeginUICommand(  sceneId  )
	       UICommand_AddInt(  sceneId,  selfId  )
	       EndUICommand(  sceneId  )
	       DispatchUICommand(  sceneId,  selfId,  8893837)
	 return
	 end

                if  index  ==  39  then
                      for  i=13000  ,31399  do  
                              LuaFnCancelSpecificImpact(sceneId,selfId,i)
	       end
                end

	 if  index  ==  41  then    -- täo ðãng 
	       if  GetMissionData(  sceneId,  selfId,  FUBEN_SDDS)  <100  then
	 	     x890096_Tips(  sceneId,  selfId," nhî ðích täo ðãng ði¬m s± b¤t túc "  )
	 	 return	 
	 	 end
	 end

	 if  index  ==  42  then    -- tø bäo b°n UI chúc phúc 
                                CallScriptFunction(  002102,"XieziDongtai",sceneId,selfId,222)
	 	 return
	 end

	 if  index  ==  43  then    -- tø bäo b°n UI lînh thü 
                                CallScriptFunction(  002102,"XieziDongtai",sceneId,selfId,333)
	 	 return
	 end

if  index  ==  40  then	   -- bài danh tß·ng l® 
if  idbox  <1  or  idbox  >6  then
      return
end

if  LuaFnGetName(  sceneId,  selfId  )  ==  " hß v¸ dî ðãi "  then
      x890096_Tips(  sceneId,  selfId," nhî cá ð§u bÑc ! a a a a a a a ~"    )
    return
end
	                 --local  nWeek  =  GetTodayWeek()
	 if  idbox    ==1  then    -- ðÆng c¤p 
                      if  GetLevel(  sceneId,  selfId  )  <  80  then
                            x890096_Tips(  sceneId,  selfId," nhî ðích ðÆng c¤p s± b¤t cú 80 , b¤t nång lînh thü "    )
                            return
                      end
	 local  nWeekCur  =  GetWeekTime();	 	 -- ðß½ng ti«n thì gian 	 	 	 . 
	 local  nDrawPayTimeLast  =  GetMissionData(  sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI1_DAYTIME);
	 local  nQuarter  =  mod(GetQuarterTime(),100);	 
	 local  allfirstplayer  =  GetPaiming(sceneId,4)
	 local  name  =  GetName(sceneId,selfId)
	 if  nWeekCur  ~=    nQuarter  >0    then

	 if  allfirstplayer[1].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==1    then    --1 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7536)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    6,118,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,6,118)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7536,  0)	 -- c¤p BUFF
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )

	 elseif  allfirstplayer[2].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==2  then  	   --2 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7537)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    6,119,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,6,119)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7537,  0)	 -- c¤p BUFF
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )

	 elseif  allfirstplayer[3].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==3  then  	 	 --3 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7538)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    6,120,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,6,120)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7538,  0)	 -- c¤p BUFF
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )

	 else
	 x890096_Tips(  sceneId,  selfId," thïnh tuy¬n trÕch dæ tñ kÖ ðích danh tñ ð¯i Ñng ðích lînh tß·ng án næu ! "    )	 -- giá lý hoàn thi®n tß·ng l® 
                return
	 end
	 SetMissionData(sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI1_DAYTIME,  nWeekCur  );	 
	 end	 
	 end	 
	 
	 
	 
	 if  idbox    ==2  then    -- sung tr¸ 
                      if  GetMissionData(  sceneId,  selfId,  CHONG_ZHI_ZENGD)  <  2000000  then
                            x890096_Tips(  sceneId,  selfId," nhî ðích sung tr¸ ði¬m s± b¤t cú 500 , b¤t nång lînh thü "    )
                            return
                      end
	 local  nWeekCur  =  GetWeekTime();	 	 -- ðß½ng ti«n thì gian 	 	 	 . 
	 local  nDrawPayTimeLast  =  GetMissionData(  sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI2_DAYTIME);
	 local  nQuarter  =  mod(GetQuarterTime(),100);	 
	 local  allfirstplayer  =  GetPaiming(sceneId,1)
	 if  nWeekCur  ~=  nQuarter  >0    then

	 if  allfirstplayer[1].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==  1  then    --1 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7521)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    1,101,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,1,101)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7521,  0)	 -- c¤p BUFF
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )	 

	 elseif  allfirstplayer[2].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==2  then  	   --2 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7522)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    1,102,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,1,102)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7522,  0)	 -- c¤p BUFF
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )	 

	 elseif  allfirstplayer[3].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==3    then  	 	 --3 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7523)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    1,103,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,1,103)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7523,  0)	 -- c¤p BUFF
                x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )

	 else
	 x890096_Tips(  sceneId,  selfId," thïnh tuy¬n trÕch dæ tñ kÖ ðích danh tñ ð¯i Ñng ðích lînh tß·ng án næu ! "    )	 -- giá lý hoàn thi®n tß·ng l® 
                return
	 end
	 SetMissionData(sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI2_DAYTIME,  nWeekCur  );
	 end	 
	 end	 

  	 
	 if  idbox    ==3  then    -- lÕt bá 
                      if  GetMissionData(  sceneId,  selfId,  QUANQULABA)  <  10  then
                            x890096_Tips(  sceneId,  selfId," nhî lÕt bá s± b¤t cú 10 , b¤t nång lînh thü "    )
                            return
                      end
	 local  nWeekCur  =  GetWeekTime();	 	 -- ðß½ng ti«n thì gian 	 	 	 . 
	 local  nDrawPayTimeLast  =  GetMissionData(  sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI3_DAYTIME);
	 local  nQuarter  =  mod(GetQuarterTime(),100);	 
	 local  allfirstplayer  =  GetPaiming(sceneId,5)
	 if  nWeekCur  ~=    nQuarter  >0    then

	 if  allfirstplayer[1].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==1  then    --1 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7533)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    2,113,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,2,113)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7533,  0)	 -- c¤p BUFF
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )
	 
	 elseif  allfirstplayer[2].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==2  then  	   --2 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7534)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    2,114,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,2,114)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7534,  0)	 -- c¤p BUFF
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )
	 
	 elseif  allfirstplayer[3].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==3    then  	 	 --3 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7535)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    2,115,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,2,115)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7535,  0)	 -- c¤p BUFF
                x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )

	 else
	 x890096_Tips(  sceneId,  selfId," thïnh tuy¬n trÕch dæ tñ kÖ ðích danh tñ ð¯i Ñng ðích lînh tß·ng án næu ! "    )	 -- giá lý hoàn thi®n tß·ng l® 
                return
	 end
	 SetMissionData(sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI3_DAYTIME,  nWeekCur  );	 
	 end	 
	 end
	
	 if  idbox    ==4  then    -- t¯ng hoa 
                      if  GetMissionData(  sceneId,  selfId,  QUANQUSONGHUA)  <  10  then
                            x890096_Tips(  sceneId,  selfId," nhî t¯ng hoa s± b¤t cú 10 , b¤t nång lînh thü "    )
                            return
                      end
	 local  nWeekCur  =  GetWeekTime();	 	 -- ðß½ng ti«n thì gian 	 	 	 . 
	 local  nDrawPayTimeLast  =  GetMissionData(  sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI4_DAYTIME);
	 local  nQuarter  =  mod(GetQuarterTime(),100);	 
	 local  allfirstplayer  =  GetPaiming(sceneId,2)
	 if  nWeekCur  ~=    nQuarter  >0    then

	 if  allfirstplayer[1].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==1  then    --1 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7524)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    3,104,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,3,104)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7524,  0)	 -- c¤p BUFF	 
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )	 

	 elseif  allfirstplayer[2].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==2  then  	   --2 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7525)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    3,105,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,3,105)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7525,  0)	 -- c¤p BUFF	 
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )	 
	 
	 elseif  allfirstplayer[3].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==3    then  	 	 --3 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7526)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    3,106,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,3,106)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7526,  0)	 -- c¤p BUFF	 
                x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )

	 else
	 x890096_Tips(  sceneId,  selfId," thïnh tuy¬n trÕch tñ kÖ ðích danh tñ lînh thü xßng hào ! "    )	 -- giá lý hoàn thi®n tß·ng l® 
	       return
	 end
	 SetMissionData(sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI4_DAYTIME,  nWeekCur  );	 
	 end	 
	 end	 	 
	 
	 
	 
	 if  idbox    ==5  then    -- thu hoa 
                      if  GetMissionData(  sceneId,  selfId,  QUANQUSHOUHUA)  <  10  then
                            x890096_Tips(  sceneId,  selfId," nhî thu hoa s± b¤t cú 10 , b¤t nång lînh thü "    )
                            return
                      end
	 local  nWeekCur  =  GetWeekTime();	 	 -- ðß½ng ti«n thì gian 	 	 	 . 
	 local  nDrawPayTimeLast  =  GetMissionData(  sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI5_DAYTIME);
	 local  nQuarter  =  mod(GetQuarterTime(),100);	 
	 local  allfirstplayer  =  GetPaiming(sceneId,6)
	 if  nWeekCur  ~=    nQuarter  >0    then

	 if  allfirstplayer[1].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==1  then    --1 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7527)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    4,107,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,4,107)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7527,  0)	 -- c¤p BUFF	 	 	 
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )
	 
	 elseif  allfirstplayer[2].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==2  then  	   --2 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7528)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    4,108,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,4,108)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7528,  0)	 -- c¤p BUFF	 	 	 
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )
	 
	 elseif  allfirstplayer[3].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==3    then  	 	 --3 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7529)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    4,109,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,4,109)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7529,  0)	 -- c¤p BUFF	 	 
                x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )

	 else
	 x890096_Tips(  sceneId,  selfId," thïnh tuy¬n trÕch dæ tñ kÖ ðích danh tñ ð¯i Ñng ðích lînh tß·ng án næu ! "    )	 -- giá lý hoàn thi®n tß·ng l® 
                return
	 end
	 SetMissionData(sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI5_DAYTIME,  nWeekCur  );	 
	 end	 
	 end	 	 
	 

	 if  idbox    ==6  then    -- sát nhân 
                      if  GetMissionData(  sceneId,  selfId,  QUANQUSHAREN)  <  10  then
                            x890096_Tips(  sceneId,  selfId," nhî sát nhân s± b¤t cú 10 , b¤t nång lînh thü "    )
                            return
                      end
	 local  nWeekCur  =  GetWeekTime();	 	 -- ðß½ng ti«n thì gian 	 	 	 . 
	 local  nDrawPayTimeLast  =  GetMissionData(  sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI6_DAYTIME);
	 local  nQuarter  =  mod(GetQuarterTime(),100);	 
	 local  allfirstplayer  =  GetPaiming(sceneId,3)
	 if  nWeekCur  ~=    nQuarter  >0    then

	 if  allfirstplayer[1].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==1  then    --1 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7530)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    5,110,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,5,110)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7530,  0)	 -- c¤p BUFF	 	 	 	 
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )
	 
	 elseif  allfirstplayer[2].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==2  then  	   --2 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7531)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    5,111,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,5,111)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7531,  0)	 -- c¤p BUFF	 	 	 
	 x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )
	 	 
	 elseif  allfirstplayer[3].Guid  ==  LuaFnGetName(  sceneId,  selfId  )  and  iop  ==3    then  	 	 --3 danh 
                      if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,7532)  ==  1  then
                            x890096_Tips(  sceneId,  selfId," nâm ðß½ng ti«n dî hæu thØ trÕng thái , vô nhu tái thÑ lînh thü "    )
                            return
                      end
                LuaFnAwardTitle(  sceneId,  selfId,    5,112,24)    -- bä nguyên lai ðích xßng hào thª hoán 
	 SetCurTitle(sceneId,selfId,5,112)                  -- c¤p xßng hào 	 
	 LuaFnDispatchAllTitle(sceneId,  selfId)    -- xoát tân khách hµ ðoan xßng hào 
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  7532,  0)	 -- c¤p BUFF
                x890096_Tips(  sceneId,  selfId," lînh thü thành công "    )
	 
	 else
	 x890096_Tips(  sceneId,  selfId," thïnh tuy¬n trÕch dæ tñ kÖ ðích danh tñ ð¯i Ñng ðích lînh tß·ng án næu ! "    )	 -- giá lý hoàn thi®n tß·ng l® 
                return
	 end
	 SetMissionData(sceneId,  selfId,  MD_CHUNJIE_TUANYUANJIAOZI6_DAYTIME,  nWeekCur  );
	 end	 
	 end	 	 
	 
	 
	 end	 
end	 



function  x890096_GetGiftsForLevelUp(  sceneId,  selfId,  nIndex  )
g_ServerNew_LevelUp_Gifts  =  {
[1]  =  {10157002,38000184,38001103,30402058},
[2]  =  {10157003,39999901,30308059,30505079},
[3]  =  {10157004,38001091,38001099,38001098},
[4]  =  {10157005,38001106,38000185,38000185},
[5]  =  {10157006,30900048,38001089,38001106},                                                    --------------- giá cá th¸ thång c¤p häo l­ 
[6]  =  {39910004,38412001,39901003,38000186},
[7]  =  {39910005,38000186,30311029,38000531},
[8]  =  {39910006,38406001,38000401,38000398},
[9]  =  {39910001,30501171,30501171,38000192},
[10]  =  {10157001,38000184,38000184,30008012  },
[11]  =  {10157001,38000184,38000184,30008012  },
[12]  =  {10157001,38000184,38000184,30008012  },
[13]  =  {10157001,38000184,38000184,30008012  },
[14]  =  {10157001,38000184,38000184,30008012  },
[15]  =  {10157001,38000184,38000184,30008012  },
[16]  =  {10157001,38000184,38000184,30008012  },}

local  CheckLev  ={10,20,30,35,40,45,50,55,60,65,70,75,80,85,90,100}
local  UUUU  =  GetMissionData(  sceneId,  selfId,  SHENG_JIJIANGLI)	 
local  huiyuanbiaoz  =  GetMissionData(  sceneId,  selfId,CHONG_ZHI_CHONGSHU)
local	 lev	 =  GetLevel(  sceneId,  selfId  )    -- ðÆng c¤p 
local	 nam	 =  LuaFnGetName(  sceneId,  selfId  )-- ngoÕn gia danh tñ 

if  nIndex  >=  1  and    nIndex  <=  16  then
                  if  nIndex  >  1  then
	         if  UUUU  <  nIndex-1  then  
	               x890096_Tips(  sceneId,  selfId," thïnh tiên lînh thü "..CheckLev[nIndex-1].." c¤p ðích tß·ng l® "  )
                        return
	         end
	   end
	   if  lev  <  CheckLev[nIndex]  then
	         x890096_Tips(  sceneId,  selfId," nhî hoàn mµt hæu "..CheckLev[nIndex].." c¤p b¤t khä dî lînh thü tß·ng l® "  )
	   return
	   end
	   if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  4  or  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  4  then
	         x890096_Tips(  sceneId,  selfId," thïnh bäo trì ðÕo cø lan hòa nhâm vø lan các hæu 4 cá không v¸ "  )
	   return	 
                  end
	   if  nIndex  <=  UUUU  then
	         x890096_Tips(  sceneId,  selfId," nhî dî kinh lînh thü li­u tß·ng l® hoàn lai t¯ th§p yêu "  )
	   return
	   else
	         SetMissionData(  sceneId,  selfId,  SHENG_JIJIANGLI,nIndex)  -- giá cá vi thông tri   
                        for  i  =  1  ,getn(g_ServerNew_LevelUp_Gifts[nIndex])  do  
	                   TryRecieveItem(  sceneId,  selfId,g_ServerNew_LevelUp_Gifts[nIndex][i],  1)-- phát tß·ng l® v§t ph¦m     
	         end
	         x890096_Tips(  sceneId,  selfId," cung hï nâm , lînh thü thành công "  )
	         BroadMsgByChatPipe(sceneId,  selfId,  " cung hï ngoÕn gia "..nam.." thành công lînh thü li­u "..CheckLev[nIndex].." c¤p thång c¤p tß·ng l® ",  4)
	         x890096_GetGiftsForUI(  sceneId,  selfId,  16  )
                        LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	   end
end



if  nIndex  ==  20  then
	 if  huiyuanbiaoz  <1  then
	 x890096_Tips(  sceneId,  selfId," nâm b¤t th¸ hµi viên ba "  )	 
	 	 return
	 end
x890096_OneKey4Slot(  sceneId,  selfId)
x890096_Tips(  sceneId,  selfId," thïnh b¤t yªu tr÷ng phøc liên tøc ði¬m kích phü t¡c hµi b¸ h® th¯ng phong hào "  )	 
x890096_Tips(  sceneId,  selfId," tôn kính ðích hµi viên , dî thành công ð¯i nâm b¯i bao nµi ðích s· hæu trang b¸ ðä häo nh¤t ki®n 4 kh±ng "  )
end	 


if  nIndex  ==  21  then
      if  huiyuanbiaoz  <1  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	 	 return
	 end
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,HUIYUANSONGLA  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()	 
if  nLastDay  ==  nToday  and  nCount  >=  1  then
x890096_Tips(  sceneId,  selfId," m²i thiên chích khä lînh thü nh¤t thÑ mi­n phí lÕt bá "  )	 
	 return
end	 
        if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <2  then
	 x890096_Tips(  sceneId,  selfId," thïnh bäo trì bao khöa hæu 2 cá không v¸ "  )
	 return	 
        end
        for  i  =  1,huiyuanbiaoz  do
                TryRecieveItem(  sceneId,  selfId,  30505107,  1)
        end
	 local  nData  =  0
	 if  nLastDay  ~=  nToday  then
	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 nData  =  SetLowWord(  nData,  1  )
	 else
	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 nData  =  SetLowWord(  nData,  nCount  +  1  )
	 end
	 SetMissionData(  sceneId,  selfId,  HUIYUANSONGLA,  nData  )
	 x890096_Tips(  sceneId,  selfId," cung hï nâm lînh thü thành công , nâm th¸ VIP"..huiyuanbiaoz.." c¤p hµi viên , m²i nh§t khä lînh thü "..huiyuanbiaoz.." cá mi­n phí [ ti¬u lÕt bá ] , ð« thång VIP ðÆng c¤p khä lînh thü canh ða ~"  )
end	 

	 

if  nIndex  ==  22  then    -- lînh công lñc ðan 
      if  huiyuanbiaoz  <2  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
                local  myhuiyuanbiaoz  =  huiyuanbiaoz  -  1
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,HUIYUANSONGDAN  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()	 
      if  nLastDay  ==  nToday  and  nCount  >=  1  then
                x890096_Tips(  sceneId,  selfId," m²i thiên chích khä lînh thü nh¤t thÑ mi­n phí công lñc ðan "  )	 
            return
      end	 
      if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  2  then
	 x890096_Tips(  sceneId,  selfId," thïnh bäo trì bao khöa hæu 2 cá không v¸ "  )
            return	 
        end
        for  i  =  1,myhuiyuanbiaoz  do
                TryRecieveItem(  sceneId,  selfId,  39999901,  1)
        end
	 	 local  nData  =  0
	 	 if  nLastDay  ~=  nToday  then
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  1  )
	 	 else
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  nCount  +  1  )
	 	 end
	 	 SetMissionData(  sceneId,  selfId,  HUIYUANSONGDAN,  nData  )
	 x890096_Tips(  sceneId,  selfId," cung hï nâm lînh thü thành công , nâm th¸ VIP"..huiyuanbiaoz.." c¤p hµi viên , m²i nh§t khä lînh thü "..myhuiyuanbiaoz.." cá mi­n phí [ công lñc ðan ] , ð« thång VIP ðÆng c¤p khä lînh thü canh ða ~"  )
end	 


if  nIndex  ==  23  then    -- lînh tinh phách 
      if  huiyuanbiaoz  <2  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
                local  myhuiyuanbiaoz  =  huiyuanbiaoz  -  1
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,HUIYUANSONGPO  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()	 
      if  nLastDay  ==  nToday  and  nCount  >=  1  then
                x890096_Tips(  sceneId,  selfId," m²i thiên chích khä lînh thü nh¤t thÑ chân nguyên tinh phách "  )	 
            return
      end	 
      if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <2  then
	 x890096_Tips(  sceneId,  selfId," thïnh bäo trì bao khöa hæu 2 cá không v¸ "  )
            return	 
        end
        for  i  =  1,myhuiyuanbiaoz  do
                TryRecieveItem(  sceneId,  selfId,  38000397,  1)
        end
	 	 local  nData  =  0
	 	 if  nLastDay  ~=  nToday  then
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  1  )
	 	 else
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  nCount  +  1  )
	 	 end
	 	 SetMissionData(  sceneId,  selfId,  HUIYUANSONGPO,  nData  )
	 x890096_Tips(  sceneId,  selfId," cung hï nâm lînh thü thành công , nâm th¸ VIP"..huiyuanbiaoz.." c¤p hµi viên , m²i nh§t khä lînh thü "..myhuiyuanbiaoz.." cá mi­n phí [ chân nguyên tinh phách ] , ð« thång VIP ðÆng c¤p khä lînh thü canh ða ~"  )
end


if  nIndex  ==  24  then    -- lînh phøc hi ng÷c 
      if  huiyuanbiaoz  <2  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
                local  myhuiyuanbiaoz  =  huiyuanbiaoz  -  1
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,HUIYUANSONGQUAN  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()	 
      if  nLastDay  ==  nToday  and  nCount  >=  1  then
                x890096_Tips(  sceneId,  selfId," m²i thiên chích khä lînh thü nh¤t thÑ phøc hi ng÷c "  )	 
            return
      end	 
      if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  2  then
	 x890096_Tips(  sceneId,  selfId," thïnh bäo trì bao khöa hæu 2 cá không v¸ "  )
            return	 
        end
        for  i  =  1,tonumber(myhuiyuanbiaoz*2)  do
                TryRecieveItem(  sceneId,  selfId,  38002049,  1)
        end
	 	 local  nData  =  0
	 	 if  nLastDay  ~=  nToday  then
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  1  )
	 	 else
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  nCount  +  1  )
	 	 end
	 	 SetMissionData(  sceneId,  selfId,  HUIYUANSONGQUAN,  nData  )
	 x890096_Tips(  sceneId,  selfId," cung hï nâm lînh thü thành công , nâm th¸ VIP"..huiyuanbiaoz.." c¤p hµi viên , m²i nh§t khä lînh thü "..tonumber(myhuiyuanbiaoz*2).." cá mi­n phí [ phøc hi ng÷c ] , ð« thång VIP ðÆng c¤p khä lînh thü canh ða ~"  )
end


if  nIndex  ==  25  then    -- lînh m®nh h°n ng÷c 
      if  huiyuanbiaoz  <2  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
                local  myhuiyuanbiaoz  =  huiyuanbiaoz  -  1
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,HUIYUANSONGQIAN  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()	 
      if  nLastDay  ==  nToday  and  nCount  >=  1  then
                x890096_Tips(  sceneId,  selfId," m²i thiên chích khä lînh thü nh¤t thÑ m®nh h°n ng÷c "  )	 
            return
      end	 
      if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  2  then
	 x890096_Tips(  sceneId,  selfId," thïnh bäo trì bao khöa hæu 2 cá không v¸ "  )
            return	 
        end
        for  i  =  1,myhuiyuanbiaoz  do
                TryRecieveItem(  sceneId,  selfId,  38002041,  1)
        end
	 	 local  nData  =  0
	 	 if  nLastDay  ~=  nToday  then
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  1  )
	 	 else
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  nCount  +  1  )
	 	 end
	 	 SetMissionData(  sceneId,  selfId,  HUIYUANSONGQIAN,  nData  )
	 x890096_Tips(  sceneId,  selfId," cung hï nâm lînh thü thành công , nâm th¸ VIP"..huiyuanbiaoz.." c¤p hµi viên , m²i nh§t khä lînh thü "..myhuiyuanbiaoz.." cá mi­n phí [ m®nh h°n ng÷c ] , ð« thång VIP ðÆng c¤p khä lînh thü canh ða ~"  )
end



if  nIndex  ==  26  then    -- lînh ngßng tÑc hoàn 
      if  huiyuanbiaoz  <2  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
                local  myhuiyuanbiaoz  =  huiyuanbiaoz  -  1
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,HUIYUANSONGCHONG  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()	 
      if  nLastDay  ==  nToday  and  nCount  >=  1  then
                x890096_Tips(  sceneId,  selfId," m²i thiên chích khä lînh thü nh¤t thÑ ngßng tÑc hoàn "  )	 
            return
      end	 
      if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  2  then
	 x890096_Tips(  sceneId,  selfId," thïnh bäo trì bao khöa hæu 2 cá không v¸ "  )
            return	 
        end
        for  i  =  1,myhuiyuanbiaoz  do
                TryRecieveItem(  sceneId,  selfId,  38002068,  1)
        end
	 	 local  nData  =  0
	 	 if  nLastDay  ~=  nToday  then
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  1  )
	 	 else
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  nCount  +  1  )
	 	 end
	 	 SetMissionData(  sceneId,  selfId,  HUIYUANSONGCHONG,  nData  )
	 x890096_Tips(  sceneId,  selfId," cung hï nâm lînh thü thành công , nâm th¸ VIP"..huiyuanbiaoz.." c¤p hµi viên , m²i nh§t khä lînh thü "..myhuiyuanbiaoz.." cá mi­n phí [ ngßng tÑc hoàn ] , ð« thång VIP ðÆng c¤p khä lînh thü canh ða ~"  )
end



if  nIndex  ==  27  then    -- lînh kim tàm ti 
      if  huiyuanbiaoz  <2  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
                local  myhuiyuanbiaoz  =  huiyuanbiaoz  -  1
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,HUIYUANSONGMA  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()	 
      if  nLastDay  ==  nToday  and  nCount  >=  1  then
                x890096_Tips(  sceneId,  selfId," m²i thiên chích khä lînh thü nh¤t thÑ kim tàm ti "  )	 
            return
      end	 
      if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  2  then
	 x890096_Tips(  sceneId,  selfId," thïnh bäo trì bao khöa hæu 2 cá không v¸ "  )
            return	 
        end
        for  i  =  1,tonumber(myhuiyuanbiaoz*20)  do
                TryRecieveItem(  sceneId,  selfId,  20310168,  1)
        end
	 	 local  nData  =  0
	 	 if  nLastDay  ~=  nToday  then
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  1  )
	 	 else
	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 nData  =  SetLowWord(  nData,  nCount  +  1  )
	 	 end
	 	 SetMissionData(  sceneId,  selfId,  HUIYUANSONGMA,  nData  )
	 x890096_Tips(  sceneId,  selfId," cung hï nâm lînh thü thành công , nâm th¸ VIP"..huiyuanbiaoz.." c¤p hµi viên , m²i nh§t khä lînh thü "..tonumber(myhuiyuanbiaoz*20).." cá mi­n phí [ kim tàm ti ] , ð« thång VIP ðÆng c¤p khä lînh thü canh ða ~"  )
end


---------------30 kÏ phúc --------
if  nIndex  ==  30  then
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,  QIFUci_SUDATA  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()	 
if  lev  <  50  then
      x890096_Tips(  sceneId,  selfId," thïnh tÕi 50 c¤p dî h§u tái lai giá lý lînh thü "  )	 
      return
end	 	 
if  GetFullExp(  sceneId,  selfId  )  ==  GetExp(  sceneId,  selfId  )  then
      x890096_Tips(  sceneId,  selfId," nâm ðích kinh nghi®m thßþng hÕn li­u thïnh sØ døng ta tái lai "  )	 
      return	 
end	 
if  nLastDay  ==  nToday  and  nCount  >=  3  then
      x890096_Tips(  sceneId,  selfId," m²i thiên chích khä kÏ phúc 3 thÑ "  )	 
      return
end	 
local  targetId  =  -1
local  zd  =  YuanBao(sceneId,selfId,targetId,3,0)
local  num  =  1000
if  zd  <  num  then
x890096_Tips(  sceneId,  selfId," nâm nguyên bäo b¤t túc "  )	 
return
end	 
  local  strun  =    YuanBao(sceneId,selfId,targetId,2,tonumber  (  num))	 
if  strun  ~=  0  then
	 x890096_Tips(  sceneId,  selfId," nguyên bäo kh¤u thü th¤t bÕi "  )
	 return
end	 
	 for  i=1  ,lev  do    
	 	 LuaFnAddExp(  sceneId,  selfId,  (lev-49)*1000)
	 end
local    se  =  	 (lev-49)*1000*lev
	 BroadMsgByChatPipe(sceneId,  selfId,  "#B cung hï ngoÕn gia "..nam.." hoa phí li­u "..num.." nguyên bäo thành công kÏ phúc hoÕch ð¡c "..tostring(se).." ði¬m kinh nghi®m ",  4)
	 -- canh tân thÑ s± 
	 local  nData  =  0
	 if  nLastDay  ~=  nToday  then
	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 nData  =  SetLowWord(  nData,  1  )
	 else
	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 nData  =  SetLowWord(  nData,  nCount  +  1  )
	 end
	 SetMissionData(  sceneId,  selfId,  QIFUci_SUDATA,  nData  )
end


if  nIndex  ==  31  then    -- tùy thân tâm pháp 
      if  huiyuanbiaoz  <1  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
      DispatchXinfaLevelInfo(  sceneId,  selfId,  selfId,  GetMenPai(sceneId,  selfId)  );
  return
end

if  nIndex  ==  32  then    -- tùy thân trang b¸ ðä tÕo 
      if  huiyuanbiaoz  <1  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
            return
      end
      suiji=random(7)
      if  suiji==1  then
            yanse  =  tostring("#effffb8#c9f0800")
      elseif  suiji==2  then
            yanse  =  tostring("#e6f00c7#c00ffff")
      elseif  suiji==3  then
            yanse  =  tostring("#e6f00c7")
      elseif  suiji==4  then
            yanse  =  tostring("#eaf0c14#Y")
      elseif  suiji==5  then
            yanse  =  tostring("#e006699#gFF00FF")
      elseif  suiji==6  then
            yanse  =  tostring("#G")
      elseif  suiji==7  then
            yanse  =  tostring("#H")
      end
      BeginUICommand(sceneId)
                UICommand_AddString(sceneId,"#Y tùy thân trang b¸ ðä tÕo ")
	 UICommand_AddInt(  sceneId,  8)
                UICommand_AddString(sceneId,""..yanse.." trang b¸ tß ch¤t giám ð¸nh ")
	 UICommand_AddInt(  sceneId,  322)
                UICommand_AddString(sceneId,""..yanse.." trang b¸ tß ch¤t tr÷ng giám ")
	 UICommand_AddInt(  sceneId,  326)
                UICommand_AddString(sceneId,""..yanse.." trang b¸ cß¶ng hóa · ðÕo cø ")
	 UICommand_AddInt(  sceneId,  323)
                UICommand_AddString(sceneId,""..yanse.." trang b¸ cß¶ng hóa · quy¬n trøc ")
	 UICommand_AddInt(  sceneId,  327)
                UICommand_AddString(sceneId,""..yanse.." cß¶ng hóa chuy¬n di ")
	 UICommand_AddInt(  sceneId,  321)
                UICommand_AddString(sceneId,""..yanse.." trang b¸ kh¡c minh ")
	 UICommand_AddInt(  sceneId,  324)
                UICommand_AddString(sceneId,""..yanse.." trang b¸ tr× minh ")
	 UICommand_AddInt(  sceneId,  325)
                UICommand_AddString(sceneId,""..yanse.." trang b¸ tu lý ")
	 UICommand_AddInt(  sceneId,  328)
          EndUICommand(  sceneId  )
          DispatchUICommand(  sceneId,  selfId,20131232)
      return
  end

if  nIndex  ==  33  then    -- tùy thân bäo thÕch ðiªm 
      if  huiyuanbiaoz  <2  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
      suiji=random(7)
      if  suiji==1  then
            yanse  =  tostring("#effffb8#c9f0800")
      elseif  suiji==2  then
            yanse  =  tostring("#e6f00c7#c00ffff")
      elseif  suiji==3  then
            yanse  =  tostring("#e6f00c7")
      elseif  suiji==4  then
            yanse  =  tostring("#eaf0c14#Y")
      elseif  suiji==5  then
            yanse  =  tostring("#e006699#gFF00FF")
      elseif  suiji==6  then
            yanse  =  tostring("#G")
      elseif  suiji==7  then
            yanse  =  tostring("#H")
      end
      BeginUICommand(sceneId)
                UICommand_AddString(sceneId,"#Y bäo thÕch tùy thân gia công ")
	 UICommand_AddInt(  sceneId,  8)
                UICommand_AddString(sceneId,""..yanse.." bäo thÕch hþp thành ")
	 UICommand_AddInt(  sceneId,  331)
                UICommand_AddString(sceneId,""..yanse.." bäo thÕch ðiêu trác ")
	 UICommand_AddInt(  sceneId,  332)
                UICommand_AddString(sceneId,""..yanse.." bäo thÕch dong luy®n ")
	 UICommand_AddInt(  sceneId,  333)
                UICommand_AddString(sceneId,""..yanse.." bäo thÕch trác kh¡c ")
	 UICommand_AddInt(  sceneId,  334)
                UICommand_AddString(sceneId,""..yanse.." bäo thÕch tß½ng khäm ")
	 UICommand_AddInt(  sceneId,  335)
                UICommand_AddString(sceneId,""..yanse.." cñc hÕn tß½ng khäm ")
	 UICommand_AddInt(  sceneId,  336)
                UICommand_AddString(sceneId,""..yanse.." bäo thÕch trích tr× ")
	 UICommand_AddInt(  sceneId,  337)
                UICommand_AddString(sceneId,""..yanse.." cñc hÕn trích tr× ")
	 UICommand_AddInt(  sceneId,  338)
          EndUICommand(  sceneId  )
          DispatchUICommand(  sceneId,  selfId,20131232)
  return
end
if  nIndex  ==  34  then    -- tùy thân th¥n khí ðä tÕo 
      if  huiyuanbiaoz  <3  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
            return
      end
      suiji=random(7)
      if  suiji==1  then
            yanse  =  tostring("#effffb8#c9f0800")
      elseif  suiji==2  then
            yanse  =  tostring("#e6f00c7#c00ffff")
      elseif  suiji==3  then
            yanse  =  tostring("#e6f00c7")
      elseif  suiji==4  then
            yanse  =  tostring("#eaf0c14#Y")
      elseif  suiji==5  then
            yanse  =  tostring("#e006699#gFF00FF")
      elseif  suiji==6  then
            yanse  =  tostring("#G")
      elseif  suiji==7  then
            yanse  =  tostring("#H")
      end
      BeginUICommand(sceneId)
                UICommand_AddString(sceneId,"#Y tùy thân th¥n khí ðä tÕo ")
	 UICommand_AddInt(  sceneId,  8)
                UICommand_AddString(sceneId,""..yanse.." th¥n khí luy®n h°n ")
	 UICommand_AddInt(  sceneId,  341)
                UICommand_AddString(sceneId,""..yanse.." th¥n khí thông linh ")
	 UICommand_AddInt(  sceneId,  342)
                UICommand_AddString(sceneId,""..yanse.." th¥n khí khª hþp ")
	 UICommand_AddInt(  sceneId,  343)
                UICommand_AddString(sceneId,""..yanse.." thßþng c± th¥n khí tiªn giai ")
	 UICommand_AddInt(  sceneId,  344)
                UICommand_AddString(sceneId,""..yanse.." thßþng c± th¥n khí tr÷ng t¦y ")
	 UICommand_AddInt(  sceneId,  345)
                UICommand_AddString(sceneId,""..yanse.." vß½ng quy«n thång linh ")
	 UICommand_AddInt(  sceneId,  346)
                UICommand_AddString(sceneId,""..yanse.." thiên ðÕo thång linh ")
	 UICommand_AddInt(  sceneId,  347)
                UICommand_AddString(sceneId,""..yanse.." thång linh tiªn giai ")
	 UICommand_AddInt(  sceneId,  348)
          EndUICommand(  sceneId  )
          DispatchUICommand(  sceneId,  selfId,20131232)
  return
end

if  nIndex  ==  35  then    -- tùy thân ngân hành thß½ng kh¯ 
      if  huiyuanbiaoz  <4  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end

      if  sceneId  ~=  0  and  sceneId  ~=  1  and  sceneId  ~=  2  and  sceneId  ~=  420  and  sceneId  ~=  186  then
	 x890096_Tips(  sceneId,  selfId," tùy thân thß½ng kh¯ chích nång tÕi - lÕc dß½ng ? tô châu ? ðÕi lý ? lâu lan ? thúc hà - tràng cänh sØ døng "  )	 
	       return
	 end

      BankBegin(sceneId,  selfId,selfId)
  return
end

if  nIndex  ==  36  then    -- tùy thân trân thú ðä tÕo 
      if  huiyuanbiaoz  <5  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
      suiji=random(7)
      if  suiji==1  then
            yanse  =  tostring("#effffb8#c9f0800")
      elseif  suiji==2  then
            yanse  =  tostring("#e6f00c7#c00ffff")
      elseif  suiji==3  then
            yanse  =  tostring("#e6f00c7")
      elseif  suiji==4  then
            yanse  =  tostring("#eaf0c14#Y")
      elseif  suiji==5  then
            yanse  =  tostring("#e006699#gFF00FF")
      elseif  suiji==6  then
            yanse  =  tostring("#G")
      elseif  suiji==7  then
            yanse  =  tostring("#H")
      end
      BeginUICommand(sceneId)
                UICommand_AddString(sceneId,"#Y tùy thân trân thú ðä tÕo ")
	 UICommand_AddInt(  sceneId,  8)
                UICommand_AddString(sceneId,""..yanse.." trân thú v§t ph¦m thß½ng ðiªm ")
	 UICommand_AddInt(  sceneId,  361)
                UICommand_AddString(sceneId,""..yanse.." tra tuân trân thú thành trß¶ng ")
	 UICommand_AddInt(  sceneId,  362)
                UICommand_AddString(sceneId,""..yanse.." trân thú hoàn ð°ng ")
	 UICommand_AddInt(  sceneId,  363)
                UICommand_AddString(sceneId,""..yanse.." ðan nhân ph°n thñc trân thú ")
	 UICommand_AddInt(  sceneId,  364)
                UICommand_AddString(sceneId,""..yanse.." trân thú kÛ nång h÷c t§p ")
	 UICommand_AddInt(  sceneId,  365)
                UICommand_AddString(sceneId,""..yanse.." trân thú kÛ nång thång c¤p ")
	 UICommand_AddInt(  sceneId,  366)
                UICommand_AddString(sceneId,""..yanse.." ð« thång trân thú ngµ tính ")
	 UICommand_AddInt(  sceneId,  367)
                UICommand_AddString(sceneId,""..yanse.." cäi biªn trân thú tính cách ")
	 UICommand_AddInt(  sceneId,  368)
          EndUICommand(  sceneId  )
          DispatchUICommand(  sceneId,  selfId,20131232)
  return
end

if  nIndex  ==  37  then    -- tùy thân mÛ dung 
      if  huiyuanbiaoz  <6  then
	 x890096_Tips(  sceneId,  selfId," nâm ðích VIP ðÆng c¤p b¤t cú "  )	 
	       return
	 end
      suiji=random(7)
      if  suiji==1  then
            yanse  =  tostring("#effffb8#c9f0800")
      elseif  suiji==2  then
            yanse  =  tostring("#e6f00c7#c00ffff")
      elseif  suiji==3  then
            yanse  =  tostring("#e6f00c7")
      elseif  suiji==4  then
            yanse  =  tostring("#eaf0c14#Y")
      elseif  suiji==5  then
            yanse  =  tostring("#e006699#gFF00FF")
      elseif  suiji==6  then
            yanse  =  tostring("#G")
      elseif  suiji==7  then
            yanse  =  tostring("#H")
      end
      BeginUICommand(sceneId)
                UICommand_AddString(sceneId,"#Y tùy thân hóa trang mÛ dung ")
	 UICommand_AddInt(  sceneId,  8)
                UICommand_AddString(sceneId,""..yanse.." tu cäi phát hình ")
	 UICommand_AddInt(  sceneId,  371)
                UICommand_AddString(sceneId,""..yanse.." tu cäi phát s¡c ")
	 UICommand_AddInt(  sceneId,  372)
                UICommand_AddString(sceneId,""..yanse.." tu chïnh dung mÕo ")
	 UICommand_AddInt(  sceneId,  373)
                UICommand_AddString(sceneId,""..yanse.." tu cäi ð¥u tßþng ")
	 UICommand_AddInt(  sceneId,  374)
                UICommand_AddString(sceneId,""..yanse.." thì trang nhi­m s¡c ")
	 UICommand_AddInt(  sceneId,  375)
                UICommand_AddString(sceneId,""..yanse.." thì trang tài ti­n ")
	 UICommand_AddInt(  sceneId,  376)
                UICommand_AddString(sceneId,""..yanse.." thì trang ði¬m chuª ")
	 UICommand_AddInt(  sceneId,  377)
                UICommand_AddString(sceneId,""..yanse.." ph¯i sÑc trích tr× ")
	 UICommand_AddInt(  sceneId,  378)
          EndUICommand(  sceneId  )
          DispatchUICommand(  sceneId,  selfId,20131232)
  return
end



        if  nIndex  ==  321  then
                  BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	       EndUICommand(sceneId  )
	       DispatchUICommand(sceneId,selfId,  20130521    )
                  return
          end

        if  nIndex  ==  322  then
                  BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	       EndUICommand(sceneId  )
	       DispatchUICommand(  sceneId,  selfId,  1001  )
                  return
          end

        if  nIndex  ==  323  then
                  BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	       EndUICommand(sceneId  )
	       DispatchUICommand(sceneId,selfId,  1002    )
                  return
          end

        if  nIndex  ==  324  then
                  BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	       EndUICommand(sceneId  )
	       DispatchUICommand(sceneId,selfId,  1005    )
                  return
          end

        if  nIndex  ==  325  then
                  BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	       EndUICommand(sceneId  )
	       DispatchUICommand(sceneId,selfId,  1006    )
                  return
          end

        if  nIndex  ==  326  then
                  BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	       EndUICommand(sceneId  )
	       DispatchUICommand(sceneId,selfId,  112233    )
                  return
          end

        if  nIndex  ==  327  then
	   BeginUICommand(  sceneId  )
	       UICommand_AddInt(  sceneId,  selfId  )
                      UICommand_AddInt(  sceneId,  11)
                      UICommand_AddInt(  sceneId,  50000)--- nhu yªu ðích ti­n 
	       UICommand_AddInt(  sceneId,  10000000)  -- trang b¸ khai thüy 
	       UICommand_AddInt(  sceneId,  20000000)    -- trang b¸ kªt thúc 
	       UICommand_AddInt(  sceneId,  -1)    -- v§t ph¦m id
	       UICommand_AddString(sceneId," trang b¸ cß¶ng hóa · quy¬n trøc ");
	       UICommand_AddString(sceneId,"#{ZBQHJ_130508_7}");
	       UICommand_AddString(sceneId," thïnh tß½ng trang b¸ phóng nh§p thØ khuông ");
	       UICommand_AddString(sceneId," thïnh tß½ng cß¶ng hóa quy¬n trøc phóng nh§p thØ khuông ");
	       EndUICommand(  sceneId  )
	       DispatchUICommand(  sceneId,selfId,21090722)
                  return
          end

        if  nIndex  ==  328  then
	 BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )
	     UICommand_AddInt(  sceneId,  -1  )
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,  19810313  )
                  return
          end

        if  nIndex  ==  331  then
	 BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,  23  )
	 return
        end

        if  nIndex  ==  332  then
	 BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )
	     EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,  112236  )
	 return
        end

        if  nIndex  ==  333  then
	 BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,  112237  )
	 return
        end

        if  nIndex  ==  334  then
	 BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,  201210120  )
	 return
        end

        if  nIndex  ==  335  then
	 BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,  19830424  )
	 return
        end

        if  nIndex  ==  336  then
	 BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,  751107  )
	 return
        end

        if  nIndex  ==  337  then
	 BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,  27  )
	 return
        end

        if  nIndex  ==  338  then
	 BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,  25702  )
	 return
        end


        if  nIndex  ==  341  then
              BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	     UICommand_AddInt(sceneId,0);
            EndUICommand(sceneId)
            DispatchUICommand(sceneId,selfId,  19831114  )
                  return
          end

        if  nIndex  ==  342  then
	 BeginUICommand(  sceneId  )
	       UICommand_AddInt(  sceneId,  selfId  )
                      UICommand_AddInt(  sceneId,  5)
        	       UICommand_AddInt(  sceneId,  50000)--- nhu yªu ðích ti­n 
	       UICommand_AddInt(  sceneId,  10300006)  -- trang b¸ khai thüy 
	       UICommand_AddInt(  sceneId,  10307023)    -- trang b¸ kªt thúc 
	       UICommand_AddInt(  sceneId,  30505816)    -- v§t ph¦m id
	       UICommand_AddString(sceneId," th¥n khí thông linh ");
	       UICommand_AddString(sceneId,"#{SQSX_120806_10}");
	       UICommand_AddString(sceneId,"#Y phóng nh§p yªu thông linh ðích th¥n khí :");
	       UICommand_AddString(sceneId,"#Y phóng nh§p tø linh thÕch :");
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    21090722)
                  return
          end

        if  nIndex  ==  343  then
	 BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,1);
	     EndUICommand(sceneId  )
	     DispatchUICommand(sceneId,selfId,  201208093)
                  return
          end

        if  nIndex  ==  344  then
	 BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	 UICommand_AddInt(sceneId,1);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  19831114  )
                  return
          end

        if  nIndex  ==  345  then
              BeginUICommand(  sceneId  )
	 UICommand_AddInt(  sceneId,  selfId  )
                UICommand_AddInt(  sceneId,  1)
        	 UICommand_AddInt(  sceneId,  800000)--- nhu yªu ðích ti­n 
	 UICommand_AddInt(  sceneId,  10300401)  -- trang b¸ khai thüy 
	 UICommand_AddInt(  sceneId,  10307041)    -- trang b¸ kªt thúc 
	 UICommand_AddInt(  sceneId,  30505813)    -- v§t ph¦m id
	 UICommand_AddString(sceneId," thßþng c± th¥n khí tr÷ng t¦y ");
	 UICommand_AddString(sceneId,"        #Y nhß quä nhî ð¯i #G thßþng c± th¥n khí #Y ðích chúc tính b¤t mãn ý , khä dî lai ngã giá lý tiªn hành tr÷ng t¦y . m²i thÑ tr÷ng t¦y nhu yªu tiêu háo #G ma huyªt thÕch #Y nh¤t mai . tr÷ng t¦y chi h§u , hæu kÖ su¤t ð¡c ðáo chúc tính canh cß¶ng ðÕi ðích thßþng c± th¥n khí . #r        #Y thßþng c± th¥n khí tr÷ng t¦y chi h§u , khä nång hµi tÕo thành phø th¬ ngoÕi quan cäi biªn , khä dî sØ døng huy­n h°n ðan ð¯i kÏ tr÷ng tân huy­n h°n tÑc khä . #r        #cFF0000 chú ý : #R ngã giá lý chích nång tr÷ng t¦y thßþng c± th¥n khí , ph± thông th¥n khí khä thông quá luy®n h°n tr÷ng trí chúc tính . ");
	 UICommand_AddString(sceneId,"#Y phóng nh§p yªu tr÷ng t¦y ðích th¥n khí :");
	 UICommand_AddString(sceneId,"#Y thïnh phóng nh§p ma huyªt thÕch :");
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    21090722)
            return
          end

        if  nIndex  ==  346  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,selfId);
	 EndUICommand(sceneId  )
	 DispatchUICommand(sceneId,selfId,  201708093)
                  return
          end

        if  nIndex  ==  347  then
	 BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	       EndUICommand(sceneId  )
	 DispatchUICommand(sceneId,selfId,  201708097)
                return
          end

        if  nIndex  ==  348  then
	 BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,selfId);
	       EndUICommand(sceneId  )
	 DispatchUICommand(sceneId,selfId,  20170526)
                return
          end

        if  nIndex  ==  361  then
              DispatchNoNpcShopItem(  sceneId,  selfId,  225  )    --225 hào trân thú tÕp hóa ðiªm 
              return
        end

        if  nIndex  ==  362  then
	 BeginUICommand(  sceneId  )
	 	 --UICommand_AddInt(  sceneId,  selfId  )
	 	 UICommand_AddInt(  sceneId,  6  )	 	 	 	 -- trân thú tra tuân phân chi 
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,  3  )	 -- ði«u døng trân thú gi¾i di®n 
              return
        end

        if  nIndex  ==  363  then
	 BeginUICommand(  sceneId  )
	 	 --UICommand_AddInt(  sceneId,  selfId  )
	 	 UICommand_AddInt(  sceneId,  2  )	 	 	 	 -- trân thú hoàn ð°ng phân chi 
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,  3  )	 -- ði«u døng trân thú gi¾i di®n 
              return
        end

        if  nIndex  ==  364  then
	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  selfId  )        -- ðan nhân ph°n thñc 
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,  150  )
              return
        end

        if  nIndex  ==  365  then
	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,selfId);	 -- ði«u døng tân bän trân thú kÛ nång h÷c t§p gi¾i di®n   UI  223
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  223)
              return
        end

        if  nIndex  ==  366  then
	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,selfId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  19823  )	 -- ði«u døng trân thú kÛ nång thång c¤p gi¾i di®n 
              return
        end

        if  nIndex  ==  367  then
	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  selfId  )        -- cån c¯t ðan th¬ ngµ 
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,  19820425  )
              return
        end

        if  nIndex  ==  368  then
	 BeginUICommand(sceneId);
	 	 UICommand_AddInt(sceneId,  selfId);            -- cäi biªn tính cách 
	 EndUICommand(sceneId);
	 DispatchUICommand(sceneId,  selfId,  800108);
              return
        end

        if  nIndex  ==  371  then
              CallScriptFunction(  801010,  "OnEnumerate",sceneId,  selfId,  selfId  )
          return
        end

        if  nIndex  ==  372  then
              CallScriptFunction(  801011,  "OnEnumerate",sceneId,  selfId,  selfId  )
          return
        end

        if  nIndex  ==  373  then
              CallScriptFunction(  805029,  "OnEnumerate",sceneId,  selfId,  selfId  )
          return
        end

        if  nIndex  ==  374  then
              CallScriptFunction(  805030,  "OnEnumerate",sceneId,  selfId,  selfId  )
          return
        end

        if  nIndex  ==  375  then
	 BeginUICommand(  sceneId  )
	 UICommand_AddInt(  sceneId,  selfId  )
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    0910281)
          return
        end

        if  nIndex  ==  376  then
	 BeginUICommand(  sceneId  )
	 UICommand_AddInt(  sceneId,  selfId  )
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    2015043098)
          return
        end

        if  nIndex  ==  377  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,selfId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  2015050199  )	 
          return
        end

        if  nIndex  ==  378  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,selfId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  20170828  )
          return
        end
end

--*************************************************
-- bình mÕc trung gian ð¯i thoÕi ð« kÏ 
--*************************************************
function  x890096_Tips(  sceneId,  selfId,msg  )
BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg)
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--*************************************************
-- nh¤t ki®n ðä kh±ng 
--*************************************************
function  x890096_OneKey4Slot(  sceneId,  selfId)
        local  tEquipGemTable  =  {0,1,2,3,4,5,6,7,9,10,11,12,13,14,15,17,18}  --8 hào t÷a kÜ ?16 hào thì trang b¤t khai kh±ng , phäng quan 
        local  bagbegin  =  GetBasicBagStartPos(sceneId,  selfId)
        local  bagend  =  GetBasicBagEndPos(sceneId,  selfId)
        for  i  =  0,10  do
	 	 for  i=bagbegin,  bagend  do
	 	 	 local  itemIndex  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  i  )	 
	 	 	 if  itemIndex>0  then
	 	 	 	 local  ret  =  LuaFnIsItemLocked(  sceneId,  selfId,  i  )
	 	 	 	 if  ret  ~=  0  then
	 	 	 	 	 return
	 	 	 	 end	 
	 	 	 	 local  EquipType  =  LuaFnGetBagEquipType(  sceneId,  selfId,  i  )	 
	 	 	 	 local  find  =  0
	 	 	 	 for  j,  gem  in  tEquipGemTable  do
	 	 	 	 	 if  gem  ==  EquipType  then
	 	 	 	 	 	 find  =  1
	 	 	 	 	 end
	 	 	 	 end
	 	 	 	 if  find  ==  1  then
	 	 	 	 	 local  equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  i  )	 
	 	 	 	 	 local  ret  =  AddBagItemSlot(  sceneId,  selfId,  i  )
	 	 	 	 	 local  ret1  =  AddBagItemSlotFour(  sceneId,  selfId,  i  )    --4 không b¤t khai 
	 	 	 	 	 equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  i  )
	 	 	 	 end
	 	 	 end
	 	 end
	 end
	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  18,  0  )
end


function  x890096_OneKeyxiuLI(  sceneId,  selfId)
        local  bagbegin  =  GetBasicBagStartPos(sceneId,  selfId)
        local  bagend  =  GetBasicBagEndPos(sceneId,  selfId)	 
	 for  i=bagbegin,  bagend  do
	 	 
	 	 DoHighRepair(  sceneId,  selfId,  i,  10)
	 end
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  18,  0  )
end