mp_dl={}
mp_dl_pre={}
mp_dl_watch={}
mp_dl_work={}
mp_dl_start={}
mp_dl_dowork={}


dl.dlcen="sd|sd|se|eu|e|n|enter|out|s|eu|eu|n|nu|n|s|sd|s|e|se|e|s|u|d|n|e|ne|eu|ed|wu|wd|sw|w|w|sw|w|wu|wd|sd|nw|n|enter|out|s|se|s|nw|wd|eu|se|se|s|n|nw|n|nu|nu|nw|nu|nu"
dl.dleast="sw|w|wu|wd|nu|eu|e|n|enter|out|s|eu|eu|n|nu|n|s|sd|s|e|se|e|s|u|d|n|e|ne|eu|ed|ne|e|u|d|w|sw|su|nd|sw|su|sd|ed|s|eu|wd|n|e|w|n|w|u|d|e|s|wu|nu|nd|ne|wu|wd|sw|w|w"
dl.dlwest="wu|wu|wu|wd|wd|n|w|enter|out|e|n|se|nw|nu|n|e|e|ne|sw|w|w|s|sd|s|s|s|s|wu|w|e|ed|se|s|n|ne|wu|n|eu|sd|sw|se|ed|wu|nw|ne|nu|ed|ed|ed"
dl.dlsouth="s|s|s|e|w|sw|sw|s|n|n|s|w|u|d|e|ne|ne|s|eu|e|w|s|n|n|u|u|d|d|s|wd|se|se|nw|s|w|e|nw|sw|ne|se|n|nw|n|n|n|n"
dl.dlnorth="n|ne|e|w|n|s|sw|nw|sw|w|w|s|sd|se|su|wd|n|w|enter|out|e|n|nu|n|e|e|ne|nd|n|nu|nu|nd|su|eu|eu|wd|s|n|n|s|wd|sd|sd|s|su|se|s"
dl.needquit=0

dl.zeiid=""
dl.zeiname=""
------------------------------------------------------------------------------------
-- mp_dl_pre
------------------------------------------------------------------------------------
function mp_dl_pre.dosomething1(n,l,w)
	local _f,a,b,c
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
			alias.resetidle()
			alias.dz(100)
		end
		if not isopen("boat") and findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			alias.resetidle()
			if dl.needquit>0 then alias.flytoid(177) else alias.flytonpc(dl.jobnpc) end
		end
		if findstring(l,"�������磬���ֵ�ͼ��177�������") then
			alias.resetidle()
			dl.needquit=0
			openclass("quit")
		end
		a,b,c=string.find(l,"��һ�죬�������ɫ�Ʋ���ӭȢ��(.+)��")
		if c~=nil and findstring(c,"����") then run("ask fan ye about �ΰ�")
		elseif c~=nil and findstring(c,"����ʯ") then run("ask ba tianshi about �ΰ�")
		elseif c~=nil and findstring(c,"������") then run("ask hua hegen about �ΰ�")
		elseif c~=nil and findstring(c,"����") then
			run("give "..dl.zeiid.." to duan xing;ask duan xing about ����;ask duan xing about ��ְ")
			alias.checkexp("mp")
		end
		if findstring(l,"��æ���أ���Ȼ�����ʻ��ɡ�","�Է���æ���أ���Ȼ�����ʻ��ɡ�") then
			alias.resetidle()
			wait.make(function()
			_f=function()
				if roomno_now==181 then run("ask hua hegen about �ΰ�")
				elseif roomno_now==180 then	run("ask ba tianshi about �ΰ�")
				elseif roomno_now==182 then run("ask fan ye about �ΰ�")
				end
			end
			wait.time(1);_f()
			end)
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=mp �ı����趨��") then
			alias.resetidle()
			if add.exp>10 and mpLimited.MarkExp<me.menpaiLimited then mpLimited.MarkExp=tonumber(me.menpaiLimited) end
			if add.exp<10 then
				mpJobLimited=1
				print("ͳ�Ƶ���arrest����Ϊ��"..mpLimited.mpexp)
				mpLimited.MarkExp=mpLimited.mpexp
				if mpLimited.MarkTime<(os.time()-3600) then
					-- ��arrestʱ��ȴ��Ȼbusy���Ƴ�2����
					mpLimited.MarkTime=tonumber(os.time()-3600+120)
				end
			end
			--alias.checkbusy("arrest")
			if havefj>0 or me.menpai~="dl" then alias.startworkflow()
			else
				closeclass("mp_dl_pre")
				openclass("mp_dl_work")
				closeclass("mp_dl_dowork")
				alias.flytoid(289)
			end
		end
		--if findstring(w[0],"����[����|����ʯ|������]+�����йء��ΰ�������Ϣ��\n[����|����ʯ|������]+˵�������Ȱ�����ͷ�Ļ�����") then
		--	alias.resetidle()
		--	dl.needquit=1
		--	alias.flytoid(177)
		--end
		--if findstring(w[0],"����[����|����ʯ|������]+�����йء��ΰ�������Ϣ��\n[����|����ʯ|������]+[˵����.+���Ҵ������޹ϸ�|��������������ͷ|������ü���ƺ������˵Щʲô]+") then
		--	do_dl_job=0
		--	alias.startworkflow()
		--end
		--if findstring(w[0],"����[����|����ʯ|������]+�����йء��ΰ�������Ϣ��\n[����|����ʯ|������]+˵��������������ûʲôҪ��������") then
		--	alias.resetidle()
		--	if havefj>0 then alias.startworkflow()
		--	else
				--if findstring(c,"����") then alias.flytonpc("����ʯ") end
				--if findstring(c,"����ʯ") then alias.flytonpc("������") end
				--if findstring(c,"������") then alias.flytonpc("����") end
		--		if roomno_now==181 then run("ask hua hegen about �ΰ�")
		--		elseif roomno_now==180 then	run("ask ba tianshi about �ΰ�")
		--		elseif roomno_now==182 then run("ask fan ye about �ΰ�")
		--		else alias.flytonpc(dl.jobnpc) end
		--	end
		--end
		--a,b,c=string.find(w[0],"����[����|����ʯ|������]+�����йء��ΰ�������Ϣ��\n[����|����ʯ|������]+˵(.+)")
		a,b,c=string.find(w[0],"����[����|����ʯ|������]+�����йء��ΰ�������Ϣ��\n[����|����ʯ|������]+(.+)")
		if c~=nil and findstring(c,"���Ҵ������޹ϸ�","��������������ͷ","�ƺ������˵Щʲô") then
			alias.resetidle()
			do_dl_job=0
			alias.startworkflow()
		end
		if c~=nil and findstring(c,"���Ȱ�����ͷ�Ļ�����") then
			alias.resetidle()
			dl.needquit=1
			alias.flytoid(177)
		end
		if c~=nil and findstring(c,"����������ûʲôҪ��������") then
			alias.resetidle()
			if havefj>0 then alias.startworkflow()
			else
				if roomno_now==181 then run("ask hua hegen about �ΰ�")
				elseif roomno_now==180 then	run("ask ba tianshi about �ΰ�")
				elseif roomno_now==182 then run("ask fan ye about �ΰ�")
				else alias.flytonpc(dl.jobnpc) end
			end
		end
		if c~=nil and findstring(c,"����","����","����","��Ū��","����") then
			alias.resetidle()
			print("�����ڱ���")
			dl.search=dl.dlnorth
			dl.searchroom=169
			closeclass("mp_dl_pre")
			openclass("mp_dl_start")
			dl.searchjs=0
			alias.flytoid(169)
		end
		if c~=nil and findstring(c,"����","����","����","������","���ƺ���","���۲�","��٤��","���","�سص̰�") then
			alias.resetidle()
			print("�����ڶ���")
			dl.search=dl.dleast
			dl.searchroom=251
			closeclass("mp_dl_pre")
			openclass("mp_dl_start")
			dl.searchjs=0
			alias.flytoid(251)
		end
		if c~=nil and findstring(c,"����","�Ϸ�","�ϲ�","ϲ�ݳ�","������","³����","�䶨��","������","���ڳ�") then
			alias.resetidle()
			print("�������ϲ�")
			dl.search=dl.dlsouth
			dl.searchroom=143
			closeclass("mp_dl_pre")
			openclass("mp_dl_start")
			dl.searchjs=0
			alias.flytoid(143)
		end
		if c~=nil and findstring(c,"����","����","����","�͵ĵ�","���ɵ�","����ѩɽ","��ˮ�ذ�","��Ϫ��","��ͷ��","����","��³��") then
			alias.resetidle()
			print("����������")
			dl.search=dl.dlwest
			dl.searchroom=171
			closeclass("mp_dl_pre")
			openclass("mp_dl_start")
			dl.searchjs=0
			alias.flytoid(171)
		end
		if c~=nil and findstring(c,"�з�","����","�в�","������","ʯ�̾���","��֭����","���ˮ�ٲ�") then
			alias.resetidle()
			print("�������в�")
			dl.search=dl.dlcen
			dl.searchroom=231
			closeclass("mp_dl_pre")
			openclass("mp_dl_start")
			dl.searchjs=0
			alias.flytoid(231)
		end
end
------------------------------------------------------------------------------------
-- mp_dl_start
------------------------------------------------------------------------------------
function mp_dl_start.dosomething1(n,l,w)
	local _f,_tb,a,b,c,d,e,f
	wait.make(function()
		a,b,c=string.find(l,"�������磬���ֵ�ͼ��(%d+)�������")
		if c~=nil and (tonumber(c)==143 or tonumber(c)==169 or tonumber(c)==171 or tonumber(c)==231 or tonumber(c)==251) then
			alias.resetidle()
			dl.findzei=0
			dl.searchid=1
			dl.err=0
			alias.dz(set_neili_job)
		end
		if not isopen("boat") and findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			alias.resetidle()
			alias.uw()
			run("wield chain;set search=yes")
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkzei=yes �ı����趨��") then
			alias.resetidle()
			if (dl.findzei==nil or dl.findzei==0) or (dl.err~=nil and dl.err>10) then run("set search=yes")
			else
				if dl.findzei~=nil and dl.findzei<2 then
					-- run("fight "..dl.zeiid..";halt")
					run("arrest "..dl.zeiid)
					_f=function() run("set checkzei=yes") end
					wait.time(2);_f()
				end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ search=yes �ı����趨��") then
			alias.resetidle()
			if dl.err~=nil and dl.err>5 then alias.flytoid(dl.searchroom)
			else
				if dl.findzei~=nil and dl.findzei>0 then
					run("arrest "..dl.zeiid..";ask "..dl.zeiid.." about �ΰ�;set checkzei=yes")
					alias.yjl()
				else
					_tb=utils.split(dl.search,"|")
					if tonumber(dl.searchid)>tonumber(table.getn(_tb)) then dl.searchid=1
					dl.searchjs=dl.searchjs+1
					if dl.searchjs>20 then 
						closeclass("mp_dl_start")
						openclass("mp_dl_pre")
						dl.needquit=1
						alias.flytoid(177)
					end
					end
					run("halt;".._tb[dl.searchid])
					dl.searchid=dl.searchid+1
					run("set search=yes")
					--_f=function() run("set search=yes") end
					--wait.time(0.5);_f()
				end
			end
		end
		a,b,c,d,e,f=string.find(l,"(%S+) (%S+)%((%w+) (%w+)%)")
		if c~=nil and d~=nil and e~=nil and f~=nil then
			if dl.findzei==nil or dl.findzei==0 and string.find("���|�ݿ�|����|����|������|��Ʀ|���е�|���|����|��å|��åͷ|·��|ë��|�����|ǿ��|ǿ��ͷ|����|ɽ����|ɽ��|ɽ��ͷ|ɽկ����|����|����ͷ|����|С��|һƷ��ɱ��|��ͷ",d) then
				dl.findzei=1
				dl.zeiname=d
				dl.zeiid=string.lower(e).." "..string.lower(f)
			end
		end
		if findstring(l,"��ȵ����󵨣������ڱ�����ǰ�������ߣ�����ȥ��","��ߺ�һ�����������ݵ���Ұ���ߣ����Ҽ���ȥ��","��ȵ����ɶ񣡾����ڴ˵�Ϸ���Ҹ�Ů�����һ�ȥ���٣�") then
			alias.resetidle()
			dl.findzei=2
			_tb=utils.split(mpyun,"|")
			for k,v in ipairs(_tb) do run(v) end
			openclass("kill")
			run("unset no_parry;unwield chain")
			openclass("kill_"..me.menpai)
			closeclass("kill_run")
			AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
			SetTimerOption("kill_timer", "group", "kill")
			reyun=1
			runaway=false
			npcfaint=false
			killRunSuccess=false
			killid=dl.zeiid
			killname=dl.zeiname
			killskill=mpweapon
			killpfm=mppfm
			killyun=mpyun
			killjiali=mpjiali
			killjiajin=mpjiajin
			run("yield no;jiali "..mpjiali..";jiajin "..mpjiajin)
			if string.len(mpweapon)>0 then
				if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
			else alias.uw() end
			_tb=utils.split(mppfm,"|")
			for k,v in ipairs(_tb) do run(v) end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ killover=yes �ı����趨��","�Է���û����ȫ���ԣ��ȵȵȰɡ�") then
			alias.resetidle()
			_f=function() for i=1,3,1 do run("get "..dl.zeiid.." "..i) end end
			wait.time(1);_f()
		end
		if findstring(l,"�㽫"..dl.zeiname.."�����������ڱ��ϡ�") then
			alias.resetidle()
			closeclass("mp_dl_start")
			openclass("mp_dl_pre")
			alias.flytonpc("����")
		end
		if findstring(l,"�˼�û���������ǣ�����������") then
			dl.findzei=1
			dl.err=1
		end
		if findstring(l,"���ﲢ�޴��ˣ�","�������û�г�·��") then
			if dl.err==nil then dl.err=0 end
			dl.err=dl.err+1
		end
		if findstring(l,"�����Ѿ�����������Ա����","�ⲻ�ǻ���","����û��.+����ˡ�") then
			dl.findzei=0
		end
		if findstring(l,"�����˹���","���Ѿ����˹���","���Ѿ���������״̬","�������൱�ص���","������֮���Ѿ�����֧��") then
			dl.needquit=1
			alias.startworkflow()
		end
		a,b,c=string.find(l,"[> ]*"..dl.zeiname.."+(.+)")
		if c~=nil and dl.findzei>0 and findstring(c,"���ڵ��ϻ��˹�ȥ") then
			alias.resetidle()
			run("yield yes;halt")
			alias.checkbusy("killover")
		end
		if c~=nil and dl.findzei>0 and findstring(c,"�����˼��¾�����","���Ҵҵ�����") then
			alias.resetidle()
			dl.needquit=1
			alias.startworkflow()
		end
		if c~=nil and dl.findzei>0 and findstring(c,"�������̫����") then
			alias.resetidle()
			_f=function()
			--if fjweapon~="" then run("get "..fjweapon) end
			--if mpweapon~="" then run("get "..mpweapon) end
			--if ftbweapon~="" then run("get "..ftbweapon) end
			for i=1,3,1 do run("get all from "..dl.zeiid.." "..i) end
			if have.jingyao>0 then run("get jing yao") end
			run("drop all;get "..weapon_now..";get chain;get huachu;get tengjia;get jiudai;get shi he;get fire;get gold;get coin;get jinchuang yao")
			for i=1,3,1 do run("get "..dl.zeiid.." "..i) end
			end
			wait.time(2);_f()
		end
	end)
end
function mp_dl_start.dosomething2(n,l,w)
	local _f,_tb,a,b,c
	--wait.make(function()
		a,b,c=string.find(w[0],"����"..dl.zeiname.."�����йء��ΰ�������Ϣ��\n"..dl.zeiname.."+(.+)")
		if c~=nil and findstring(c,"�����Ǹ��õط�","���ٺٺ١���Ц�˼���") then
			dl.findzei=1
			run("follow "..dl.zeiid)
		end
		if c~=nil and findstring(c,"����ķ羰����","���ǺǺǡ���Ц�˼���","�޿ɷ��","û��˵��","�����۾�������","���ҿɲ����","���ʵ�����ʵ��û��ӡ��","����˵�������","��˵ʲô����","��Ҳ�ܼ�װ��˵�����") then
			dl.findzei=0
		end
	--end)
end
--function mp_dl_start.dosomething3(n,l,w)
	--local _f,_tb,a,b,c,d
	--wait.make(function()
	--	if findstring(l,"����"..dl.zeiname.."�����йء��ΰ�������Ϣ��\n"..dl.zeiname.."���ٺٺ١���Ц�˼�����\n"..dl.zeiname.."˵���������Ǹ��õط����Ҷ��������������ٺ�") then
	--		dl.findzei=1
	--		run("follow "..dl.zeiid)
	--	end
	--	if findstring(l,"����"..dl.zeiname.."�����йء��ΰ�������Ϣ��\n"..dl.zeiname.."���ǺǺǡ���Ц�˼�����\n"..dl.zeiname.."˵��������ķ羰���ˣ��ΰ����滹����ԡ�") then
	--		dl.findzei=0
	--	end
	--end)
--end
------------------------------------------------------------------------------------
-- mp_dl_work
------------------------------------------------------------------------------------
function mp_dl_work.dosomething1(n,l,w)
	local _f,a,b,c
	wait.make(function()
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=work �ı����趨��") then
		alias.resetidle()
			if havefj>0 or dl.worked>0 then
				run("get all")
				alias.flytonpc("�κ�ҩ")
			else run("ask huajiang about check;ask huajiang about �ɻ�") end
		end
		if not isopen("dealwith_sellyao") and findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ���κ�ҩ��") then
			alias.resetidle()
			if hp.neili<(hp.maxneili*160/100) then alias.checkdrugbusy("da xueteng") end
			alias.checkitems()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
			alias.resetidle()
			alias.startworkflow()
		end
		if not isopen("boat") and findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			alias.resetidle()
			if dl.dohuajiangwork>0 then
				print("��ʼ�ֻ�")
				run("find huachu")
				alias.flytoid(200)
			else
				--alias.checkbusy("work")
				alias.startworkflow()
			end
		end
		if findstring(l,"��������ڳ�һ����Ѫ��") then
			have.xueteng=have.xueteng+1
		end
		if findstring(l,"�㶪��һ�ô�Ѫ��","�����һ.+��Ѫ��") then
			have.xueteng=have.xueteng-1
		end
		if findstring(l,"��������ڳ�һ������") then
			have.danggui=have.danggui+1
		end
		if findstring(l,"�㶪��һ�õ���") then
			have.danggui=have.danggui-1
		end
		if findstring(l,"��æ���أ���Ȼ�����ʻ��ɡ�") then
			alias.resetidle()
			_f=function() run("ask huajiang about check;ask huajiang about �ɻ�") end
			wait.time(2);_f()
		end
		if findstring(l,"�������磬���ֵ�ͼ��200�������") then
			alias.resetidle()
			if havefj>0 then alias.startworkflow()
			else run("ask huajiang about check;ask huajiang about �ɻ�") end
		end
		if findstring(l,"�������磬���ֵ�ͼ��289�������") then
			alias.resetidle()
			dl.worked=0
			_f=function() run("open door;enter;drop huachu;remove all;give tengjia to gu ducheng;set no_accept 0;ask gu ducheng about �ټ�;set no_accept 1;wear all") end
			wait.time(2);_f()
			alias.dz(100)
		end
		if findstring(w[0],"����������ͷ�������˵�������ˣ����ˣ�����Ļ�͸ɵ�����ɡ�\n�������������Ĵָ������������㣬�г�һ�ձس�һ���󻨽���") then
			alias.resetidle()
			closeclass("mp_dl_dowork")
			alias.checkbusy("work")
		end
		if findstring(w[0],"���򻨽������йء��ɻ����Ϣ��\n����˵���������˲��ٻ���") then
			alias.resetidle()
			dl.worked=1
			alias.checkbusy("work")
		end
		if findstring(w[0],"���򻨽������йء��ɻ����Ϣ��\n����˵�����ü��ˡ�����������Ҫ��������԰�ӣ�����ҳ��������ɡ�","���򻨽������йء��ɻ����Ϣ��\n����˵�������Ȱ���ͷ�Ļ������˵�ɡ�") then
			alias.uw()
			run("wield huachu")
			openclass("mp_dl_dowork")
		end
		a,b,c=string.find(w[0],"���򻨽������йء�check������Ϣ��\n������������˵�ͷ��\n����˵������ĿǰΪֹ��һ������(%d+)������")
		if c~=nil then
			dl.workcs=tonumber(c)
		end
	end)
end
------------------------------------------------------------------------------------
-- mp_dl_dowork
------------------------------------------------------------------------------------
function mp_dl_dowork.timer()
	alias.resetidle()
	if have.xueteng>0 then if hp.neili<(hp.maxneili*160/100) then alias.checkdrugbusy("da xueteng") end;run("drop da xueteng") end
	if have.danggui>0 then run("drop dang gui") end
	run("work")
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function mp_dl.update()
	AddTimer("mp_dl_dowork_timer", 0, 0, 1, "", timer_flag.Enabled + timer_flag.Replace, "mp_dl_dowork.timer")
	SetTimerOption("mp_dl_dowork_timer", "group", "mp_dl_dowork")
	closeclass("mp_dl_dowork")
	
	local  mp_dl_pre_triggerlist={
	       {name="mp_dl_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_dl_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_dl_pre_triggerlist) do
		addtri(v.name,v.regexp,"mp_dl_pre",v.script,v.line)
	end
	local  mp_dl_pre_m_triggerlist={
	       {name="mp_dl_pre_m_dosth1",line=2,regexp="^(> > > |> > |> |)����(����|����ʯ|������+)�����йء��ΰ�������Ϣ��\\n(.+)\\Z",script=function(n,l,w)    mp_dl_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_dl_pre_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_dl_pre",v.script,v.line)
	end
	closeclass("mp_dl_pre")
	
	local  mp_dl_start_triggerlist={
	       {name="mp_dl_start_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_dl_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_dl_start_triggerlist) do
		addtri(v.name,v.regexp,"mp_dl_start",v.script,v.line)
	end
	local  mp_dl_start_m_triggerlist={
	       {name="mp_dl_start_m_dosth1",line=2,regexp="^(> > > |> > |> |)����.+�����йء��ΰ�������Ϣ��\\n(.+)\\Z",script=function(n,l,w)    mp_dl_start.dosomething2(n,l,w)  end,},
	      -- {name="mp_dl_start_m_dosth2",line=3,regexp="^(> > > |> > |> |)����.+�����йء��ΰ�������Ϣ��\\n(.+)\\n(.+)\\Z",script=function(n,l,w)    mp_dl_start.dosomething3(n,l,w)  end,},
	}
	for k,v in pairs(mp_dl_start_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_dl_start",v.script,v.line)
	end
	closeclass("mp_dl_start")
	
	local  mp_dl_work_triggerlist={
	       {name="mp_dl_work_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_dl_work.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_dl_work_triggerlist) do
		addtri(v.name,v.regexp,"mp_dl_work",v.script,v.line)
	end
	local _tb={
		"���򻨽������йء��ɻ����Ϣ��\\n(.+)\\Z",
		"����������ͷ�������˵�������ˣ����ˣ�����Ļ�͸ɵ�����ɡ�\\n(.+)\\Z",
	}
	local _tb3={
		"���򻨽������йء�check������Ϣ��\\n������������˵�ͷ��\\n(.+)\\Z",
	}
	local  mp_dl_work_m_triggerlist={
	       {name="mp_dl_work_m_dosth1",line=2,regexp=linktri(_tb),script=function(n,l,w)    mp_dl_work.dosomething1(n,l,w)  end,},
	       {name="mp_dl_work_m_dosth2",line=3,regexp=linktri(_tb3),script=function(n,l,w)    mp_dl_work.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_dl_work_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_dl_work",v.script,v.line)
	end
	closeclass("mp_dl_work")
	
	local noecho_trilist={
			"������û����������",
			"���������һԾ",
			".+���׳ʿ�ĸ���",
			".+����ֻ�÷���",
			"����æ����",
			"�����ڲ�æ",
			"�˼�û���������ǣ����������ˣ�",
			}
	local _noechotri=linktri(noecho_trilist)

	addtri("mp_dl_watch_gag_dosth1",_noechotri,"mp_dl_watch","")
	SetTriggerOption("mp_dl_watch_gag_dosth1","omit_from_output",1)
end
mp_dl.update()
