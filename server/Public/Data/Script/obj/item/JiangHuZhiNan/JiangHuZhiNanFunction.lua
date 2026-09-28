x920202_g_scriptId  =  920202
x920202_XxStr={
Upgrade="thång c¤p ",
Play="ngoÕn pháp ",
BossTime={
[1]={name="bossname1",time="1:1"},
[2]={name="bossname2",time="2:1"},
[3]={name="bossname3",time="3:1"},
[4]={name="bossname4",time="4:1"},
[5]={name="bossname5",time="5:1"},
[6]={name="bossname6",time="6:1"},
[7]={name="bossname7",time="7:1"},
[8]={name="bossname8",time="8:1"},
[9]={name="bossname9",time="9:1"},
[10]={name="bossname10",time="10:1"},
[11]={name="bossname11",time="11:1"},
},
}
--**********************************
--  sñ ki®n ğóng h² nh§p kh¦u 
--**********************************

function  x920202_OnDefaultEvent(  sceneId,  selfId  )
	 if  GetNumText()==1  then
	 	 x920202_Update(sceneId,selfId,GetNumText())
	 elseif  GetNumText()==2  then
	 	 x920202_Update(sceneId,selfId,GetNumText())
	 elseif  GetNumText()==3  then
	 	 x920202_Update(sceneId,selfId,GetNumText())
	 elseif  GetNumText()==4  then
	 	 x920202_Update(sceneId,selfId,GetNumText())
	 elseif  GetNumText()>=101  and  GetNumText()<=120  then
	 	 x920202_BossTimeform(sceneId,selfId,GetNumText())
	 elseif  GetNumText()>=99999  and  GetNumText()<=99999  then
	 	 x920202_Update(sceneId,selfId,3)
	 end
end
--by tiêu tß½ng Q1400003003
function  x920202_Update(sceneId,selfId,x920202_a)
if  x920202_a==1  then
	 x920202_MsgBox(  sceneId,  selfId,  x920202_XxStr.Upgrade)
elseif  x920202_a==2  then
	 x920202_MsgBox(  sceneId,  selfId,  x920202_XxStr.Play)
elseif  x920202_a==3  then
	 local  num  =  getn(x920202_XxStr.BossTime)
	 BeginEvent(sceneId)          
	 	 	   for  i=1,num  do  AddNumText(sceneId,  x920202_g_scriptId,x920202_XxStr.BossTime[i].name,  8,i+100)  end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,-1)
elseif  x920202_a==4  then
	 DispatchUICommand(sceneId,selfId,201607101)  
end
end

function  x920202_BossTimeform(sceneId,selfId,ID)
	 BeginEvent(sceneId)          
	 	 	 AddText(sceneId,x920202_XxStr.BossTime[(ID-100)].time)
	 	 	 AddNumText(sceneId,x920202_g_scriptId," trang trß¾c ",8,99999)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,-1)
end
--**********************************
-- tr· v« trang chính 
--**********************************
function  x920202_BackToIndex(  sceneId,  selfId  )
	 x920201_OnDefaultEvent(  sceneId,  selfId,  -1  )
end
--**********************************
-- nhà ch½i màn änh trung gian ğ« kÏ 
--**********************************
function  x920202_Tips(  sceneId,  selfId,  str  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- ğ¯i thoÕi cØa s± tin tÑc ğ« kÏ 
--**********************************
function  x920202_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end
--**********************************
-- t¡t ğ¯i thoÕi khuông 
--**********************************
function  x920202_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end