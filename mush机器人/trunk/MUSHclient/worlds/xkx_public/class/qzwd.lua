qzwd={}
qzwd_pre={}
qzwd_start={}
qzwd_watch={}

pobi=0
zhizhulist=""
zhizhunum=1
------------------------------------------------------------------------------------
-- qzwd_pre
------------------------------------------------------------------------------------
function qzwd_pre.dosomething1(n,l,w)
	local _f,_tb
	if findstring(l,"Ŀ��ص�·��δͨ��flytoid=1519","Ŀ��ص�·��δͨ��flytoid=705") then
		run("u;u;break men;n;n")
	end
	if findstring(l,"������, ��֩������û������") then
		run("xiulian")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=qzwd �ı����趨��","��Ŀǰ��û���κ�Ϊ checkbusy=qzwd �ı����趨��","�������磬���ֵ�ͼ��705�������") then
		openclass("dazuo")
		run("dazuo 10")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkpobi �ı����趨��") then
		if pobi>0 then
			run("wield jian;strike wall;enter;zhua zhizhu;strike wall;out")
			pobi=0
		else
			for i=1,10,1 do run("mianbi") end
			run("set checkpobi")
		end
	end
	if findstring(l,"��������ȷ�ķ���") then
		print("û֩����")
		run("shout")
		alias.close_gps()
		alias.startxue()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ qzwd=start �ı����趨��") then
		openclass("qzwd_start")
		run("xiulian")
	end
	if findstring(l,"�����Щ��֩����������ǧ�����֡�") then
		alias.ch()
		wait.make(function()
			_f=function()
						if skillslist["qianzhu-wandu"]==nil then skillslist["qianzhu-wandu"]={} end
						if skillslist["qianzhu-wandu"]["lvl"]==nil then skillslist["qianzhu-wandu"]["lvl"]=0 end
						if skillslist["zhaixinggong"]==nil then skillslist["zhaixinggong"]={} end
						if skillslist["zhaixinggong"]["lvl"]==nil then skillslist["zhaixinggong"]["lvl"]=0 end
						if skillslist["qianzhu-wandu"]["lvl"]<80 then
							zhizhulist="1349|1440|1324|1325|1367|2051|45|1519"
						elseif skillslist["qianzhu-wandu"]["lvl"]<150 then
							if skillslist["zhaixinggong"]["lvl"]>100 then
								zhizhulist="896|1153|1431|1349|1440|1324|1325|1367|2051|45|1519"
							else
								zhizhulist="896|1153|1349|1440|1324|1325|1367|2051|45|1519"
							end
						else
							if skillslist["zhaixinggong"]["lvl"]>100 then
								zhizhulist="1787|896|1153|1431|1349|1440|1324|1325|1367|2051|45|1519"
							else
								zhizhulist="1787|896|1153|1349|1440|1324|1325|1367|2051|45|1519"
							end
						end
						zhizhunum=1
						_tb=utils.split(zhizhulist,"|")
						alias.flytoid(tonumber(_tb[zhizhunum]))
				end
			wait.time(3);_f()
		end)
	end
	if findstring(l,"�������磬���ֵ�ͼ��45�������") then
		run("bei none;enable finger qianzhu-wandu;bei qianzhu-wandu;break men;s;d;zhua zhizhu;u;break men;n;n")
	end
	if findstring(l,"�������磬���ֵ�ͼ��1787�������") then
		run("bei none;enable finger qianzhu-wandu;bei qianzhu-wandu;move qi;zhua zhizhu")
	end
	if findstring(l,"�������磬���ֵ�ͼ��1519�������") then
		run("bei none;enable finger qianzhu-wandu;bei qianzhu-wandu;move stone;zhua zhizhu")
	end
	if findstring(l,"�������磬���ֵ�ͼ��896�������") then
		run("bei none;enable finger qianzhu-wandu;bei qianzhu-wandu;wield jian")
		for i=1,10,1 do run("mianbi") end
		run("wield jian;strike wall;set checkpobi")
	end
	if findstring(l,"�������磬���ֵ�ͼ��1153�������","�������磬���ֵ�ͼ��1324�������","�������磬���ֵ�ͼ��1325�������","�������磬���ֵ�ͼ��1349�������","�������磬���ֵ�ͼ��1367�������","�������磬���ֵ�ͼ��1440�������","�������磬���ֵ�ͼ��2051�������") then
		run("bei none;enable finger qianzhu-wandu;bei qianzhu-wandu;zhua zhizhu")
	end
	if findstring(l,"���ã���ͻȻ��һ����","���漴�������������������֮��������ʯͷ��ס���䣬¶��һ��խխ�Ŀ׵���") then
		pobi=1
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
		alias.resetidle()
		if not isopen("boat") then if havefj>0 then alias.startfj() else alias.startqzwd() end end
	end
	if findstring(l,"���ý��и�������ذ�.*�벦�����ӡ�") then
		alias.resetidle()
		alias.flytoid(705)
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
		run("set qzwd=start")
	end
	if findstring(l,"��Ҫץʲô��") then
		run("unwield jian;kill wu gong;kill scorpion")
		wait.make(function()
			_f=function()
						zhizhunum=zhizhunum+1
						_tb=utils.split(zhizhulist)
						if zhizhunum>table.getn(zhizhulist) then zhizhunum=1 end
						alias.flytoid(_tb[zhizhunum])
				end
			wait.time(1);_f()
		end)
	end
end

------------------------------------------------------------------------------------
-- qzwd_start
------------------------------------------------------------------------------------
function qzwd_start.dosomething1(n,l,w)
	if findstring(l,"���˹���ϣ� ���������˿�����") then
		alias.resetidle()
		alias.checkbusy("qzwd")
	end
end
------------------------------------------------------------------------------------
-- qzwd_watch
------------------------------------------------------------------------------------
function qzwd_watch.dosomething1(n,l,w)
	if findstring(l,"����˿�޷�������ǧ�����֡�") then
		alias.resetidle()
		run("get all from jin he;drop zhusi;xiulian")
	end
	if findstring(l,"����ȡ����ָ�ϵ�ѪҺΪʳ��������ָ��Ѫ����ת��Ҳ����.*�����ڶ�Һ�������Լ�Ѫ�С�","���е�.*�������������ֱ�ҧס��������ָͷ��","��ӻ���ȡ�����У��򿪺иǣ���˫������ʳָ������С�","������ׯ������֮�ݣ�ü�ĺ�̫��Ѩ�ϵ�����������һ�������ҧ�����أ���������ʹ����","��������һ������˫����΢������Ǳ���ڹ����붾�࿹��","�����˹����ã����Ϻ������ˣ�����Ѫɫ��","���⹦�����˼��а��ʱ������֩��ֱ��������Ѫ�������͵ú�Բ�����ƣ���ŵ��ں��У�����˯ȥ��","�ٹ�һ�ᣬ�ּ���Ǽ�������ϸϸ��һ�������顣") then
		alias.resetidle()
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function qzwd.update()
	local  qzwd_pre_triggerlist={
	       {name="qzwd_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    qzwd_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(qzwd_pre_triggerlist) do
		addtri(v.name,v.regexp,"qzwd_pre",v.script,v.line)
	end
	closeclass("qzwd_pre")
	
	local  qzwd_start_triggerlist={
	       {name="qzwd_start_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    qzwd_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(qzwd_start_triggerlist) do
		addtri(v.name,v.regexp,"qzwd_start",v.script,v.line)
	end
	closeclass("qzwd_start")
	
	local  qzwd_watch_triggerlist={
	       {name="qzwd_watch_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    qzwd_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(qzwd_watch_triggerlist) do
		addtri(v.name,v.regexp,"qzwd_watch",v.script,v.line)
	end
	closeclass("qzwd_watch")
end
qzwd.update()
