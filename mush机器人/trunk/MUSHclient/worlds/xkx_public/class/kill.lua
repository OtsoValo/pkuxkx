-- �������Ļ�ǧ����Ҹģ�лл��~

kill={}
kill_run={}
kill_dl={}
kill_gb={}
kill_hs={}
kill_qz={}
kill_sl={}
kill_bt={}
kill_xs={}
kill_em={}
kill_gm={}
kill_xx={}

------------------------------------------------------------------------------------
-- kill
------------------------------------------------------------------------------------
function kill.timer()
	if isopen("mp_mj_yudi") then mj.ydnpc=0;run("look") end
	run("hp;set check=kill")
end
function kill.dokill(id,name,class)
	if isopen("kill") or fjroomid>0 then
		alias.initialize_trigger()
		print("����ս����Σ�գ��˳���������")
		openclass("quit")
		stat.quiting=0
	else
		alias.initialize_trigger()
		if cm.doing~=nil and tonumber(cm.doing)>0 then
			print("������")
			run("halt;yun recover")
		end
		run("halt;halt")
		_tb=utils.split(fjyun,"|")
		for k,v in ipairs(_tb) do run(v) end
		reyun=0
		npcfaint=false
		killRunSuccess=false
		run("unset no_parry")
		openclass("kill")
		openclass("kill_"..me.menpai)
		closeclass("kill_run")
		AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
		SetTimerOption("kill_timer", "group", "kill")
		runaway=false
		alias.uw()
		if me.menpai=="hs" and fjweapon~="" then
			if stat.leidong>0 then
				pfmid=2
				if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
			else
				pfmid=1
				alias.uw()
			end
		else
			pfmid=1
			if string.len(fjweapon)==0 then
				if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
			else alias.uw() end
		end
		killid=id
		killname=name
		killskill=fjweapon
		killpfm=fjpfm
		killyun=fjyun
		killjiali=fjjiali
		killjiajin=fjjiajin
		run("jiali "..fjjiali..";jiajin "..fjjiajin)
		if me.menpai=="bt" then run("convert staff;attack "..killid) end
		if me.menpai=="mj" then run("order fighter do attack "..killid..";order fighter 2 do attack "..killid) end
		run("kill "..killid)
		--_tb=utils.split(fjpfm,"|")
		--if pfmid<=table.getn(_tb) then if kmq() then alias.kmq() else run(_tb[pfmid].." "..killid) end end
		--_tb=utils.split(killpfm,"|")
		alias.pfm()
		openclass(class)
	end
end
function kill.dosomething1(n,l,w)
	local _tb,_f,a,b,c,_t
	if findstring(l,"�����һ.+�ȡ�") then have.staff=have.staff+1 end
	if findstring(l,"�����һ.+����") then have.jian=have.jian+1 end
	if findstring(l,"�����һ.+����") then have.dao=have.dao+1 end
	if findstring(l,"�����һ.+����") then have.stick=have.stick+1 end
	if findstring(l,"��ո�ѹ��ס�������ƣ����ǲ�Ҫ����������") then yunbusy=yunbusy+1 end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ check=kill �ı����趨��") then
		if wieldweapon>0 and killskill~="" then
			if workflow.nowjob=="fj" or workflow.nowjob=="ftb" or workflow.nowjob=="mp" then _t=workflow.nowjob else _t="fj" end
			if have[_G[_t.."weapon"]]~=nil and have[_G[_t.."weapon"]]>0 then
				if killskill=="staff" then alias.wi(staffid) else alias.wi(killskill) end
			else
				rekill=1
				run("halt;get ".._G[_t.."weapon"])
			end
		end
		if rekill>0 then run("kill "..tostring(killid)) end
		if hp.healthqi<60 then runaway=true;print("��������") end
		if (hp.jingli<(hp.maxjingli*2/3) and hp.neili<500) then runaway=true;print("û�о���") end
		if hp.neili<(hp.maxneili*2/10) then runaway=true;print("û������") end
		if (yunbusy>=3 and (hp.jingli<(hp.maxjingli/3) or hp.qi<(hp.maxqi*100/hp.healthqi/2)) and jifa.forcename~="huagongdafa") then runaway=true;print("yunbusy����") end
		if not runaway then
			if me.menpai=="xx" and reyun>0 then run("yun hua") end
			if hp.qi<(hp.maxqi*100/hp.healthqi/2) and jifa.forcename~="huagongdafa" then run("yun recover") end
			if hp.jing<(hp.maxjing/2) then run("yun regenerate") end
			if hp.jingli<(hp.maxjingli*1/3) then
				run("jiajin basic")
				if hp.jiajin>50 then rejiajin=true end
			end
			if (me.menpai=="wd" and killskill=="jian") then
				-- �䵱����chan���˾���Ҫ��ɫ����
				if hp.jingli<(hp.maxjingli/3) then alias.yjl() end
			else
				if string.len(killskill)>0 then
					-- ʹ������ʱһ�㶼jiajin max������Ҫ����yjl
					if hp.jingli<(hp.maxjingli/2) then alias.yjl() end
				else
					-- ���ּ��ܲ��ûһ�뾫��ʱ��yjl
					if hp.jingli<(hp.maxjingli/2) then alias.yjl() end
				end
			end
			if reyun~=nil and reyun>0 then
				_tb=utils.split(killyun,"|")
				for k,v in ipairs(_tb) do run(v) end
			end
			_tb=utils.split(killpfm,"|")
			if pfmid==nil or pfmid>table.getn(_tb) then pfmid=1 end
			alias.pfm()
			--if not npcfaint and pfmid<=table.getn(_tb) and xy.pfm()>0 then
			--	if kmq() then alias.kmq() else run(_tb[pfmid].." "..killid) end
			--end
		else
			print("׼������")
			if not isopen("kill_run") then
				openclass("kill_run")
				run("halt")
				if jifa.forcename=="motianyunqi" then run("yun shougong") end
				if me.menpai=="bt" then run("stop she;stop she;stop she;convert she") end
				run("go "..alias.SafeEntrance(roomno_now)..";18mo "..killid)
			end
		end
	end
	if findstring(l,"��ת���飬�������ܣ�ֻ��ͦ������֡����˵ز������Ǹ��ֱ�ƴ������") then
		if not isopen("kill_run") then
			openclass("kill_run")
			if jifa.forcename=="motianyunqi" then run("yun shougong") end
			run("halt;go "..alias.SafeEntrance(roomno_now)..";18mo "..killid)
		end
	end
	a,b,c=string.find(l,"��(.+)")
	if c~=nil and	not findstring(c,"�����趨") then
		alias.resetidle()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=killover �ı����趨��") then
		if skillslist["cuff"]==nil then skillslist["cuff"]={} end
		if skillslist["cuff"]["lvl"]==nil then skillslist["cuff"]["lvl"]=1 end
		if (me.xtbl+skillslist["cuff"]["lvl"]/10)==me.bl and me.menpai=="hs" then stat.leidong=0 end
		if jifa.forcename=="motianyunqi" then run("yun shougong") end
		if me.shen<0 and (me.menpai=="wd" or me.menpai=="em" or me.menpai=="qz") then
			closeclass("kill")
			openclass("quit")
			openclass("quitdis")
		elseif me.shen>0 and me.menpai=="xx" then
			closeclass("kill")
			openclass("quit")
			openclass("quitdis")
		else alias.killover() end
	end
	if findstring(l,"����ʹ�õ��⹦��û�����ֹ��ܡ�") then
		_tb=utils.split(killpfm,"|")
		if findstring(_tb[pfmid],"leidong","jingmo","nian","qiankun","piaomiao") then alias.uw();return end
		if killskill=="staff" then alias.wi(staffid) else alias.wi(killskill) end
	end
	--if findstring(l,"��.+����ľ��������ʹ.+", "�������� enable ָ��ѡ����Ҫʹ�õ��⹦��") then
	--	if jifa.forcename=="xuanyinzhenqi" then alias.jfhbmz() else Execute("/alias.jf"..me.menpai.."()") end
	--end
	if findstring(l,"���������������������˿�����") then
		if rejiajin then
			run("jiajin "..killjiajin)
			rejiajin=false
		end
	end
	if findstring(l,"�㽫.+����ؽ��ʡ�","�㽫.+���ƻ����䡣","�㽫.+�������˽��ʡ�") then alias.resetidle() end
	a,b,c=string.find(l,"ֻ����.+һ���������е�(.+)�Ѿ���Ϊ���أ�")
	if c~=nil then
		alias.resetidle()
		if findstring(c,"�ⵣ","����","��") then have.staff=have.staff-1 end
		if findstring(c,"��") then have.jian=have.jian-1 end
		if findstring(c,"��") then have.dao=have.dao-1 end
		if findstring(c,"��") then have.stick=have.stick-1 end
		wieldweapon=1
	end
	a,b,c=string.find(l,"��ֻ���á�����Ѩ����һ�����飬��ָ������(.+)�����ȣ����ڵ��£�")
	if c~=nil then
		alias.resetidle()
		if findstring(c,"�ⵣ","����","��") then have.staff=have.staff-1 end
		if findstring(c,"��") then have.jian=have.jian-1 end
		if findstring(c,"��") then have.dao=have.dao-1 end
		if findstring(c,"��") then have.stick=have.stick-1 end
		wieldweapon=1
		getweapon=1
	end
	a,b,c=string.find(l,"��ֻ��������(.+)�ѳֲ��������ַɳ���")
	if c~=nil then
		alias.resetidle()
		if findstring(c,"�ⵣ","����","��") then have.staff=have.staff-1 end
		if findstring(c,"��") then have.jian=have.jian-1 end
		if findstring(c,"��") then have.dao=have.dao-1 end
		if findstring(c,"��") then have.stick=have.stick-1 end
		wieldweapon=1
		getweapon=1
	end
	a,b,c=string.find(l,"��ֻ������һ�ȣ�(.+)��ʱ���ֶ���")
	if c~=nil then
		alias.resetidle()
		if findstring(c,"�ⵣ","����","��") then have.staff=have.staff-1 end
		if findstring(c,"��") then have.jian=have.jian-1 end
		if findstring(c,"��") then have.dao=have.dao-1 end
		if findstring(c,"��") then have.stick=have.stick-1 end
		wieldweapon=1
		getweapon=1
	end
	a,b,c=string.find(l,"��.+����ľ���ѵ�һ����(.+)�����˵��ϡ�")
	if c~=nil then
		alias.resetidle()
		if findstring(c,"�ⵣ","����","��") then have.staff=have.staff-1 end
		if findstring(c,"��") then have.jian=have.jian-1 end
		if findstring(c,"��") then have.dao=have.dao-1 end
		if findstring(c,"��") then have.stick=have.stick-1 end
		wieldweapon=1
		getweapon=1
	end
	if findstring(l,"����û������ˡ�") then
		if isopen("ftb_start") and not isopen("gps_dealwith") then
			-- ֻ��������ͷ��ʱ�Ŵ��������
			alias.resetidle()
			closeclass("kill")
			ftbnpcindex=ftbnpcindex+1
			_tb=utils.split(ftbnpcid,"|")
			if ftbnpcindex<=table.getn(_tb) then
				npcid=_tb[ftbnpcindex]
				_tb=utils.split(ftbnpcname,"|")
				npcname=_tb[ftbnpcindex]
				run("ask "..npcid.." about �̿�")
			else
				npcfind=0
				ftbnpcindex=1
				if cmd.nums<cmd.setnums then
					if string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end
				else
					wait.make(function()
						_f=function()
									if string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end
							end
						wait.time(1);_f()
					end)
				end
			end
		end
	end
	if findstring(l,"����û�� "..tostring(killid).."��") then
		alias.resetidle()
		alias.checkbusy("killover")
	end
	if findstring(l,"��.+��ֻ����ս����ʹ�á�") then alias.resetidle();run("kill "..killid) end
	a,b,c=string.find(l,"[> ]*(.+)�������˼�������ǿ��ѹ��ס�����ϵ����ơ�")
	if c~=nil then
		alias.resetidle()
		if c==killname and not findstring(c,"��Ӱ","->","��") then
			run("jiajin "..killjiajin..";jiali "..killjiali)
		end
	end
	a,b,c=string.find(l,"[> ]*(.+)���ڵ��ϣ������˼��¾����ˡ�")
	if c==killname and c~=nil then
		alias.resetidle()
		if not findstring(c,"��Ӱ","->","��") then
			run("jiajin basic;jiali 0;score")
			npcfaint=true
			alias.checkbusy("killover")
		end
	end
	a,b,c=string.find(l,"[> ]*(.+)�Ѿ���������״̬����ʱ������ˤ����ȥ��")
	if c~=nil then
		alias.resetidle()
		if c==killname and not findstring(c,"��Ӱ","->","��") and not npcfaint then
			if me.menpai=="sl" then run("jiajin 50") end
		end
	end
	a,b,c=string.find(l,"[> ]*(.+)����һ�����ȣ����ڵ��ϻ��˹�ȥ��")
	if c~=nil then
		alias.resetidle()
		if c==killname and not findstring(c,"��Ӱ","->","��") then
			run("jiajin basic;jiali 0")
			npcfaint=true
			reyun=0
		end
	end
	if findstring(l,"�������ھ���ע������ǿ��֮����.+����"..tostring(killname).."�����������������أ�") then
		alias.resetidle()
		run("score")
		alias.checkbusy("killover")
	end
	if findstring(l,"�����"..tostring(killname).."�ȵ�����.+��") then
		alias.resetidle()
		rekill=0
	end
	--if findstring(l,"����ʹ�õ��⹦��û�����ֹ��ܡ�") then
	--	alias.resetidle()
	--	alias.uw(staffid)
	--	alias.uw("jian")
	--	alias.uw("dao")
	--	alias.uw("stick")
	--	alias.uw("qin")
	--end
	if findstring(l,"���Ѿ�װ�����ˡ�") then wieldweapon=0 end
	if findstring(l,"��.+��������","��.+ȡ��������") then alias.resetidle();wieldweapon=0 end
	if killname==nil then killname="" end
	if findstring(l,"һ����ͷ����ļҶ����˹���������ĳ���һЦ��������������"..tostring(killname).."��ʬ�塣","[> ]*"..tostring(killname).."����ææ�뿪�ˡ�") then
		alias.resetidle()
		run("jiajin basic;jiali 0")
		npcfaint=true
		run("score")
		alias.checkbusy("killover")
	end
	if findstring(w[0],"�������һ���������%.%.%.\n(%S+) %-") then
		-- �������ֳ����ر�Killģ��
		alias.yjl()
		run("yun recover")
		alias.close_kill()
		alias.startworkflow()
	end
end
------------------------------------------------------------------------------------
-- kill_run
------------------------------------------------------------------------------------
function kill_run.dosomething1(n,l,w)
	local _f,_tb,a,b,c
	wait.make(function()
		a,b,c=string.find(l,"^%s+����Ψһ�ĳ����� (.+)��")
		if c~=nil then
			entrance=c
			xkxGPS.setEntrance(entrance)
		end
		a,b,c=string.find(l,"^%s+�������Եĳ����� (.+)��")
		if c~=nil then
			entrance=c
			xkxGPS.setEntrance(entrance)
		end
		if findstring(l,"�ݿ�����һ����Ц��ˬ��Ľ���������������Ȼ������Ī����","ɽ���������Ͽ콫��������������Ȼ��ͱ�ָ�������뿪��","�����ɵ��Ӷ�ݺݵ���в�����콫����������������ȡ�㹷����") then
			alias.initialize_trigger()
			print("�޷��ӣ���Ҫ�˳���")
			openclass("quit")
			stat.quiting=0
		end
		if findstring(l,"�����һ������(.+)��������ᳪ��ʮ�������գ���һ������������") then
			_f=function()
						run("halt")
						alias.yjl()
						run(safego..";18mo "..killid)
				end
			wait.time(0.2);_f()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ resetSafe=yes �ı����趨��") then
			alias.resetidle()
			_tb=utils.split(xkxGPS.entrance,"|")
			safego=_tb[math.random(table.getn(_tb))]
			SafeBack=invDirection(safego)
		end
		if findstring(l,"��Ҫ��˭�� 18mo ���������") then
			if not killRunSuccess then
				print("���ܳɹ���")
				alias.resetidle()
				alias.close_kill()
				if isopen("mp_dl_start") then dl.needquit=1 end
				alias.startworkflow()
			end
		end
		if findstring(l,"����.+�Ķ�������˵���������ƣ����ӣ�","�л�����˵, ��Ҫ�ż�") then
			_f=function()
						_tb=utils.split(killid," ")
						run("halt;"..safego..";whisper ".._tb[1].." �����ƣ����ӣ�")
				end
			wait.time(0.2);_f()
		end
		if findstring(l,"�������û�г�·��") then
			if runaway then run("look;set resetSafe=yes") end
		end
	end)
end
------------------------------------------------------------------------------------
-- kill_dl
------------------------------------------------------------------------------------
function kill_dl.dosomething1(n,l,w)
	if findstring(l,"��е������������ǣ���ת�Ŀ����ķ�����ɢȥ��") then
		reyun=1
	end
	if findstring(l,"��˫�ƺ�ʮ����ת�����ķ���һ�������Ե����������������ת��Ϣ������һ��һ�����֣�Ƭ�̼��ظ�������","��������ת�����ķ��ˡ�") then
		reyun=0
	end
	if findstring(l,"�����л��������о���֮ɫ�����ֵ�ȥ��һָ������","����ɫ���أ����ᵤ���ָ����������һ�������ƿն���������","����ǰ����һ�����������һ�У�����˫ֱָ����������") then
		alias.dl_with_ailao()
	end
end
------------------------------------------------------------------------------------
-- kill_gb
------------------------------------------------------------------------------------
function kill_gb.dosomething1(n,l,w)
	local _tb
	if findstring(l,"��Ļ�������������ϣ��������ջص��","��ֻ��������ת���������ò�������������Ϣ���ɡ�") then
		stat.huntianup=0
		reyun=1
	end
	if findstring(l,"��΢һ�����������������ȫ��ǽڷ���һ�󱬶��������","������������ʢ�����»��������Ź����Է�λ��ͷ��ð�����ڰ�������������������ӿ֮�������������ѷ��ӵ����£�","���������һԾ������սȦ�����ˡ�") then
		reyun=0
	end
	if findstring(l,"[> ]*(.+)Ŀǰ���Թ˲�Ͼ���ŵ������ɡ�") then
		_tb=utils.split(killpfm,"|")
		if pfmid<table.getn(_tb) then pfmid=pfmid+1 end
	end
	if findstring(l,"����������һ����˫�ְ���������ÿһ���Ƴ�������һ���Ʒ磡") then
		_tb=utils.split(killpfm,"|")
		if pfmid<table.getn(_tb) then pfmid=pfmid+1 end
	end
	if findstring(w[0],"��ʹ���򹷰����������־����ó���ɽ��Ӱ����.+��û��\n�����������˸���æ���ң�һʱ�޷����н�����") then
		_tb=utils.split(killpfm,"|")
		if pfmid<table.getn(_tb) then pfmid=pfmid+1 end
	end
end
------------------------------------------------------------------------------------
-- kill_hs
------------------------------------------------------------------------------------
function kill_hs.dosomething1(n,l,w)
	local _tb
	if findstring(l,"�㵱������ϼ�񹦶��˵���.+���ϣ�����һ������.+��ͷֱ����","��΢һ�˾���ֻ��������Ϣ���ң�����ʹ�����У�","������ʹ�á��׶����졹���޷�����ʹ������������","������ʹ�����ھ���������ʩչ�������������ɽ�����") then
		pfmid=pfmid+1
	end
	if findstring(l,"ֻ������һ����ȣ�ȭ��ͻȻ����;�֮������ȴ����Ʈ���Ѳ⣡","������ʹ���׶������ˣ�") then
		pfmid=pfmid+1
		if killskill~=nil and string.len(killskill)>0 then
			wieldweapon=1
			if killskill=="staff" then alias.wi(staffid) else alias.wi(killskill) end
		end
	end
	if findstring(l,"�㻺������һ���������ھ��ջص��") then
		if findstring(killpfm,"leidong") and not npcfaint then
			wieldweapon=0
			alias.uw()
			run("perform leidong")
			pfmid=1
		end
	end
	if findstring(l,"�㡸ৡ���һ�����һ��.-���������С�","���Ѿ�װ�����ˡ�") then
		if me.master=="������" then run("jifa dodge dugu-jiujian") else run("jifa parry huashan-jianfa") end
	end
	if findstring(l,"�㽫���е�.-����ؽ��ʡ�") then
		if me.master=="������" then run("jifa dodge dugu-jiujian") else run("jifa parry pishi-poyu") end
	end
	if findstring(l,"����һ���Ϣ����������õ�����ԭ�����ҵ���Ϣ�ָ���������") then
		_tb=utils.split(killpfm,"|")
		for k,v in ipairs(_tb) do
			if findstring(v,"sanxian") then pfmid=k end
		end
	end
end
------------------------------------------------------------------------------------
-- kill_qz
------------------------------------------------------------------------------------
function kill_qz.dosomething1(n,l,w)
	local _tb
	if findstring(l,"�㳤Хһ����ȭ����Ȼ�ӿ죬ȭ��һ�䣬ȴ�Ǵ�ӯ���壬���ò��","��ӳ�һȭ������ǧ����ħ�̵��Ӳ��ҵ����������Զԣ�","��������ȭ��ȭ���ƺ���Щ�仯�����Ǵ����ȱ�����ò��ס�","������ӳ�һȭ������ûʲô��������־��ȴ���ҵ������ġ�") then
		pfmid=pfmid+1
		_tb=utils.split(killpfm,"|")
		if pfmid>table.getn(_tb) then pfmid=1 end
	end
	if findstring(l,"����һ��������ͻ�䣬.+���Ƴ�ѩ����â��һ����Ϊ.+��") then
		pfmid=pfmid+1
		_tb=utils.split(killpfm,"|")
		if pfmid>table.getn(_tb) then pfmid=1 end
		st=0
	end
	if findstring(l,"����������ͨ����Ƭ��֮�䣬��������ȫ��˫�۾������䣬���ַ���ý����������٣���ƽʱ�������ˡ�") then
		st=st+1
		if st>=2 then pfmid=pfmid+1 end
		_tb=utils.split(killpfm,"|")
		if pfmid>table.getn(_tb) then pfmid=1 end
	end
	if findstring(l,"������һ�������������ջص������Ҳ�ָ�������") then
		pfmid=1
	end
end
------------------------------------------------------------------------------------
-- kill_sl
------------------------------------------------------------------------------------
function kill_sl.dosomething1(n,l,w)
	if findstring(l,"���ʱ����������򳹷����ͨ�������������������һҶһҶ����������������ԴԴ���ϵص�����","����Ϣ��ת���ϣ������ڽ�����������Խ��Խ�죬����Ԫһ���������ڵ��������������˰�.+ѹ�ô�����������","������.+������������ǰ������ȴ���Ի����ջأ���������ƬƬ�������ꡣ") then
		alias.yjl()
	end
end
------------------------------------------------------------------------------------
-- kill_bt
------------------------------------------------------------------------------------
function kill_bt.dosomething1(n,l,w)
	local a,b,c
	if findstring(l,"�ⲻ������ߣ��������������ָ�ӵġ�") then
		run(safego)
		run("convert she")
	end
	if findstring(l,"���߿��˿��㣬ͻȻ�Ƽ�һ��Ծ��׼ȷ�����������ϣ�����������","����������һ�����ˣ����߼�����ȥ��") then
		closeclass("kill_"..me.menpai)
		closeclass("kill")
		run("set killover="..killaction)
		killaction=""
	end
	if findstring(l,"���з��߳�����") then
		run("convert staff")
	end
	if findstring(l,"��ֻ����ս�����������ϡ�") then
		alias.resetidle()
		alias.checkbusy("killover")
	end
	if findstring(l,"��������ս���У��޷���������֮�ϡ�") then
		run("stop she "..sheid)
		wait.make(function()
			local _f=function() run("convert she") end
			wait.time(1);_f()
		end)
	end
	if findstring(l,"[> ]*"..killname.."����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
		alias.resetidle()
		run("kill "..killid)
		sheid=1
		run("stop she "..sheid)
		if skillslist["hamagong"]==nil then skillslist["hamagong"]={} end
		if skillslist["hamagong"]["lvl"]==nil then skillslist["hamagong"]["lvl"]=1 end
		if addforce~=nil and addforce>0 and skillslist["hamagong"]~=nil and skillslist["hamagong"]["lvl"]~=nil and skillslist["hamagong"]["lvl"]<me.maxlvl and skillslist["hamagong"]["lvl"]<751 then
			addforce=0
			alias.uw()
			run("perform puji")
		end
	end
end
function kill_bt.dosomething2(n,l,w)
	if findstring(w[0],"��������ʾ�����ͣ������\n���ǹ���������") then
		sheid=sheid+1
		run("stop she "..sheid)
	end
	if findstring(w[0],"��������������������˵С�\nʲô��") then
		-- #if @debug {#say ����������staff�ϣ�����Ҫ��������}
		closeclass("kill_"..me.menpai)
		closeclass("kill")
		run("set killover="..killaction)
	end
	if findstring(w[0],"�㷢��(.+)��������Щ��������\n�����ʱ͵Ϯ�ɹ������Դ�Ķ���ȫ�޻���֮����") then
		if xy.pfm()>0 then run("perform shoot") end
	end
end
------------------------------------------------------------------------------------
-- kill_xs
------------------------------------------------------------------------------------
function kill_xs.dosomething1(n,l,w)
	local _tb
	if findstring(l,"����Ծ���ᣬ��ʱ���ء����ˡ����֮���������������������˸˸��.+ֻ���Ӵ�.+����ͬ��λ��Ϯ������","�ڿ�����ת����֮�����������������������䵽�˵��ϡ�",".+�����������˸�Ȧ�ӣ�������һ�У��Ƿ����е�.+�����·ɻ�������У�") then
		pfmid=pfmid+1
		_tb=utils.split(killpfm,"|")
		if pfmid>table.getn(_tb) then pfmid=1 end
	end
	if findstring(l,"����Ҫ������Ӳ���ʹ�á����ִ�ת����") then
		alias.uw()
		pfmid=pfmid+1
		_tb=utils.split(killpfm,"|")
		if pfmid>table.getn(_tb) then pfmid=1 end
	end
end
------------------------------------------------------------------------------------
-- kill_em
------------------------------------------------------------------------------------
function kill_em.dosomething1(n,l,w)
	if findstring(l,"������������ڼҹ����������������㣬ʹ������һ�С�","������������ڼҹ������ϲ�������ʹ������") then
		alias.max()
	end
	if findstring(l,"���������к��ʱ��ʱ�֣�һ���ӱ��������ġ�") then
		reyun=0
	end
	if findstring(l,"������̫�����η�֮����ɢ�������ָֻ���ԭ״��","��ող�ʹ����̫�����η�������ô��ʱ�����ظ�ʹ���Ƿǳ��к��ģ�") then
		reyun=1
	end
	if findstring(l,"�����ţ��������ɷ磬���п������ף�����㹥���˶���.+������") then
		alias.yjl()
	end
end
------------------------------------------------------------------------------------
-- kill_gm
------------------------------------------------------------------------------------
function kill_gm.dosomething1(n,l,w)
	if findstring(l,"����Ů�ľ��ķ�����ɢȥ�������𽥻ָ���̬��") then
		reyun=1
	end
	if findstring(l,"ֻ����΢΢һЦ�����鰲�������о���û������һ����") then
		reyun=0
	end
	if findstring(l,"���Ѿ���˫������ˡ�","������һ����������������ܺܺõ�ʹ��˫����赵ľ���֮����","�������˫�����ܺ�����һ�����","��Ľ�����Ϊ������","��ͻȻ�����ֳ����һ�ѽ���˫��ʹ����Ȼ��ͬ�Ľ������������һ���������") then
		pfmid=pfmid+1
		_tb=utils.split(killpfm,"|")
		if pfmid>table.getn(_tb) then pfmid=1 end
	end
end
------------------------------------------------------------------------------------
-- kill_xx
------------------------------------------------------------------------------------
function kill_xx.dosomething1(n,l,w)
	if findstring(l,"��΢��ƣ����ֻ�ý�����������ջء�") then
		reyun=1
	end
	if findstring(l,"����ɫ���䣬��ֻ�ֽ��沢����ǰ��Ǳ���ڹ����������󷨹�������ȫ��","���Ѿ������û����󷨻�ס�����Ѩ��") then
		reyun=0
	end
	if findstring(l,"�����.+������������ԴԴ���������˽�����",".+�Ѿ�������ɢ�����Ѿ��޷�����������ȡ�κ������ˣ�","����ȡ����������ȫ���޷�����ȡ������","ͻȻ������һЦ����׼���ᣬ�����͵���.+��ȥ��\n.+ת���飬�������ܣ�ֻ��ͦ������֡����˵ز������Ǹ��ֱ�ƴ����") then
		xx.suck=2
	end
	if findstring(l,"�����.+������������ԴԴ���������˽�����",".+�Ѿ�������ɢ�����Ѿ��޷�����������ȡ�����ˣ�") then
		xx.suck=1
	end
	if findstring(w[0],"��ת�ּ��Ѿ�����������ʩչ������������Ӱ������㾫��˲ʱ���",".+�Ѿ�������ɢ�����Ѿ��޷�����������ȡ�κ������ˣ�",".+�Ѿ�������ɢ�����Ѿ��޷�����������ȡ�����ˣ�") then
		xx.suck=2
		run("yun huagong "..killid)
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function kill.update()
	local  kill_triggerlist={
	       {name="kill_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_triggerlist) do
		addtri(v.name,v.regexp,"kill",v.script,v.line)
	end
	local  kill_m_triggerlist={
	       {name="kill_m_dosth1",line=2,regexp="^(> > > |> > |> |)�������һ���������\\.\\.\\.\\n\\S+ -\\Z",script=function(n,l,w)    kill.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"kill",v.script,v.line)
	end
	closeclass("kill")
	
	local  kill_run_triggerlist={
	       {name="kill_run_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_run.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_run_triggerlist) do
		addtri(v.name,v.regexp,"kill_run",v.script,v.line)
	end
	closeclass("kill_run")
	
	local  kill_dl_triggerlist={
	       {name="kill_dl_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_dl.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_dl_triggerlist) do
		addtri(v.name,v.regexp,"kill_dl",v.script,v.line)
	end
	closeclass("kill_dl")
	
	local  kill_gb_triggerlist={
	       {name="kill_gb_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_gb.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_gb_triggerlist) do
		addtri(v.name,v.regexp,"kill_gb",v.script,v.line)
	end
	local  kill_gb_m_triggerlist={
	       {name="kill_gb_m_dosth1",line=2,regexp="^(> > > |> > |> |)��ʹ���򹷰����������־����ó���ɽ��Ӱ����.+��û��\\n�����������˸���æ���ң�һʱ�޷����н�����\\Z",script=function(n,l,w)    kill_gb.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_gb_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"kill_gb",v.script,v.line)
	end
	closeclass("kill_gb")
	
	local  kill_hs_triggerlist={
	       {name="kill_hs_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_hs.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_hs_triggerlist) do
		addtri(v.name,v.regexp,"kill_hs",v.script,v.line)
	end
	closeclass("kill_hs")
	
	local  kill_qz_triggerlist={
	       {name="kill_qz_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_qz.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_qz_triggerlist) do
		addtri(v.name,v.regexp,"kill_qz",v.script,v.line)
	end
	closeclass("kill_qz")
	
	local  kill_sl_triggerlist={
	       {name="kill_sl_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_sl.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_sl_triggerlist) do
		addtri(v.name,v.regexp,"kill_sl",v.script,v.line)
	end
	closeclass("kill_sl")
	
	local  kill_bt_triggerlist={
	       {name="kill_bt_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_bt.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_bt_triggerlist) do
		addtri(v.name,v.regexp,"kill_bt",v.script,v.line)
	end
	local _tb2={
		"��������ʾ�����ͣ������\\n���ǹ���������\\Z",
		"��������������������˵С�\\nʲô��\\Z",
		"�㷢��(.+)��������Щ��������\\n�����ʱ͵Ϯ�ɹ������Դ�Ķ���ȫ�޻���֮����\\Z",
	}
	local  kill_bt_m_triggerlist={
	       {name="kill_bt_m_dosth2",line=2,regexp=linktri(_tb2),script=function(n,l,w)    kill_bt.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(kill_bt_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"kill_bt",v.script,v.line)
	end
	closeclass("kill_bt")
	
	local  kill_xs_triggerlist={
	       {name="kill_xs_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_xs.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_xs_triggerlist) do
		addtri(v.name,v.regexp,"kill_xs",v.script,v.line)
	end
	closeclass("kill_xs")
	
	local  kill_em_triggerlist={
	       {name="kill_em_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_em.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_em_triggerlist) do
		addtri(v.name,v.regexp,"kill_em",v.script,v.line)
	end
	closeclass("kill_em")
	
	local  kill_gm_triggerlist={
	       {name="kill_gm_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_gm.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_gm_triggerlist) do
		addtri(v.name,v.regexp,"kill_gm",v.script,v.line)
	end
	closeclass("kill_gm")
	
	local  kill_xx_triggerlist={
	       {name="kill_xx_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    kill_xx.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_xx_triggerlist) do
		addtri(v.name,v.regexp,"kill_xx",v.script,v.line)
	end
	local  kill_xx_m_triggerlist={
	       {name="kill_xx_m_dosth1",line=2,regexp="^(> > > |> > |> |)ͻȻ������һЦ����׼���ᣬ�����͵���.+��ȥ��\\n.+ת���飬�������ܣ�ֻ��ͦ������֡����˵ز������Ǹ��ֱ�ƴ����\\Z",script=function(n,l,w)    kill_xx.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(kill_xx_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"kill_xx",v.script,v.line)
	end
	closeclass("kill_xx")
end
kill.update()