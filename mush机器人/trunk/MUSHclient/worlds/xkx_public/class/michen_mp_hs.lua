mp_hs={}
mp_hs_pre={}
mp_hs_watch={}
mp_hs_start={}

mmr={
	searchlist="s|w|s|s|e|n|ne|se|sw|n|w|n",
	searchroomno="2010|2011|2012|2013|2014|2015|2016|2018|2017|2016|2010|841",
	searchid=3,
	findmmr=0,
	name="",
	id="",
	targetNum=3,
	havenum=1,
	oneexp=149,
	corpseid=-1,
	err=0,
	givenum=0,
}

------------------------------------------------------------------------------------
-- mp_hs_pre
------------------------------------------------------------------------------------
function mp_hs_pre.dosomething1(n,l,w)
	local _f,_tb,a,b,c
	wait.make(function()
		if findstring(l,"��Ŀǰ��û���κ�Ϊ giveling=yes �ı����趨��") then
			if mmr.givenum>0 then
				if mpLimited.mpexp<4750 or os.time()>(mpLimited.MarkTime+3600) then
					print("�������� "..mmr.givenum.." ��")
					run("give yue "..mmr.givenum.." ling")
					mmr.havenum=mmr.havenum+mmr.givenum
					have.ling=have.ling-mmr.givenum
					print("ʣ��"..have.ling.."��")
				else
					print("�������� "..have.ling.." ��")
					for i=1,20,1 do run("give yue ling") end
					run("set check=mmrLimited")
					mmr.havenum=have.ling
					have.ling=0
				end
			else
				print("������ɣ���ǰMPEXPֵ "..mpLimited.mpexp)
				if hp.neili<(hp.maxneili*set_neili_global/100) then alias.dz(set_neili) else alias.startworkflow() end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=mmrLimited �ı����趨��") then
			if mpJobLimited>0 then
				print("����ͳ�Ƶ�������mmr����Ϊ��"..mpLimited.mpexp)
				if mpLimited.stat()==0 then
					-- ������ʱ����ȴ������Ƴٸ���2����
					mpLimited.MarkTime=os.time()-3600+120
				end
				mpLimited.MarkExp=mpLimited.mpexp
				alias.setTargetNum()
				if hp.neili<(hp.maxneili*set_neili_global/100) then alias.dz(set_neili) else alias.startworkflow() end
			else alias.checkexp("mp") end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			if not isopen("boat") then
				alias.resetidle()
				alias.startworkflow()
			end
		end
		if findstring(l,"��û����ô�����ͭ���ơ�") then
			if have.ling~=nil and have.ling>0 then
				print("Ҫ��������Լ���")
				mmr.havenum=mmr.havenum-1
				have.ling=have.ling+mmr.givenum
				have.ling=have.ling-1
				run("set giveling=yes")
			else
				print("������ɣ���ǰMPEXPֵ "..mpLimited.mpexp)
				if hp.neili<(hp.maxneili*set_neili_global/100) then alias.dz(set_neili) else alias.startworkflow() end
			end
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ������Ⱥ��") then
			print("��ǰMPEXPֵ "..mpLimited.mpexp)
			print("������ "..have.ling.."��")
			mmr.havenum=0
			_f=function()
						for i=1,20,1 do run("give yue ling") end
						run("set check=mmrLimited")
						mmr.havenum=have.ling
						have.ling=0
				end
			wait.time(1);_f()
		end
		if findstring(l,"����������������һ����") then
			print("������ɣ���ǰMPEXPֵ "..mpLimited.mpexp)
			if hp.neili<(hp.maxneili*set_neili_global/100) then alias.dz(set_neili) else alias.startworkflow() end
		end
		a,b,c=string.find(l,"������(.+)��ɱ���㣡")
		if c~=nil then
			mmr.name=c
			mmr.findmmr=1
		end
		if findstring(l,"����Ⱥ�������ʵ����������ƺ�������ġ�������������ģ�") then
			alias.resetidle()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ searchmmr=yes �ı����趨��") then
			alias.resetidle()
			safego="/alias.flytoid("..me.menpaiJobStart..")"
			SaveBack="south"
			if mmr.err>0 then
				alias.flytoid(me.menpaiJobStart)
			else
				if mmr.findmmr>0 then
					closeclass("mp_hs_pre")
					openclass("mp_hs_start")
					run("id here;set checkmmrid=yes")
					alias.yjl()
				else
					_tb=utils.split(mmr.searchlist,"|")
					if mmr.searchid>table.getn(_tb) then mmr.searchid=1 end
					run(_tb[mmr.searchid])
					_tb=utils.split(mmr.searchroomno,"|")
					roomno_now=_tb[mmr.searchid]
					mmr.searchid=mmr.searchid+1
					if cmd.nums<20 then
						run("set searchmmr=yes")
					else
						alias.yjl()
						_f=function() run("set searchmmr=yes") end
						wait.time(2);_f()
					end
				end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
			alias.resetidle()
			if have.ling>=mmr.targetNum and have.ling>0 then
				if mpJobLimited>0 then alias.startworkflow() else alias.flytonpc("����Ⱥ") end
			else alias.flytoid(me.menpaiJobStart) end
		end
		a,b,c=string.find(l,"�������磬���ֵ�ͼ��(%d+)�������")
		if c~=nil and tonumber(c)==tonumber(me.menpaiJobStart) then
			alias.resetidle()
			mmr.findmmr=0
			mmr.searchid=1
			mmr.err=0
			mmr.id=""
			mmr.name=""
			alias.dz(set_neili)
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=mp �ı����趨��") then
			alias.resetidle()
			alias.yjl()
			alias.et()
			if add.exp>10 and mmr.havenum>10 then mmr.oneexp=math.floor(add.exp/mmr.havenum) end
			alias.setTargetNum()
			if mpLimited.mpexp>me.menpaiLimited then
				mpJobLimited=1
				print("����ͳ�Ƶ���mmr����Ϊ��"..mpLimited.mpexp)
				if mpLimited.mpexp<me.menpaiLimited then mpLimited.MarkExp=me.menpaiLimited else mpLimited.MarkExp=mpLimited.mpexp end
			end
			print("������ɣ���ǰMPEXPֵ "..mpLimited.mpexp)
			if hp.neili<(hp.maxneili*set_neili_global/100) then alias.dz(set_neili) else alias.startworkflow() end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=mmr �ı����趨��") then
			alias.resetidle()
			alias.yjl()
			alias.et()
			if hp.neili<(hp.maxneili*set_neili_global/100) then alias.dz(set_neili) else alias.startworkflow() end
		end
		a,b,c=string.find(w[0],"����Ⱥ˵������ʱ������˶���ˣ�\n����Ⱥ˵����(.+)����Щ�����������ţ����Һúóﻮ���д�ơ�")
		if c~=nil and c==me.charname then
			mpJobLimited=1
		end
		a,b,c=string.find(w[0],"����Ⱥ����üͷ˵��������а�ɵ���ͭ����ǵ����к���ͼ��\n����Ⱥ˵����(.+)�����÷ǳ��ã�����ȥ��Ϣ�ɡ�")
		if c~=nil and c==me.charname then
			alias.resetidle()
			mpJobLimited=0
		end
	end)
end
------------------------------------------------------------------------------------
-- mp_hs_start
------------------------------------------------------------------------------------
function mp_hs_start.dosomething1(n,l,w)
	local _tb,a,b,c,d,e,f
	if findstring(l,"�������ڵ��ӣ�����������ͷ��ò�Ҫʹ�ý��ھ���������ͬ�ų�Ц��") then
		pfmid=pfmid+1
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ killover=yes �ı����趨��") then
		alias.resetidle()
		run("get silver;get silver from corpse")
		if have.getlingdummy==nil or have.getlingdummy==0 then
			if mmr.corpseid>1 then run("get ling from corpse "..mmr.corpseid) else run("get ling from corpse") end
		end
		mmr.corpseid=-1
		alias.yjl()
		run("set getling=yes")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ getling=yes �ı����趨��") then
		alias.resetidle()
		closeclass("mp_hs_start")
		openclass("mp_hs_pre")
		mmr.findmmr=0
		mmr.err=0
		mmr.id=""
		mmr.name=""
		if not isopen("check_items") then
			print("Ŀǰ������ "..have.ling.." ����Ŀ��Ϊ "..mmr.targetNum.."�����ϴ�����ʱ�㵽Ŀǰ�Ĺ�������Ϊ��"..mpLimited.mpexp)
		end
		if have.ling>=mmr.targetNum or (stat.leidong==nil or stat.leidong==0) or hp.neili<(hp.maxneili*set_neili_job/100) then
			alias.checkitems()
		else
			run("halt")
			alias.startworkflow()
		end
	end
	a,b,c=string.find(l,"[> ]*(.+)��˵���������ܵÿ죬�����浹ù��")
	if c~=nil and c==mmr.name then
		alias.resetidle()
		if hp.neili<(hp.maxneili*set_neili_global/100) then alias.dz(set_neili) else alias.startworkflow() end
	end
	a,b,c,d,e,f=string.find(l,"(%S+)%s+=%s+(%w+) (%w+), (%w+)")
	if c~=nil and d~=nil and e~=nil and d~=nil and c==mmr.name then
		alias.resetidle()
		run("hp")
		mmr.id=d.." "..e
		have.getlingdummy=0
		_tb=utils.split(mpyun,"|")
		for k,v in ipairs(_tb) do run(v) end
		openclass("kill")
		run("unset no_parry")
		openclass("kill_"..me.menpai)
		closeclass("kill_run")
		AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
		SetTimerOption("kill_timer", "group", "kill")
		runaway=false
		npcfaint=false
		killRunSuccess=false
		if tonumber(stat.leidong)~=nil and stat.leidong>0 then pfmid=2 else pfmid=1 end
		killid=mmr.id
		killname=mmr.name
		killskill=mpweapon
		killpfm=mppfm
		killyun=mpyun
		killjiali=mpjiali
		killjiajin=mpjiajin
		run("jiali "..mpjiali..";jiajin "..mpjiajin)
		_tb=utils.split(mppfm,"|")
		if findstring(_tb[pfmid],"leidong") then
			alias.uw()
			if me.master=="������" and mpweapon=="jian" then run("jifa dodge dugu-jiujian") else run("jifa parry pishi-poyu") end
		else
			if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
			wieldweapon=1
			if me.master=="������" and mpweapon=="jian" then run("jifa dodge dugu-jiujian")
			else
				if mpweapon=="jian" then run("jifa parry huashan-jianfa")
				else
					if mpweapon=="staff" or mpweapon=="qin" then run("jifa parry jinhua-zhang") end
				end
			end
		end
		run("kill "..mmr.id)
		_tb=utils.split(mppfm,"|")
		if pfmid<=table.getn(_tb) then run(_tb[pfmid].." "..mmr.id) end
	end
end
------------------------------------------------------------------------------------
-- mp_hs_watch
------------------------------------------------------------------------------------
function mp_hs_watch.dosomething1(n,l,w)
	local a,b,c
	if findstring(l,".+����һ����ͭ���ơ�") then
		have.getlingdummy=1
		alias.resetidle()
		have.ling=have.ling+1
		alias.setTargetNum()
	end
	if findstring(l,".+����Ķ�������˵�������æ���ˣ����ʬ��û�") then
		have.getlingdummy=1
		alias.resetidle()
		alias.setTargetNum()
	end
	if findstring(l,"�������û�г�·��") then
		mmr.err=1
	end
	if findstring(l,"���.+��ʬ�������ѳ�һ����ͭ���ơ�") then
		alias.resetidle()
		have.ling=have.ling+1
		alias.setTargetNum()
	end
	a,b,c=string.find(l,"[> ]*(.-)���ڵ��ϣ������˼��¾����ˡ�")
	if c~=nil then
		if c==mmr.name then mmr.corpseid=0 end
		if mmr.corpseid>=0 then mmr.corpseid=mmr.corpseid+1 end
	end
	a,b,c=string.find(l,"[> ]*(.-)������.-�뿪��")
	if c~=nil and c==mmr.name then
		alias.checkbusy("killover")
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function mp_hs.update()
	local  mp_hs_pre_triggerlist={
	       {name="mp_hs_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_hs_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_hs_pre_triggerlist) do
		addtri(v.name,v.regexp,"mp_hs_pre",v.script,v.line)
	end
	local _tb={
		"����Ⱥ˵������ʱ������˶���ˣ�\\n����Ⱥ˵����(.+)����Щ�����������ţ����Һúóﻮ���д�ơ�\\Z",
		"����Ⱥ����üͷ˵��������а�ɵ���ͭ����ǵ����к���ͼ��\\n����Ⱥ˵����(.+)�����÷ǳ��ã�����ȥ��Ϣ�ɡ�\\Z",
	}
	local  mp_hs_pre_m_triggerlist={
	       {name="mp_hs_pre_m_dosth1",line=2,regexp=linktri2(_tb),script=function(n,l,w)    mp_hs_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_hs_pre_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_hs_pre",v.script,v.line)
	end
	closeclass("mp_hs_pre")
	
	local  mp_hs_start_triggerlist={
	       {name="mp_hs_start_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_hs_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_hs_start_triggerlist) do
		addtri(v.name,v.regexp,"mp_hs_start",v.script,v.line)
	end
	closeclass("mp_hs_start")
	
	local  mp_hs_watch_triggerlist={
	       {name="mp_hs_watch_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_hs_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_hs_watch_triggerlist) do
		addtri(v.name,v.regexp,"mp_hs_watch",v.script,v.line)
	end
	closeclass("mp_hs_watch")
end
mp_hs.update()
