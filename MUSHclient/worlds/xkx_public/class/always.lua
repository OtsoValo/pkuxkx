always={}
always_daytime={}
always_hp={}
always_skills={}
always_watch={}
watch_death={}

mpjoblimited=0
tunanum=0
sheid=1
st=0
rekill=0
killname=""
pfmid=1
wieldweapon=0
getweapon=0
dropweapon=0
gpszeikou=""
gpserrnum=0
flytoareastartid=0
daytime=true
songjingtime=0
guanyuntime=false
chaobaitime=false
reEnableSkills=0
idle=0
yunbusy=0
killaction=""
mpJobLimited=0
--lianwunum_set=0
nextJobGodazuobase=0
deathroomno=0
deathjob=""

burnnpc={}
wx={
	taiji=0,
	zhixin=0,
}
xy={
	findxy=0,
	roomno=0,
	name="",
	id="",
	xyLimited=0,
	limitedResume=0,
	biteLimited=0,
	xyexp=0,
	checkfirstbite=0,
	
}
stat={
	havedu=0,
	drugbusy=0,
	addexp=0,
	avgall=0,
	avgfj=0,
	avgmp=0,
	avgftb=0,
	avgdeath=0,
	countdeath=0,
	leidong=0,
	havedu=0,
	haveyyz=0,
	reverse=0,
	powerup=0,
	quiting=0,
	zixia=0,
	daxiao=0,
	fengyun=0,
	tiandi=0,
	zhixin=0,
	huntianup=0,
	shengang=0,
	xuanyin=0,
	heji=0,
	longxiang=0,
}
count={
	death=0,
}
hp={
	thpot=0,
}
mark={
	sTime=os.time(),
}
jifa={}
list={}
pk={}
add={
	exp=0,
}
have={}
have.gold=0
have.silver=0
have.coin=0
have.jian=0
have.dao=0
have.dan=0
have.jcy=0
have.fire=0
have.jiudai=0
have.he=0
have.chain=0
have.armor=1
have.bagua=0
have.ji=0
have.xinfa=0
have.staff=0
have.ling=0
have.shengzi=0
have.guaishe=0
have.whip=0
have.club=0
have.yaodai=0
have.fuling=0
have.zhongjian=0
have.jingyao=0
have.stick=0
have.stick_zhu=0
have.stick_tong=0
have.stick_huangzhu=0
have.heshouwu=0
have.yufengjiang=0
have.chuanbei=0
have.shengdi=0
have.jinyinhua=0
have.jugeng=0
have.huanglian=0
have.gouzhizi=0
have.faling=0
have.lubo=0
have.kulouguan=0
have.rentoulian=0
have.falun=0
have.syguan=0
have.bi=0
have.xueteng=0
have.danggui=0
have.swjing=0
addneili={
	dahuandan=0,
	putizi=0,
	dazuo=0,
	fj=0,
}
mpLimited={
	MarkTime=0,
	MarkExp=0,
	mpexp=0,
	-- stat=0,
}
skillslist={
	literate={lvl=0,},
	cuff={lvl=0,},
	["kongming-quan"]={lvl=0,},
}

if me==nil then me={} end
me.xtbl=0
me.bl=0

function xy.pfm()
	if me.menpai=="bt" and isopen("mp_bt_start") then
		if xy.xyLimited>0 and xy.biteLimited==0 or xy.checkfirstbite>0 then return 0 else return 1 end
	else
		return 1
	end
end
function mpLimited.stat()
	if os.time()>tonumber(mpLimited.MarkTime)+3600 or tonumber(mpLimited.mpexp)<tonumber(mpLimited.MarkExp) then
		return 0
	else
		return 1
	end
end
------------------------------------------------------------------------------------
-- always_daytime
------------------------------------------------------------------------------------
function always_daytime.dosomething1(n,l,w,s)
	local col=string.find(l,w[1])
	if not col then
		print("[::always_daytime.dosomething1::]::��ɫץȡʧ��::")
		return
	end
	style=GetStyle(s,col)
	local color=RGBColourToName(style.textcolour)
	if color=="silver" and style["backcolor"]==0 then return end
	if findstring(l,"̫���Ӷ����ĵ�ƽ�������ˡ�","̫���մӶ����ĵ�ƽ������") then
		daytime=true;songjingtime=0;guanyuntime=true;chaobaitime=true
	end
	if findstring(l,"�Ѿ�����ҹ�ˡ�","ҹ�����ˡ�","ҹĻ�ʹ������췱��","ҹĻ���������","һ�ֻ���Ϧ�����ǻ��������ĵ�ƽ����","�Ѿ�����ҹ�ˡ�") then
		daytime=false;songjingtime=0;guanyuntime=false;chaobaitime=false
	end
	if findstring(l,"�����ˣ�̫�������ͽ����������ӳ��һƬ��졣","����������п�ʼ����һ˿΢�ء�","�Ѿ��������ˣ�̫���������Ϸ���ҫ����ء�","̫����ʼ�����������������������","̫�����߹��ڶ����������","̫�����߹��������������","����������ʱ�֣�̫���߹������ͷ�����Ϸ�") then
		daytime=true;songjingtime=0;guanyuntime=false;chaobaitime=true
	end
	if findstring(l,"������������𽥷���","����������п�ʼ����һ˿΢�ء�") then
		daytime=true;songjingtime=1;guanyuntime=false;chaobaitime=false
	end
end
------------------------------------------------------------------------------------
-- always_hp
------------------------------------------------------------------------------------
function always_hp.dosomething1(n,l,w)
	me["expadd"]=tonumber(w[1])
end
function always_hp.dosomething2(n,l,w)
	me["gold"]=ctonum(w[1])
	if skillslist["literate"]==nil then skillslist["literate"]={} end
	if skillslist["literate"]["lvl"]==nil then skillslist["literate"]["lvl"]=1 end
	if me["gold"]>100 and skillslist["literate"]["lvl"]<500 and havegoldxuelit>0 then xuelit=1 else xuelit=0 end
end
function always_hp.dosomething3(n,l,w)
	me["gold"]=0
	xuelit=0
end
function always_hp.dosomething4(n,l,w)
	hp["jing"]=tonumber(w[2])
	hp["maxjing"]=tonumber(w[3])
	hp["healthjing"]=tonumber(w[4])
	hp["jingli"]=tonumber(w[5])
	hp["maxjingli"]=tonumber(w[6])
	hp["jiajin"]=tonumber(w[7])
end
function always_hp.dosomething5(n,l,w)
	hp["qi"]=tonumber(w[1])
	hp["maxqi"]=tonumber(w[2])
	hp["healthqi"]=tonumber(w[3])
	hp["neili"]=tonumber(w[4])
	hp["maxneili"]=tonumber(w[5])
end
function always_hp.dosomething6(n,l,w)
	hp["food"]=tonumber(w[1])
	hp["maxfood"]=tonumber(w[2])
	hp["pot"]=tonumber(w[3])
	hp["maxpot"]=tonumber(w[4])
	if mark["setpot"] then
		mark["pot"]=hp["pot"]
		mark["setpot"]=0
	end
end
function always_hp.dosomething7(n,l,w)
	hp["water"]=tonumber(w[1])
	hp["maxwater"]=tonumber(w[2])
	hp["exp"]=tonumber(w[3])
	me["maxlvl"]=math.floor(math.floor((hp["exp"]*10)^(1/3) * 10)/10)
	if mark["setexp"]>0 then
		mark["exp"]=hp["exp"]
		mark["setexp"]=0
	end  
	if (do_dl_job==1 and hp.exp<30000) or (do_dl_job==1 and hp.exp>3000000) then do_dl_job=0 end
end
function always_hp.dosomething8(n,l,w)
	me["shen"]=tonumber(w[2])
	if me["shen"]<=-1 then setybjob=1 end
	if me["shen"]>=0 then setybjob=0 end
end
function always_hp.dosomething9(n,l,w)
	me["menpai"]="none"
	xkxGPS.setEntranceCondition("condition is null")
	if string.find(w[1],"��Ĺ��") then
		me["menpai"]="gm"
		me["fjmaster"]=""
		me["fjmasternick"]="���ү"
		me["fjmasterid"]=""
		me["fjbaseid"]=0
		me["fjnpcname"]=""
		me["fjnpcid"]=""
		me["menpailingwuid"]=2065
		me["menpaiJobStart"]=2076
		me["menpaiLimited"]=5000
		me["dazuobaseid"]=2077
		me["chongmaiBaseid"]=2077
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"����μ�") then
		me["menpai"]="dl"
		me["fjmaster"]="������"
		me["fjmasternick"]="����ү"
		me["fjmasterid"]="zhengchun"
		me["fjbaseid"]=191
		me["fjnpcname"]="ǿ��"
		me["fjnpcid"]="qiang dao"
		me["menpailingwuid"]=191
		me["menpaiJobStart"]=286
		me["menpaiLimited"]=8000
		me["dazuobaseid"]=0
		me["chongmaiBaseid"]=1422
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"ȫ���") then
		me["menpai"]="qz"
		me["fjmaster"]="����"
		me["fjmasternick"]="�ƽ�����"
		me["fjmasterid"]="ma"
		me["fjbaseid"]=792
		me["fjnpcname"]="ħ�̵���"
		me["fjnpcid"]="mojiao"
		me["menpailingwuid"]=808
		me["menpaiJobStart"]=782
		me["menpaiLimited"]=6000
		me["dazuobaseid"]=785
		me["chongmaiBaseid"]=785
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong' or condition='qz') and id<>3247") else xkxGPS.setEntranceCondition("(condition is null or condition='qz')") end
	end
	if string.find(w[1],"�䵱��") then
		me["menpai"]="wd"
		me["fjmaster"]="������"
		me["fjmasternick"]="������������"
		me["fjmasterid"]="zhang sanfeng"
		me["fjbaseid"]=677
		me["fjnpcname"]="�ɹ�����"
		me["fjnpcid"]="dazi"
		me["menpailingwuid"]=687
		me["menpaiJobStart"]=705
		me["menpaiLimited"]=5000
		me["dazuobaseid"]=0
		me["chongmaiBaseid"]=1422
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"������") then
		me.menpai="sl"
		me.fjmaster="���ȴ�ʦ"
		me.fjmasternick="���ȷ���"
		me.fjmasterid="dashi"
		me.fjbaseid=1651
		me.fjnpcname="ǿ��"
		me.fjnpcid="qiang dao"
		me.menpailingwuid=1653
		me.menpaiJobStart=1553
		me.menpaiLimited=4000
		me.dazuobaseid=0
		me.chongmaiBaseid=1422
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"�һ���") then
		me.menpai="th"
		me.fjmaster="½�˷�"
		me.fjmasternick="ׯ��"
		me.fjmasterid="lu chengfeng"
		me.fjbaseid=1470
		me.fjnpcname="ǿ��"
		me.fjnpcid="qiang dao"
		me.menpailingwuid=0
		me.menpaiJobStart=1470
		me.menpaiLimited=7000
		me.dazuobaseid=0
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"������") then
		me.menpai="em"
		me.fjmaster="���ʦ̫"
		me.fjmasternick="�������ʦ̫"
		me.fjmasterid="miejue"
		me.fjbaseid=372
		me.fjnpcname="ħ�̵���"
		me.fjnpcid="mojiao"
		me.menpailingwuid=378
		me.menpaiJobStart=per.roomno
		me.menpaiLimited=5000
		me.dazuobaseid=2052
		me.chongmaiBaseid=2052
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"��ɽ��") then
		me.menpai="hs"
		me.fjmaster="����Ⱥ"
		me.fjmasternick="������"
		me.fjmasterid="buqun"
		me.fjbaseid=874
		me.fjnpcname="ǿ��"
		me.fjnpcid="qiang dao"
		me.menpailingwuid=2019
		me.menpaiJobStart=841
		me.menpaiLimited=5000
		me.dazuobaseid=0
		me.chongmaiBaseid=1422
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"������") then
		me.menpai="xx"
		me.fjmaster="������"
		me.fjmasternick="��������"
		me.fjmasterid="ding"
		me.fjbaseid=1442
		me.fjnpcname="������ʿ"
		me.fjnpcid="xiashi"
		me.menpailingwuid=2112
		me.menpaiJobStart=1442
		me.menpaiLimited=6000
		me.dazuobaseid=1442
		me.chongmaiBaseid=1442
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"����ɽ") then
		me.menpai="bt"
		me.fjmaster="ŷ����"
		me.fjmasternick="ŷ������"
		me.fjmasterid="feng"
		me.fjbaseid=1801
		me.fjnpcname="������ʿ"
		me.fjnpcid="xiashi"
		me.menpailingwuid=2026
		me.menpaiJobStart=1801
		me.menpaiLimited=8000
		me.dazuobaseid=1801
		me.chongmaiBaseid=1801
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"����") then
		me.menpai="mj"
		me.fjmaster="����"
		me.fjmasternick="������ʹ����"
		me.fjmasterid="yang"
		me.fjbaseid=573
		me.fjnpcname="������ʿ"
		me.fjnpcid="xiashi"
		me.menpailingwuid=1970
		me.menpaiJobStart=573
		me.menpaiLimited=5000
		me.dazuobaseid=0
		me.chongmaiBaseid=1422
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"ѩɽ��") then
		me.menpai="xs"
		me.fjmaster="�Ħ��"
		me.fjmasternick="���������Ħ��"
		me.fjmasterid="jiumozhi"
		me.fjbaseid=436
		me.fjnpcname="ǿ��"
		me.fjnpcid="qiang dao"
		me.menpailingwuid=1853
		me.menpaiJobStart=428
		me.menpaiLimited=7000
		me.dazuobaseid=0
		me.chongmaiBaseid=1422
		if set_GbSecretWay>0 then xkxGPS.setEntranceCondition("(condition is null or condition='xs' or condition='dong') and id<>3247") end
	end
	if string.find(w[1],"����") then me.menpai="xs" end
	if string.find(w[1],"ؤ��") then
		me.menpai="gb"
		me.fjmaster="���߹�"
		me.fjmasternick="�����"
		me.fjmasterid="hong"
		me.fjbaseid=1121
		me.fjnpcname="ǿ��"
		me.fjnpcid="qiang dao"
		me.menpailingwuid=1653
		me.menpaiJobStart=1116
		me.menpaiLimited=8000
		me.dazuobaseid=0
		me.chongmaiBaseid=1422
		xkxGPS.setEntranceCondition("(condition is null or condition='gb' or condition='dong') and id<>3247 and id<>3248")
	end
end
function always_hp.dosomething10(n,l,w)
	me.master=w[1]
	me.masterid=""
	me.masterroom=""
	if string.find(me["master"],"��ѧ��ͨ") then me["masterid"]="" end
	if string.find(me["master"],"����") then me["masterid"]="juexin" end
	if string.find(me["master"],"�Ħ��") then me["masterid"]="jiumozhi" end
	if string.find(me["master"],"���ַ���") then me["masterid"]="fawang" end
	if string.find(me["master"],"һ�ƴ�ʦ") then me["masterid"]="yideng" end
	if string.find(me["master"],"��ҩʦ") then me["masterid"]="huang" end
	if string.find(me["master"],"������") then me["masterid"]="zhang" end
	if string.find(me["master"],"����") then me["masterid"]="ma" end
	if string.find(me["master"],"������") then me["masterid"]="ding" end
	if string.find(me["master"],"ŷ����") then me["masterid"]="ouyang" end
	if string.find(me["master"],"������") then me["masterid"]="ai" end
	if string.find(me["master"],"������") then me["masterid"]="gao" end
	if string.find(me["master"],"���߹�") then me["masterid"]="hong" end
	if string.find(me["master"],"������") then me["masterroom"]=2027 end
	if string.find(me["master"],"������") then
		me["masterid"]="feng"
		if set_GbSecretWay>0 then
			xkxGPS.setEntranceCondition("(condition is null or condition='dong' or condition='feng')")
		else
			xkxGPS.setEntranceCondition("(condition is null or condition='feng')")
		end
	end
end
function always_hp.dosomething11(n,l,w)
	if string.find(w[1],"��") then me["quit"]=true else me["quit"]=false end
end
function always_hp.dosomething12(n,l,w)
	if string.find(w[1],"����") then me["sex"]=true end
	if string.find(w[1],"Ů��") then me["sex"]=false end
	if string.find(w[1],"����") then me["sex"]=true end
end
function always_hp.dosomething13(n,l,w)
	me["charname"]=w[1]
end
function always_hp.dosomething14(n,l,w)
	me["shen"]=0-tonumber(w[1])
end
function always_hp.dosomething15(n,l,w)
	me["charid"]=string.lower(w[1])
end
function always_hp.dosomething16(n,l,w)
	local a,b,c
	a,b,c=string.find(l,"��Ŀǰ���һ�Ǳ��(.+)�㡣")
	if c~=nil then
		hp.thpot=ctonum(c)
	end
	if findstring(l,"��û����ô���һ�Ǳ�ܡ�","������û���һ�Ǳ�ܡ�") then
		hp.thpot=0
	end
end
function always_hp.dosomething17(n,l,w)
	me["shijian"]=ctonum(w[1])
	if me["shijian"]>=1 then stat.quiting=2 end
end
------------------------------------------------------------------------------------
-- always_skills
------------------------------------------------------------------------------------
function always_skills.dosomething1(n,l,w)
	me["bl"]=tonumber(w[1])
	me["xtbl"]=tonumber(w[2])
	me["wx"]=tonumber(w[3])
	me["xtwx"]=tonumber(w[4])
end
function always_skills.dosomething2(n,l,w)
	me["gg"]=tonumber(w[1])
	me["xtgg"]=tonumber(w[2])
	me["sf"]=tonumber(w[3])
	me["xtsf"]=tonumber(w[4])
end
function always_skills.dosomething3(n,l,w)
	if string.find(w[1],"��������") then jifa["forcename"]="huntianqigong" end
	if string.find(w[1],"��������") then jifa["forcename"]="bitaoxuangong" end
	if string.find(w[1],"�ߵ���") then jifa["forcename"]="diandaogong" end
	if string.find(w[1],"������") then jifa["forcename"]="dulongdafa" end
	if string.find(w[1],"����ʥ��") then jifa["forcename"]="guangmingshenghuo" end
	if string.find(w[1],"��󡹦") then jifa["forcename"]="hamagong" end
	if string.find(w[1],"������") then jifa["forcename"]="huagongdafa" end
	if string.find(w[1],"��Ԫ��") then jifa["forcename"]="hunyuangong" end
	if string.find(w[1],"��Ԫһ����") then jifa["forcename"]="hunyuanyiqi" end
	if string.find(w[1],"������") then jifa["forcename"]="jiuyangshengong" end
	if string.find(w[1],"��������") then jifa["forcename"]="kurongchangong" end
	if string.find(w[1],"�ټ�ʮ��ׯ") then jifa["forcename"]="linjizhuang" end
	if string.find(w[1],"���������") then jifa["forcename"]="longxiangbanruo" end
	if string.find(w[1],"���չ�") then jifa["forcename"]="milegong" end
	if string.find(w[1],"Ħ������") then jifa["forcename"]="motianyunqi" end
	if string.find(w[1],"̫����") then jifa["forcename"]="taijishengong" end
	if string.find(w[1],"̫����") then jifa["forcename"]="taixuangong" end
	if string.find(w[1],"���칦") then jifa["forcename"]="xiantiangong" end
	if string.find(w[1],"����Ҫּ") then jifa["forcename"]="xiulingyaozhi" end
	if string.find(w[1],"���ŵ�����") then jifa["forcename"]="xuanmendaoyin" end
	if string.find(w[1],"��������") then jifa["forcename"]="xuanyinzhenqi" end
	if string.find(w[1],"��Ů�ľ�") then jifa["forcename"]="yunuxinjing" end
	if string.find(w[1],"��ϼ��") then jifa["forcename"]="zixiagong" end
	jifa["force"]=tonumber(w[2])
end
function always_skills.dosomething4(n,l,w)
	run("jifa")
end
function always_skills.dosomething5(n,l,w)
	skillslist[w[3]]={}
	skillslist[w[3]]["name"]=w[2]
	skillslist[w[3]]["lvl"]=tonumber(w[4])
	skillslist[w[3]]["sld"]=tonumber(w[5])
end
function always_skills.dosomething6(n,l,w)
	skillslist={}
end
------------------------------------------------------------------------------------
-- always_watch
------------------------------------------------------------------------------------
function always_watch.timer()
	me.drugbusy=0
end
function always_watch.timer1()
	cm.havebuff=0
end
function always_watch.timer10()
	stat.addexp=sum.all()
	stat.avgall=avg.all()
	stat.avgfj=avg.fj()
	stat.avgmp=avg.mp()
	stat.avgftb=avg.ftb()
	stat.avgdeath=avg.death()
	stat.countdeath=count.death
end
function always_watch.timer_log()
	if IsLogOpen() then CloseLog() end
	OpenLog("",false)
end
packets=0
function always_watch.timer30()
	if idle>0 and resetidle>0 then
		print("ò�Ʒ�����")
		addlog("������")
		if packets~=0 and packets==GetInfo(204) then
			Disconnect()
			Connect()
		end
		packets=GetInfo(204)
		--cmd.nums=0
		if not IsConnected() and (_G["notconnect"]==nil or _G["notconnect"]==0) then Connect()
		elseif IsConnected() then
			checkmove.NotGPSMove=1
			alias.initialize_trigger()
			if me.menpai=="em" then run("put fuling in yaodai") end
			if me.menpai=="bt" then run("convert she") end
			ftbnpckilled=0
			havefj=0
			fjzone=""
			fjroom=""
			fjarea=""
			fjroomid=0
			haveshizhe=0
			gpszeikou=""
			gold.id=""
			gold.begPlayerNum=-100
			alias.resetidle()
			alias.yjl()
			run("yun recover;yun regenerate")
			alias.startworkflow()
		end
	end
end
function always_watch.timer60()
	idle=1
end
function always_watch.timer1d()
	if cm.setmz~=nil and cm.setmz>0 then cm.fightmz=1 else cm.fightmz=0 end
end
function always_watch.dosomething1(n,l,w)
	local _f,_tb,_t,a,b,c,d,e
	if findstring(l,"�����һ�Ŵ󻹵���ֻ������������ԴԴ���������Ϲ���������") then addneili.dahuandan=addneili.dahuandan+1 end
	if findstring(l,"������������ˣ���") then addneili.dazuo=addneili.dazuo+1 end
	a,b,c=string.find(l,"����������������(%d+)�㡣")
	if c~=nil then addneili.fj=addneili.fj+tonumber(c) end
	if findstring(l,"һ���������������˹����������ɱ���������ƺ���������֮����") then
		haveshizhe=1
		kill.dokill("shizhe","�������ʹ��","shizhe")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ rbt=start �ı����趨��") then
		if jifa.forcename=="xuanyinzhenqi" then _t="hbmz" else _t="" end
		if setting~=me.menpai.._t then
			--Execute("/alias.set"..me.menpai.._t.."()")
		end
		alias.startworkflow()
	end
	a,b,c,d=string.find(l,"[> ]*(.+) - (%w+)")
	if c~=nil and d~=nil then
		if isopen("gps_start") then
			checkmove.roomName=c
			checkmove.roomFirstEntrance=d
			checkmove.NotGPSMove=0
		else
			if d==checkmove.roomName and findstring(checkmove.roomFirstEntrance,e) then checkmove.NotGPSMove=0 else checkmove.NotGPSMove=1 end
		end
	end
	if findstring(l,"�����������㿴����֪����Щʲô���⡣") then
		kill.dokill("er","����","fang")
	end
	if findstring(l,"�������������㿴����֪����Щʲô���⡣") then
		kill.dokill("fang","������","fang")
	end
	if findstring(l,"�����������㿴����֪����Щʲô���⡣") then
		kill.dokill("san","����","fang")
	end
	if findstring(l,"������һ��ѣ�θд�����������������֪��....") then
		wait.make(function()
			if setting_resetidle>0 then resetidle=1 end
			if workflow.nowjob=="death" then
				workflow.nowjob=deathjob
				_f=function()
							openclass("watch_death")
							if me.menpai=="wd" and set_lifesave>0 then run("set check=lifesavehp") else alias.flytoid(deathroomno) end
					end
				wait.time(1);_f()
			else
				if workflow.nowjob=="lifesave" then
					workflow.nowjob=deathjob
					_f=function()
								openclass("watch_death")
								run("set check=lifesavehp")
						end
					wait.time(1);_f()
				else
					if not isopen("liaoshang") then
						alias.initialize_trigger()
						ftbnpckilled=0
						havefj=0
						haveshizhe=0
						alias.resetidle()
						alias.yjl()
						run("yun recover;yun regenerate")
						alias.startworkflow()
					end
				end
			end
		end)
	end
	if findstring(l,"һ��������콵�£�ֱ������ȥ�������û���У�") then openclass("quit") end
	if findstring(l,"һ��΢�紵�������澰���ƺ�����Щ�仯��") then buzhen=false end
	if findstring(l,"����ͻ�䣬ʱ����Ǩ�����Ѿ��������������ˡ�") then cm.mengzhu=0 end
	if findstring(l,"���㹪��Ϊ��˵�������������˼Һã�","���������󺰣��������꣬���꣬�����꣡") then cm.mengzhu=1 end
	if findstring(l,"�ϵı������뿪�ɡ�") then run("dismiss") end
	if findstring(l,"��ʹ������ô�෨�֡�") then run("drop 1 lun") end
	if findstring(l,"��õ�һֻ��Ѽ��") then dropya=true end
	a,b,c=string.find(l,"һ��.+�������˹���,���㱨ȭ���������·�(.+)֮���������ٻ�.+����������")
	if c~=nil and c==me.fjmasternick then
		fjcome=os.time()
		if fjend==nil then fjend=0 end
		fjwaittime=fjcome-fjend
		print("����fj���ʱ��"..fjwaittime)
	end
	a,b,c,d=string.find(l,"[> ]*(.+)˵��:���������ˣ�(.+)����Ϊ����������һ������")
	if c~=nil and c==me.fjmaster and d~=nil and d==me.charname then
		fjend=os.time()
		arrstarttime=os.time()
	end
	if findstring(l,"�ƴ��Ѿ����ȵ�һ��Ҳ��ʣ�ˡ�","�ƴ������ˮ�ȵõ׳����ˡ�") then have.water=0 end
	if findstring(l,"����һ�����ĵ���ʹ���㿪ʼ�е���֫���飬�߶������ˣ�","��е��������ѣ���ľ�ĸо�˳����֫�����У��߶������ˣ�") then
		run("hp")
		if hp.healthjing<85 or me.menpai=="xx" then stat.havedu=1 end
	end
	if findstring(l,"�㿪ʼ�е������ñ�����","����˿ڷ��飬ȫ��ֱ������ʹ�����ⲻ����ͨ���߶���","��Ȼһ��̹ǵ��溮Ϯ�������е������ƶ������ˣ�") then
		run("hp")
		if hp.healthjing<85 or me.menpai=="xx" then stat.havedu=1 end
		--if me.menpai=="sl" then
		--	if hp.healthjing<85 then stat.havedu=1 end
		--else stat.havedu=1 end
	end
	if findstring(l,"û�����������û�Ŷ���") then
		alias.initialize_trigger()
		openclass("mp_dl")
		openclass("mp_dl_work")
		openclass("mp_dl_dowork")
		alias.uw()
		alias.wi("huachu")
	end
	if findstring(l,"�����һ���Ͻ�ͨ������ֻ����ͷ�ؽ��ᣬҡҡ������ԭ����ʳ̫��̫�࣬ҩЧ�ʵ��䷴��","�㽫һ���Ͻ�ͨ����������У���Ŀ���񣬴���ҩ��ȫ�ڻ���ȫ�������Ȼ����žž�����졣") then
		alias.resetidle()
		cm.havebuff=1
		me.drugbusy=1
		AddTimer("drug_timer", 0, 0, 3600, "", timer_flag.Enabled + timer_flag.Replace, "always_watch.timer")
		AddTimer("drug_timer1", 0, 0, 3600, "", timer_flag.Enabled + timer_flag.Replace, "always_watch.timer1")
	end
	if findstring(l,"�����һ�Ŵ�Ѫ�٣�ֻ���øγ���ϣ��������ѣ�ԭ����ʳ̫��ҩ�ҩЧ�ʵ��䷴��","�����һ�ô�Ѫ�٣���ʱѪ����ӿѪ�����ͣ������󳤡�") then
		stat.drugbusy=os.time()+720
		print("����ʱ�䣺"..os.time().."  �´γ�ҩʱ�䣺"..stat.drugbusy)
		--me.drugbusy=1
		--AddTimer("drug_timer2", 0, 0, 720, "", timer_flag.Enabled + timer_flag.Replace, "always_watch.timer")
	end
	if findstring(l,"��С������ذ�һ����ҩ�����˿���") then
		stat.drugbusy=os.time()+30
		print("����ʱ�䣺"..os.time().."  �´γ�ҩʱ�䣺"..stat.drugbusy)
		--me.drugbusy=1
		--AddTimer("drug_timer3", 0, 0, 30, "", timer_flag.Enabled + timer_flag.Replace, "always_watch.timer")
	end
	if findstring(l,"һ���عع�����ִ�����������ǰ������ץס�����ϵġ���˾·������ϸ����š�") then alias.resetidle() end
	if findstring(l,"���������һ���ۺ����������ô�����������ȥ��ȥ����","�ز�����������������ӷ�","ͻȻ��о��������ж����ڱ��������Ĳ��Ӵ�����","���������Ӱ���һ�У�Ʈ����ţͷ���棬����������ڵ��ȥ��") then
		alias.resetidle()
		if me.menpai=="wd" and set_lifesave>0 then run("yun lifesave") end
	end
	if findstring(l,"���佫��ġ���˾·������������������ָ��ָ���ţ������ǽ����ȥ��") then
		alias.resetidle()
		if me.menpai=="wd" and set_lifesave>0 then run("yun lifesave") end
		run("n;n")
	end
	if findstring(l,"���Ź� - ") then
		alias.resetidle()
		stat.havedu=0
		if fjroomid==0 then deathroomno=roomno_now else deathroomno=fjroomid end
		-- #if %class( blockpk_start) {#add list.pk %concat( " ��ɱ��")}
		-- #additem DeathList {%concat( %time( yyyy-mm-dd hh:nn:ss), " Job=", @deathjob, %if( @deathjob=fj, %concat( " Room=", @fj.room, " Zone=", @fj.zone, " Roomno=", @fj.roomno, " NPC=", @fj.npc), %concat( " Room=", @deathroomno)))}
		local msg="���������� Job="..tostring(deathjob)
		if deathjob=="fj" then
			msg=msg.." Room="..tostring(fj.room).." Zone="..tostring(fj.zone).." Roomno="..tostring(fj.roomno).." NPC="..tostring(fj.npc)
		else
			msg=msg.." Room="..tostring(deathroomno)
		end
		addlog(msg)
		
		alias.initialize_trigger()
		--if jifa.forcename=="xuanyinzhenqi" then alias.jfhbmz() else Execute("/alias.jf"..me.menpai.."()") end
		run("jiajin basic;jiali 0")
		deathjob=workflow.nowjob
		workflow.nowjob="death"
		alias.checkexp("death")
		if me.menpai=="wd" and set_lifesave>0 then run("yun lifesave") end
	end
	if findstring(l,"�������������������������","һ�����ɵ����Ѿ�������") then mj.haveyd=1 end
	if findstring(l,"����������һ�ģ����ڳɹ������ǰ���ν�������ɵĽ���") then mj.haveyd=0 end
	if findstring(l,"����þ�����Ϊ����","�������Ѫ��������","����þ���ǳ�����") then run("yun shougong") end
	if findstring(l,"�����ߣ�") then run("stand") end
	if findstring(l,"��ֻ���á�����Ѩ����һ������") then stat.quiting=2 end
	if findstring(l,"ֻ������һ����ȣ�ȭ��ͻȻ����;�֮������ȴ����Ʈ���Ѳ⣡") then alias.resetidle();stat.leidong=1 end
	if findstring(l,"�����ǰһ�ڣ�����ʲôҲ��֪����....") then resetidle=0 end
	if findstring(l,"ͻȻһ��ǿ������������Ƴ��ض���") then roomno_now=2058;alias.startcm() end
	if findstring(l,"���д�С��ׯ�Ѿã��ָֻ���ԭ�о�����") then stat.daxiao=0 end
	if findstring(l,"����Ϣ�������������д�С��ׯ��ֻ��һ��ů�������ţ����ػ�������ȫ��������һ�ܣ����뵤��������") then stat.daxiao=1 end
	if findstring(l,"������й��Ѿã��Ծ����ĳ�����һЩ��") then stat.fengyun=0 end
	if findstring(l,"�㰵�˷�����ׯ����˼����Ʈ��֮���л�����Ĭ���絴��֮Ѹ�ٽ�����") then stat.fengyun=1 end
	if findstring(l,"��ֻ����һ��ͷ��, ��ǰֻ������ʰ�쵵�һƬģ��, ԭ�����е�ǧ�����ַ�����!","��һ��ҡ��, ���ᵤ��֮��ȴ�᲻�����������Щˤ��.","ֻ�����ƺ���һ��, �����ѱ�") then stat.havedu=1 end
	if findstring(l,"һ�����飬Ѫ����������ʱ�������ã�") then stat.haveyyz=1 end
	if findstring(l,"�����߹��ߵ���ƬҲ�𽥻ָ�Ϊ����ɫ�����ò���������ܲ�������") then stat.heji=0 end
	if findstring(l,"�����ʩչ����ܲ�������������֮�����ϣ�ֻ������߹���������Ƭ���죬�����쳣��") then stat.heji=1 end
	if findstring(l,"��Ļ�������������ϣ��������ջص��") then stat.huntianup=0 end
	if findstring(l,"��΢һ�����������������ȫ��ǽڷ���һ�󱬶��������") then stat.huntianup=1 end
	if findstring(l,"�㻺������һ���������ھ��ջص��") then stat.leidong=0 end
	if findstring(l,"�������֮��������ϣ��������ջص��") then stat.longxiang=0 end
	if findstring(l,"�����Ĭ������������ԣ��ֽ�Ħ��֧���ŭӡ������") then stat.longxiang=1 end
	if findstring(l,"ֻ����ĸ�󡹦������ϣ��������ջص��") then stat.powerup=0 end
	if findstring(l,"ֻ������ڵ��£�˫��������룬����һֻ�����ܰ��������ˣ����з�����ţ˻����Ĺ���֮����ʱЪʱ����") then stat.powerup=1 end
	if findstring(l,"�����Ĭ������������ԣ��ֽ�Ħ��֧���ŭӡ������") then stat.longxiang=1 end
	if findstring(l,"��ľ�����ת������ϣ������ظ�һ��������") then stat.reverse=0 end
	if findstring(l,"ֻ������не�������̺���������������ͷ�½���֮�Σ�˫�ֳŵأ�������ȥ��") then stat.reverse=1 end
	if findstring(l,"��Ȼ������������������ɻص��") then stat.shengang=0 end
	if findstring(l,"������ĬȻ�˹�����һ�����ϵ�") then stat.shengang=1 end
	if findstring(l,"���������֮������ɢ�����֮�䣬���ָֻ���ԭ�о�����") then stat.tiandi=0 end
	if findstring(l,"��ϯ�ض������������죬������ض�ׯ����������������Ǳ����������������ض�����̩�����پ��Լ��������������ˡ�") then stat.tiandi=1 end
	if findstring(l,"����ɫת�ף������ǹɱ��˵�����֮��������ʧ��") then stat.xuanyin=0 end
	if findstring(l,"ֻ����ٺٺټ�����Ц������ø�������Ѳ⣬����˫��һ����˿˿����������ð����") then stat.xuanyin=1 end
	if findstring(l,"�������ѻ������������ƺ��������ֹ���Ѱ����") then stat.zhixin=0 end
	if findstring(l,"��΢һ�����˶�֮����ׯ��ȥ���������⣬�����������У�ֻ����̨�������������ƺ��������ӡ�") then stat.zhixin=1 end
	if findstring(l,"����Ϣ���������鲼ȫ�����ϼ��������ɢȥ��") then stat.zixia=0 end
	if findstring(l,"���������������ϼ�񹦣�����������ʢ��") then stat.zixia=1 end
	if findstring(l,"��������","ȡ��������") then weapon_id=1 end
	if findstring(l,"������Լ�����ʶԽ��Խ����������ʡ�����ˡ�����") then
		workflow.nowjob=deathjob
		resetidle=1
		wait.make(function()
			_f=function()
						openclass("watch_death")
						if me.menpai=="wd" and set_lifesave>0 then run("set check=lifesavehp") else alias.flytoid(deathroomno) end
				end
			wait.time(1);_f()
		end)
	end
	if findstring(l,"һ�������Ũ��ͻȻ���֣��ܿ�ذ�Χ���㡣") then
		workflow.nowjob=deathjob
		resetidle=1
		if me.menpai=="dl" then run("drop pao")
		elseif me.menpai=="th" then run("drop robe")
		else run("drop cloth") end
		wait.make(function()
			_f=function()
				openclass("watch_death")
				if tonumber(deathroomno)>0 then alias.flytoid(deathroomno) else alias.startworkflow() end
			end
			wait.time(1);_f()
		end)
	end
	if findstring(l,"һ������Ե���ӿ����ֱ�����飬��ʹ�ü���������ȥ��") then
		workflow.nowjob="lifesave"
		openclass("watch_death")
	end
	if findstring(l,"�����ھ۶����࣬���Լ�����ߡ�") then xx.needsandu=1 end
	if findstring(l,"�������һ���������...") then
		alias.yjl()
		run("yun recover")
		wait.make(function()
			_f=function()
						run("halt;"..safego)
				end
			if not isopen("kill") then wait.time(1);_f() end
		end)
	end
end
------------------------------------------------------------------------------------
-- watch_death
------------------------------------------------------------------------------------
function watch_death.dosomething1(n,l,w)
	local a,b,c
	if findstring(l,"��Ŀǰ��û���κ�Ϊ check=lifesavehp �ı����趨��") then
		if hp.healthjing<100 or hp.healthqi<100 then alias.flytonpc("�����") else run("set check=lifesaveover") end
	end
	if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ������ҡ�") then
		if hp.healthjing<70 or hp.healthqi>49 then
			run("ask yu about �������ĵ�;fu dan")
		else
			run("ask yu about �׻�������;fu wan")
		end
		run("hp")
		alias.checkexp("death")
	end
	if findstring(l,"�������磬���ֵ�ͼ��950�������") then
		closeclass("watch_death")
		run("e;look")
		alias.startworkflow()
	end
	a,b,c=string.find(l,"�������磬���ֵ�ͼ��(%d+)�������")
	if c~=nil and tonumber(c)==deathroomno then
		run("halt;get all from corpse;get all from corpse 2;get all from corpse 3")
		if me.menpai=="dl" then run("drop pao")
		elseif me.menpai=="th" then run("drop robe")
		else run("drop cloth") end
		run("wear armor;wear all")
		if me.menpai=="em" or me.menpai=="bt" then run("put fuling in yaodai") end
		alias.flytoid(950)
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=death �ı����趨��") then
		alias.resetidle()
		run("set check=lifesaveover")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ check=lifesaveover �ı����趨��") then
		workflow.nowjob=deathjob
		alias.flytoid(deathroomno)
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function always.update()
	local  always_daytime_triggerlist={
	       {name="always_daytime_dosth1",regexp="(̫���Ӷ����ĵ�ƽ�������ˡ�|�Ѿ�����ҹ�ˡ�|�����ˣ�̫�������ͽ����������ӳ��һƬ��졣|����������п�ʼ����һ˿΢�ء�|�Ѿ��������ˣ�̫���������Ϸ���ҫ����ء�|̫����ʼ�����������������������|ҹ�����ˡ�|������������𽥷���|����������п�ʼ����һ˿΢�ء�|̫���մӶ����ĵ�ƽ������|̫�����߹��ڶ����������|̫�����߹��������������|����������ʱ�֣�̫���߹������ͷ�����Ϸ�|ҹĻ�ʹ������췱��|ҹĻ���������|һ�ֻ���Ϧ�����ǻ��������ĵ�ƽ����|�Ѿ�����ҹ�ˡ�)",script=function(n,l,w,s)    always_daytime.dosomething1(n,l,w,s)  end,},
	}
	for k,v in pairs(always_daytime_triggerlist) do
		addtri(v.name,v.regexp,"always_daytime",v.script)
	end
	openclass("always_daytime")

	local  always_hp_triggerlist={
	       {name="always_hp_dosth1",regexp="\\s+�������ӣ�(\\d+)\\s+",script=function(n,l,w)    always_hp.dosomething1(n,l,w)  end,},
	       {name="always_hp_dosth2",regexp="\\s+Ǯׯӯ�ࣺ(\\S+)���ƽ�",script=function(n,l,w)    always_hp.dosomething2(n,l,w)  end,},
	       {name="always_hp_dosth3",regexp="\\s+Ǯׯӯ�ࣺ(��������|����)\\s+",script=function(n,l,w)    always_hp.dosomething3(n,l,w)  end,},
	       {name="always_hp_dosth4",regexp="^(> > > |> > |> |) ����\\s*(\\d+)\\s*/\\s*(\\d+)\\s*\\(\\s*(\\d+)%\\)\\s*������\\s*(\\d+)\\s*/\\s*(\\d+)\\s*\\(\\s*\\+\\s*(\\d+)\\)",script=function(n,l,w)    always_hp.dosomething4(n,l,w)  end,},
	       {name="always_hp_dosth5",regexp="^ ��Ѫ��\\s*(\\d+)\\s*/\\s*(\\d+)\\s*\\(\\s*(\\d+)%\\)\\s*������\\s*(\\S+)\\s*/\\s*(\\d+)\\s*\\(\\s*\\+\\s*(\\d+)\\)",script=function(n,l,w)    always_hp.dosomething5(n,l,w)  end,},
	       {name="always_hp_dosth6",regexp="^ ʳ�\\s*(\\d+)\\s*/\\s*(\\d+)\\s*Ǳ�ܣ�\\s*(\\S+)\\s*/\\s*(\\d+)\\s*",script=function(n,l,w)    always_hp.dosomething6(n,l,w)  end,},
	       {name="always_hp_dosth7",regexp="^ ��ˮ��\\s*(\\d+)\\s*/\\s*(\\d+)\\s*���飺\\s*(\\S+)\\s*",script=function(n,l,w)    always_hp.dosomething7(n,l,w)  end,},
	       {name="always_hp_dosth8",regexp="^��(�ľ���ʼ|��ԯ����)��(\\d+)",script=function(n,l,w)    always_hp.dosomething8(n,l,w)  end,},
	       {name="always_hp_dosth14",regexp="^����ħ������(\\d+)",script=function(n,l,w)    always_hp.dosomething14(n,l,w)  end,},
		   {name="always_hp_dosth9",regexp="^���������ɣ�(\\S+)\\s+",script=function(n,l,w)    always_hp.dosomething9(n,l,w)  end,},
	       {name="always_hp_dosth10",regexp="^����ҵʦ����(\\S+)\\s+",script=function(n,l,w)    always_hp.dosomething10(n,l,w)  end,},
	       {name="always_hp_dosth11",regexp="^���˳����ƣ�(\\S+)",script=function(n,l,w)    always_hp.dosomething11(n,l,w)  end,},
	       {name="always_hp_dosth12",regexp="^����  ��(\\S+)����",script=function(n,l,w)    always_hp.dosomething12(n,l,w)  end,},
	       {name="always_hp_dosth13",regexp="^����  ����(\\S+)\\s+",script=function(n,l,w)    always_hp.dosomething13(n,l,w)  end,},
	       {name="always_hp_dosth15",regexp="^��Ӣ��ID��(\\w+)\\s+",script=function(n,l,w)    always_hp.dosomething15(n,l,w)  end,},
	       {name="always_hp_dosth16",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    always_hp.dosomething16(n,l,w)  end,},
		   {name="always_hp_dosth17",regexp="\\s+����ʱ�䣺(\\S+)��",script=function(n,l,w)    always_hp.dosomething17(n,l,w)  end,},
	}
	for k,v in pairs(always_hp_triggerlist) do
		addtri(v.name,v.regexp,"always_hp",v.script)
	end
	openclass("always_hp")
	
	local  always_skills_triggerlist={
	       {name="always_skills_dosth1",regexp="\\s*������\\s*(\\d+)/\\s*(\\d+)\\s*���ԣ�\\s*(\\d+)/\\s*(\\d+)",script=function(n,l,w)    always_skills.dosomething1(n,l,w)  end,},
	       {name="always_skills_dosth2",regexp="\\s*���ǣ�\\s*(\\d+)/\\s*(\\d+)\\s*����\\s*(\\d+)/\\s*(\\d+)",script=function(n,l,w)    always_skills.dosomething2(n,l,w)  end,},
	       {name="always_skills_dosth3",regexp="\\s*�ڹ� \\(force\\)\\s*��\\s*(\\S+)\\s*��Ч�ȼ���(\\d+)",script=function(n,l,w)    always_skills.dosomething3(n,l,w)  end,},
	       {name="always_skills_dosth4",regexp="^(> > > |> > |> |)��ġ�(�����ڹ�|��������|�ߵ���|������|����ʥ��|��󡹦|������|��������|��Ԫ��|��Ԫһ����|������|��������|�ټ�ʮ��ׯ|���������|���չ�|Ħ������|̫����|̫����|���칦|����Ҫּ|���ŵ�����|��������|��Ů�ľ�|��ϼ��)�������ˣ�",script=function(n,l,w)    always_skills.dosomething4(n,l,w)  end,},
	       {name="always_skills_dosth5",regexp="^��(��|��)(\\S+)\\s*\\((\\S+)\\)\\s+-\\s*\\S+\\s*(\\d+)\\/\\s*(\\d+)",script=function(n,l,w)    always_skills.dosomething5(n,l,w)  end,},
	       {name="always_skills_dosth6",regexp="^(> > > |> > |> |)��Ŀǰ��ѧ���ļ��ܣ�����(\\S+)��ܣ�",script=function(n,l,w)    always_skills.dosomething6(n,l,w)  end,},
	}

	for k,v in pairs(always_skills_triggerlist) do
		addtri(v.name,v.regexp,"always_skills",v.script)
	end
	openclass("always_skills")
	
	_tb={
		"�㿪ʼ�е������ñ�����",
		"����һ�����ĵ���ʹ���㿪ʼ�е���֫���飬�߶������ˣ�",
		"����ͻ�䣬ʱ����Ǩ�����Ѿ��������������ˡ�",
		"���Ź� - ",
		"�����ߣ�",
		"��ֻ���á�����Ѩ����һ������",
		"���������һ���ۺ����������ô�����������ȥ��ȥ����",
		"�����һ�Ŵ�Ѫ�٣�ֻ���øγ���ϣ��������ѣ�ԭ����ʳ̫��ҩ�ҩЧ�ʵ��䷴��",
		"�����һ�ô�Ѫ�٣���ʱѪ����ӿѪ�����ͣ������󳤡�",
		"��С������ذ�һ����ҩ�����˿���",
		"�����һ���Ͻ�ͨ������ֻ����ͷ�ؽ��ᣬҡҡ������ԭ����ʳ̫��̫�࣬ҩЧ�ʵ��䷴��",
		"�㽫һ���Ͻ�ͨ����������У���Ŀ���񣬴���ҩ��ȫ�ڻ���ȫ�������Ȼ����žž�����졣",
		"����˿ڷ��飬ȫ��ֱ������ʹ�����ⲻ����ͨ���߶���",
		"�����ǰһ�ڣ�����ʲôҲ��֪����....",
		"��������е�.+����Ȼ������������������ɻص��",
		"��е�.+һ�����飬Ѫ����������ʱ�������ã�",
		"�����߹��ߵ���ƬҲ�𽥻ָ�Ϊ����ɫ�����ò���������ܲ�������",
		"������ĬȻ�˹�����һ�����ϵ�.+�ƺ�����������ԣ�",
		"��΢һ�����������������ȫ��ǽڷ���һ�󱬶��������",
		"һ��������콵�£�ֱ������ȥ�������û���У�",
		"ֻ����ĸ�󡹦������ϣ��������ջص��",
		"������й��Ѿã��Ծ����ĳ�����һЩ��",
		"�����ʩչ����ܲ�������������֮�����ϣ�ֻ������߹���������Ƭ���죬�����쳣��",
		"���������֮������ɢ�����֮�䣬���ָֻ���ԭ�о�����",
		"�������ѻ������������ƺ��������ֹ���Ѱ����",
		"���д�С��ׯ�Ѿã��ָֻ���ԭ�о�����",
		".+���㹪��Ϊ��˵�������������˼Һã�",
		".+���������󺰣��������꣬���꣬�����꣡",
		"�ز�����������������ӷ�",
		"������һ��ѣ�θд�����������������֪��....",
		"�㰵�˷�����ׯ����˼����Ʈ��֮���л�����Ĭ���絴��֮Ѹ�ٽ�����",
		"��Ļ�������������ϣ��������ջص��",
		"����Ϣ�������������д�С��ׯ��ֻ��һ��ů�������ţ����ػ�������ȫ��������һ�ܣ����뵤��������",
		"��΢һ�����˶�֮����ׯ��ȥ���������⣬�����������У�ֻ����̨�������������ƺ��������ӡ�",
		"��ϯ�ض������������죬������ض�ׯ����������������Ǳ����������������ض�����̩�����پ��Լ��������������ˡ�",
		"ͻȻһ��ǿ������������Ƴ��ض���",
		"��Ȼһ��̹ǵ��溮Ϯ�������е������ƶ������ˣ�",
		"��������İ���׼�����ˡ�",
		"һ�������Ũ��ͻȻ���֣��ܿ�ذ�Χ���㡣",
		"ֻ����ٺٺټ�����Ц������ø�������Ѳ⣬����˫��һ����˿˿����������ð����",
		"��õ�һֻ��Ѽ��",
		"���佫��ġ���˾·������������������ָ��ָ���ţ������ǽ����ȥ��",
		"������Լ�����ʶԽ��Խ����������ʡ�����ˡ�����",
		"һ���عع�����ִ�����������ǰ������ץס�����ϵġ���˾·������ϸ����š�",
		"ֻ������не�������̺���������������ͷ�½���֮�Σ�˫�ֳŵأ�������ȥ��",
		"ͻȻ��о��������ж����ڱ��������Ĳ��Ӵ�����",
		"��ֻ����һ��ͷ��, ��ǰֻ������ʰ�쵵�һƬģ��, ԭ�����е�ǧ�����ַ�����!",
		"���������������ϼ�񹦣�����������ʢ��",
		"����Ϣ���������鲼ȫ�����ϼ��������ɢȥ��",
		"ֻ������һ����ȣ�ȭ��ͻȻ����;�֮������ȴ����Ʈ���Ѳ⣡",
		".+�������������������������",".+һ�����ɵ����Ѿ�������",
		".+����������һ�ģ����ڳɹ������ǰ���ν�������ɵĽ���",
		"����þ�����Ϊ����","�������Ѫ��������","����þ���ǳ�����",
		"���������Ӱ���һ�У�Ʈ����ţͷ���棬����������ڵ��ȥ��",
		"��һ��ҡ��, ���ᵤ��֮��ȴ�᲻�����������Щˤ��.",
		"һ��΢�紵�������澰���ƺ�����Щ�仯��",
		"����ɫת�ף������ǹɱ��˵�����֮��������ʧ��",
		"ֻ������ڵ��£�˫��������룬����һֻ�����ܰ��������ˣ����з�����ţ˻����Ĺ���֮����ʱЪʱ����",
		"(.+)˵��:���������ˣ�(.+)����Ϊ����������һ������",
		".+�ƴ��Ѿ����ȵ�һ��Ҳ��ʣ�ˡ�",
		"(.+) - (\\w+)",
		"�������һ���������...",
		"��Ŀǰ��û���κ�Ϊ rbt=start �ı����趨��",
		"һ���������������˹����������ɱ���������ƺ���������֮����",
		"һ������Ե���ӿ����ֱ�����飬��ʹ�ü���������ȥ��",
		"ֻ�����ƺ���һ��, �����ѱ�.+ָ������.",
		"һ��.+�������˹���,���㱨ȭ���������·�(.+)֮���������ٻ�.+����������",
		"��.+(��������|ȡ��������)",
		"�����һ�Ŵ󻹵���ֻ������������ԴԴ���������Ϲ���������",
		"��ľ�����ת������ϣ������ظ�һ��������",
		"�������֮��������ϣ��������ջص��",
		"������������ˣ���",
		"����������������(\\d+)�㡣",
		"�㻺������һ���������ھ��ջص��",
		"�����Ĭ������������ԣ��ֽ�Ħ��֧���ŭӡ������.+֮����",
		"���Ѿ���.+�ƴ������ˮ�ȵõ׳����ˡ�",
		"�����������㿴����֪����Щʲô���⡣",
		"�����������㿴����֪����Щʲô���⡣",
		"�������������㿴����֪����Щʲô���⡣",
		"û�����������û�Ŷ���",
		"��ʹ������ô�෨�֡�",
		"�����ھ۶����࣬���Լ�����ߡ�",
		"�Ƚ�.+�ϵı������뿪�ɡ�",
	}
	local  always_watch_triggerlist={
	       {name="always_watch_dosth1",regexp=linktri(_tb),script=function(n,l,w)    always_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(always_watch_triggerlist) do
		addtri(v.name,v.regexp,"always_watch",v.script,v.line)
	end

	local noecho_trilist={
			"��Ŀǰ��û���κ�Ϊ (.+) �ı����趨��",
			"�㲢δ����Ħ���ķ���",
			"�����ں�æ��ͣ��������",
			}
	local _noechotri=linktri(noecho_trilist)

	addtri("always_watch_gag_dosth1",_noechotri,"always_watch","")
	SetTriggerOption("always_watch_gag_dosth1","omit_from_output",1)
	
	AddTimer("always_watch_timer10", 0, 0, 10, "", timer_flag.Enabled + timer_flag.Replace, "always_watch.timer10")
	SetTimerOption("always_watch_timer10", "group", "always_watch")
	AddTimer("always_watch_timer30", 0, 0, 30, "", timer_flag.Enabled + timer_flag.Replace, "always_watch.timer30")
	SetTimerOption("always_watch_timer30", "group", "always_watch")
	AddTimer("always_watch_timer60", 0, 1, 0, "", timer_flag.Enabled + timer_flag.Replace, "always_watch.timer60")
	SetTimerOption("always_watch_timer60", "group", "always_watch")
	AddTimer("always_watch_timer1", 1, 0, 0, "", timer_flag.Enabled + timer_flag.Replace, "always_watch.timer1d")
	SetTimerOption("always_watch_timer1", "group", "always_watch")
	for i=0,23,1 do
		AddTimer("always_watch_log_timer"..tostring(i), i, 0, 1, "", timer_flag.Enabled + timer_flag.Replace + timer_flag.AtTime, "always_watch.timer_log")
		SetTimerOption("always_watch_log_timer"..tostring(i), "group", "always_watch")
	end
	openclass("always_watch")
	
	_tb={
		"��Ŀǰ��û���κ�Ϊ check=lifesavehp �ı����趨��",
		"��һ�죬�������ɫ�Ʋ���ӭȢ������ҡ�",
		"�������磬���ֵ�ͼ��950�������",
		"�������磬���ֵ�ͼ��(\\d+)�������",
		"��Ŀǰ��û���κ�Ϊ checkexpover=death �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ check=lifesaveover �ı����趨��",
	}
	local  watch_death_triggerlist={
	       {name="watch_death_dosth1",regexp=linktri(_tb),script=function(n,l,w)    watch_death.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(watch_death_triggerlist) do
		addtri(v.name,v.regexp,"watch_death",v.script,v.line)
	end
	AddTimer("watch_death_timer", 0, 0, 10, "", timer_flag.Enabled + timer_flag.Replace, "alias.resetidle")
	SetTimerOption("watch_death_timer", "group", "watch_death")
	closeclass("watch_death")
	
	AddAlias("alias_goto","goto (.*)","",alias_flag.Enabled + alias_flag.Replace+ alias_flag.RegularExpression ,"alias.goto")
	AddAlias("alias_fn","fn","",alias_flag.Enabled + alias_flag.Replace+ alias_flag.RegularExpression ,"alias.flytonext")

end
always.update()