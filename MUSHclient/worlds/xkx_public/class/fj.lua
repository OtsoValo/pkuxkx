fj={}
fj_watch={}
fj_close={}
fj_escape={}
fj_other={}
fj_pre={}
fj_start={}

------------------------------------------------------------------------------------
-- fj_watch
------------------------------------------------------------------------------------
function fj_watch.dosomething1(n,l,w)
	local a,b,c,d,e
	if findstring(l,"�����㵢���ʱ��̫���ˣ��������ȡ���ˡ�") then havefj=0 end
	a,b,c=string.find(l,"һ��.+�������˹���,���㱨ȭ���������·�(.+)֮���������ٻ�.+����������")
	if c~=nil and c==me.fjmasternick then
		havefj=1
		set_neili=tonumber(set_neili_job)
	end
	a,b,c,d=string.find(l,"[> ]*(.+)������ȥ(.+)���������Ҫ���񣬸Ͽ�ȥִ�аɡ�")
	if c~=nil and d~=nil and c==me.fjmasternick then
		havefj=1
		fjarea=d
		alias.fjarea(fjarea)
	end
	if findstring(l,"�����Ѿ���ɣ��Ͽ��ȥ�����ɡ�") then
		havefj=1
		fjzone=""
		fjroom=""
		fjarea=""
		fjroomid=0
	end
	a,b,c,d=string.find(l,"[> ]*(.+)����˵����Ŀǰ��.+�Ĺ��׶�Ϊ(.+)�㡣")
	if c~=nil and d~=nil and c==me.fjmaster then
		gxd.mp=ctonum(d)
	end
	a,b,c,d=string.find(l,"[> ]*(.+)����˵������Ϊ.+�����Ĺ���Ϊ(.+)�㡣��Ҫ����Ŭ������ȡ���´�.+����ϵõ����������")
	if c~=nil and d~=nil and c==me.fjmaster then
		gxd.me=ctonum(d)
	end
	a,b,c=string.find(l,"[> ]*(.+)�Ѵ���Ҫ�ټ��㣬�㻹�ǿ��ȥ�ɡ�")
	if c~=nil and c==me.fjmasternick then
		havefj=1
	end
	a,b,c,d=string.find(l,"[> ]*(.+)˵��:���������ˣ�(.+)����Ϊ.+������һ������")
	if c~=nil and d~=nil and c==me.fjmaster and d==me.charname then
		havefj=0
		set_neili=tonumber(set_neili_global)
	end
	a,b,c=string.find(l,"��ľ���������(%d+)�㡣")
	if c~=nil then
		fjexp=tonumber(c)
	end
	a,b,c,d=string.find(l,"[> ]*(.+)˵��:���ɵúã�(.+)��������Խ��Խ�������ˡ���")
	if c~=nil and d~=nil and c==me.fjmaster and d==me.charname then
		havefj=0
		set_neili=tonumber(set_neili_global)
	end
	a,b,c,d,e=string.find(w[0],".+˵������(.-)��.+\n(.+)˵��:��������(.+)����.*")
	if c~=nil and d~=nil and e~=nil and c==me.charname and d==me.fjmaster then
		alias.resetidle()
		fjroomid=0
		fjarea=e
		alias.fjarea(fjarea)
	end
end
------------------------------------------------------------------------------------
-- fj_close
------------------------------------------------------------------------------------
function fj_close.dosomething1(n,l,w)
	local a,b,c
	a,b,c=string.find(l,"�������磬���ֵ�ͼ��(%d+)�������")
	if c~=nil and tonumber(c)==me.fjbaseid then
		if not isopen("dazuo") then run("ask "..me.fjmasterid.." about Ҫ������") end
	end
	a,b,c=string.find(l,"����(.+)�����йء�Ҫ����������Ϣ��")
	if c~=nil and c==me.fjmaster then
		havefj=0
		closeclass("fj_close")
		alias.startworkflow()
	end
end
------------------------------------------------------------------------------------
-- fj_escape
------------------------------------------------------------------------------------
function fj_escape.dosomething1(n,l,w)
	local _f,_tb,a,b,c
	wait.make(function()
		a,b,c=string.find(l,"����(.+)�Ķ�������˵�����㲻���ҵĲˣ�")
		if c~=nil and c==me.fjnpcname then
			alias.resetidle()
			if escape_err>0 then
				run("look;set resetSafe=yes")
				escape_err=0
			else
				_f=function() run("halt;go "..escape..";whisper "..me.fjnpcid.." �㲻���ҵĲˣ�") end
				wait.time(0.2);_f()
			end
		end
		if findstring(l,"��Ҫ��˭�� doufu ���������") then
			if selectRunSuccess==nil or selectRunSuccess==0 then
				-- ���ܳɹ���
				alias.resetidle()
				alias.close_kill()
				alias.checkbusy("escape")
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=escape �ı����趨��") then
			alias.resetidle()
			if jifa.forcename=="motianyunqi" then run("yun shougong") end
			alias.dz(set_neili_job)
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			alias.resetidle()
			_f=function()
						fjnpcleave=1
						lookgag=1
						run("look "..tostring(invDirection(escape))..";set checknpcleave=yes")
				end
			wait.time(0.2);_f()
		end
		a,b,c=string.find(l,"%s+(.+)�����˹����ˡ�$")
		if c~=nil and c==me.fjnpcname then
			fjnpcleave=0
			alias.resetidle()
		end
		a,b,c=string.find(l,"%s+.+���� ([^\(]+)\(.+\) <ս����>")
		if c~=nil and c==me.fjnpcname then
			fjnpcleave=0
			alias.resetidle()
		end
		a,b,c=string.find(l,"%s+.+���� ([^\(]+)\(.+\) <���Բ���>")
		if c~=nil and c==me.fjnpcname then
			fjnpcleave=0
			alias.resetidle()
		end
		a,b,c=string.find(l,"%s+.+���� ([^\(]+)\(.+\)$")
		if c~=nil and c==me.fjnpcname then
			fjnpcleave=0
			alias.resetidle()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checknpcleave=yes �ı����趨��") then
			if escape_err~=nil and escape_err>0 then
				-- ���ڷ����ı䣬ʹ��flytoid
				closeclass("fj_escape")
				_f=function()
							alias.flytoid(fjroomid)
							fjroomid=0
							escape_err=0
					end
				wait.time(3);_f()
			else
				if fjnpcleave>0 then
					run("halt")
					escapeback_err=0
					run("go "..invDirection(escape)..";set check=escapeback")
				else
					_f=function()
								fjnpcleave=1
								lookgag=1
								run("look "..invDirection(escape)..";set checknpcleave=yes")
						end
					wait.time(0.2);_f()
				end
			end
		end
		if findstring(l,"��Ҫ��ʲô��","��Ҫ���ĸ������ߣ�","�������û�г�·��") then
			escape_err=1
		end
		if findstring(l,"����������ã����ܴ�����") then
			alias.tdz()
		end
		if findstring(l,"ս���в������ڹ������߻���ħ��","��������Ϣ��Ӳ�����ؽ���Ϣѹ����ȥ������վ��������") then
			alias.resetidle()
			_f=function() alias.dz(set_neili_job) end
			wait.time(1);_f()
		end
		a,b,c=string.find(l,"%s+����[Ψһ|����]+�ĳ����� (.+)��$")
		if c~=nil then
			entrance=c
			xkxGPS.setEntrance(entrance)
			if lookgag~=nil and lookgag>0 then
				lookgag=0
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ resetSafe=yes �ı����趨��") then
			alias.resetidle()
			if selectRunSuccess==nil or selectRunSuccess==0 then
				_tb=utils.split(xkxGPS.entrance,"|")
				escape=_tb[math.random(#_tb)]
				run("halt;go "..escape)
				if tonumber(fjroomid)==609 then
					-- ��ֹ����per��ǿ�����´�������
					_tb=utils.split(me.fjnpcid," ")
					run("doufu ".._tb[1])
				else
					run("doufu "..me.fjnpcid)
				end
			end
		end
		if findstring(l,"��⣬������ʧ���ˣ�","��Ķ�����û����ɣ������ƶ���") then
			escapeback_err=1
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=escapeback �ı����趨��") then
			if escapeback_err~=nil and escapeback_err>0 then
				_f=function()
							run("halt")
							escapeback_err=0
							run("go "..invDirection(escape)..";set check=escapeback")
					end
				wait.time(0.5);_f()
			else
				alias.resetidle()
				closeclass("fj_escape")
			end
		end
		if findstring(l,"���ֵ������̰����������׹����������") then
			run("giveup")
			escapeback_err=1
		end
		a,b,c=string.find(l,"������ض�(.+)��������ǧɽ����·����ǧ������飬�����翿���������鶹����")
		if c~=nil and c==me.fjnpcname then
			alias.resetidle()
			if escape_err~=nil and escape_err>0 then
				run("look;set resetSafe=yes")
				escape_err=0
			else
				if selectRunSuccess~=nil and selectRunSuccess>0 then
					print("����ص���ͬ����FJ NPC�����ٴ�������")
				else
					_f=function()
								run("halt;go "..escape)
								if tonumber(fjroomid)==609 then
									-- ��ֹ����per��ǿ�����´�������
									_tb=utils.split(me.fjnpcid," ")
									run("doufu ".._tb[1])
								else
									run("doufu "..me.fjnpcid)
								end
						end
					wait.time(0.2);_f()
				end
			end
		end
		if findstring(l,"��Ȼһ���ȷ�Ϯ����һ�����������Դ��������£���������ˡ�") then
			closeclass("fj_escape")
			_f=function()
						alias.flytoid(fjroomid)
						fjroomid=0
						escape_err=0
				end
			wait.time(3);_f()
		end
		if string.find(w[0],"���������һԾ������սȦ�����ˡ�\n.+ \-") then
			print("���ܳɹ���")
			alias.yjl()
			selectRunSuccess=1
			checkmove.notgpsmove=1
			alias.resetidle()
			alias.checkbusy("escape")
		end
	end)
end
------------------------------------------------------------------------------------
-- fj_other
------------------------------------------------------------------------------------
function fj_other.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ������") then
			_f=function() run("ask chanshi about �󻹵�") end
			wait.time(1);_f()
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����ѡ�") then
			_f=function() alias.checkbusy("putizi") end
			wait.time(1);_f()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=putizi �ı����趨��") then
			alias.resetidle()
			run("ask nan about ������")
		end
		if findstring(l,"���Ѳ�ȻһЦ��������̾һ������������ȡ���������ƿ�����������ӵݸ��㡣") then
			run("fu zi")
			resetidle=0
		end
		if findstring(l,"����˵���������������֮����ɼ������ޱȣ����������ڿ�û�С�") then
			closeclass("fj_other")
			_f=function() alias.startworkflow() end
			wait.time(1);_f()
		end
		if findstring(l,"�����һ�������ӣ���Ȼ��ֻ��һ�ɺƵ��ޱȵ�����ֱ�嶥��") then
			_f=function()
						if addneili.putizi==nil then addneili.putizi=0 end
						if mark.neili==nil then mark.neili=0 end
						addneili.putizi=addneili.putizi+(hp.maxneili-mark.neili)
						-- #additem list.putizi {%concat( %time( "yyyy-mm-dd hh:mm:ss"), " �Ե������ӣ������������ ", %eval( @hp.maxneili-@mark.neili), " ��")}
						local _tmp=tonumber(hp.maxneili)-tonumber(mark.neili)
						addlog("�Ե������ӣ������������ "..tostring(_tmp).."��")
				end
			wait.time(5);_f()
		end
		if findstring(l,"����û�� nan ����ˡ�") then
			closeclass("fj_other")
			alias.startworkflow()
		end
		if findstring(w[0],"����û�� chanshi ����ˡ�","���������ʦ�����йء��󻹵�������Ϣ��\n������ʦ˵�����Բ��𣬴󻹵��Ѿ�������") then
			alias.resetidle()
			run("hp")
			mark.neili=tonumber(hp.maxneili)
			alias.flytonpc("����")
		end
		--if findstring(l,"�������������Ǹ���,Ϻ�׶��ǳ������������������") then
		--	run("put 5 silver in xiang")
		--	closeclass("fj_other")
		--	alias.startworkflow()
		--end
		if findstring(l,"��������Ѫ��ζ��Ŀǰ���������÷��䡣") then
			closeclass("fj_other")
			alias.close_gps()
			alias.startworkflow()
		end
		if findstring(w[0],"���������ʦ�����йء��󻹵�������Ϣ��\n����һ�Ŵ󻹵���") then
			alias.resetidle()
			run("fu dan")
			closeclass("fj_other")
			alias.startworkflow()
		end
		if findstring(w[0],"���������ʦ�����йء��󻹵�������Ϣ��\n������ʦ˵����.+���ǲ��ǸճԹ�ҩ����ô����Ҫ�ˣ� ��ҩ����к����ˣ�����ʱ�������ɡ�") then
			alias.resetidle()
			closeclass("fj_other")
			alias.startworkflow()
		end
	end)
end
------------------------------------------------------------------------------------
-- fj_pre
------------------------------------------------------------------------------------
function fj_pre.dosomething1(n,l,w)
	local _f,a,b,c
	wait.make(function()
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
			alias.resetidle()
			alias.flytoid(me.fjbaseid)
		end
		a,b,c=string.find(l,"�������磬���ֵ�ͼ��(%d+)�������")
		if c~=nil and tonumber(c)==me.fjbaseid then
			if not isopen("dazuo") then
				if me.menpai=="mj" then run("fighter") end
				_f=function() run("ask "..me.fjmasterid.." about ��������") end
				wait.time(1);_f()
			end
		end
		a,b,c=string.find(l,"[> ]*(.+)��������ļ��˵�����ã���������ʱ��Ȼ������ȥ֪ͨ�㡣")
		if c~=nil and c==me.fjmaster then
			alias.resetidle()
			if fjroom~=nil and string.len(fjroom)>0 and fjzone~=nil and string.len(fjzone)>0 then
				if fjweapon~=nil and string.len(fjweapon)>0 then
					if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
				end
				if fjroomid>0 then
					-- ���ܳ�����FJ������ֱ��FJ����ID
					alias.flytoid(fjroomid)
				else
					alias.flytoname(fjroom,fjzone)
					-- #if @explist.keephour {#add explist.tempinfo %concat( @fjzone, " ", @fjroom)}
				end
				closeclass("fj_pre")
				openclass("fj_start")
				fjarrived=0
			else
				if havefj>0 then
					-- δ��ȡ�������Եȣ�
					_f=function() run("ask "..me.fjmasterid.." about ��������")	end
					wait.time(1);_f()
				else alias.startworkflow() end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			if not isopen("boat") then
				alias.resetidle()
				alias.checkitems()
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkhp=addneili �ı����趨��") then
			if havefj>0 and hp.neili>(hp.maxneili*set_neili_job/100) then alias.tdz() end
		end
		if findstring(l,"�Է���æ���أ���Ȼ�����ʻ��ɡ�") then
			alias.resetidle()
			if fjroom~=nil and string.len(fjroom)>0 and fjzone~=nil and string.len(fjzone)>0 then
				if fjweapon~=nil and string.len(fjweapon)>0 then
					if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
				end
				alias.flytoname(fjroom,fjzone)
				closeclass("fj_pre")
				openclass("fj_start")
				fjarrived=0
			else
				if havefj>0 then
					-- δ��ȡ�������Եȣ�
					_f=function() run("ask "..me.fjmasterid.." about ��������")	end
					wait.time(1);_f()
				else alias.startworkflow() end
			end
		end
		a,b,c=string.find(l,"����û�� (.+) ����ˡ�")			
		if c~=nil and c==me.fjmasterid then
			if fjroom~=nil and string.len(fjroom)>0 and fjzone~=nil and string.len(fjzone)>0 then
				if fjweapon~=nil and string.len(fjweapon)>0 then
					if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
				end
				if fjroomid>0 then
					-- ���ܳ�����FJ������ֱ��FJ����ID
					alias.flytoid(fjroomid)
				else
					alias.flytoname(fjroom,fjzone)
				end
				closeclass("fj_pre")
				openclass("fj_start")
				fjarrived=0
			else
				if havefj>0 then
					-- FJMaster��ɱ����ˢ�£�
					_f=function() run("ask "..me.fjmasterid.." about ��������")	end
					wait.time(5);_f()
				else alias.startworkflow() end
			end
		end
		if findstring(l,"��æ���أ���Ȼ�����ʻ��ɡ�") then
			alias.resetidle()
			if fjroom~=nil and string.len(fjroom)>0 and fjzone~=nil and string.len(fjzone)>0 then
				if fjweapon~=nil and string.len(fjweapon)>0 then
					if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
				end
				if fjroomid>0 then
					-- ���ܳ�����FJ������ֱ��FJ����ID
					alias.flytoid(fjroomid)
				else
					alias.flytoname(fjroom,fjzone)
					-- #if @explist.keephour {#add explist.tempinfo %concat( @fjzone, " ", @fjroom)}
				end
				closeclass("fj_pre")
				openclass("fj_start")
				fjarrived=0
			else
				if havefj>0 then
					-- δ��ȡ�������Եȣ�
					_f=function() run("ask "..me.fjmasterid.." about ��������")	end
					wait.time(2);_f()
				else alias.startworkflow() end
			end
		end
	end)
end
------------------------------------------------------------------------------------
-- fj_start
------------------------------------------------------------------------------------
function fj_start.dosomething1(n,l,w)
	local _f,_t,_tb,a,b,c,d
	wait.make(function()
		if findstring(l,"�������ܺ�����Щ���Ծ�") then
			alias.resetidle()
			if jifa.forcename=="xuanyinzhenqi" then run("yun yin") end
			if jifa.forcename=="huntianqigong" then run("yun powerup") end
			if me.menpai=="mj" then run("shoutfighter fighter") end
			if me.menpai=="bt" then alias.yunbt() end
			if me.menpai=="em" then alias.yunem() end
			if me.menpai=="xs" then run("yun longxiang") end
			if me.menpai=="xx" then
				xx.suck=0
				run("yun hua;blow di")
			end
			if fjarrived>0 then
				fjroomid=tonumber(roomno_now)
				fj.roomno=tonumber(roomno_now)
				escape=alias.SafeEntrance(roomno_now)
				_f=function()
							looknpc=1
							run("set checklooknpc=yes")
					end
				wait.time(1);_f()
				if tonumber(roomno_now)==1529 or tonumber(roomno_now)==1530 then
					-- �����µ�����ɽ·����һ����仯��������Ҫ���⴦��
					escape_err=1
				else escape_err=0 end
				-- �ҵ�Ŀ�꣬�趨��ǰΪfj�ص㣬�������������ͬʱֹͣ����
			else
				-- ����δ����FJ������ʼ���򣬵�·���ĵص���FJ�ص������������fjroomid����flytonext������
				if fjweapon~=nil and string.len(fjweapon)>0 then
					if me.menpai=="hs" then
						_tb=utils.split(fjpfm,"|")
						if findstring(_tb[pfmid],"leidong") then
							alias.uw()
							if me.master=="������" and fjweapon=="jian" then run("jifa dodge dugu-jiujian") else run("jifa parry pishi-poyu") end
						else
							if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
							wieldweapon=1
							if me.master=="������" and fjweapon=="jian" then run("jifa dodge dugu-jiujian")
							else
								if fjweapon=="jian" then run("jifa parry huashan-jianfa")
								else
									if fjweapon=="staff" or fjweapon=="qin" then run("jifa parry jinhua-zhang") end
								end
							end
						end
					else
						if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
					end
				else alias.uw() end
			end
		end
		a,b,c,d=string.find(l,"�������ɣ�(.+)����(.+)���������")
		if c~=nil and d~=nil and c==me.charname and d==me.fjnpcname then
			alias.resetidle()
			if fjroomid==0 and fjarrived>0 then
				-- �������ܺ�����Щ���Ծ�.....��仰û�г��֣������ʮ�ŵ����������ܺܶ������£����õ�ǰ����Ϊfj����
				fjroomid=tonumber(roomno_now)
				fj.roomno=tonumber(roomno_now)
				escape=alias.SafeEntrance(roomno_now)
			end
			fjselectnpc.weapon=1
			if fjroomid==609 then
				-- ��ֹ����per��ǿ�����´�������
				_tb=utils.split(me.fjnpcid,"|")
				run("look ".._tb[1])
			else run("look "..me.fjnpcid) end
			alias.close_gps()
			if fjarrived==0 then
				print("·���ĵط�����fjnpc��ɱ�����Ҫ����look�ص㶨λ")
				checkmove.NotGPSMove=1
			end
			run("set checkmenpai=yes")
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkmenpai=yes �ı����趨��") then
			alias.resetidle()
			if hp.healthqi<90 or hp.neili<(hp.maxneili*set_neili_job/100) then
				-- ����״̬���ã���ɱ
				openclass("fj_escape")
				run("halt")
				if me.menpai=="em" then run("persuade "..me.fjnpcid) end
				run("go "..escape)
				checkmove.notgpsmove=1
				selectRunSuccess=0
				if fjroomid==609 then
					-- ��ֹ����per��ǿ�����´�������
					_tb=utils.split(me.fjnpcid," ")
					run("doufu ".._tb[1])
				else
					run("doufu "..me.fjnpcid)
				end
			else
				fjnpc=fjselectnpc.menpai.." "..case_weapon(fjselectnpc.weapon)
				--#if @debug {#say NPC=@fj.npc��%if( selectfjnpc(), ɱ, ��ɱ)}
				if selectfjnpc()>0 then
					addlog("FJ Place="..fj.room.."|"..fj.zone..",NPC="..fjnpc)
					--  #if @explist.keephour {#add explist.tempinfo %concat( " NPC=", @fj.npc)}
					if jifa.forcename=="hunyuanyiqi" and fjselectnpc.menpai=="xx" and fjselectnpc.weapon==7 then
						run("yun sangong")
						reyun=0
					else
						_tb=utils.split(fjyun,"|")
						for k,v in ipairs(_tb) do run(v) end
						reyun=0
					end
					if fjselectnpc.weapon==1 or kmq() or (me.menpai=="gb" and jifa.forcename=="huntianqigong") then
						run("unset no_parry")
					else
						if me.master=="������"and fjweapon=="jian" then run("unset no_parry") else run("set no_parry 1") end
					end
					openclass("kill")
					openclass("kill_"..me.menpai)
					closeclass("kill_run")
					AddTimer("kill_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "kill.timer")
					SetTimerOption("kill_timer", "group", "kill")
					runaway=false
					npcfaint=false
					killRunSuccess=false
					if me.menpai=="hs" then
						if stat.leidong>0 then
							pfmid=2
							if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
							wieldweapon=1
						else
							pfmid=1
							alias.uw()
						end
					else
						pfmid=1
						if string.len(fjweapon)>0 then
							if fjweapon=="staff" then alias.wi(staffid) else alias.wi(fjweapon) end
						else alias.uw() end
					end
					if fjroomid==609 then
						-- ��ֹ����per��ǿ�����´�������
						_tb=utils.split(me.fjnpcid," ")
						killid=_tb[1]
					else
						killid=me.fjnpcid
					end
					killname=me.fjnpcname
					killskill=fjweapon
					killpfm=fjpfm
					killyun=fjyun
					killjiali=fjjiali
					killjiajin=fjjiajin
					--if me.menpai=="dl" then alias.jfdl() end
					run("jiali "..fjjiali..";jiajin "..fjjiajin)
					if me.menpai=="bt" then run("convert staff;attack "..me.fjnpcid) end
					if me.menpai=="mj" then run("order fighter do attack "..me.fjnpcid..";order fighter 2 do attack "..me.fjnpcid) end
					if fjroomid==609 then
						-- ��ֹ����per��ǿ�����´�������
						_tb=utils.split(me.fjnpcid," ")
						run("kill ".._tb[1])
					else
						run("kill "..me.fjnpcid)
					end
					--_tb=utils.split(fjpfm,"|")
					--_tb=utils.split(killpfm,"|")
					alias.pfm()
					--if pfmid<=table.getn(_tb) then
						--if kmq() then alias.kmq()
						--else
						--	_tb=utils.split(killpfm,"|")
						--	run(_tb[pfmid].." "..killid)
						--end
					--end
					run("set checkkillstart=yes")
				else
					openclass("fj_escape")
					run("halt")
					if me.menpai=="em" then run("persuade "..me.fjnpcid) end
					run("go "..escape)
					checkmove.notgpsmove=1
					selectRunSuccess=0
					if fjroomid==609 then
						-- ��ֹ����per��ǿ�����´�������
						_tb=utils.split(me.fjnpcid," ")
						run("doufu ".._tb[1])
					else
						run("doufu "..me.fjnpcid)
					end
				end
			end
		end
		a,b,c,d=string.find(l,"(.+)���� (.+)%(.+%)$")
		if c~=nil and d~=nil and d==me.fjnpcname then
			if findstring(c,"����μ�") then fjselectnpc.menpai="dl" end
			if findstring(c,"ȫ���") then fjselectnpc.menpai="qz" end
			if findstring(c,"�䵱��") then fjselectnpc.menpai="wd" end
			if findstring(c,"������") then fjselectnpc.menpai="sl" end
			if findstring(c,"�һ���") then fjselectnpc.menpai="th" end
			if findstring(c,"������") then fjselectnpc.menpai="em" end
			if findstring(c,"��ɽ��") then fjselectnpc.menpai="hs" end
			if findstring(c,"������") then fjselectnpc.menpai="xx" end
			if findstring(c,"����ɽ") then fjselectnpc.menpai="bt" end
			if findstring(c,"ѩɽ��") then fjselectnpc.menpai="xs" end
			if findstring(c,"����") then fjselectnpc.menpai="xs" end
			if findstring(c,"ؤ��") then fjselectnpc.menpai="gb" end
		end
		a,b,c,d=string.find(l,"���ƶ��Ʈ��Ʈ���� (%d+) ����.+���еĵ� (%d+) ������")
		if c~=nil and d~=nil and tonumber(c)==tonumber(flytosum) and tonumber(d)==tonumber(flytoidx) then
			alias.resetidle()
			fjarrived=1
			killstart=0
			if fjroomid>0 then
				fjroomid=tonumber(roomno_now)
				fj.roomno=tonumber(roomno_now)
				escape=alias.SafeEntrance(roomno_now)
			end
			_f=function()
						if fjroomid==0 then
							if flytoidx==flytosum then
								-- ���һ������Ҳû�ҵ�fjnpcʱ�ӵ�һ����ʼ�߹�
								alias.checkbusy("refly")
							else alias.checkbusy("flytonext") end
						end
				end
			wait.time(4);_f()
		end
		if findstring(l,"�������������Ǹ���,Ϻ�׶��ǳ���������.+�������") then
			alias.resetidle()
			fjarrived=1
			killstart=0
			fjroomid=tonumber(roomno_now)
			fj.roomno=tonumber(roomno_now)
			escape=alias.SafeEntrance(roomno_now)
		end
		a,b,c=string.find(l,"��(.+)%(.+%)")
		if c~=nil then
			if not findstring(c,"Ƥ����") then
				if findstring(c,"��") then fjselectnpc.weapon=2 end
				if findstring(c,"��") then fjselectnpc.weapon=3 end
				if findstring(c,"��") then fjselectnpc.weapon=4 end
				if findstring(c,"��") then fjselectnpc.weapon=5 end
				if findstring(c,"��") then fjselectnpc.weapon=6 end
				if findstring(c,"��") then fjselectnpc.weapon=7 end
				if findstring(c,"��") then fjselectnpc.weapon=8 end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ killover=yes �ı����趨��") then
			run("get gold from corpse;get beixin from corpse;drop beixin;drop beixin;get beixin;wear all")
			fjzone=""
			fjroom=""
			fjarea=""
			fjroomid=0
			alias.yjl()
			alias.flytoid(me.fjbaseid)
		end
		a,b,c=string.find(l,"�������磬���ֵ�ͼ��(%d+)�������")
		if c~=nil and tonumber(c)==me.fjbaseid then
			alias.resetidle()
			run("set checkfj=over")
		end
		if c~=nil and tonumber(c)==fjroomid then
			alias.resetidle()
			fjarrived=1
			fjroomid=tonumber(roomno_now)
			fj.roomno=tonumber(roomno_now)
			escape=alias.SafeEntrance(roomno_now)
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkgxd=yes �ı����趨��") then
			if gxd.type==1 then
				if me.menpai=="hs" and me.master~="������" then run("nick $HIM$�Ƿ�$HIW$������MUSH��$HIR$"..gxd.me) end
			end
			if gxd.type==2 then
				if gxd.me==nil then gxd.me=0 end
				if gxd.me>gxd.value then
					if me.menpai=="hs" and me.master~="������" then run("nick $HIM$�Ƿ�$HIW$�̶�MUSH��$HIR$"..gxd.me) end
					_t=fangqivalue()
					if _t>0 then
						for i=1,_t,1 do
							run("ask "..me.fjmasterid.." about Ҫ������;ask "..me.fjmasterid.." about ��������")
						end
						gxd.me=gxd.me-10*_t
					end
				end
			end
			if gxd.type==3 then
				if gxd.me==nil then gxd.me=0 end
				if gxd.mp==nil then gxd.mp=100000 end
				if gxd.me>(gxd.mp*gxd.percent/100) then
					if me.menpai=="hs" and me.master~="������" then run("nick $HIM$�Ƿ�$HIW$����MUSH��$HIR$"..gxd.percent.."%$HIW$ֵΪ$HIR$"..gxd.me) end
					_t=fangqipercent()
					if _t>0 then
						for i=1,_t,1 do
							run("ask "..me.fjmasterid.." about Ҫ������;ask "..me.fjmasterid.." about ��������")
						end
						gxd.me=gxd.me-10*_t
					end					
				end
			end
			alias.checkexp("fj")
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=fj �ı����趨��") then
			alias.resetidle()
			if me.menpai=="sl" then
				openclass("fj_other")
				alias.flytonpc("����")
			else
				if me.menpai=="bt" and mpJobLimited>0 and ((add.exp-fjexp)>10 or mpLimited.mpexp<me.menpaiLimited) then
					-- ˵��bite or xyδ��
					mpJobLimited=0
					xy.xyLimited=0
					xy.biteLimited=0
					if xy.limitedResume>=5 then xy.limitedResume=xy.limitedResume-1 end
				end
			if me.menpai=="mj" and hp.pot<hp.maxpot then run("ask yang xiao about ����") end
			alias.startworkflow()
			end									
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=flytonext �ı����趨��") then
			alias.flytonext()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkfj=over �ı����趨��") then
			-- �ȴ���ȡ������ɾ���
			_f=function() if havefj>0 then run("set checkfj=over") else run("ask "..me.fjmasterid.." about ���׶�;set checkgxd=yes") end end
			wait.time(1);_f()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkkillstart=yes �ı����趨��") then
			if killstart==0 then
				_f=function() run("set checkmenpai=yes") end
				wait.time(2);_f()
			end
			killaction=""
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=refly �ı����趨��") then
			if havefj>0 then alias.flytoname(fjroom,fjzone) else alias.startworkflow() end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checklooknpc=yes �ı����趨��") then
			if looknpc==nil or looknpc==0 then
				-- ���fj�ص㣬�ӵ�һ����ʼ�߹�
				alias.checkbusy("refly")
			end
		end
		if findstring(l,"��Ҫ��ʲô��") then
			if not isopen("fj_escape") then
				looknpc=0
				print("���翨����npc�ķ����Ѿ��ɹ���")
			end
		end
		a,b,c=string.find(l,"�����(.+)�ȵ�����.+��")
		if c~=nil and c==me.fjnpcname then
			killstart=1
		end
	end)
end
function selectfjnpc()
	local _tb
	_tb=utils.split(fjselectnpc[fjselectnpc.menpai],"|")
	return tonumber(_tb[fjselectnpc.weapon])
end
function fangqivalue()
	local a,b,c
	a=math.fmod(gxd.me-gxd.value,10)
	if a>0 then b=1 else b=0 end
	c=(gxd.me-gxd.value)/10+b
	if c>5 then c=5 end
	return math.floor(c)
end
function fangqipercent()
	local a,b,c
	a=math.fmod(gxd.me-gxd.mp*gxd.percent/100,10)
	if a>0 then b=1 else b=0 end
	c=(gxd.me-gxd.mp*gxd.percent/100)/10+b
	if c>5 then c=5 end
	return math.floor(c)
	
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function fj.update()
	_tb={
		"�������ܺ�����Щ���Ծ�\\.\\.\\.\\.\\.\\.",
		"�������ɣ�(.+)����(.+)���������",
		"��Ŀǰ��û���κ�Ϊ checkmenpai=yes �ı����趨��",
		"(.+)���� (.+)\\(.+\\)",
		"���ƶ��Ʈ��Ʈ���� \\d+ ����.+���еĵ� \\d+ ������",
		"�������������Ǹ���,Ϻ�׶��ǳ���������.+�������",
		"\\s+��(.+)\\(.+\\)",
		"��Ŀǰ��û���κ�Ϊ killover=yes �ı����趨��",
		"�������磬���ֵ�ͼ��(\\d+)�������",
		"��Ŀǰ��û���κ�Ϊ checkgxd=yes �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ checkexpover=fj �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ busyover=flytonext �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ checkfj=over �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ checkkillstart=yes �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ busyover=refly �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ checklooknpc=yes �ı����趨��",
		"��Ҫ��ʲô��",
		"�����(.+)�ȵ�����.+��",
	}
	local  fj_start_triggerlist={
	       {name="fj_start_dosth1",regexp=linktri(_tb),script=function(n,l,w)    fj_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(fj_start_triggerlist) do
		addtri(v.name,v.regexp,"fj_start",v.script,v.line)
	end
	closeclass("fj_start")
	
	_tb={
		"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��",
		"�������磬���ֵ�ͼ��(\\d+)�������",
		"(.+)��������ļ��˵�����ã���������ʱ��Ȼ������ȥ֪ͨ�㡣",
		"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ checkhp=addneili �ı����趨��",
		"�Է���æ���أ���Ȼ�����ʻ��ɡ�",
		"����û�� (.+) ����ˡ�",
		"��æ���أ���Ȼ�����ʻ��ɡ�",
	}
	local  fj_pre_triggerlist={
	       {name="fj_pre_dosth1",regexp=linktri(_tb),script=function(n,l,w)    fj_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(fj_pre_triggerlist) do
		addtri(v.name,v.regexp,"fj_pre",v.script,v.line)
	end
	closeclass("fj_pre")
	
	local _tb={
		"���������ʦ�����йء��󻹵�������Ϣ��\\n������ʦ˵�����Բ��𣬴󻹵��Ѿ�������\\Z",
		"���������ʦ�����йء��󻹵�������Ϣ��\\n����һ�Ŵ󻹵���\\Z",
		"���������ʦ�����йء��󻹵�������Ϣ��\\n������ʦ˵����.+���ǲ��ǸճԹ�ҩ����ô����Ҫ�ˣ� ��ҩ����к����ˣ�����ʱ�������ɡ�\\Z",
	}
	local  fj_other_m_triggerlist={
	       {name="fj_other_m_dosth1",line=2,regexp=linktri(_tb),script=function(n,l,w)    fj_other.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(fj_other_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"fj_other",v.script,v.line)
	end
	
	_tb={
		"��һ�죬�������ɫ�Ʋ���ӭȢ������",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����ѡ�",
		"��Ŀǰ��û���κ�Ϊ busyover=putizi �ı����趨��",
		"���Ѳ�ȻһЦ��������̾һ������������ȡ���������ƿ�����������ӵݸ��㡣",
		"����˵���������������֮����ɼ������ޱȣ����������ڿ�û�С�",
		"�����һ�������ӣ���Ȼ��ֻ��һ�ɺƵ��ޱȵ�����ֱ�嶥��",
		"����û�� nan ����ˡ�",
		"����û�� chanshi ����ˡ�",
		"�������������Ǹ���,Ϻ�׶��ǳ������������������",
		"��������Ѫ��ζ��Ŀǰ���������÷��䡣",
	}
	local  fj_other_triggerlist={
	       {name="fj_other_dosth1",regexp=linktri(_tb),script=function(n,l,w)    fj_other.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(fj_other_triggerlist) do
		addtri(v.name,v.regexp,"fj_other",v.script,v.line)
	end
	closeclass("fj_other")
	
	local _tb={
		"���������һԾ������սȦ�����ˡ�\\n.+ \\-.*\\Z",
	}
	local  fj_escape_m_triggerlist={
	       {name="fj_escape_m_dosth1",line=2,regexp=linktri(_tb),script=function(n,l,w)    fj_escape.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(fj_escape_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"fj_escape",v.script,v.line)
	end
	
	_tb={
		"����(.+)�Ķ�������˵�����㲻���ҵĲˣ�",
		"��Ҫ��˭�� doufu ���������",
		"��Ŀǰ��û���κ�Ϊ busyover=escape �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��",
		"\\s+(.+)�����˹����ˡ�",
		"\\s+.+���� (.+)\\(*\\) <ս����>",
		"\\s+.+���� (.+)\\(*\\) <���Բ���>",
		"\\s+.+���� (.+)\\(*\\)$",
		"��Ŀǰ��û���κ�Ϊ checknpcleave=yes �ı����趨��",
		"��Ҫ��ʲô��",
		"��Ҫ���ĸ������ߣ�",
		"�������û�г�·��",
		"����������ã����ܴ�����",
		"ս���в������ڹ������߻���ħ��",
		"��������Ϣ��Ӳ�����ؽ���Ϣѹ����ȥ������վ��������",
		"\\s+����.{4}�ĳ����� (.+)��$",
		"��Ŀǰ��û���κ�Ϊ resetSafe=yes �ı����趨��",
		"��⣬������ʧ���ˣ�",
		"��Ķ�����û����ɣ������ƶ���",
		"��Ŀǰ��û���κ�Ϊ check=escapeback �ı����趨��",
		"���ֵ������̰����������׹����������",
		"������ض�(.+)��������ǧɽ����·����ǧ������飬�����翿���������鶹����",
		"��Ȼһ���ȷ�Ϯ����һ�����������Դ��������£���������ˡ�",
	}
	local  fj_escape_triggerlist={
	       {name="fj_escape_dosth1",regexp=linktri(_tb),script=function(n,l,w)    fj_escape.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(fj_escape_triggerlist) do
		addtri(v.name,v.regexp,"fj_escape",v.script,v.line)
	end
	closeclass("fj_escape")
	
	_tb={
		"�������磬���ֵ�ͼ��(\\d+)�������",
		"����(.+)�����йء�Ҫ����������Ϣ��",
	}
	local  fj_close_triggerlist={
	       {name="fj_close_dosth1",regexp=linktri(_tb),script=function(n,l,w)    fj_close.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(fj_close_triggerlist) do
		addtri(v.name,v.regexp,"fj_close",v.script,v.line)
	end
	closeclass("fj_close")
	
	local _tb={
		"(.+)(������˵�ͷ|���������ͷ|�ع�ͷ������һ��|������ļ�|���㡸�ٺٺ١���Ц�˼���).+˵������(.+)��.+\\n(.+)˵��:��������(.+)����.*\\Z",
	}

	local  fj_watch_m_triggerlist={
	       {name="fj_watch_m_dosth1",line=2,regexp=linktri(_tb),script=function(n,l,w)    fj_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(fj_watch_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"fj_watch",v.script,v.line)
	end
	
	_tb={
		"�����㵢���ʱ��̫���ˣ��������ȡ���ˡ�",
		"һ��.+�������˹���,���㱨ȭ���������·�(.+)֮���������ٻ�.+����������",
		"(.+)������ȥ(.+)���������Ҫ���񣬸Ͽ�ȥִ�аɡ�",
		"�����Ѿ���ɣ��Ͽ��ȥ�����ɡ�",
		"(.+)����˵����Ŀǰ��.+�Ĺ��׶�Ϊ(.+)�㡣",
		"(.+)����˵������Ϊ.+�����Ĺ���Ϊ(.+)�㡣��Ҫ����Ŭ������ȡ���´�.+����ϵõ����������",
		"(.+)�Ѵ���Ҫ�ټ��㣬�㻹�ǿ��ȥ�ɡ�",
		"(.+)˵��:���������ˣ�(.+)����Ϊ.+������һ������",
		"��ľ���������(\\d+)�㡣",
		"(.+)˵��:���ɵúã�(.+)��������Խ��Խ�������ˡ���",
	}
	local  fj_watch_triggerlist={
	       {name="fj_watch_dosth1",regexp=linktri(_tb),script=function(n,l,w)    fj_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(fj_watch_triggerlist) do
		addtri(v.name,v.regexp,"fj_watch",v.script,v.line)
	end
	openclass("fj_watch")
end

fj.update()
