ftb={}
ftb_ask={}
ftb_pre={}
ftb_start={}
ftb_watch={}

ftbnum=0
ftbareanum=0
ftbroom=""
ftbzone=""
ftbnpcabandon=0

if ftbselectnpc==nil then ftbselectnpc={} end
function ftbselectnpc.select()
	local _t,_tb
	--if workflow.nowjob=="lzjob" then return 1 end
	_t=_G["ftbselectnpc"][ftbselectnpc.menpai]
	_tb=utils.split(_t,"|")
	return tonumber(_tb[ftbselectnpc.weapon+1])
end
------------------------------------------------------------------------------------
-- ftb_ask
------------------------------------------------------------------------------------
function ftb_ask.dosomething1(n,l,w)
	if findstring(l,"�����������ĵ㷿�����ʧ�ܣ�") then
		if me.menpai=="xs" then run("ask lingzhi shangren about abandon") end
		if me.menpai=="xx" then xx.needsandu=1 end
		alias.startworkflow()
	end
	if findstring(l,"����û�� cheng ����ˡ�") then
		alias.resetidle()
		if me.menpai=="xx" then
			xx.needsandu=1
			alias.startworkflow()
		elseif hp.pot<100 then
			alias.dz("addneili")
			resumejob="ask cheng about job"
			openclass("ftb_pre")
		else alias.startxue() end
	end
end
function ftb_ask.dosomething2(n,l,w)
	if findstring(w[0],"����̽𸫴����йء�job������Ϣ��\n�̽𸫽����㼸���ƽ�","����̽𸫴����йء�job������Ϣ��\n�̽�˵����������, ��ͷ��Ϳ��������Ĵ�Ű�!") then
		alias.resetidle()
		closeclass("ftb_ask")
		openclass("ftb_pre")
		alias.checkexp("ftb")
	end
end
function ftb_ask.dosomething3(n,l,w)
	local a,b,c,d,e
	a,b,c,d,e=string.find(w[0],"����̽𸫴����йء�job������Ϣ��\n�̽�˵������˵��(.+)���һ���Ա��ﲻ��.\n�̽�˵������˵�����Ѿ�����([^(]+).*��Բ(.+)��֮��%.")
	if c~=nil and d~=nil and e~=nil then
		alias.resetidle()
		ftbnum=ctonum(c)
		ftbarea=d
		ftbareanum=ctonum(e)
		if ftbareanum>4 then ftbareanum=4 end
		alias.ftbarea(ftbarea)
		if ftbroom=="���ﶴ" then ftbroom="��С·" end
		if string.len(ftbweapon)>0 then
			if ftbweapon=="staff" then alias.wi(staffid) else alias.wi(ftbweapon) end
		end
		alias.flytoarea(ftbroom,ftbzone,ftbareanum+1)
		addlog(ftbzone.." "..ftbroom.." ��Χ="..tostring(ftbareanum+1).." ����="..tostring(ftbnum))
		-- #if @explist.keephour {#add explist.tempinfo %concat( @ftbzone, " ", @ftbroom, " ��Χ=", %eval( @ftbareanum+1), " ����=", @ftbnum)}
	end
	if findstring(w[0],"����̽𸫴����йء�job������Ϣ��\n�̽�һ�������������ƨ�ɣ�\n�̽�˵����ȥ����ô�òŻ���, �˼��������") then
		alias.resetidle()
		if not isopen("ftb_pre") then alias.startftb() end
	end
end
function ftb_ask.dosomething4(n,l,w)
	local a,b,c,d,e
	a,b,c,d,e=string.find(w[0],"����̽𸫴����йء�job������Ϣ��\n�̽�˵��������͸��߹�����:\n�̽�˵������˵��(.+)���һ���Ա��ﲻ��.\n�̽�˵������˵�����Ѿ�����([^(]+).*��Բ(.+)��֮��")
	if c~=nil and d~=nil and e~=nil then
		alias.resetidle()
		if me.menpai=="xx" then
			xx.needsandu=1
			alias.startworkflow()
		elseif hp.pot<100 then
			alias.dz("addneili")
			resumejob="ask cheng about job"
			openclass("ftb_pre")
		else alias.startxue() end
	end
end
------------------------------------------------------------------------------------
-- ftb_pre
------------------------------------------------------------------------------------
function ftb_pre.dosomething1(n,l,w)
	if findstring(l,"�������������Ǹ���,Ϻ�׶��ǳ������������á������") then
		alias.resetidle()
		if ftbnpckilled>0 then run("ask cheng about job") end
		alias.et()
		alias.yjl()
		alias.checkitems()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=ftb �ı����趨��") then
		alias.resetidle()
		ftbnpckilled=0
		ftbnpcabandon=0
		ftbnum=0
		workflow.nowjob="ftb"
		alias.startworkflow()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
		alias.resetidle()
		if not isopen("boat") then
			if havefj>0 then
				alias.startworkflow()
			elseif tonumber(roomno_now)==1705 then
				closeclass("ftb_pre")
				openclass("ftb_ask")
				run("ask cheng about job")
			else alias.startftb() end
		end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
		alias.resetidle()
		if me.menpai=="xx" then
			if havefj>0 then
				alias.startworkflow()
			elseif tonumber(roomno_now)==1705 then
				closeclass("ftb_pre")
				openclass("ftb_ask")
				run("ask cheng about job")
			else alias.startftb() end
		else alias.dz(set_neili) end
	end
end
function ftb_pre.dosomething2(n,l,w)
	if findstring(w[0],"����̽𸫴����йء�job������Ϣ��\n�̽𸫽����㼸���ƽ�","����̽𸫴����йء�job������Ϣ��\n�̽�˵����������, ��ͷ��Ϳ��������Ĵ�Ű�!") then
		alias.resetidle()
		alias.checkexp("ftb")
	end
	if findstring(w[0],"����̽𸫴����йء�job������Ϣ��\n�̽�˵��������͸��߹�����:") then
		alias.resetidle()
		closeclass("ftb_pre")
		openclass("ftb_ask")
		run("ask cheng about job")
	end
end
function ftb_pre.dosomething3(n,l,w)
	if findstring(w[0],"����̽𸫴����йء�job������Ϣ��\n�̽�һ�������������ƨ�ɣ�\n�̽�˵����ȥ����ô�òŻ���, �˼��������%.") then
		alias.resetidle()
		alias.startftb()
	end
end
------------------------------------------------------------------------------------
-- ftb_start
------------------------------------------------------------------------------------
function ftb_start.dosomething1(n,l,w)
	local _f,_tb,a,b,c,d,e
	wait.make(function()
		if findstring(l,"���ﲻ׼ս����") then
			rekill=rekill+1
			if workflow.nowjob=="lzjob" then run("ask "..tostring(npcid).." about ���͹�")
			else run("ask "..tostring(npcid).." about ��ͷ��") end
			if rekill>30 then
				closeclass("kill_"..me.menpai)
				closeclass("kill")
				wieldweapon=0
				getweapon=0
				run("set killover=yes")
			end
		end
		if findstring(l,"��æ���أ���Ȼ�����ʻ��ɡ�") then
			if npcid==nil then npcid="" end
			_f=function() run("ask "..npcid.." about �̿�") end
			wait.time(1);_f()
		end
		if findstring(l,"�������û�г�·��") then
			gpserrnum=gpserrnum+1
		end
		a,b,c=string.find(l,"����������(.+)���֡�")
		if c~=nil then
			if findstring(c,"����μ�") then ftbselectnpc.menpai="dl" end
			if findstring(c,"ȫ���") then ftbselectnpc.menpai="qz" end
			if findstring(c,"�䵱��") then ftbselectnpc.menpai="wd" end
			if findstring(c,"������") then ftbselectnpc.menpai="sl" end
			if findstring(c,"�һ���") then ftbselectnpc.menpai="th" end
			if findstring(c,"������") then ftbselectnpc.menpai="em" end
			if findstring(c,"��ɽ��") then ftbselectnpc.menpai="hs" end
			if findstring(c,"������") then ftbselectnpc.menpai="xx" end
			if findstring(c,"����ɽ") then ftbselectnpc.menpai="bt" end
			if findstring(c,"ѩɽ��") then ftbselectnpc.menpai="xs" end
			if findstring(c,"����") then ftbselectnpc.menpai="xs" end
			if findstring(c,"ؤ��") then ftbselectnpc.menpai="gb" end
			ftbselectnpc.weapon=0
		end
		a,b,c=string.find(l,"��(.+)%(.+%)")
		if c~=nil then
			if not findstring(c,"Ƥ����") then ftbselectnpc.weapon=1 end
			if findstring(c,"����") then
				ftbselectnpc.menpai="bt"
				ftbselectnpc.weapon=1
				if me.menpai=="xs" and lzjob.open>0 then print("�����ж���������ɱ") end
			end
		end
		if findstring(l,'�趨����������walk = "off"') then
			alias.resetidle()
			run("set checknpc=yes")
		end
		a,b,c,d=string.find(l,"%s+��.+��(.+)%((.+)%)")
		if c~=nil and d~=nil then
			if workflow.nowjob=="ftb" then
				alias.resetidle()
				npcfind=1
				ftbnpcname=additem(ftbnpcname,c)
				ftbnpcid=additem(ftbnpcid,string.lower(d))
				ftbnpcindex=1
			end
		end
		a,b,c,d,e=string.find(l,"(.+)%((%w+) (%w+)%)")
		if c~=nil and d~=nil and e~=nil and findstring(c,lzjob.name) then
			if workflow.nowjob=="lzjob" then
				alias.resetidle()
				npcfind=1
				ftbnpcname=lzjob.name
				ftbnpcid=string.lower(d).." "..string.lower(e)
				ftbnpcindex=1
			end
		end
		if findstring(l,"ͻȻ��(.+)�����е���һ�����͹ޡ�") then
			run("halt;get suyou guan")
		end
		if findstring(l,"�Է���æ���أ���Ȼ�����ʻ��ɡ�") then
			alias.resetidle()
			ftbnpcindex=ftbnpcindex+1
			_tb=utils.split(ftbnpcid,"|")
			if ftbnpcindex<=table.getn(_tb) then
				_tb=utils.split(ftbnpcname,"|")
				npcname=_tb[ftbnpcindex]
				_tb=utils.split(ftbnpcid,"|")
				npcid=_tb[ftbnpcindex]
				run("ask "..npcid.." about �̿�")
			else
				npcfind=0
				ftbnpcindex=1
				_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
				if cmd.nums<cmd.setnums then
					_f()
				else
					wait.time(0.5);_f()
				end
			end
		end
		a,b,c=string.find(l,"����û�� (.+) ����ˡ�")
		if c~=nil and c==npcid then
			alias.resetidle()
			ftbnpcindex=ftbnpcindex+1
			_tb=utils.split(ftbnpcid,"|")
			if ftbnpcindex<=table.getn(_tb) then
				_tb=utils.split(ftbnpcname,"|")
				npcname=_tb[ftbnpcindex]
				_tb=utils.split(ftbnpcid,"|")
				npcid=_tb[ftbnpcindex]
				run("ask "..npcid.." about �̿�")
			else
				npcfind=0
				ftbnpcindex=1
				_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
				if cmd.nums<cmd.setnums then
					_f()
				else
					wait.time(0.2);_f()
				end
			end
		end
		if findstring(l,"��Ҫ��˭�� kick4 ���������","�������������ߣ�ֻ�ߵõ��ϵİ�ѩ�ɽ���") then
			alias.resetidle()
			ftbnpcindex=ftbnpcindex+1
			_tb=utils.split(ftbnpcid,"|")
			if ftbnpcindex<=table.getn(_tb) then
				_tb=utils.split(ftbnpcname,"|")
				npcname=_tb[ftbnpcindex]
				_tb=utils.split(ftbnpcid,"|")
				npcid=_tb[ftbnpcindex]
				run("kick4 "..npcid)
			else
				npcfind=0
				ftbnpcindex=1
				_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
				if cmd.nums<cmd.setnums then
					_f()
				else
					wait.time(0.2);_f()
				end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ killover=yes �ı����趨��") then
			alias.resetidle()
			ftbnpckilled=ftbnpckilled+1
			ftbnpcindex=ftbnpcindex+1
			alias.yjl()
			if me.menpai=="xs" and lzjob.open>0 then
				run("get suyou guan")
				print("����npcɱ�꣡")
				flytoareastartid=0
				workflow.nowjob="ftb"
				nextJobGodazuobase=1
				openclass("ftb")
				openclass("ftb_pre")
				closeclass("ftb_ask")
				closeclass("ftb_start")
				alias.checkexp("ftb")
			else
				_tb=utils.split(ftbnpcid,"|")
				if ftbnpcindex<=table.getn(_tb) then
					_tb=utils.split(ftbnpcname,"|")
					npcname=_tb[ftbnpcindex]
					_tb=utils.split(ftbnpcid,"|")
					npcid=_tb[ftbnpcindex]
					run("ask "..npcid.." about �̿�")
				else
					npcfind=0
					ftbnpcindex=1
					_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
					if tonumber(ftbnpckilled)<tonumber(ftbnum) then
						wait.time(0.1);_f()
					else
						print("����npcɱ�꣡")
						alias.startftb()
					end
				end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=killstart �ı����趨��") then
			alias.resetidle()
			_tb=utils.split(ftbpfm,"|")
			if findstring(_tb[pfmid],"leidong") and me.menpai=="hs" then
				run("jifa dodge huashan-shenfa;jifa parry pishi-poyu")
			end
			if me.menpai=="hs" then
				if me.master=="������" then run("jifa sword dugu-jiujian")
				elseif ftbweapon=="jian" then run("jifa parry huashan-jianfa")
				elseif ftbweapon=="staff" then run("jifa parry jinhua-zhang") end
			end
			if me.menpai=="bt" then run("conver staff;attack "..npcid) end
			if me.menpai=="mj" then run("order fighter do attack "..npcid..";order fighter 2 do attack "..npcid) end
			if me.menpai=="xs" and lzjob.open then print("lzjob ��ʼɱ��") end
			_tb=utils.split(killyun,"|")
			for k,v in ipairs(_tb) do run(v) end
			run("kill "..npcid)
			_tb=utils.split(killpfm,"|")
			run(_tb[pfmid].." "..npcid)
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checknpc=menpai �ı����趨��") then
			alias.resetidle()
			if ftbselectnpc.select()>0 then
				-- #say ����@ftbselectnpc.menpai npc @npcname~(@npcid~)��%if( @ftbselectnpc.weapon, ����, û����)
				-- #if @explist.keephour {#add explist.tempinfo %concat( " NPC=", @ftbselectnpc.menpai, " ", %if( @ftbselectnpc.weapon, ����, û����))}
				openclass("kill")
				openclass("kill_"..me.menpai)
				closeclass("kill_run")
				AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
				SetTimerOption("kill_timer", "group", "kill")
				runaway=false
				npcfaint=false
				killRunSuccess=false
				rekill=0
				killid=npcid
				killname=npcname
				killskill=ftbweapon
				killpfm=ftbpfm
				killyun=ftbyun
				killjiali=ftbjiali
				killjiajin=ftbjiajin
				--if me.menpai=="dl" then alias.jfdl() end
				run("jiali "..killjiali..";jiajin "..killjiajin)
				if me.menpai=="hs" then
					if stat.leidong>0 then
						pfmid=2
						if ftbweapon=="staff" then alias.wi(staffid) else alias.wi(ftbweapon) end
					else
						pfmid=1
						alias.uw()
					end
				else
					pfmid=1
					if string.len(ftbweapon)>0 then
						if ftbweapon=="staff" then alias.wi(staffid) else alias.wi(ftbweapon) end
					else alias.uw() end
				end
				if jifa.forcename=="hunyuanyiqi" and ftbselectnpc.menpai=="xx" and ftbselectnpc.weapon>0 then
					run("yun sangong")
				else
					_tb=utils.split(ftbyun,"|")
					for k,v in ipairs(_tb) do run(v) end
				end
				alias.checkbusy("killstart")
			else
				-- #if @debug=1 {#say @ftbselectnpc.menpai npc��%if( @ftbselectnpc.weapon, ����, û����) ��ɱ}
				run("follow none")
				ftbnpcabandon=ftbnpcabandon+1
				ftbnpcindex=ftbnpcindex+1
				_tb=utils.split(ftbnpcid,"|")
				if ftbnpcindex<=table.getn(_tb) then
					_tb=utils.split(ftbnpcname,"|")
					npcname=_tb[ftbnpcindex]
					_tb=utils.split(ftbnpcid,"|")
					npcid=_tb[ftbnpcindex]
					run("ask "..npcid.." about �̿�")
				else
					npcfind=0
					ftbnpcindex=1
					if tonumber(ftbnpcabandon+ftbnpckilled)==ftbnum then
						-- ������ɱ����NPC����������Ҫ�ҵ�NPC������ֱ�ӻ�ȥ��
						if me.menpai=="xs" and lzjob.open>0 then
							openclass("ftb")
							openclass("ftb_pre")
							closeclass("ftb_ask")
							closeclass("ftb_start")
							alias.checkexp("ftb")
						else
							if ftbnpckilled>0 then alias.startftb() else alias.startworkflow() end
						end
					else
						_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
						wait.time(0.1)
						_f()
					end
				end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checknpc=yes �ı����趨��") then
			alias.resetidle()
			if npcfind==0 then
				if cmd.nums<=cmd.setnums then
					if getgold==1 then run("get gold") end
					if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end
				else
					_f=function()
								alias.yjl()
								if getgold==1 then run("get gold") end
								if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end
						end
					wait.time(1);_f()
				end
			else
				npcname=ftbnpcname
				npcid=ftbnpcid
				if me.menpai=="xs" and lzjob.open>0 then run("kick4 "..npcid) else run("ask "..npcid.." about �̿�") end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ searcharea=over �ı����趨��") then
			alias.resetidle()
			print("������ϣ�ɱ��"..ftbnum.."���е�"..ftbnpckilled.."��NPC")
			if me.menpai=="xs" and lzjob.open>0 then
				openclass("ftb")
				openclass("ftb_pre")
				closeclass("ftb_ask")
				closeclass("ftb_start")
				alias.checkexp("ftb")
			elseif ftbnpckilled>0 then alias.startftb()
			else alias.startworkflow() end
		end
		if findstring(l,"����(.+)ƨ��������һ�ţ������ߵü����ﶷ������ȥ�����һ����ײ��ǽ�ϡ�") then
			alias.resetidle()
			killaction=""
			ftbselectnpc.menpai="dl"
			ftbselectnpc.weapon=0
			run("follow "..npcid..";look "..npcid..";set checknpc=menpai")
		end
		a,b,c=string.find(l,"[> ]*(.+)˵����������ô���������������ɱ��!")
		if c~=nil then
			alias.resetidle()
			killaction=""
			if c==npcname then run("follow "..npcid..";look "..npcid..";set checknpc=menpai") end
		end
		a,b,c=string.find(l,"���Ǻ���Ȼ�ģ�(.+)���ڵ�״��û�а취�����κδ𸲡�")
		if c~=nil then
			alias.resetidle()
			if c==npcname then
				ftbnpcindex=ftbnpcindex+1
				_tb=utils.split(ftbnpcid,"|")
				if ftbnpcindex<=table.getn(_tb) then
					_tb=utils.split(ftbnpcname,"|")
					npcname=_tb[ftbnpcindex]
					_tb=utils.split(ftbnpcid,"|")
					npcid=_tb[ftbnpcindex]
					run("ask "..npcid.." about �̿�")
				else
					npcfind=0
					ftbnpcindex=1
					_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
					wait.time(0.2);_f()
				end
			end
		end
		a,b,c=string.find(l,"[> ]*(.+)˵����������յ�, �����д̿�%? Ц��%.")
		if c~=nil then
			alias.resetidle()
			if c==npcname then
				ftbnpcindex=ftbnpcindex+1
				_tb=utils.split(ftbnpcid,"|")
				if ftbnpcindex<=table.getn(_tb) then
					_tb=utils.split(ftbnpcname,"|")
					npcname=_tb[ftbnpcindex]
					_tb=utils.split(ftbnpcid,"|")
					npcid=_tb[ftbnpcindex]
					run("ask "..npcid.." about �̿�")
				else
					npcfind=0
					ftbnpcindex=1
					_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
					if cmd.nums<cmd.setnums then _f() else wait.time(0.5);_f() end
				end
			end
		end
		a,b,c=string.find(l,"[> ]*(.+)˵������%.%.%.%.���ҿɲ��������������ʱ��˰ɡ�")
		if c~=nil then
			alias.resetidle()
			if c==npcname then
				ftbnpcindex=ftbnpcindex+1
				_tb=utils.split(ftbnpcid,"|")
				if ftbnpcindex<=table.getn(_tb) then
					_tb=utils.split(ftbnpcname,"|")
					npcname=_tb[ftbnpcindex]
					_tb=utils.split(ftbnpcid,"|")
					npcid=_tb[ftbnpcindex]
					run("ask "..npcid.." about �̿�")
				else
					npcfind=0
					ftbnpcindex=1
					_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
					if cmd.nums<cmd.setnums then _f() else wait.time(0.5);_f() end
				end
			end
		end
		a,b,c=string.find(l,"[> ]*(.+)�����ʼ磬�ܱ�Ǹ��˵���޿ɷ�档")
		if c~=nil then
			alias.resetidle()
			if c==npcname then
				ftbnpcindex=ftbnpcindex+1
				_tb=utils.split(ftbnpcid,"|")
				if ftbnpcindex<=table.getn(_tb) then
					_tb=utils.split(ftbnpcname,"|")
					npcname=_tb[ftbnpcindex]
					_tb=utils.split(ftbnpcid,"|")
					npcid=_tb[ftbnpcindex]
					run("ask "..npcid.." about �̿�")
				else
					npcfind=0
					ftbnpcindex=1
					_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
					if cmd.nums<cmd.setnums then _f() else wait.time(0.5);_f() end
				end
			end
		end
		a,b,c=string.find(l,"[> ]*(.+)����һ�����˵�����Բ������ʵ�����ʵ��û��ӡ��")
		if c~=nil then
			alias.resetidle()
			if c==npcname then
				ftbnpcindex=ftbnpcindex+1
				_tb=utils.split(ftbnpcid,"|")
				if ftbnpcindex<=table.getn(_tb) then
					_tb=utils.split(ftbnpcname,"|")
					npcname=_tb[ftbnpcindex]
					_tb=utils.split(ftbnpcid,"|")
					npcid=_tb[ftbnpcindex]
					run("ask "..npcid.." about �̿�")
				else
					npcfind=0
					ftbnpcindex=1
					_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
					if cmd.nums<cmd.setnums then _f() else wait.time(0.5);_f() end
				end
			end
		end
		a,b,c=string.find(l,"[> ]*(.+)ҡҡͷ��˵����û��˵����")
		if c~=nil then
			alias.resetidle()
			if c==npcname then
				ftbnpcindex=ftbnpcindex+1
				_tb=utils.split(ftbnpcid,"|")
				if ftbnpcindex<=table.getn(_tb) then
					_tb=utils.split(ftbnpcname,"|")
					npcname=_tb[ftbnpcindex]
					_tb=utils.split(ftbnpcid,"|")
					npcid=_tb[ftbnpcindex]
					run("ask "..npcid.." about �̿�")
				else
					npcfind=0
					ftbnpcindex=1
					_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
					if cmd.nums<cmd.setnums then _f() else wait.time(0.5);_f() end
				end
			end
		end
		a,b,c=string.find(l,"[> ]*(.+)�����۾������㣬��Ȼ��֪������˵ʲô��")
		if c~=nil then
			alias.resetidle()
			if c==npcname then
				ftbnpcindex=ftbnpcindex+1
				_tb=utils.split(ftbnpcid,"|")
				if ftbnpcindex<=table.getn(_tb) then
					_tb=utils.split(ftbnpcname,"|")
					npcname=_tb[ftbnpcindex]
					_tb=utils.split(ftbnpcid,"|")
					npcid=_tb[ftbnpcindex]
					run("ask "..npcid.." about �̿�")
				else
					npcfind=0
					ftbnpcindex=1
					_f=function() if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep() else alias.searchareaback() end end
					if cmd.nums<cmd.setnums then _f() else wait.time(0.5);_f() end
				end
			end
		end
		a,b,c=string.find(l,"�������磬���ֵ�ͼ��(%d+)�������")
		if c~=nil and tonumber(c)==tonumber(flytoareastartid) then
			alias.resetidle()
			run("set checknpc=yes")
		end
		if findstring(l,"��Ҫ��˭�� 18mo ���������") then
			alias.startworkflow()
		end
	end)
end
------------------------------------------------------------------------------------
-- ftb_watch
------------------------------------------------------------------------------------
function ftb_watch.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"�˵ز��ʺ�ʩչһέ�ɽ�������") then
			gpserrnum=gpserrnum+1
		end
		if findstring(l,"����ô��˽���㲻�ܴ��߳���һ�ѱ�����") then
			gpserrnum=gpserrnum+1
			dropweapon=dropweapon+1
		end
		if findstring(l,"�������û�г�·��") then
			print(roomno_now.."����")
			if tonumber(roomno_now)==934 then alias.searchareastep3() else gpserrnum=gpserrnum+1 end
		end
		if findstring(l,"��ʦ��������˵�������ʳ����ȥ��������������ߡ�","���̵���ָ��ָ�����ŵ�ʳ�˵�������ݽ̹棬���̵��Ӳ��ý�ʳ�������ʳ�") then
			run("drop ya;drop jiuping")
			gpserrnum=gpserrnum+1
		end
		if findstring(l,"��С��һ�µ���¥��ǰ������һ���������ţ����ס����","������㣬�����е�����Ϣ�ң�","������㣬����Ů������Ϣ�ң�","��һ�������˵�Ů�˵���ȥ���ʲô��","���ϲ�������������������","δ����ɣ����ý���ؾ�����¥��","Ԭ����˵������������������Ϣ�����������") then
			if flytoarealist_backpath==nil or string.len(flytoarealist_backpath)==0 then alias.searchareastep2() else alias.searchareaback2() end
		end
		a,b,c=string.find(l,"[> ]*(.+)%s+%-%s+")
		if c~=nil then
			if not findstring(c,"%)") then roomname=c end
		end
		if findstring(l,"��Ķ�����û����ɣ������ƶ���") then
			if not findstring(roomname,"�һ���") then gpserrnum=gpserrnum+1 end
		end
		if findstring(l,"�����ص���������㻹�ڣ�����һ��, ˵�����㻹û���ϰ���, �����㵽���ߡ�") then
			openclass("boat")
		end
		if findstring(l,"����Ҫ����������ͻȻ�������˽���һ�ģ��úÿ����䣬���Ҷ���") then
			alias.close_gps()
			_f=function() run("s;s;set checknpc=yes") end
			wait.time(5);_f()
		end
		if findstring(l,"^%s+(.+)���ƽ�%(Gold%)") then
			getgold=1
		end
		if findstring(l,"ʯ���ԱߵĲݴ��к�ȻԾ��һ����Ӱ����ס���㣡") then
			run("giveup")
		end
		if findstring(l,"����ؤ�� �������ܵĵ���ͨ��������ؤ�Ｘ����֮��Ѫ��ɡ�") then
			alias.resetidle()
			run("ne;ne;u;set checknpc=yes")
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkGbSecretWay=err �ı����趨��") then
			alias.resetidle()
			_f=function() run("look") end
			wait.time(5);_f()
		end
	end)
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function ftb.update()
	local  ftb_ask_triggerlist={
	       {name="ftb_ask_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    ftb_ask.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(ftb_ask_triggerlist) do
		addtri(v.name,v.regexp,"ftb_ask",v.script,v.line)
	end
	local _tb2={
		"����̽𸫴����йء�job������Ϣ��\\n(.+)\\Z",
	}
	local _tb3={
		"����̽𸫴����йء�job������Ϣ��\\n(.+)\\n(.+)\\Z",
	}
	local _tb4={
		"����̽𸫴����йء�job������Ϣ��\\n(.+)\\n(.+)\\n(.+)\\Z",
	}
	local  ftb_ask_m_triggerlist={
	       {name="ftb_ask_m_dosth2",line=2,regexp=linktri2(_tb2),script=function(n,l,w)    ftb_ask.dosomething2(n,l,w)  end,},
	       {name="ftb_ask_m_dosth3",line=3,regexp=linktri2(_tb3),script=function(n,l,w)    ftb_ask.dosomething3(n,l,w)  end,},
	       {name="ftb_ask_m_dosth4",line=4,regexp=linktri2(_tb4),script=function(n,l,w)    ftb_ask.dosomething4(n,l,w)  end,},
	}
	for k,v in pairs(ftb_ask_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"ftb_ask",v.script,v.line)
	end
	closeclass("ftb_ask")
	
	local  ftb_pre_triggerlist={
	       {name="ftb_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    ftb_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(ftb_pre_triggerlist) do
		addtri(v.name,v.regexp,"ftb_pre",v.script,v.line)
	end
	local _tb2={
		"����̽𸫴����йء�job������Ϣ��\\n(.+)\\Z",
	}
	local _tb3={
		"����̽𸫴����йء�job������Ϣ��\\n(.+)\\n(.+)\\Z",
	}
	local  ftb_pre_m_triggerlist={
	       {name="ftb_pre_m_dosth2",line=2,regexp=linktri2(_tb2),script=function(n,l,w)    ftb_pre.dosomething2(n,l,w)  end,},
	       {name="ftb_pre_m_dosth3",line=3,regexp=linktri2(_tb3),script=function(n,l,w)    ftb_pre.dosomething3(n,l,w)  end,},
	}
	for k,v in pairs(ftb_pre_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"ftb_pre",v.script,v.line)
	end
	closeclass("ftb_pre")
	
	local  ftb_start_triggerlist={
	       {name="ftb_start_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    ftb_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(ftb_start_triggerlist) do
		addtri(v.name,v.regexp,"ftb_start",v.script,v.line)
	end
	closeclass("ftb_start")
	
	local  ftb_watch_triggerlist={
	       {name="ftb_watch_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    ftb_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(ftb_watch_triggerlist) do
		addtri(v.name,v.regexp,"ftb_watch",v.script,v.line)
	end
	closeclass("ftb_watch")
end
ftb.update()
