mp_wd={}
mp_wd_pre={}
mp_wd_start={}
mp_wd_watch={}

------------------------------------------------------------------------------------
-- mp_wd_pre
------------------------------------------------------------------------------------
function mp_wd_pre.dosomething1(n,l,w)
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
		if not isopen("boat") then
			alias.resetidle()
			alias.startworkflow()
		end
	end
	if findstring(l,"�������ʯ��������˼�����ã���������") then
		alias.checkbusy("mb")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=mb �ı����趨��") then
		alias.et()
		run("yun regenerate")
		alias.checkexp("mp")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
		alias.flytoid(me.menpaiJobStart)
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=mp �ı����趨��") then
		alias.resetidle()
		if hp.neili<(hp.maxneili*set_neili_global/100) then alias.dz(set_neili) else alias.startworkflow() end
	end
	if findstring(l,"�������磬���ֵ�ͼ��"..tostring(me.menpaiJobStart).."�������") then
		alias.resetidle()
		run("hp;mianbi")
	end
	if findstring(l,"����÷��겻�������Ծ۾��붨��") then
		run("yun regenerate;mianbi")
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function mp_wd.update()
	local  mp_wd_pre_triggerlist={
	       {name="mp_wd_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_wd_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_wd_pre_triggerlist) do
		addtri(v.name,v.regexp,"mp_wd_pre",v.script,v.line)
	end
	closeclass("mp_wd_pre")
end
mp_wd.update()
