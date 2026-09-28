-- chª c± kÛ nång thång c¤p 

-- chân v¯n s¯ 
x339008_g_ScriptId  =  339008
x339008_g_SD_tl  =  {
	 [1]  =  {  1,  200,      15,  31501  },
	 [2]  =  {  2,  500,      17,  31502  },
	 [3]  =  {  2,  500,      17,  31503  },
	 [4]  =  {  3,  1000,    19,  31504  },
	 [5]  =  {  3,  1000,    19,  31505  },
	 [6]  =  {  3,  1000,    19,  31506  },
	 [7]  =  {  4,  2500,    24,  31507  },
	 [8]  =  {  4,  2500,    24,  31508  },
	 [9]  =  {  4,  2500,    24,  31509  },
	 [10]  =  {  4,  2500,    24,  31510  },
	 [11]  =  {  5,  5000,    29,  31511  },
	 [12]  =  {  5,  5000,    29,  31512  },
	 [13]  =  {  5,  5000,    29,  31513  },
	 [14]  =  {  5,  5000,    29,  31514  },
	 [15]  =  {  5,  5000,    29,  31515  },
	 [16]  =  {  6,  10000,  34,  31516  },
	 [17]  =  {  6,  10000,  34,  31517  },
	 [18]  =  {  6,  10000,  34,  31518  },
	 [19]  =  {  6,  10000,  34,  31519  },
	 [20]  =  {  6,  10000,  34,  31520  },
	 [21]  =  {  6,  10000,  34,  31521  },
	 [22]  =  {  7,  30000,  39,  31522  },
	 [23]  =  {  7,  30000,  39,  31523  },
	 [24]  =  {  7,  30000,  39,  31524  },
	 [25]  =  {  7,  30000,  39,  31525  },
	 [26]  =  {  7,  30000,  39,  31526  },
	 [27]  =  {  7,  30000,  39,  31527  },
	 [28]  =  {  7,  30000,  39,  31528  },	 
	 [29]  =  {  8,  80000,  45,  31529  },
	 [30]  =  {  8,  80000,  45,  31530  },
	 [31]  =  {  8,  80000,  45,  31531  },
	 [32]  =  {  8,  80000,  45,  31532  },
	 [33]  =  {  8,  80000,  45,  31533  },
	 [34]  =  {  8,  80000,  45,  31534  },
	 [35]  =  {  8,  80000,  45,  31535  },
	 [36]  =  {  8,  80000,  45,  31536  },
	 [37]  =  {  9,  150000,51,  31537  },
	 [38]  =  {  9,  150000,51,  31538  },
	 [39]  =  {  9,  150000,51,  31539  },
	 [40]  =  {  9,  150000,51,  31540  },
	 [41]  =  {  9,  150000,51,  31541  },
	 [42]  =  {  9,  150000,51,  31542  },
	 [43]  =  {  9,  150000,51,  31543  },
	 [44]  =  {  9,  150000,51,  31544  },
	 [45]  =  {  31546,  150000,31550,  31545  }
}
------------------------
function  x339008_On_sD(  sceneId,  selfId,idaa  )
	 
	 if  idaa  ==  3  then    -- n½i này b± sung thÑ tß th¥n ðïnh 
                      if  GetLevel(sceneId,  selfId)  <  15  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 15 c¤p , m¾i có th¬ m· ra th¥n ðïnh gi¾i m£t ! "    )	 
	       return
	       end	 
                      x339008_MsgBoxdd(  sceneId,  selfId  )	 
	 return
	 end

	 if  idaa  ==  4  then
                      if  GetLevel(sceneId,  selfId)  <  15  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 15 c¤p , m¾i có th¬ m· ra th¥n ðïnh gi¾i m£t   "    )	 
	       return
	       end
                      x339008_MsgBoxaa(  sceneId,  selfId  )	 
	 return
	 end

	 if  idaa  ==  5  then
                      if  GetLevel(sceneId,  selfId)  <  15  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 15 c¤p , m¾i có th¬ m· ra th¥n ðïnh gi¾i m£t ! "    )	 
	       return
	       end
                      x339008_MsgBoxbb(  sceneId,  selfId  )	 
	 return
	 end
	 
	 if  idaa  ==  6  then
                      if  GetLevel(sceneId,  selfId)  <  15  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 15 c¤p , m¾i có th¬ m· ra th¥n ðïnh gi¾i m£t ! "    )	 
	       return
	       end	 
                      x339008_MsgBoxcc(  sceneId,  selfId  )	 
	 return
	 end
	 
	 if  idaa  ==  7  then    -- th§t xa dùng 
                      if  GetLevel(sceneId,  selfId)  <  80  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 80 c¤p , m¾i có th¬ m· ra chân nguyên gi¾i m£t ! "    )	 
	       return
	       end
                            CallScriptFunction((300104),  "AddUI",sceneId,  selfId,103)	       --- chân nguyên 
	 return
	 end
	 
	 
	 if  idaa  ==  8  then    -- tu luy®n 
                      if  GetLevel(sceneId,  selfId)  <  70  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 70 c¤p , m¾i có th¬ m· ra tu luy®n gi¾i m£t ! "    )	 
	       return
	       end	 
	 local  gongli=GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )
	 local  liliang=GetMissionData(  sceneId,  selfId,  XIULIAN_LILIANG  )
	 local  lingqi=GetMissionData(  sceneId,  selfId,  XIULIAN_LINGQI  )
	 local  tili=GetMissionData(  sceneId,  selfId,  XIULIAN_TILI  )
	 local  dingli=GetMissionData(  sceneId,  selfId,  XIULIAN_DINGLI  )
	 local  shenfa=GetMissionData(  sceneId,  selfId,  XIULIAN_SHENFA  )
	 BeginUICommand(  sceneId  )
	         UICommand_AddInt(  sceneId,  gongli  )
	 	 UICommand_AddInt(  sceneId,  liliang  )
	 	 UICommand_AddInt(  sceneId,  lingqi  )
	 	 UICommand_AddInt(  sceneId,  tili  )
	 	 UICommand_AddInt(  sceneId,  dingli  )
	 	 UICommand_AddInt(  sceneId,  shenfa  )
	 	 UICommand_AddString(sceneId,"wuhu")
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,80111204)
	 return
	 end	 

	 
	 if  idaa  ==  9  then    -- hào hi®p ¤n 
	     if  LuaFnGetLevel(sceneId,selfId)  <85  then  
	           x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 85 c¤p , m¾i có th¬ m· ra hi®p ¤n gi¾i m£t ! "    )	 	 
	       return
	       end	 
                  CallScriptFunction((880006),  "HXY_E",sceneId,  selfId)	       --- hào hi®p ¤n 
	   return
	 end	 
	 
	 if  idaa  ==  11  then    -- bäo kiªm 
	     if  LuaFnGetLevel(sceneId,selfId)  <85  then  
	           x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 85 c¤p , m¾i có th¬ m· ra bäo giám gi¾i m£t ! "    )	 	 
	       return
	       end
                    CallScriptFunction((910103),  "UK_Open_Ui",sceneId,  selfId)	       --- bäo kiªm 
	 return
	 end
	 
	 if  idaa  ==  12  then    -- bí t¸ch 
	       if  LuaFnGetLevel(sceneId,selfId)  <75  then  
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 75 c¤p , m¾i có th¬ m· ra bí t¸ch gi¾i m£t ! "    )	 	 
	       return
	   end	 
	 x339008_g_wujuemijitoxingdenum  =  {WULIMIJIXUEJUEBOOK1,WULIMIJIXUEJUEBOOK2,WULIMIJIXUEJUEBOOK3}-- bí t¸ch 
                local  jisumiji  =  mod(GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE  ),1000000)
                local  skillbook1  =  floor(jisumiji/10000)+  30311000
                local  skillbook2  =  floor(mod(jisumiji,10000)/100)+  30311000
                local  skillbook3  =  mod(mod(mod(jisumiji,10000),100),100)+  30311000
                local  xiuweijinjue  =  0  
                local  lingwujinjuelevel  =  {}
                          for  i  =  1,3  do
                          xiuweijinjue  =  xiuweijinjue  +  GetMissionData(  sceneId,  selfId,  x339008_g_wujuemijitoxingdenum[i])
                          lingwujinjuelevel[i]  =  GetMissionData(  sceneId,  selfId,  x339008_g_wujuemijitoxingdenum[i])
                          end
	             BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,skillbook1)
	             UICommand_AddInt(sceneId,skillbook2)
	             UICommand_AddInt(sceneId,skillbook3)
	             UICommand_AddInt(sceneId,xiuweijinjue)
	             UICommand_AddInt(sceneId,GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEXINDE  ))
	             UICommand_AddInt(sceneId,GetMissionData(  sceneId,  selfId,  WULIMIJIXUEJUE_3BOOKS  ))
	             for  i  =  1,3  do
	             UICommand_AddInt(sceneId,lingwujinjuelevel[i])
	             end
	             UICommand_AddString(sceneId,"OPEN_MIJI_PAGE")
	             EndUICommand(sceneId)
	             DispatchUICommand(sceneId,selfId,2013092101)
	 return
	 end
	 
	 if  idaa==13  then-- m· ra kinh mÕch 
                      if  GetLevel(sceneId,  selfId)  <  90  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 90 c¤p , m¾i có th¬ m· ra kinh mÕch gi¾i m£t ! "    )	 
	       return
	       end
	       CallScriptFunction(  880012,  "JingMai_E",  sceneId,  selfId)
	 return
	 end

	 if  idaa==14  then-- m· ra hài tØ gi¾i m£t 
                      if  GetLevel(sceneId,  selfId)  <  50  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 50 c¤p , m¾i có th¬ m· ra con gái gi¾i m£t ! "    )	 
	       return
	       end
	       CallScriptFunction(910052,"Openinfant",sceneId,selfId)
                return
                end

	 if  idaa==15  then-- m· ra vû ý gi¾i m£t 
                      CallScriptFunction(2015,"JianCe",sceneId,selfId)  -- m²i l¥n m· ra cà m¾i vû ý giªt trách ðªm 
                      if  GetLevel(sceneId,  selfId)  <  85  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 85 c¤p , m¾i có th¬ m· ra vû ý gi¾i m£t ! "    )	 
	       return
	       end
	       BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,1);
	 	 EndUICommand(sceneId)
	       DispatchUICommand(sceneId,selfId,201711091)
                return
                end

	 if  idaa==16  then-- m· ra th¥n binh gi¾i m£t 
                        local  SGSQ  =  0
                        local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,100);
                        if  myname  ~=  nil  then
	         local  sree1  =  strfind(myname,"#S")
	 	     if  sree1  ~=  nil  then
                                          SGSQ  =  tonumber(strsub(myname,sree1+2,sree1+9))
                                      end
                        end
	         BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,selfId);
	                 UICommand_AddInt(sceneId,SGSQ)
	         EndUICommand(sceneId)
	         DispatchUICommand(sceneId,selfId,  89247101  )
                return
                end


	 if  idaa==1002  then-- m· ra vû h°n 
                      if  GetLevel(sceneId,  selfId)  <  65  then
	             x339008_MsgBox(  sceneId,  selfId,  " c¤p b§c l¾n h½n tß½ng ðß½ng v¾i 65 c¤p , m¾i có th¬ m· ra vû h°n gi¾i m£t ! "    )	 
	       return
	       end
	       CallScriptFunction(  892112,  "opwuhun",  sceneId,  selfId,1)
	 return
	 end	 

	 if  idaa  ==  100  then
	 	 if  GetMissionData(sceneId,  selfId,  SD_TILI)  >=45  then
	 	 	 x339008_MsgBox(  sceneId,  selfId,  " ðã ði¬m ð¥y "    )	 
	 	 	 return
	 	 end	 
	 	 if  GetMissionData(sceneId,  selfId,  SD_YAOCHEN)  >=  x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_TILI)+1][2]  then
	 	 SetMissionData(sceneId,  selfId,  SD_YAOCHEN,GetMissionData(sceneId,  selfId,  SD_YAOCHEN)-x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_TILI)+1][2])	 
	 	   SetMissionData(sceneId,  selfId,  SD_TILI,GetMissionData(sceneId,  selfId,  SD_TILI)+1)	     
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngßng ðan thành công "    )	 
	 	 x339008_MsgBoxaa(  sceneId,  selfId  )
	 	 else
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngß½i thu¯c tr¥n chßa ðü "..(x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_TILI)+1][2]).." ði¬m "    )
                                x339008_MsgBoxaa(  sceneId,  selfId  )	 	 
	 	 end
	 	 return
	 end
	 
	 if  idaa  ==  200  then
	 	 if  GetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ)  >=45  then
	 	 	 x339008_MsgBox(  sceneId,  selfId,  " ðã ði¬m ð¥y "    )	 
	 	 	 return
	 	 end	 
	 	 if  GetMissionData(sceneId,  selfId,  SD_YAOCHEN)  >=  x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ)+1][2]  then
	 	 SetMissionData(sceneId,  selfId,  SD_YAOCHEN,GetMissionData(sceneId,  selfId,  SD_YAOCHEN)-x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ)+1][2])	 
	 	 SetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ,GetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ)+1)	 
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngßng ðan thành công "    )	 	 
	 	 x339008_MsgBoxbb(  sceneId,  selfId  )	 
	 	 else
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngß½i thu¯c tr¥n chßa ðü "..(x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ)+1][2]).." ði¬m "    )
	 	 --x339008_MsgBoxbb(  sceneId,  selfId  )	 
	 	 end
	 	 x339008_MsgBoxbb(  sceneId,  selfId  )	 
	 end	 
	 if  idaa  ==  300  then
	 	 if  GetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ)  >=45  then
	 	 	 x339008_MsgBox(  sceneId,  selfId,  " ðã ði¬m ð¥y "    )	 
	 	 	 return
	 	 end	 
	 	 if  GetMissionData(sceneId,  selfId,  SD_YAOCHEN)  >=  x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ)+1][2]  then
	 	 SetMissionData(sceneId,  selfId,  SD_YAOCHEN,GetMissionData(sceneId,  selfId,  SD_YAOCHEN)-x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ)+1][2])	 
	 	 SetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ,GetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ)+1)
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngßng ðan thành công "    )	 
	 	 else
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngß½i thu¯c tr¥n chßa ðü "..(x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ)+1][2]).." ði¬m "    )
	 	 end
	 	 x339008_MsgBoxcc(  sceneId,  selfId  )	 
	 end

	 if  idaa  ==  400  then
	 	 if  GetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ)  >=45  then
	 	 	 x339008_MsgBox(  sceneId,  selfId,  " ðã ði¬m ð¥y "    )	 
	 	 	 return
	 	 end	 
	 	 if  GetMissionData(sceneId,  selfId,  SD_YAOCHEN)  >=  x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ)+1][2]  then
	 	 SetMissionData(sceneId,  selfId,  SD_YAOCHEN,GetMissionData(sceneId,  selfId,  SD_YAOCHEN)-x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ)+1][2])	 
	 	 SetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ,GetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ)+1)
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngßng ðan thành công "    )	 
	 	 else
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngß½i thu¯c tr¥n chßa ðü "..(x339008_g_SD_tl[GetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ)+1][2]).." ði¬m "    )
	 	 end
	 	 x339008_MsgBoxdd(  sceneId,  selfId  )	 
	 end

	 --------------------- phía dß¾i · dung hþp cho ðan ðích   ng÷n ký   700  ðªn 1000
	 if  idaa  ==  700  then    -- th¬ lñc 
	       if  GetMissionData(sceneId,  selfId,  SD_TILI)  <  45  then
	             x339008_MsgBox(  sceneId,  selfId,  " ngßng ðan mãn c¤p sau m¾i có th¬ dung hþp "  )
                            return
                      end
                      if  GetMissionData(sceneId,  selfId,  SD_TILI)  >=  60  then
	             x339008_MsgBox(  sceneId,  selfId,  " dung hþp ðã ðÕt cao nh¤t "  )
                            return
                      end
	             SetMissionData(sceneId,  selfId,  SD_TILI,GetMissionData(sceneId,  selfId,  SD_TILI)+3)
	             x339008_MsgBox(  sceneId,  selfId,  " kim ðan dung hþp thành công , th¬ lñc gia tång 90"  )
	             x339008_MsgBoxaa(  sceneId,  selfId  )
	 end

	 if  idaa  ==  800  then    -- thuµc tính 
	       if  GetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ)  <  45  then
	             x339008_MsgBox(  sceneId,  selfId,  " ngßng ðan mãn c¤p sau m¾i có th¬ dung hþp "  )
                            return
                      end
                      if  GetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ)  >=  60  then
	             x339008_MsgBox(  sceneId,  selfId,  " dung hþp ðã ðÕt cao nh¤t "  )
                            return
                      end
	             SetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ,GetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ)+3)
	             x339008_MsgBox(  sceneId,  selfId,  " kim ðan dung hþp thành công , khôn vû ði¬m ðªm gia tång 90"  )
	             x339008_MsgBoxbb(  sceneId,  selfId  )
	 end
	 
	 if  idaa  ==  900  then    -- kháng tính 
	       if  GetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ)  <  45  then
	             x339008_MsgBox(  sceneId,  selfId,  " ngßng ðan mãn c¤p sau m¾i có th¬ dung hþp "  )
                            return
                      end
                      if  GetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ)  >=  60  then
	             x339008_MsgBox(  sceneId,  selfId,  " dung hþp ðã ðÕt cao nh¤t "  )
                            return
                      end
	             SetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ,GetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ)+3)
	             x339008_MsgBox(  sceneId,  selfId,  " kim ðan dung hþp thành công , ch¤n ngñ ði¬m ðªm gia tång 24"  )
	             x339008_MsgBoxcc(  sceneId,  selfId  )
	 end	 

	 if  idaa  ==  1000  then    -- giäm kháng tính 
	       if  GetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ)  <  45  then
	             x339008_MsgBox(  sceneId,  selfId,  " ngßng ðan mãn c¤p sau m¾i có th¬ dung hþp "  )
                            return
                      end
                      if  GetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ)  >=  60  then
	             x339008_MsgBox(  sceneId,  selfId,  " dung hþp ðã ðÕt cao nh¤t "  )
                            return
                      end
	             SetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ,GetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ)+3)
	             x339008_MsgBox(  sceneId,  selfId,  " kim ðan dung hþp thành công , cách ? ði¬m ðªm gia tång 24"  )
	             x339008_MsgBoxdd(  sceneId,  selfId  )
	 end	 
end


function  x339008_MsgBoxaa(  sceneId,  selfId  )
	 CallScriptFunction(  892002,  "AHa_ReMyBuff",  sceneId,  selfId  )
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_TILI))    --idx
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_YAOCHEN))    -- thu¯c tr¥n 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_YAOCHEN))    -- thu¯c tr¥n 
	 EndUICommand(sceneId)
	 DispatchUICommand(  sceneId,selfId,  20151130)
end	 

function  x339008_MsgBoxbb(  sceneId,  selfId  )	 -- thuµc tính sñ ki®n 
	 CallScriptFunction(  892002,  "AHa_ReMyBuff",  sceneId,  selfId  )
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_SHUXINGDENGJ))    --idx
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_YAOCHEN))    -- thu¯c tr¥n 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_BINGSHUX))    -- bång 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_HUOSHUX))    -- lØa 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_XUANSHUX))    -- huy«n 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_DUSHUX))    -- ðµc 
	 EndUICommand(sceneId)
	 DispatchUICommand(  sceneId,selfId,  20151131)
end
	 
function  x339008_MsgBoxcc(  sceneId,  selfId  )
	 CallScriptFunction(  892002,  "AHa_ReMyBuff",  sceneId,  selfId  )
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_KANGXINGDENGJ))    --idx
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_YAOCHEN))    -- thu¯c tr¥n 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_BINGKANGX))    -- bång kháng 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_HUOKANGX))    -- lØa kháng 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_XUANKANGX))    -- huy«n kháng 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_DUKANGX))    -- ðµc kháng 
	 EndUICommand(sceneId)
	 DispatchUICommand(  sceneId,selfId,  20151132)
end
	 
function  x339008_MsgBoxdd(  sceneId,  selfId  )
	 CallScriptFunction(  892002,  "AHa_ReMyBuff",  sceneId,  selfId  )
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_JIANKANGDENGJ))    --idx
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_YAOCHEN))    -- thu¯c tr¥n 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_BINGJKANG))    -- bång kháng 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_HUOJKANG))    -- lØa kháng 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_XUANJKANG))    -- huy«n kháng 
	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  SD_DUJKANG))    -- ðµc kháng 
	 EndUICommand(sceneId)
	 DispatchUICommand(  sceneId,selfId,  20151133)
end

function  x339008_MsgBox(  sceneId,  selfId,  str  )	 
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

function  x339008_OnLianDanLuQianNengAccept(  sceneId,  selfId,  inden,bing,huo,xuan,du  )	 
	 if  inden==10  then  --+ thuµc tính sñ ki®n 
	 SetMissionData(sceneId,  selfId,  SD_BINGSHUX,bing)	 
	 SetMissionData(sceneId,  selfId,  SD_HUOSHUX,huo)	 
	 SetMissionData(sceneId,  selfId,  SD_XUANSHUX,xuan)	 
	 SetMissionData(sceneId,  selfId,  SD_DUSHUX,du)	 
	 local  unt  =  0  
	 local  stry1  =  GetMissionData(sceneId,  selfId,  SD_BINGSHUX)
	 local  stry2  =  GetMissionData(sceneId,  selfId,  SD_HUOSHUX)
	 local  stry3  =  GetMissionData(sceneId,  selfId,  SD_XUANSHUX)
	 local  stry4  =  GetMissionData(sceneId,  selfId,  SD_DUSHUX)
	 if  stry1  >0  and  stry2  ==  0    and  stry3  ==  0  and  stry4  ==  0  then
	 unt  =  1  	 
	 elseif  stry1  ==0  and  stry2  >  0    and  stry3  ==  0  and  stry4  ==  0  then
	 unt  =  1  	 
	 elseif  stry1  ==0  and  stry2  ==  0    and  stry3  >  0  and  stry4  ==  0  then
	 unt  =  1  	 
	 elseif  stry1  ==0  and  stry2  ==  0    and  stry3  ==  0  and  stry4  >  0  then
	 unt  =  1  	 
	 else
	 unt  =  0
	 end
	 if  unt  ~=  1  then  
	       x339008_MsgBox(  sceneId,  selfId,  " tÕm th¶i chï üng hµ phân ph¯i mµt loÕi thuµc tính "    )	 
	       return
	 end	 
	 x339008_MsgBox(  sceneId,  selfId,  " thuµc tính tång thêm thành công "    )
	 x339008_MsgBoxbb(  sceneId,  selfId  )	 
	 end
	 if  inden==20  then  --+ n£ng ðßa 
	       if  GetMissionData(sceneId,  selfId,  SD_YAOCHEN)  <  20000  then  
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngß½i thu¯c tr¥n chßa ðü 20000 ði¬m "    )	 
	 	 return
	       end
	 SetMissionData(sceneId,  selfId,  SD_YAOCHEN,GetMissionData(sceneId,  selfId,  SD_YAOCHEN)-20000)	 	 
	 SetMissionData(sceneId,  selfId,  SD_BINGSHUX,0)	 
	 SetMissionData(sceneId,  selfId,  SD_HUOSHUX,0)	 
	 SetMissionData(sceneId,  selfId,  SD_XUANSHUX,0)	 
	 SetMissionData(sceneId,  selfId,  SD_DUSHUX,0)	 
	 x339008_MsgBoxbb(  sceneId,  selfId  )	 
	 end
-----------------------------------------------------------	 
	 if  inden==30  then  --+ thuµc tính sñ ki®n K
	 SetMissionData(sceneId,  selfId,  SD_BINGKANGX,bing)	 
	 SetMissionData(sceneId,  selfId,  SD_HUOKANGX,huo)	 
	 SetMissionData(sceneId,  selfId,  SD_XUANKANGX,xuan)	 
	 SetMissionData(sceneId,  selfId,  SD_DUKANGX,du)	 
	 local  unt  =  0  
	 local  stry1  =  GetMissionData(sceneId,  selfId,  SD_BINGKANGX)
	 local  stry2  =  GetMissionData(sceneId,  selfId,  SD_HUOKANGX)
	 local  stry3  =  GetMissionData(sceneId,  selfId,  SD_XUANKANGX)
	 local  stry4  =  GetMissionData(sceneId,  selfId,  SD_DUKANGX)
	 if  stry1  >0  and  stry2  ==  0    and  stry3  ==  0  and  stry4  ==  0  then
	 unt  =  1  	 
	 elseif  stry1  ==0  and  stry2  >  0    and  stry3  ==  0  and  stry4  ==  0  then
	 unt  =  1  	 
	 elseif  stry1  ==0  and  stry2  ==  0    and  stry3  >  0  and  stry4  ==  0  then
	 unt  =  1  	 
	 elseif  stry1  ==0  and  stry2  ==  0    and  stry3  ==  0  and  stry4  >  0  then
	 unt  =  1  	 
	 else
	 unt  =  0
	 end
	 if  	 unt  ~=  1  then  
	 	 x339008_MsgBox(  sceneId,  selfId,  " tÕm th¶i chï üng hµ phân ph¯i mµt loÕi kháng tính "    )	 
	 	 return
	 end	 
	 
	 x339008_MsgBox(  sceneId,  selfId,  " kháng tính tång thêm thành công "    )
	 x339008_MsgBoxcc(  sceneId,  selfId  )	 
	 end
	 if  inden==40  then  --+ n£ng ðßa K
	 	 if  GetMissionData(sceneId,  selfId,  SD_YAOCHEN)  <  20000  then  
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngß½i thu¯c tr¥n chßa ðü 20000 ði¬m "    )	 
	 	 	 return
	 	 end	 
	 SetMissionData(sceneId,  selfId,  SD_YAOCHEN,GetMissionData(sceneId,  selfId,  SD_YAOCHEN)-20000)	 
	 SetMissionData(sceneId,  selfId,  SD_BINGKANGX,0)	 
	 SetMissionData(sceneId,  selfId,  SD_HUOKANGX,0)	 
	 SetMissionData(sceneId,  selfId,  SD_XUANKANGX,0)	 
	 SetMissionData(sceneId,  selfId,  SD_DUKANGX,0)	 
	 x339008_MsgBoxcc(  sceneId,  selfId  )	 
	 end	 
----------------------------------------------------------------
	 if  inden==50  then  --+ thuµc tính sñ ki®n K
	 SetMissionData(sceneId,  selfId,  SD_BINGJKANG,bing)	 
	 SetMissionData(sceneId,  selfId,  SD_HUOJKANG,huo)	 
	 SetMissionData(sceneId,  selfId,  SD_XUANJKANG,xuan)	 
	 SetMissionData(sceneId,  selfId,  SD_DUJKANG,du)	 
	 local  unt  =  0  
	 local  stry1  =  GetMissionData(sceneId,  selfId,  SD_BINGJKANG)
	 local  stry2  =  GetMissionData(sceneId,  selfId,  SD_HUOJKANG)
	 local  stry3  =  GetMissionData(sceneId,  selfId,  SD_XUANJKANG)
	 local  stry4  =  GetMissionData(sceneId,  selfId,  SD_DUJKANG)
	 if  stry1  >0  and  stry2  ==  0    and  stry3  ==  0  and  stry4  ==  0  then
	 unt  =  1  	 
	 elseif  stry1  ==0  and  stry2  >  0    and  stry3  ==  0  and  stry4  ==  0  then
	 unt  =  1  	 
	 elseif  stry1  ==0  and  stry2  ==  0    and  stry3  >  0  and  stry4  ==  0  then
	 unt  =  1  	 
	 elseif  stry1  ==0  and  stry2  ==  0    and  stry3  ==  0  and  stry4  >  0  then
	 unt  =  1  	 
	 else
	 unt  =  0
	 end
	 if  	 unt  ~=  1  then  
	 	 x339008_MsgBox(  sceneId,  selfId,  " tÕm th¶i chï üng hµ phân ph¯i mµt loÕi kháng tính "    )	 
	 	 return
	 end	 
	 
	 x339008_MsgBox(  sceneId,  selfId,  " giäm kháng tång thêm thành công "    )
	 x339008_MsgBoxdd(  sceneId,  selfId  )	 
	 end
	 if  inden==60  then  --+ n£ng ðßa K
	 	 if  GetMissionData(sceneId,  selfId,  SD_YAOCHEN)  <  20000  then  
	 	 x339008_MsgBox(  sceneId,  selfId,  " ngß½i thu¯c tr¥n chßa ðü 20000 ði¬m "    )	 
	 	 	 return
	 	 end	 
	 SetMissionData(sceneId,  selfId,  SD_YAOCHEN,GetMissionData(sceneId,  selfId,  SD_YAOCHEN)-20000)	 
	 SetMissionData(sceneId,  selfId,  SD_BINGJKANG,0)	 
	 SetMissionData(sceneId,  selfId,  SD_HUOJKANG,0)	 
	 SetMissionData(sceneId,  selfId,  SD_XUANJKANG,0)	 
	 SetMissionData(sceneId,  selfId,  SD_DUJKANG,0)	 
	 x339008_MsgBoxdd(  sceneId,  selfId  )	 
	 end
end