mp_xx={}
mp_xx_pre={}
mp_xx_start={}
mp_xx_watch={}
mp_xx_pre_sandu={}
mp_xx_pre_suck={}
mp_xx_start_catch={}
mp_xx_start_sandu={}
mp_xx_start_search={}
mp_xx_xiulian={}
mp_xx_kmmr={}

xx={
	needsandu=0,
	suck=0,
	sucknow=1,
	suckid="",
	suckname="",
	suckroom=0,
	npcname="",
	npcid="",
	bugout=0,
	bugname="",
	bugid="",
	havebug=0,
}
mmr={
	searchlist="s|w|s|s|e|n|ne|se|sw|n|w|n",
	searchroomno="2010|2011|2012|2013|2014|2015|2016|2018|2017|2016|2010|841",
	searchid=3,
	findmmr=0,
	name="",
	id="",
	targetNum=30,
	havenum=1,
	oneexp=149,
	corpseid=-1,
	err=0,
	givenum=0,
}
xxsuck_list={}
table.insert(xxsuck_list,{suckid="haoshou",suckname="�����ɺ���",suckroom=1437})
table.insert(xxsuck_list,{suckid="gushou",suckname="�����ɹ���",suckroom=1437})
table.insert(xxsuck_list,{suckid="boshou",suckname="����������",suckroom=1437})
table.insert(xxsuck_list,{suckid="haoshou",suckname="�����ɺ���",suckroom=1435})
table.insert(xxsuck_list,{suckid="gushou",suckname="�����ɹ���",suckroom=1435})
table.insert(xxsuck_list,{suckid="boshou",suckname="����������",suckroom=1435})
table.insert(xxsuck_list,{suckid="haoshou",suckname="�����ɺ���",suckroom=1444})
table.insert(xxsuck_list,{suckid="gushou",suckname="�����ɹ���",suckroom=1444})
table.insert(xxsuck_list,{suckid="boshou",suckname="����������",suckroom=1444})
table.insert(xxsuck_list,{suckid="haoshou",suckname="�����ɺ���",suckroom=1440})
table.insert(xxsuck_list,{suckid="gushou",suckname="�����ɹ���",suckroom=1440})
table.insert(xxsuck_list,{suckid="boshou",suckname="����������",suckroom=1440})
table.insert(xxsuck_list,{suckid="haoshou",suckname="�����ɺ���",suckroom=1441})
table.insert(xxsuck_list,{suckid="gushou",suckname="�����ɹ���",suckroom=1441})
table.insert(xxsuck_list,{suckid="boshou",suckname="����������",suckroom=1441})
table.insert(xxsuck_list,{suckid="boshou",suckname="����������",suckroom=1329})
table.insert(xxsuck_list,{suckid="hazakh",suckname="������",suckroom=1328})
table.insert(xxsuck_list,{suckid="binu",suckname="�Ů",suckroom=1327})
table.insert(xxsuck_list,{suckid="woman",suckname="ά����帾Ů",suckroom=1333})
table.insert(xxsuck_list,{suckid="kid",suckname="С��",suckroom=1336})
table.insert(xxsuck_list,{suckid="hu",suckname="����ү",suckroom=1336})
--table.insert(xxsuck_list,{suckid="li",suckname="������",suckroom=1335})
table.insert(xxsuck_list,{suckid="girl",suckname="������Ů",suckroom=1447})
table.insert(xxsuck_list,{suckid="girl",suckname="������Ů",suckroom=1447})
table.insert(xxsuck_list,{suckid="sheng",suckname="����",suckroom=1376})
table.insert(xxsuck_list,{suckid="dao",suckname="��ͯ",suckroom=1376})
table.insert(xxsuck_list,{suckid="lama",suckname="С����",suckroom=1376})
table.insert(xxsuck_list,{suckid="ke",suckname="����",suckroom=1373})
table.insert(xxsuck_list,{suckid="boy",suckname="��ͯ",suckroom=939})
table.insert(xxsuck_list,{suckid="boy",suckname="��ͯ",suckroom=939})
table.insert(xxsuck_list,{suckid="girl",suckname="Ů��",suckroom=820})
table.insert(xxsuck_list,{suckid="boy",suckname="�к�",suckroom=820})
table.insert(xxsuck_list,{suckid="man",suckname="�",suckroom=827})
table.insert(xxsuck_list,{suckid="girl",suckname="Ů��",suckroom=832})
table.insert(xxsuck_list,{suckid="kid",suckname="С��",suckroom=813})
table.insert(xxsuck_list,{suckid="kid",suckname="С��",suckroom=813})
table.insert(xxsuck_list,{suckid="boy",suckname="�к�",suckroom=838})
------------------------------------------------------------------------------------
-- mp_xx_pre
------------------------------------------------------------------------------------
function mp_xx_pre.dosomething1(n,l,w)
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkhp �ı����趨��") then
		alias.resetidle()
		-- #if @debug {#say ��ʼ���״̬���ж���״̬���þ�ȥsuck npc��}
		if stat.havedu>0 or hp.healthjing<100 or hp.healthqi<100 or hp.neili<(hp.maxneili*120/100) then
			print("��ʼsuck����")
			xx.suckid=xxsuck_list[xx.sucknow]["suckid"]
			xx.suckname=xxsuck_list[xx.sucknow]["suckname"]
			xx.suckroom=xxsuck_list[xx.sucknow]["suckroom"]
			alias.flytoid(xx.suckroom)
		else
			run("yun regenerate;yun refresh;yun recover")
			if havefj>0 then alias.startworkflow()
			else
				closeclass("mp_xx_pre")
				closeclass("mp_xx_pre_suck")
				closeclass("mp_xx_pre_sandu")
				--if xx.needsandu>0 and hp.exp>150000 then
				if hp.exp>150000 then
					print("��ʼsearch bug")
					openclass("mp_xx_start")
					alias.flytoid(1442)
				else
					print("��ʼkmmr")
					openclass("mp_xx_kmmr")
					alias.flytoid(841)
				end
			end
		end
	end
	if findstring(l,"�������磬���ֵ�ͼ��"..tostring(xx.suckroom).."�������") then
		alias.resetidle()
		run("ask "..tostring(xx.suckid).." about ������")
	end
	if findstring(l,"����û�� "..tostring(xx.suckid)) then
		alias.resetidle()
		xx.sucknow=xx.sucknow+1
		run("yield no")
		alias.checkbusy("pre")
	end
	if findstring(l,"����"..tostring(xx.suckname).."�����йء������󷨡�����Ϣ��") then
		alias.resetidle()
		run("yield yes;kill "..tostring(xx.suckid)..";yun jiemai "..tostring(xx.suckid))
		openclass("mp_xx_pre_suck")
	end
	if findstring(l,"��æ���أ���Ȼ�����ʻ��ɡ�","�Է���æ���أ���Ȼ�����ʻ��ɡ�") then
		alias.resetidle()
		wait.make(function()
		_f=function() run("ask "..tostring(xx.suckid).." about ������") end
		wait.time(1);_f()
		end)
	end
	if findstring(l,"^[> ]*"..tostring(xx.suckname).."�Ѿ�.+��ɢ�����Ѿ��޷�����������ȡ") then
		alias.resetidle()
		run("yield no")
	end
	if findstring(l,"^[> ]*"..tostring(xx.suckname).."����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
		alias.resetidle()
		closeclass("mp_xx_pre_suck")
		closeclass("mp_xx_pre_sandu")
		if stat.havedu>0 then
			print("��Ҫɢ��")
			run("yield yes")
			openclass("mp_xx_pre_sandu")
		else run("yield no") end
	end
	if findstring(l,"^[> ]*"..tostring(xx.suckname).."���ڵ��ϣ������˼��¾����ˡ�") then
		alias.resetidle()
		closeclass("mp_xx_pre_suck")
		closeclass("mp_xx_pre_sandu")
		xx.sucknow=xx.sucknow+1
		run("yield no")
		alias.checkbusy("pre")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
		alias.resetidle()
		--xx.sucknow=1
		if hp.neili<500 then alias.dz(set_neili) else alias.checkbusy("pre") end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
		alias.resetidle()
		if not isopen("boat") then run("hp;set checkhp") end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=pre �ı����趨��") then
		alias.resetidle()
		if xx.sucknow>table.getn(xxsuck_list) then xx.sucknow=1 end
		run("hp;set checkhp")
		--if xx.sucknow>table.getn(xxsuck_list) then 
		--	xx.sucknow=1
		--	alias.dz(set_neili)
		--else
		--	run("yun regenerate;yun refresh;yun recover;hp;set checkhp")
		--end
	end
end
------------------------------------------------------------------------------------
-- mp_xx_pre_sandu
------------------------------------------------------------------------------------
function mp_xx_pre_sandu.timer()
	alias.resetidle()
	alias.uw()
	run("perform sandu")
end
------------------------------------------------------------------------------------
-- mp_xx_pre_suck
------------------------------------------------------------------------------------
function mp_xx_pre_suck.timer()
	alias.resetidle()
	run("yun jiemai "..tostring(xx.suckid)..";yun jiexin "..tostring(xx.suckid))
end
------------------------------------------------------------------------------------
-- mp_xx_start
------------------------------------------------------------------------------------
function mp_xx_start.dosomething1(n,l,w)
	local _tb,a,b,c,d
	if findstring(l,"��Ŀǰ��û���κ�Ϊ killover=yes �ı����趨��") then
		alias.checkexp("mp")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=mp �ı����趨��") then
		alias.resetidle()
		if add.exp>10 and mpLimited.MarkExp<me.menpaiLimited then mpLimited.MarkExp=tonumber(me.menpaiLimited) end
		if add.exp<10 then
			mpJobLimited=1
			print("ͳ�Ƶ���SUCK����Ϊ��"..mpLimited.mpexp)
			mpLimited.MarkExp=tonumber(mpLimited.mpexp)
			if mpLimited.MarkTime<(os.time()-3600) then
				-- ��ʱ��ȴ��Ȼbusy���Ƴ�2����
				mpLimited.MarkTime=tonumber(os.time()-3600+120)
			end
		end
		alias.checkbusy("sb")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=goquit �ı����趨��") then
		alias.flytoid(1436)
	end
	if findstring(l,"�������磬���ֵ�ͼ��1442�������") then
		alias.resetidle()
		if xx_xiulian>0 then
			run("give du dan to ding chunqiu;give du dan to ding chunqiu;give du dan to ding chunqiu")
		end
		run("give ling pai to ding chunqiu;give ling pai to ding chunqiu;give ling pai to ding chunqiu")
		run("ask ding about job")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ killnpc �ı����趨��") then
		alias.resetidle()
		if string.len(mpweapon)==0 then run("blow di") end
		_tb=utils.split(mpyun,"|")
		for k,v in ipairs(_tb) do run(v) end
		openclass("kill")
		run("unset no_parry")
		openclass("kill_"..me.menpai)
		closeclass("kill_run")
		AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
		SetTimerOption("kill_timer", "group", "kill")
		xx.suck=2
		reyun=1
		runaway=false
		npcfaint=false
		killRunSuccess=false
		killid=xx.npcid
		killname=xx.npcname
		killskill=mpweapon
		killpfm=mppfm
		killyun=mpyun
		killjiali=mpjiali
		killjiajin=mpjiajin
		run("jiali "..mpjiali..";jiajin "..mpjiajin)
		if string.len(mpweapon)>0 then
			if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
		else alias.uw() end
		run("kill "..tostring(killid))
		_tb=utils.split(mppfm,"|")
		for k,v in ipairs(_tb) do run(tostring(v).." "..tostring(xx.npcid)) end
	end
	if findstring(l,"^[> ]*"..tostring(xx.bugname).."ͻȻ�굽һƬ��Ҷ���棬��Ӱȫ�ޡ�","�ⶫ����ò�Ҫץ��","�����ҳ����ģ������˼ץ��","����û��������") then
		if not isopen("kill") then
			alias.resetidle()
			closeclass("mp_xx_start_catch")
			openclass("mp_xx_start_search")
			run("yield no")
			xx.bugname=""
			xx.bugout=0
		end
	end
	if findstring(l,"������Ȼ�ȥ�������������ɵȼ��ˡ�") then
		alias.resetidle()
		closeclass("mp_xx_start_catch")
		openclass("mp_xx_xiulian")
		alias.checkbusy("xiulian")
	end
	if findstring(l,"��������е��߹��͵ؽ�"..tostring(xx.bugname).."��ס��Ȼ��С������ؽ��߹޷�������ס��","�Ѿ��ж����ˣ������ɡ�") then
		alias.resetidle()
		closeclass("mp_xx_start_catch")
		openclass("mp_xx_xiulian")
		run("yield no")
		xx.havebug=1
		alias.checkbusy("xiulian")
	end
	if findstring(l,"���ҵ�������ʲô��ʢ�أ�") then
		alias.resetidle()
		closeclass("mp_xx_start_sandu")
		closeclass("mp_xx_start_search")
		print("�߹�ˤ���ˣ���Ҫrelogin")
		run("get gold")
		alias.checkbusy("goquit")
	end
	if findstring(l,"^[> ]*"..tostring(xx.npcname).."����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
		alias.resetidle()
		closeclass("mp_xx_start_sandu")
		closeclass("mp_xx_start_search")
		if xx.needsandu>0 or stat.havedu>0 then
			print("��Ҫɢ��")
			run("yield yes")
			openclass("mp_xx_start_sandu")
		else run("yield no") end
		rekill=1
	end
	if findstring(l,"^[> ]*"..tostring(xx.npcname).."���ڵ��ϣ������˼��¾����ˡ�") then
		alias.resetidle()
		closeclass("mp_xx_start_sandu")
		closeclass("mp_xx_start_search")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=sb �ı����趨��") then
		alias.resetidle()
		closeclass("mp_xx_start_sandu")
		closeclass("mp_xx_start_search")
		alias.uw()
		run("get ling pai;yun regenerate;yun refresh;yun recover")
		alias.startworkflow()
		--if havefj>0 then alias.startworkflow() else openclass("mp_xx_start_search") end
	end
	if findstring(l,"�������磬���ֵ�ͼ��1436�������") then
		alias.resetidle()
		run("n;give du dan to ding chunqiu;give du dan to ding chunqiu;give du dan to ding chunqiu;give ling pai to ding chunqiu;give ling pai to ding chunqiu;give ling pai to ding chunqiu;s")
		openclass("quit")
	end
	a,b,c=string.find(l,"������(.+)��ɱ���㣡")
	if c~=nil and findstring(c,"���޶���","����Ы","�쾦��","����","���ļ׳�","Ұ��","����֩��") then
		alias.resetidle()
		xx.bugname=c
		if xx.bugname=="���޶���" then xx.bugid="zhu" end
		if xx.bugname=="����Ы" then xx.bugid="xie" end
		if xx.bugname=="�쾦��" then xx.bugid="wa" end
		if xx.bugname=="����" then xx.bugid="e" end
		if xx.bugname=="���ļ׳�" then xx.bugid="chong" end
		if xx.bugname=="Ұ��" then xx.bugid="bee" end
		if xx.bugname=="����֩��" then xx.bugid="bee" end
		if xx_xiulian>0 then
			closeclass("mp_xx_start_search")
			openclass("mp_xx_start_catch")
			run("yield yes")
		else
			run("yield no")
		--	run("yield no;kill "..tostring(xx.bugid))
		end
	end
	if c~=nil and findstring(c,"�����ֿ�","Ҷ��ɽ","�߿���","����","��־��","����","����","����") then
		alias.resetidle()
		xx.npcname=c
	end
	if findstring(w[0],"���򶡴�������йء�job������Ϣ��\n������˵���������������������ҪһЩ�������㵽��ɽ��Щ�����Ұɡ���","���򶡴�������йء�job������Ϣ��\n������˵������С�ӣ���һ������û����ɾ͸������ҹ�����") then
		alias.resetidle()
		alias.et()
		run("yield no;s;ne;nw;n")
		alias.wi()
		xx.npcname=""
		closeclass("mp_xx_start_sandu")
		openclass("mp_xx_start_search")
	end
	if findstring(l,"���ж��ˣ�") then
		stat.havedu=1
	end
	a,b,c,d=string.find(l,tostring(xx.npcname).."%s+=%s+(%w+)%s+(%w+),%s+")
	if c~=nil and d~=nil then
		xx.npcid=string.lower(c).." "..string.lower(d)
	end
	a,b,c=string.find(l,tostring(xx.npcname).."%s+=%s+(%w+),%s+")
	if c~=nil then
		xx.npcid=string.lower(c)
	end
end
------------------------------------------------------------------------------------
-- mp_xx_start_catch
------------------------------------------------------------------------------------
function mp_xx_start_catch.timer()
	alias.resetidle()
	run("kou "..tostring(xx.bugid))
end
------------------------------------------------------------------------------------
-- mp_xx_start_sandu
------------------------------------------------------------------------------------
function mp_xx_start_sandu.timer()
	alias.resetidle()
	alias.uw()
	run("kill "..xx.npcid..";perform sandu")
end
------------------------------------------------------------------------------------
-- mp_xx_start_search
------------------------------------------------------------------------------------
function mp_xx_start_search.timer()
	alias.resetidle()
	if xx.npcname~="" then
		closeclass("mp_xx_start_search")
		run("id here;set killnpc")
	else
		if havefj>0 then alias.startworkflow() else run("search bug") end
	end
end
------------------------------------------------------------------------------------
-- mp_xx_watch
------------------------------------------------------------------------------------
function mp_xx_watch.dosomething1(n,l,w)
	if findstring(l,"��һ������.+�ؿڣ�����.+����̫�����㷴���ܰѶ����Ƴ�ȥ����������") then
		stat.havedu=0
		rekill=1
		run("yield no")
	end
	if findstring(l,"��һ������.+�ؿڣ������������ֿ���˳�ư������������ƽ�.+���ڡ�") then
		stat.havedu=0
		rekill=1
		run("yield no")
		xx.needsandu=0
	end
	if findstring(l,"����ֻ����ս���жԶ���ʹ�á�","����ֻ����ս���жԶ���ʹ�á�") then
		rekill=1
	end
end
------------------------------------------------------------------------------------
-- mp_xx_xiulian
------------------------------------------------------------------------------------
function mp_xx_xiulian.dosomething1(n,l,w)
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=xiulian �ı����趨��") then
		alias.resetidle()
		if havefj>0 then alias.startworkflow() else run("xiulian") end
	end
	if findstring(l,"�㽫��"..tostring(xx.bugname).."�ó��߹ޣ���������ʿ����ó�һ������Ѫ�ĵ�������","û�ж��棬����Ҫ�ÿ���������") then
		alias.resetidle()
		closeclass("mp_xx_xiulian")
		xx.bugname=""
		if xx.havebug>0 then
			closeclass("mp_xx_start_sandu")
			closeclass("mp_xx_start_search")
			print("��Ҫrelogin")
			alias.checkbusy("goquit")
		else
			alias.uw()
			run("yun regenerate;yun refresh;yun recover")
			alias.startworkflow()
		end
	end
	if findstring(l,"����æ���ء�") then
		alias.resetidle()
		alias.checkbusy("xiulian")
	end
	if findstring(l,"^[> ]*"..tostring(xx.bugname).."���Ӹ߸�����ž��һ������޵ס�") then
		alias.resetidle()
		run("xiulian")
	end
	if findstring(l,"������������סȫ���Ѩ��Ȼ������۾�����ָ�����߹ޡ�") then
		xx.havebug=0
	end
end
------------------------------------------------------------------------------------
-- mp_xx_kmmr
------------------------------------------------------------------------------------
function mp_xx_kmmr.dosomething1(n,l,w)
	local _f,_tb,_t,a,b,c,d,e,f
	if findstring(l,"�������磬���ֵ�ͼ��841�������") then
		alias.resetidle()
		mmr.findmmr=0
		mmr.searchid=1
		mmr.err=0
		run("yun recover")
		if me.shen<(0-(hp.exp/3)) then
			run("set searchmmr=yes")
		else
			xx.needsandu=1
			alias.startworkflow()
		end
	end
	if findstring(l,"�������磬���ֵ�ͼ��856�������") then
		alias.resetidle()
		mmr.findmmr=0
		mmr.err=0
		run("drop "..mmr.id..";drop corpse;drop skeleton;yun recover")
		alias.checkexp("mp")
	end
	if findstring(l,"yunbusy����","��������") then
		closeclass("kill")
		alias.flytoid(856)
	end
	a,b,c=string.find(l,"(.+)����һ�����ȣ����ڵ��ϻ��˹�ȥ��")
	if c~=nil and c==mmr.name then run("halt");alias.checkbusy("killover") end
	a,b,c=string.find(l,"[> ]*(.-)������.-�뿪��")
	if c~=nil and c==mmr.name then alias.checkbusy("killover") end
	a,b,c=string.find(l,"[> ]*(.-)ͻȻ��һ����������սȦ�����ˣ�")
	if c~=nil and c==mmr.name then alias.checkbusy("killover") end
	--a,b,c=string.find(l,"[> ]*(.-)������.-�뿪��","[> ]*(.-)ͻȻ��һ����������սȦ�����ˣ�")
	--if c~=nil and c==mmr.name then
	--	alias.checkbusy("killover")
	--end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=killover �ı����趨��") then
		alias.resetidle()
		run("get silver;get silver from corpse;get silver from "..mmr.id..";get "..mmr.id)
		alias.flytoid(856)
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=mp �ı����趨��") then
		alias.resetidle()
		if add.exp>10 and mpLimited.MarkExp<me.menpaiLimited then mpLimited.MarkExp=tonumber(me.menpaiLimited) end
		if add.exp<10 then
			mpJobLimited=1
			print("ͳ�Ƶ���suck����Ϊ��"..mpLimited.mpexp)
			mpLimited.MarkExp=tonumber(mpLimited.mpexp)
			if mpLimited.MarkTime<(os.time()-3600) then
				-- ��suckʱ��ȴ��Ȼbusy���Ƴ�2����
				mpLimited.MarkTime=tonumber(os.time()-3600+120)
			end
		end
		alias.startworkflow()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ searchmmr=yes �ı����趨��") then
		alias.resetidle()
		safego="/alias.flytoid(841)"
		SaveBack="south"
		if mmr.err>0 then
			alias.flytoid(841)
		else
			if mmr.findmmr>0 then
				run("id here;set checkmmrid=yes")
				alias.yjl()
			else
				_tb=utils.split(mmr.searchlist,"|")
				if mmr.searchid>table.getn(_tb) then mmr.searchid=1 end
				run(_tb[mmr.searchid])
				_tb=utils.split(mmr.searchroomno,"|")
				roomno_now=_tb[mmr.searchid]
				mmr.searchid=mmr.searchid+1
				--if cmd.nums<20 then
					run("set searchmmr=yes")
				--else
				--	alias.yjl()
				--	_f=function() run("set searchmmr=yes") end
				--	wait.time(2);_f()
				--end
			end
		end
	end
	a,b,c=string.find(l,"������(.+)��ɱ���㣡")
	if c~=nil then
		mmr.name=c
		mmr.findmmr=1
	end
	a,b,c,d,e,f=string.find(l,"(%S+)%s+=%s+(%w+) (%w+), (%w+)")
	if c~=nil and d~=nil and e~=nil and d~=nil and c==mmr.name then	mmr.id=d.." "..e end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkmmrid=yes �ı����趨��") then
		alias.resetidle()
		if string.len(mpweapon)==0 then run("blow di") end
		_tb=utils.split(mpyun,"|")
		for k,v in ipairs(_tb) do run(v) end
		openclass("kill")
		run("unset no_parry")
		openclass("kill_"..me.menpai)
		closeclass("kill_run")
		AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
		SetTimerOption("kill_timer", "group", "kill")
		xx.suck=2
		reyun=1
		runaway=false
		npcfaint=false
		killRunSuccess=false
		killid=mmr.id
		killname=mmr.name
		killskill=mpweapon
		killpfm=mppfm
		killyun=mpyun
		killjiali=mpjiali
		killjiajin=mpjiajin
		run("jiali "..mpjiali..";jiajin "..mpjiajin)
		if string.len(mpweapon)>0 then
			if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
		else alias.uw() end
		run("kill "..tostring(killid))
		_tb=utils.split(mppfm,"|")
		for k,v in ipairs(_tb) do run(tostring(v).." "..tostring(killid)) end
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function mp_xx.update()
	local  mp_xx_pre_triggerlist={
	       {name="mp_xx_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_xx_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_xx_pre_triggerlist) do
		addtri(v.name,v.regexp,"mp_xx_pre",v.script,v.line)
	end
	closeclass("mp_xx_pre")
	
	AddTimer("mp_xx_pre_sandu_timer", 0, 0, 1, "", timer_flag.Enabled + timer_flag.Replace, "mp_xx_pre_sandu.timer")
	SetTimerOption("mp_xx_pre_sandu_timer", "group", "mp_xx_pre_sandu")
	closeclass("mp_xx_pre_sandu")
	
	AddTimer("mp_xx_pre_suck_timer", 0, 0, 1, "", timer_flag.Enabled + timer_flag.Replace, "mp_xx_pre_suck.timer")
	SetTimerOption("mp_xx_pre_suck_timer", "group", "mp_xx_pre_suck")
	closeclass("mp_xx_pre_suck")
	
	local  mp_xx_start_triggerlist={
	       {name="mp_xx_start_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_xx_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_xx_start_triggerlist) do
		addtri(v.name,v.regexp,"mp_xx_start",v.script,v.line)
	end	
	local _tb2={
		"ͻȻ�������Խ��һ���ˣ��ߺ�һ���������޼��ˣ�����������\\n������(.+)��ɱ���㣡\\Z",
		"���򶡴�������йء�job������Ϣ��\\n������˵���������������������ҪһЩ�������㵽��ɽ��Щ�����Ұɡ���\\Z",
		"���򶡴�������йء�job������Ϣ��\\n������˵������С�ӣ���һ������û����ɾ͸������ҹ�����\\Z",
	}
	local  mp_xx_start_m_triggerlist={
	       {name="mp_xx_start_m_dosth2",line=2,regexp=linktri2(_tb2),script=function(n,l,w)    mp_xx_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_xx_start_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_xx_start",v.script,v.line)
	end
	closeclass("mp_xx_start")
	
	AddTimer("mp_xx_start_catch_timer", 0, 0, 1, "", timer_flag.Enabled + timer_flag.Replace, "mp_xx_start_catch.timer")
	SetTimerOption("mp_xx_start_catch_timer", "group", "mp_xx_start_catch")
	closeclass("mp_xx_start_catch")
	
	AddTimer("mp_xx_start_sandu_timer", 0, 0, 1, "", timer_flag.Enabled + timer_flag.Replace, "mp_xx_start_sandu.timer")
	SetTimerOption("mp_xx_start_sandu_timer", "group", "mp_xx_start_sandu")
	closeclass("mp_xx_start_sandu")
	
	AddTimer("mp_xx_start_search_timer", 0, 0, 1, "", timer_flag.Enabled + timer_flag.Replace, "mp_xx_start_search.timer")
	SetTimerOption("mp_xx_start_search_timer", "group", "mp_xx_start_search")
	closeclass("mp_xx_start_search")
	
	local  mp_xx_watch_triggerlist={
	       {name="mp_xx_watch_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_xx_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_xx_watch_triggerlist) do
		addtri(v.name,v.regexp,"mp_xx_watch",v.script,v.line)
	end	
	closeclass("mp_xx_watch")
	
	local  mp_xx_xiulian_triggerlist={
	       {name="mp_xx_xiulian_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_xx_xiulian.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_xx_xiulian_triggerlist) do
		addtri(v.name,v.regexp,"mp_xx_xiulian",v.script,v.line)
	end	
	closeclass("mp_xx_xiulian")

	local  mp_xx_kmmr_triggerlist={
	       {name="mp_xx_kmmr_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_xx_kmmr.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_xx_kmmr_triggerlist) do
		addtri(v.name,v.regexp,"mp_xx_kmmr",v.script,v.line)
	end	
	closeclass("mp_xx_kmmr")
end
mp_xx.update()

