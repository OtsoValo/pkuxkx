chongmai={}
chongmai_pre={}
chongmai_start={}
chongmai_watch={}

cm={
	mai=0,
	chong=0,
	havebuff=0,
	doing=0,
	mengzhu=0,
	setmz=0,
	fightmz=0,
	mzname="",
	mzdeath=0,
}
qugold={
	num=0,
	success=0,
}
------------------------------------------------------------------------------------
-- chongmai_pre
------------------------------------------------------------------------------------
function chongmai_pre.dosomething1(n,l,w)
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
		alias.setaoyao_tongmaidan()
		if (cm.mengzhu==0 and cm.havebuff==0 and have.gold<401 and me.gold>401 and daytime) then
			alias.flyto("Ǯׯ") else run("set chongmai=start")
		end
	end
	if findstring(l,"�������������Ǹ���,Ϻ�׶��ǳ���������Ǯׯ�������") then
		alias.resetidle()
		qugold.num=aoyao.needgold-100*(aoyao.buyno-1)-have.gold+5
		run("qu "..tostring(qugold.num).." gold;set check=qugold")
	end
	if findstring(l,"�ƹ��Ц��˵������ȡ��ô��Ǯ���������ò����ˡ�") then
		qugold.success=0
	end
	if findstring(l,"�ƹ�ĵ��ͷ����������ȡ��.+���ƽ𽻵������") then
		qugold.success=1
		have.gold=5
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ check=qugold �ı����趨��") then
		alias.resetidle()
		if qugold.success>0 then alias.startay()
		else
			qugold.num=qugold.num-100
			run("qu "..tostring(qugold.num).." gold;set check=qugold")
		end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ aoyao=false �ı����趨��") then
		alias.resetidle()
		cm.havebuff=0
		alias.checkitems()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ aoyao=true �ı����趨��") then
		alias.resetidle()
		run("fu dan;set chongmai=start")
	end
	if findstring(l,"��⵰��һ�ߴ���ȥ��") then
		alias.close_aoyao()
		alias.flyto("Ǯׯ")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ chongmai=start �ı����趨��") then
		closeclass("chongmai_pre")
		openclass("chongmai_start")
		alias.flytoid(me.chongmaiBaseid)
	end
end
------------------------------------------------------------------------------------
-- chongmai_start
------------------------------------------------------------------------------------
function chongmai_start.dosomething1(n,l,w)
	if findstring(l,"�������磬���ֵ�ͼ��"..tostring(me.chongmaiBaseid).."�������") then
		alias.resetidle()
		alias.dz(set_neili)
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
		alias.resetidle()
		if havefj>0 then
			alias.uw()
			alias.startfj()
		elseif workflow.mp>0 and mpJobLimited==0 and me.menpai~="wd" then alias.startmp()
		else
			cm.doing=1
			run("yun chongmai")
		end
	end
	if findstring(l,"��о���Ϣ��.+��ת���裬��æ�Ӵ�������Ҫ������һ�أ�������˵����ˡ�") then
		alias.resetidle()
		run("set cm"..tostring(cm.mai).." "..tostring(cm.chong))
		cm.doing=0
		alias.dz(set_neili)
	end
	if findstring(l,"�㵱ǰ������ͨ") then
		alias.resetidle()
		cm.mai=cm.mai+1
		run("set cm"..tostring(cm.mai).." "..tostring(cm.chong))
		cm.doing=0
		alias.dz(set_neili)
	end
end
------------------------------------------------------------------------------------
-- chongmai_watch
------------------------------------------------------------------------------------
function chongmai_watch.dosomething1(n,l,w)
	local a,b,c
	if findstring(l,"�趨����������cm%d+ = %d+") then
		alias.resetidle()
	end
	a,b,c=string.find(l,"��Ŀǰ cm%d+ �ı����趨Ϊ�� (%d+)")
	if tonumber(c)~=nil then
		alias.resetidle()
		cm.chong=tonumber(c)
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ cm%d+ �ı����趨��") then
		alias.resetidle()
		cm.chong=0
	end
	if findstring(l,"����Ϣ��ת��.+����ʱ�о��ޱ����ɡ�","�����ڲ�ͬ�ڹ���������Ϣ��ת��.*�����Ǻܳ�ͨ������Ҳ���Ǻ����ء�") then
		alias.resetidle()
		cm.chong=cm.chong+1
		alias.setmpLimitedMark()
	end
	a,b,c=string.find(l,"�㽫����֮�ڵ���Ϣ����������ͨ��(.+)���У�׼���ٳ߸�ͷ����һ����")
	if c~=nil then
		alias.resetidle()
		cm.mai=ctonum(c)
		run("set cm"..tostring(cm.mai))
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function chongmai.update()
	local  chongmai_pre_triggerlist={
	       {name="chongmai_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    chongmai_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(chongmai_pre_triggerlist) do
		addtri(v.name,v.regexp,"chongmai_pre",v.script,v.line)
	end
	closeclass("chongmai_pre")
	
	local  chongmai_start_triggerlist={
	       {name="chongmai_start_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    chongmai_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(chongmai_start_triggerlist) do
		addtri(v.name,v.regexp,"chongmai_start",v.script,v.line)
	end
	closeclass("chongmai_start")
	
	local  chongmai_watch_triggerlist={
	       {name="chongmai_watch_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    chongmai_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(chongmai_watch_triggerlist) do
		addtri(v.name,v.regexp,"chongmai_watch",v.script,v.line)
	end
	closeclass("chongmai_watch")
end
chongmai.update()
