mp_mj={}
mp_mj_pre={}
mp_mj_yudi={}
mp_mj_wxq={}
mp_mj_wxqjob={}
mp_mj_tyjob={}
mp_mj_watch={}

mj.haveyd=0
mj.yd1="s|w|nw|wu|sw|se|sd|s|sw|sd|s|sd|sd|se|se|sd|sd|nu|nu|nw|nw|nu|nu|n|nu|nw|n|ne"
mj.yd2="s|w|nw|wu|sw|se|sd|s|sw|sd|s|sd|sd|se|se|sd|sd|nu|nu|nw|nw|nu|nu|n|nu|nw|n|ne|u|e|w|w|e|nu|w|e|nu|ne|sw|nw|se|nu|se|nw|nw|se|sw|ne|ne|sw|nu|e|s|n|n|s|w|w|s|n|n|s|e|enter|e|w|w|n|w"
mj.search=""
mj.searchid=1
mj.ydnpc=0
mj.npcname=""

mj.tyjobnpc=""
mj.tyjobnpcid=""

function alias.wxqask()
	if roomno_now==466 then run("ask tang yang about ľͰ;ask tang yang about job")
	elseif roomno_now==554 then run("ask yan yuan about ����;ask yan yuan about job")
	elseif roomno_now==449 then run("ask wen cangsong about ��ͷ;ask wen cangsong about job")
	elseif roomno_now==597 then run("ask zhuang zheng about ����;ask zhuang zheng about job")
	elseif roomno_now==444 then run("ask xin ran about job")
	elseif roomno_now==596 then run("ask wu jincao about ����;ask wu jincao about ����")
	else alias.flytonpc("����")	end
end
function alias.mjlianwu()
	alias.uw()
	skills_num=1
	alias.lianwu()
end
------------------------------------------------------------------------------------
-- mp_mj_pre
------------------------------------------------------------------------------------
function mp_mj_pre.dosomething1(n,l,w)
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
		alias.resetidle()
		alias.flytoid(596)
	end
	if findstring(l,"�������磬���ֵ�ͼ��596�������") then
		alias.resetidle()
		alias.dz(set_neili_global)
	end
	if not isopen("boat") and findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
		alias.resetidle()
		closeclass("mp_mj_pre")
		if mj.yudi~=nil and mj.yudi~=0 and mj.haveyd==1 then
			openclass("mp_mj_yudi")
			run("wavefighter fighter;wavefighter fighter;menpai")
			alias.flytonpc("�⾢��")
		elseif havefj>0 then 
			alias.startworkflow()
		elseif mj.wxq~=nil and mj.wxq~=0 then
			--openclass("mp_mj_wxq")
			--alias.flytonpc("����")
			print("��û����")
			alias.startworkflow()
		elseif mj.tyjob~=nil and mj.tyjob~=0 then
			openclass("mp_mj_tyjob")
			alias.flytonpc("��Ұ��")
		else
			--if hp.pot<hp.maxpot then alias.flytonpc("����") else alias.mjlianwu() end
			openclass("mp_mj_pre")
			alias.mjlianwu()
		end
	end
	if not isopen("boat") and findstring(l,"��Ŀǰ��û���κ�Ϊ lian=over �ı����趨��") then
		alias.dz("addneili")
	end
	--if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����С�") then
	--	alias.resetidle()
		--if hp.pot<hp.maxpot then run("ask yang xiao about ����") end
	--end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=mp �ı����趨��") then
		alias.resetidle()
		if add.exp>10 and mpLimited.MarkExp<me.menpaiLimited then mpLimited.MarkExp=tonumber(me.menpaiLimited) end
		if add.exp<10 then
			mpJobLimited=1
			print("ͳ�Ƶ���yudi����Ϊ��"..mpLimited.mpexp)
			mpLimited.MarkExp=mpLimited.mpexp
			if mpLimited.MarkTime<(os.time()-3600) then
				-- ��ʱ��ȴ��Ȼbusy���Ƴ�2����
				mpLimited.MarkTime=tonumber(os.time()-3600+120)
			end
		end
		if fjjf~=nil and fjjf~="" then alias.jf(fjjf) end
		alias.startworkflow()
	end
end
------------------------------------------------------------------------------------
-- mp_mj_yudi
------------------------------------------------------------------------------------
function mp_mj_yudi.dosomething1(n,l,w)
	local _f,_tb,a,b,c,d,e,f
	wait.make(function()
	if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ���⾢�ݡ�") then
		alias.resetidle()
		if mj.yudi>1 then mj.search=mj.yd2 else mj.search=mj.yd1 end
		mj.searchid=1
		mj.ydnpc=0
		mj.npcname=""
		if mpjf~=nil and mpjf~="" then alias.jf(mpjf) end
		alias.dz(set_neili_global)
	end
	if not isopen("boat") and findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
		alias.resetidle()
		if mj.haveyd==1 then
			if string.len(mpweapon)>0 then
				if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
			else alias.uw() end
			run("unset no_parry;yield no;jiali "..mpjiali..";jiajin "..mpjiajin)
			run("set search=yes")
		else
			closeclass("mp_mj_yudi")
			openclass("mp_mj_pre")
			alias.checkexp("mp")
		end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ search=yes �ı����趨��") then
		alias.resetidle()
		if mj.haveyd==0 then alias.flytonpc("�⾢��")
		elseif mj.ydnpc>0 then
			_tb=utils.split(mpyun,"|")
			for k,v in ipairs(_tb) do run(v) end
			openclass("kill")
			closeclass("kill_run")
			AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
			SetTimerOption("kill_timer", "group", "kill")
			reyun=1
			runaway=false
			npcfaint=false
			killRunSuccess=false
			killid=""
			killname="npc"
			killskill=mpweapon
			killpfm=mppfm
			killyun=mpyun
			killjiali=mpjiali
			killjiajin=mpjiajin
			_tb=utils.split(mppfm,"|")
			for k,v in ipairs(_tb) do run(v) end
		else
			closeclass("kill")
			_tb=utils.split(mj.search,"|")
			if tonumber(mj.searchid)>tonumber(table.getn(_tb)) then
				alias.flytoid(585)
			else
				run("halt;".._tb[mj.searchid])
				mj.searchid=mj.searchid+1
				run("set search=yes")
			end
		end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ check=kill �ı����趨��") then
		print("��"..mj.ydnpc.."������")
		if mj.ydnpc==0 or mj.ydnpc>=mj.yuditp then
			alias.close_kill()
			alias.checkbusy("yudikill")
		elseif (hp.healthqi<70 or hp.neili<(hp.maxneili*70/100)) then
			alias.close_kill()
			alias.flytoid(585)
		elseif mj.npcname~="" then
			run("kill "..mj.npcname)
		end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=yudikill �ı����趨��") then
		run("set search=yes")
	end
	if findstring(l,"�����˹���","���Ѿ����˹���","���Ѿ���������״̬","�������൱�ص���","������֮���Ѿ�����֧��","��ҡͷ����","���Ѿ�һ��ͷ�ؽ����ģ��") then
		alias.close_kill()
		alias.flytoid(585)
	end
	if findstring(l,"�������磬���ֵ�ͼ��585�������") then
		_f=function() run("yun regenerate;yun refresh;yun recover")	end
		wait.time(2);_f()
		alias.flytonpc("�⾢��")
	end
	--a,b,c=string.find(l,"[> ]*(.+)����һ�����ȣ����ڵ��ϻ��˹�ȥ��")
	--if c~=nil and not findstring(c,"��Ӱ","->","��") then
	--	mj.npcname=c
	--	run("id here")
	--end
	--a,b,c,d=string.find(l,"^"..mj.npcname.."%s+=%s+(%w+)%s+(%w+),%s*")
	--if c~=nil and d~=nil then mj.npcname=string.lower(d).." "..string.lower(e) end
	if findstring(l,"��ֻ��������ת����") then
		reyun=1
	end
	if findstring(l,"���Ѿ��߶�","������������ʢ","����������") then
		reyun=0
	end
	a,b,c,d,e=string.find(l,"[��ɽ|����|����|�䵱]+�ɵ���%s(.+)%((%w+)%s+(.+)")
	--print(c,"|",d,"|",e)
	if c~=nil and d~=nil and e~=nil and not findstring(c,"ǿ��","������ʿ","ħ�̵���") then
		if findstring(e,"���Բ���") then mj.npcname=string.lower(d) else mj.npcname="" end
		if hp.exp>=650000 or (hp.exp<650000 and findstring(e,"ս����","���Բ���")) then	mj.ydnpc=mj.ydnpc+1	end
	end
	end)
end
------------------------------------------------------------------------------------
-- mp_mj_wxq
------------------------------------------------------------------------------------
function mp_mj_wxq.dosomething1(n,l,w)
	local a,b,c
	if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ��.+��") then
		alias.resetidle()
		if havefj>0 then alias.startworkflow() else alias.dz(set_neili_global) end
	end
	if not isopen("boat") and findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
		alias.resetidle()
		alias.wxqask()
		run("checkling")
	end
	a,b,c=string.find(l,"��������(.+)")
	if c~=nil and findstring(c,"��  ˮ") then alias.flytonpc("����")
	elseif c~=nil and findstring(c,"�ڵص�") then alias.flytonpc("��ԫ")
	elseif c~=nil and findstring(c,"��  ��") then alias.flytonpc("�Ų���")
	elseif c~=nil and findstring(c,"�ɼ�����") then alias.flytonpc("ׯ�")
	elseif c~=nil and findstring(c,"�����ǹ") then alias.flytoid(596)
	elseif c~=nil and findstring(c,"��") then alias.wxqask() end
	if findstring(l,"�������磬���ֵ�ͼ��.+�������") then openclass("mp_mj_wxqjob") end
	if findstring(l,"��С�������","��Ӷ�����","��Ӷ���","�㽫������������","��Ӷ�������","��Ž�ȼ��","�����Ѿ���ʼ�ܻ���","������ǹģ����") then
		alias.resetidle()
	end
	if findstring(l,"ľͰ�ⶫ����װ����ˮ","���ľͰ���ˮȫ��������ˮ����","������ͨ��һ�εص�","��ʹ��һ̧�����տ����������ɿ�������","�㽫һС���ڽ��ʯ������","���Ѿ���һ���ʯ","�Ҳ����ѽo��������ô","����������������","�����һ������ʯ","��ǹ�Ѿ��Ƴ�") then
		alias.resetidle()
		closeclass("mp_mj_wxqjob")
		alias.checkbusy("jobover")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=jobover �ı����趨��") then
		alias.resetidle()
		if roomno_now==461 then alias.flytoid(469)
		elseif roomno_now==469 then roomno_now=466;run("h;w;s;ask tang yang about job;checkling")
		elseif roomname=="�ص�" then alias.flytoid(554) 
		elseif roomno_now==446 or roomno_now==450 then alias.flytoid(449) 
		elseif roomno_now==590 then alias.flytoid(596) 
		elseif roomno_now==596 then _tb={594,595};alias.flytoid(_tb[math.random(1,2)])
		elseif roomno_now==594 or roomno_now==595 then run("h;nw;n;n;give jing tie to wu jincao")
		elseif roomno_now==539 then alias.flytoid(599) 
		elseif roomno_now==599 then run("h;w;w;give huo qiang to xin ran")
		end
	end
	if findstring(l,"�����¯�Ѿ�����������") then
		alias.resetidle()
		if roomno_now==594 then alias.flytoid(595) else alias.flytoid(594) end
	end
end
function mp_mj_wxq.dosomething2(n,l,w)
	local a,b,c,d
	a,b,c,d=string.find(w[0],"����(.+)�����йء�.+������Ϣ��\n(.+)")
	if c~=nil and d~=nil and findstring(d,"�������ȥ�����������￴����û�к��ʵ�����") then
		if roomno_now==466 then alias.flytonpc("��ԫ")
		elseif roomno_now==554 then alias.flytonpc("�Ų���")
		elseif roomno_now==449 then alias.flytonpc("ׯ�")
		elseif roomno_now==597 then alias.flytonpc("��Ȼ")
		elseif roomno_now==444 then alias.flytonpc("����")
		end
	end
end
------------------------------------------------------------------------------------
-- mp_mj_wxqjob
------------------------------------------------------------------------------------
function mp_mj_wxqjob.timer()
	if roomno_now==461 or roomno_now==469 then run("fill tong;dao water into gang")
	elseif roomname=="�ص�" then run("dig north")
	elseif roomno_now==446 or roomno_now==450 then run("kang shu gan;wield axe;chop tree;unwield axe")
	elseif roomno_now==590 or roomno_now==594 or roomno_now==595 then run("dig;tou ��ʯ in ��¯;da ��")
	elseif roomno_now==539 then run("get xiaohuang shi")
	elseif roomno_now==599 then run("fang ���� in ��¯;dao ��ˮ in ��ǹģ��;add ���� in ��ǹģ��")
	end
end
------------------------------------------------------------------------------------
-- mp_mj_tyjob
------------------------------------------------------------------------------------
function mp_mj_tyjob.dosomething1(n,l,w)
	local a,b,c,d,e
	a,b,c=string.find(w[0],"��һ�죬�������ɫ�Ʋ���ӭȢ��(.+)��")
	if c~=nil and findstring(c,"��Ұ��") then
		if havefj>0 then alias.startworkflow() else run("ask yin yewang about job") end
	elseif c~=nil and findstring(c,"����","ΤһЦ","�ܵ�","��ǫ","��Ө��","����","˵����","��ƽ����","��˹","Ф����","�ⱦ��","ׯ�","�⾢��","����","��Ȼ","��ԫ","�Ų���") then
		mj.tyjobnpc=c
		mj.tyjobnpcid=""
		run("id here;set checknpc")
	end
	if not isopen("boat") and findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
		alias.resetidle()
		AddTimer("mj_tyjob_wait_timer",0,0,30,"",timer_flag.Enabled + timer_flag.OneShot, "alias.tlw")
		alias.mjlianwu()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ lian=over �ı����趨��") then
		alias.resetidle()
		closeclass("skills_lian")
		closeclass("dazuo")
		DeleteTimer("mj_tyjob_wait_timer")
		alias.uw()
		if havefj>0 then alias.startworkflow() else run("h;ask yin yewang about job") end
	end
	a,b,c,d=string.find(l,"^"..tostring(mj.tyjobnpc).."%s+=%s+(%w+)%s+(%w+),%s*")
	if c~=nil and d~=nil then
		mj.tyjobnpcid=string.lower(c).." "..string.lower(d)
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checknpc �ı����趨��") then
		alias.resetidle()
		if mj.tyjobnpcid~=nil and mj.tyjobnpcid~="" then run("halt;give mihan to "..mj.tyjobnpcid) end
		alias.flytonpc("��Ұ��")
	end
	if findstring(l,"˫�ɣ����ɣ����һ��ɣ��ȡ�4 ���� �ܵ� ���еĵ�.+ ������") then
		run("give mihan to zhou dian")
		alias.flytonext()
	end
	if findstring(l,"ȫ��NPC������ϣ�") then
		alias.flytonpc("��Ұ��")
	end
end
function mp_mj_tyjob.dosomething2(n,l,w)
	a,b,c=string.find(w[0],"������Ұ�������йء�job������Ϣ��\n��Ұ��(.+)")
	if c~=nil and findstring(c,"���.+�ܸ��ҽ�����","���������.+����","������ü���ƺ���˵ʲô") then
		run("ask yin yewang about abandon")
		alias.dz(set_neili_global)
	end
end
function mp_mj_tyjob.dosomething3(n,l,w)
	if findstring(w[0],"������Ұ�������йء�job������Ϣ��\n��Ұ����������ļ��\n��Ұ��˵�����ܺã��һ���������ν���ģ�") then
		closeclass("mp_mj_tyjob")
		openclass("mp_mj_pre")
		alias.checkexp("mp")
	end
	a,b,c=string.find(w[0],"������Ұ�������йء�job������Ϣ��\n��Ұ������һ���ܺ���\n��Ұ��˵�������������������͸�(.+)���¹��ش󣬿�ȥ��أ�")
	if c~=nil and findstring(c,"����") then alias.flytonpc("����")
	elseif c~=nil and findstring(c,"Τ����") then alias.flytonpc("ΤһЦ")
	elseif c~=nil and findstring(c,"�ܵ�") then alias.flytonpc("�ܵ�")
	elseif c~=nil and findstring(c,"��ǫ") then alias.flytonpc("��ǫ")
	elseif c~=nil and findstring(c,"��Ө��") then alias.flytonpc("��Ө��")
	elseif c~=nil and findstring(c,"����") then alias.flytonpc("����")
	elseif c~=nil and findstring(c,"˵����") then alias.flytonpc("˵����")
	elseif c~=nil and findstring(c,"��ƽ����") then alias.flytonpc("��ƽ����")
	elseif c~=nil and findstring(c,"��˹") then alias.flytonpc("��˹")
	elseif c~=nil and findstring(c,"Ф����") then alias.flytonpc("Ф����")
	elseif c~=nil and findstring(c,"�ⱦ��") then alias.flytonpc("�ⱦ��")
	elseif c~=nil and findstring(c,"ׯ�") then alias.flytonpc("ׯ�")
	elseif c~=nil and findstring(c,"�⾢��") then alias.flytonpc("�⾢��")
	elseif c~=nil and findstring(c,"����") then alias.flytonpc("����")
	elseif c~=nil and findstring(c,"��Ȼ") then alias.flytonpc("��Ȼ")
	elseif c~=nil and findstring(c,"��ԫ") then alias.flytonpc("��ԫ")
	elseif c~=nil and findstring(c,"�Ų���") then alias.flytonpc("�Ų���")
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function mp_mj.update()
	local  mp_mj_pre_triggerlist={
	       {name="mp_mj_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_mj_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_mj_pre_triggerlist) do
		addtri(v.name,v.regexp,"mp_mj_pre",v.script,v.line)
	end
	closeclass("mp_mj_pre")
	
	local  mp_mj_yudi_triggerlist={
	       {name="mp_mj_yudi_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_mj_yudi.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_mj_yudi_triggerlist) do
		addtri(v.name,v.regexp,"mp_mj_yudi",v.script,v.line)
	end
	closeclass("mp_mj_yudi")
	
	local  mp_mj_wxq_triggerlist={
	       {name="mp_mj_wxq_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_mj_wxq.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_mj_wxq_triggerlist) do
		addtri(v.name,v.regexp,"mp_mj_wxq",v.script,v.line)
	end
	local _tb2={
		"����.+�����йء�.+������Ϣ��\\n(.+)\\Z",
	}
	local  mp_mj_wxq_m_triggerlist={
			{name="mp_mj_wxq_m_dosth2",line=2,regexp=linktri2(_tb2),script=function(n,l,w)    mp_mj_wxq.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(mp_mj_wxq_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_mj_wxq",v.script,v.line)
	end
	closeclass("mp_mj_wxq")
	AddTimer("mp_mj_wxqjob_timer", 0, 0, 1, "", timer_flag.Enabled + timer_flag.Replace, "mp_mj_wxqjob.timer")
	SetTimerOption("mp_mj_wxqjob_timer", "group", "mp_mj_wxqjob")
	closeclass("mp_mj_wxqjob")
	
	local  mp_mj_tyjob_triggerlist={
	       {name="mp_mj_tyjob_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_mj_tyjob.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_mj_tyjob_triggerlist) do
		addtri(v.name,v.regexp,"mp_mj_tyjob",v.script,v.line)
	end
	local _tb2={
		"������Ұ�������йء�job������Ϣ��\\n(.+)\\Z",
	}
	local _tb3={
		"������Ұ�������йء�job������Ϣ��\\n(.+)\\n(.+)\\Z",
	}
	local  mp_mj_tyjob_m_triggerlist={
			{name="mp_mj_tyjob_m_dosth2",line=2,regexp=linktri2(_tb2),script=function(n,l,w)    mp_mj_tyjob.dosomething2(n,l,w)  end,},
			{name="mp_mj_tyjob_m_dosth3",line=3,regexp=linktri2(_tb3),script=function(n,l,w)    mp_mj_tyjob.dosomething3(n,l,w)  end,},
	}
	for k,v in pairs(mp_mj_tyjob_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_mj_tyjob",v.script,v.line)
	end
	closeclass("mp_mj_tyjob")
	
	local noecho_trilist={
			"����æ����",
			"�����ڲ�æ��",
			"����û������ˡ�",
			"ʲô��",
			"�㲢û��װ������������Ϊ����",
			"ֻ�ܶ�ս���еĶ���ʹ��",
			}
	local _noechotri=linktri(noecho_trilist)

	addtri("mp_mj_watch_gag_dosth1",_noechotri,"mp_mj_watch","")
	SetTriggerOption("mp_mj_watch_gag_dosth1","omit_from_output",1)
end
mp_mj.update()