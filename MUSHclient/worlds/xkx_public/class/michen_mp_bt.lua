mp_bt={}
mp_bt_pre={}
mp_bt_start={}
mp_bt_watch={}

function alias.searchxy1()
	xy.findxy=0
	xy.roomno=0
	run("look;set searchxy=1801")
	roomono_now=1801
	run("open door;d;set searchxy=2024")
	roomono_now=2024
	run("n;set searchxy=2025")
	roomono_now=2025
	run("open door;d;set searchxy=2026")
	roomono_now=2026
	run("open door;u;set searchxy=2025")
	roomono_now=2025
	run("s;set searchxy=2024")
	roomono_now=2024
	run("open door;u;set searchxy=1801")
	roomono_now=1801
	run("e;set searchxy=1800")
	roomono_now=1800
	run("e;set searchxy=1799")
	roomono_now=1799
	run("e;set searchxy=1798")
	roomono_now=1798
	run("n;set searchxy=1807")
	roomono_now=1807
	run("nw;set searchxy=1808")
	roomono_now=1808
	run("se;set searchxy=1807")
	roomono_now=1807
	run("s;set searchxy=1798")
	roomono_now=1798
	run("e;set searchxy=1797")
	roomono_now=1797
	run("set searchxy=step1")
end
function alias.searchxy2()
	xy.findxy=0
	xy.roomno=0
	run("look;set searchxy=1797")
	roomono_now=1797
	run("n;set searchxy=1809")
	roomono_now=1809
	run("n;set searchxy=1810")
	roomono_now=1810
	run("s;set searchxy=1809")
	roomono_now=1809
	run("s;set searchxy=1797")
	roomono_now=1797
	run("ed;set searchxy=1811")
	roomono_now=1811
	run("nw;set searchxy=1812")
	roomono_now=1812
	run("n;set searchxy=1813")
	roomono_now=1813
	run("nw;set searchxy=1814")
	roomono_now=1814
	run("e;set searchxy=1815")
	roomono_now=1815
	run("w;set searchxy=1814")
	roomono_now=1814
	run("se;set searchxy=1813")
	roomono_now=1813
	run("s;set searchxy=1812")
	roomono_now=1812
	run("se;set searchxy=1811")
	roomono_now=1811
	run("e;set searchxy=1816")
	roomono_now=1816
	run("set searchxy=step2")
end
function alias.searchxy3()
	xy.findxy=0
	xy.roomno=0
	run("look;set searchxy=1816")
	roomono_now=1816
	run("w;set searchxy=1811")
	roomono_now=1811
	run("wu;set searchxy=1797")
	roomono_now=1797
	run("s;set searchxy=1806")
	roomono_now=1806
	run("sw;set searchxy=1805")
	roomono_now=1805
	run("nw;set searchxy=1802")
	roomono_now=1802
	run("sw;set searchxy=1804")
	roomono_now=1804
	run("ne;set searchxy=1802")
	roomono_now=1802
	run("w;set searchxy=1803")
	roomono_now=1803
	run("e;set searchxy=1802")
	roomono_now=1802
	run("n;set searchxy=1798")
	roomono_now=1798
	run("w;set searchxy=1799")
	roomono_now=1799
	run("w;set searchxy=1800")
	roomono_now=1800
	run("w;set searchxy=1801")
	roomono_now=1801
	run("set searchxy=step3")
end
------------------------------------------------------------------------------------
-- mp_bt_pre
------------------------------------------------------------------------------------
function mp_bt_pre.dosomething1(n,l,w)
	local _f,a,b,c
	wait.make(function()
		if findstring(l,"  Ѳׯ��ʦ ����%(Xin yi%)") then
			xy.findxy=1
		end
		a,b,c=string.find(l,"��Ŀǰ��û���κ�Ϊ searchxy=(%d+) �ı����趨��")
		if c~=nil and tonumber(c)>0 then
			if xy.findxy>0 and xy.roomno==0 then
				xy.roomno=tonumber(c)
				print("��"..tostring(xy.roomno).."��������")
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			if not isopen("boat") then
				if roomno_now==me.menpaiJobStart then
					xy.findxy=0
					if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
					_f=function() alias.searchxy1() end
					wait.time(1);_f()
				else alias.flytoid(me.menpaiJobStart) end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=mp �ı����趨��") then
			alias.resetidle()
			if xy.xyLimited>0 and xy.biteLimited>0 then xy.limitedResume=xy.limitedResume+1 end
			alias.checkbusy("xy")
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ searchxy=false �ı����趨��") then
			alias.resetidle()
			alias.startworkflow()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
			alias.resetidle()
			if mpJobLimited>0 then alias.startworkflow() else alias.dz(set_neili) end
		end
		if findstring(l,"�������磬���ֵ�ͼ��"..tostring(me.menpaiJobStart).."�������") then
			alias.resetidle()
			needquit=0
			if not isopen("dazuo") then
				if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
				_f=function() alias.searchxy1() end
				wait.time(2);_f()
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ searchxy=step1 �ı����趨��") then
			alias.yjl()
			if xy.findxy>0 then
				print("Ŀ�귿�䣺"..tostring(xy.roomno))
				closeclass("mp_bt_pre")
				openclass("mp_bt_start")
				xy.name=""
				alias.flytoid(xy.roomno)
			else
				if havefj>0 then alias.startworkflow()
				else
					_f=function() alias.searchxy2() end
					wait.time(2);_f()
				end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ searchxy=step2 �ı����趨��") then
			alias.yjl()
			if xy.findxy>0 then
				print("Ŀ�귿�䣺"..tostring(xy.roomno))
				closeclass("mp_bt_pre")
				openclass("mp_bt_start")
				xy.name=""
				alias.flytoid(xy.roomno)
			else
				if havefj>0 then alias.startworkflow()
				else
					_f=function() alias.searchxy3() end
					wait.time(2);_f()
				end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ searchxy=step3 �ı����趨��") then
			alias.yjl()
			if xy.findxy>0 then
				print("Ŀ�귿�䣺"..tostring(xy.roomno))
				closeclass("mp_bt_pre")
				openclass("mp_bt_start")
				xy.name=""
				alias.flytoid(xy.roomno)
			else run("set searchxy=false") end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=xy �ı����趨��") then
			alias.yjl()
			alias.et()
			run("get gold from corpse")
			alias.startworkflow()
		end
	end)
end
------------------------------------------------------------------------------------
-- mp_bt_start
------------------------------------------------------------------------------------
function mp_bt_start.dosomething1(n,l,w)
	local _f,a,b,c,d,_tb
	if findstring(l,"�Է���æ���أ���Ȼ�����ʻ��ɡ�") then
		wait.make(function()
			_f=function()
						alias.resetidle()
						run("ask xin yi about �������")
				end
			wait.time(1);_f()
		end)
	end
	a,b,c=string.find(l,"������(.+)��ɱ���㣡")
	if c~=nil then
		if string.len(xy.name)==0 then
			xy.name=c
			run("id here")
		end
	end
	a,b,c,d=string.find(l,xy.name.."%s+=%s+(%w+) (%w+), %w+")
	if c~=nil and d~=nil and xy.name~="����" and xy.name~="" then
		xy.id=string.lower(c).." "..string.lower(d)
		alias.resetidle()
		run("hp")
		openclass("kill")
		run("set no_parry 1")
		openclass("kill_"..me.menpai)
		closeclass("kill_run")
		AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
		SetTimerOption("kill_timer", "group", "kill")
		runaway=false
		npcfaint=false
		killRunSuccess=false
		killid=xy.id
		killname=xy.name
		killskill=mpweapon
		killpfm=mppfm
		killyun=mpyun
		killjiali=mpjiali
		killjiajin=mpjiajin
		run("jiali "..mpjiali..";jiajin "..mpjiajin)
		wait.make(function()
			_f=function()
						_tb=utils.split(mpyun,"|")
						for k,v in ipairs(_tb) do run(v) end
						if xy.pfm() then
							if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
						else alias.uw() end
						run("kill "..xy.id..";convert staff;attack "..xy.id)
						if xy.pfm() then
							_tb=utils.split(mppfm,"|")
							run(_tb[pfmid].." "..xy.id)
						end
				end
			wait.time(1.5);_f()
		end)
	end
	if findstring(l,"����û�� xin yi ����ˡ�") then
		closeclass("mp_bt_start")
		openclass("mp_bt_pre")
		run("set searchxy=false")
	end
	if findstring(l,"�������磬���ֵ�ͼ��"..tostring(xy.roomno).."�������") then
		alias.resetidle()
		if not isopen("dazuo") then run("ask xin yi about �������") end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ killover= �ı����趨��","��Ŀǰ��û���κ�Ϊ killover=yes �ı����趨��") then
		closeclass("mp_bt_start")
		openclass("mp_bt_pre")
		alias.checkexp("mp")
	end
	if findstring(l,"�ȶ������̫���ˡ�") then
		alias.close_kill()
		needquit=1
		alias.flytoid(1803)
	end
	if findstring(w[0],"�������Ŵ����йء�������֡�����Ϣ��\n����˵������˵���ǣ�����ɲ�������н��롣") then
		closeclass("mp_bt_start")
		openclass("mp_bt_pre")
		run("set searchxy=false")
	end
end
------------------------------------------------------------------------------------
-- mp_bt_watch
------------------------------------------------------------------------------------
function mp_bt_watch.dosomething1(n,l,w)
	local a,b,c
	if findstring(l,"���Ȼ����һ��˵������ƣ�������������ι��̫���ˡ�") then
		if xy.xyLimited>0 then xy.biteLimited=1 end
		if xy.xyLimited>0 and (xy.limitedResume+1)>=5 then
			mpJobLimited=1
			print("ͳ�Ƶ���xy+bite����Ϊ��"..tostring(mpLimited.mpexp))
			mpLimited.MarkExp=tonumber(mpLimited.mpexp)
			run("perform heji")
			if mpLimited.MarkTime<(os.time()-3600) then
				-- #if @debug {#say ��xyʱ��ȴ��Ȼbusy���Ƴ�2����}
				mpLimited.MarkTime=tonumber(os.time()-3600+120)
			end
		end
	end
	if findstring(l,"�����ио���һ���ᷳ��������Ӧ��ȥ�����Ĺ������ˡ�") then
		xy.xyLimited=1
		if xy.biteLimited>0 and (xy.limitedResume+1)>=5 then
			mpJobLimited=1
			print("ͳ�Ƶ���xy+bite����Ϊ��"..tostring(mpLimited.mpexp))
			mpLimited.MarkExp=tonumber(mpLimited.mpexp)
			run("perform heji")
			if mpLimited.MarkTime<(os.time()-3600) then
				-- #if @debug {#say ��xyʱ��ȴ��Ȼbusy���Ƴ�2����}
				mpLimited.MarkTime=tonumber(os.time()-3600+120)
			end
		end
	end
	if findstring(l,"��ֻ���á�����Ѩ����һ�����飬��ָ������.+�������ȣ����ڵ��£�","��ֻ��������.+�Ȱѳֲ��������ַɳ���","��.+����ľ���ѵ�һ����.+�ȵ����˵��ϡ�") then
		if not isopen("kill") then
			run("hp")
			openclass("kill")
			run("set no_parry 1")
			openclass("kill_"..me.menpai)
			closeclass("kill_run")
			AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
			SetTimerOption("kill_timer", "group", "kill")
			runaway=false
			npcfaint=false
			killRunSuccess=false
			killid=""
			killname=""
			killskill=mpweapon
			killpfm=mppfm
			killyun=mpyun
			killjiali=mpjiali
			killjiajin=mpjiajin
			run("jiali "..fjjiali..";jiajin "..fjjiajin)
			have.staff=have.staff-1
			wieldweapon=1
			getweapon=1
		end
	end
	if findstring(l,"ֻ����.+һ���������е�.+���Ѿ���Ϊ���أ�") then
		if not isopen("kill") then
			run("hp")
			openclass("kill")
			run("set no_parry 1")
			openclass("kill_"..me.menpai)
			closeclass("kill_run")
			AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
			SetTimerOption("kill_timer", "group", "kill")
			runaway=false
			npcfaint=false
			killRunSuccess=false
			killid=""
			killname=""
			killskill=mpweapon
			killpfm=mppfm
			killyun=mpyun
			killjiali=mpjiali
			killjiajin=mpjiajin
			run("jiali "..fjjiali..";jiajin "..fjjiajin)
			have.staff=have.staff-1
			wieldweapon=1
		end
	end
	if findstring(l,"��.+����ľ��������ʹ.+") then
		if not isopen("kill") then
			run("hp")
			openclass("kill")
			run("set no_parry 1")
			openclass("kill_"..me.menpai)
			closeclass("kill_run")
			AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
			SetTimerOption("kill_timer", "group", "kill")
			runaway=false
			npcfaint=false
			killRunSuccess=false
			killid=""
			killname=""
			killskill=mpweapon
			killpfm=mppfm
			killyun=mpyun
			killjiali=mpjiali
			killjiajin=mpjiajin
			run("jiali "..fjjiali..";jiajin "..fjjiajin)
			--if jifa.forcename=="xuanyinzhenqi" then alias.jfhbmz() else Execute("/alias.jf"..me.menpai.."()") end
		end
	end
	if findstring(l,"�������磬���ֵ�ͼ��1803�������") then
		if needquit>0 then
			openclass("quit")
			stat.quiting=0
		end
	end
	if findstring(l,"�������һ��ҧס"..xy.name.."���ʺ����͵�����Ѫ����") then
		if xy.checkfirstbite>0 then xy.checkfirstbite=0 end
	end
	if findstring(l,"���������������㵸�����񷢷�һ�㡣") then
		run("convert staff")
	end
	if findstring(l,"����������ã����ܴ�����") then
		alias.flytoid(1801)
	end
	a,b,c=string.find(l,"ͨ����ɱ���������������ɣ�����(%d+)��ʵս���飡")
	if c~=nil then
		xy.xyexp=tonumber(c)
	end
	if findstring(w[0],"�������Ŵ����йء�������֡�����Ϣ��\n����˵���������ȴ�����������\n����˵�����ղŵ����˿��������ˡ��������ְ���������ô��") then
		needquit=1
		alias.flytoid(1803)
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function mp_bt.update()
	local  mp_bt_pre_triggerlist={
	       {name="mp_bt_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_bt_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_bt_pre_triggerlist) do
		addtri(v.name,v.regexp,"mp_bt_pre",v.script,v.line)
	end
	closeclass("mp_bt_pre")
	
	local  mp_bt_start_triggerlist={
	       {name="mp_bt_start_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_bt_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_bt_start_triggerlist) do
		addtri(v.name,v.regexp,"mp_bt_start",v.script,v.line)
	end	
	local _tb2={
		"�������Ŵ����йء�������֡�����Ϣ��\\n����˵������˵���ǣ�����ɲ�������н��롣\\Z",
	}
	local  mp_bt_start_m_triggerlist={
	       {name="mp_bt_start_m_dosth2",line=2,regexp=linktri2(_tb2),script=function(n,l,w)    mp_bt_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_bt_start_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_bt_start",v.script,v.line)
	end
	closeclass("mp_bt_start")
	
	local  mp_bt_watch_triggerlist={
	       {name="mp_bt_watch_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_bt_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_bt_watch_triggerlist) do
		addtri(v.name,v.regexp,"mp_bt_watch",v.script,v.line)
	end	
	local _tb3={
		"�������Ŵ����йء�������֡�����Ϣ��\\n����˵���������ȴ�����������\\n����˵�����ղŵ����˿��������ˡ��������ְ���������ô��\\Z",
	}
	local  mp_bt_watch_m_triggerlist={
	       {name="mp_bt_watch_m_dosth3",line=3,regexp=linktri2(_tb3),script=function(n,l,w)    mp_bt_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_bt_watch_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_bt_watch",v.script,v.line)
	end
	closeclass("mp_bt_watch")
end
mp_bt.update()

