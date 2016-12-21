---------------------------------------------------------------------------
-- File name   : rest.mod
-- Description : ���ļ�Ϊ��һ���ű���ܡ��ļ��Ļָ�ģ�顣
--				��Ҫ���������������ɣ����飬�������ݼ�ģ�顣
-- Author: ��С��littleknife (applehoo@126.com)
-- Version:	2011.11.27.0711
---------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
----***********************************************************************************----
----***********************************************************************************----
-------------------------------------------------------------------------------------------

_USE_help=[[
----condition::>> neili,curneili,curmaxneili
----		:>>;jingli,curjingli
-----use:
----do_dazuo("1250","neili","Execute('look')")
----do_dazuo("1250","neili","do_tuna('1150')")
----do_dazuo("1250","neili","tuna('main')()")

]]
OverFlow_dazuo=0
dazuo={
	--[[
	new=function()
		local _dazuo={}
		setmetatable(_dazuo,{__index=dazuo})
		return _dazuo
	end,--]]
	neili_limit=0,
	goal=1000,
	condition="neili",
}

do_dazuo=function(goal,condition,dazuo_ok,dazuo_fail)
	if dazuo_ok~=nil then
		dazuo.finish=function()
			dazuo_ok()
		end
	else dazuo.finish=nil end
	if dazuo_fail~=nil then
		dazuo.finish=function()
			dazuo_fail()
		end
	else dazuo.fail=nil end
	dazuo.goal=goal
	dazuo.condition=condition

	gethpvar()
	dazuo.start(goal,condition)
end
function dazuo:finish()
end

function dazuo:fail()
end

function dazuo.start()
	dazuo.update()
	local f=function() dazuo.check() end
	getjifa(f)
end

function dazuo.check()
	local f=function()
		OverFlow_dazuo=0
		DeleteTriggerGroup("q_dazuo")
		dazuo.finish()
	end
	local dzcmd=function() dazuo.cmd() end
	if OverFlow_dazuo==0 then
		checkitok("hp",dazuo.condition,dazuo.goal,f,dzcmd)
	else
		call(f)
	end
end

function dazuo.cmd()
--[[
	if me.hp["food"]<=0.5*me.hp["foodmax"] then
		run("eat liang")
	end
	if me.hp["water"]<=0.5*me.hp["watermax"] then
		run("drink jiudai")
	end
--]]
	if me.hp["qi"]<=0.85*me.hp["qimax"] and me.jifa["force"]["lv"]~=nil and me.jifa["force"]["lv"]>150 then
		run("yun recover")-------------DiscardQueue()��Ӱ����
		----Execute("yun recover")
	end
	if me.hp["jing"]<=0.85*me.hp["jingmax"] then
		run("yun regenerate")
	end

	jifa_sklevel_force=tonumber(me.jifa["force"]["lv"])-1
	MaxNum_dazuo=2*tonumber(jifa_sklevel_force)*10
	SetVariable("dazuo_maxnum",MaxNum_dazuo)

	dazuonum=need_dznum(me.hp.qi,me.hp.qimax,me.hp.neili,me.hp.neilimax)
	dazuonum=math.ceil(math.min((tonumber(jifa_sklevel_force)*10/100+1)*2,dazuonum))
	if dazuonum < 10 then
		dazuonum = 10
	end
	run("dazuo "..tostring(dazuonum))
	local dzck=function() dazuo.check() end
	busytest(dzck)
end

dazuo.overflow=function()
	OverFlow_dazuo=1
end
function dazuo.update()
-----��ľ�����Ϊ�Ѿ��ﵽ��ƿ��
	OverFlow_dazuo=0
	addtri("dz_overflow",".*���������Ϊ�ƺ��Ѿ��ﵽ��ƿ��\\w*","q_dazuo","dazuo.overflow")
	EnableTriggerGroup("q_dazuo",1)
end
------------------------------------------------------------------------------------------------------------------------------
--AddAlias("alias_dazuo","#dazuo (.+)","",alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression,"dazuo.alias")
--AddAlias("alias_dazuostop","#dazuostop","",alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression,"dazuo.stop")
--AddAlias("alias_dazuocontinue","#dazuogo","",alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression,"dazuo.resume")
------------------------------------------------------------------------------------------------------------------------------
--SetAliasOption("alias_dazuo","group","dazuo")
--SetAliasOption("alias_dazuostop","group","dazuo")
--SetAliasOption("alias_dazuocontinue","group","dazuo")

--------------------Dazuo End-----------------------------------------
--------------------Tuna Start----------------------------------------
-----ʹ��:
_USE_help=[[
----condition::>> neili,curneili,curmaxneili
----		:>>;jingli,curjingli
-----use:
----do_tuna("1250","neili","Execute('look')")
----do_tuna("1250","neili","do_tuna('1150')")
----do_tuna("1250","neili","tuna('main')()")

]]

OverFlow_tuna=0
tuna={
	new=function()
		local _tuna={}
		setmetatable(_tuna,{__index=tuna})
		return _tuna
	end,
	neili_limit=0,
	goal=1000,
	condition="jingli",
	isover=0,
}
tuna.alias=function(n,l,w)
	dz_str_tb=utils.split (w[1], ",")
	goal=dz_str_tb[1]
	condition=dz_str_tb[2]
	tuna_ok=dz_str_tb[3]
	tuna_fail=dz_str_tb[4]
	do_tuna(goal,condition,tuna_ok,tuna_fail)
end

do_tuna=function(goal,condition,tuna_ok,tuna_fail)
	local tmp_tuna=tuna.new()
	tmp_tuna.finish=tuna_ok
	tmp_tuna.fail=tuna_fail
	tmp_tuna.goal=goal
	tmp_tuna.condition=condition

	gethpvar()
	tmp_tuna:start(goal,condition)
end
function tuna:finish()
print("Ĭ�����ɻص�����finish")
end

function tuna:fail()
print("Ĭ�����ɻص�����fail")
end

function tuna:start()
	OverFlow_tuna=0
	self:update()
	local f=function() self:check() end
	getcha(f)
end

function tuna:check()
	local f=function()
	DeleteTriggerGroup("q_tuna")
	OverFlow_tuna=0
	self:finish()
	end
	local tncmd=function() self:cmd() end
	if OverFlow_tuna==0 then
	checkitok("hp",self.condition,self.goal,f,tncmd)
	else
	call(f)
	end
end

function tuna:cmd()

	skills_level_force=tonumber(me.skills["force"]["lv"])-1
	MaxNum_tuna=tonumber(skills_level_force)*15
	SetVariable("tuna_maxnum",MaxNum_tuna)

	--[[
	if me.hp["food"]<=0.5*me.hp["foodmax"] then
		run("eat liang")
	end
	if me.hp["water"]<=0.5*me.hp["watermax"] then
		run("drink jiudai")
	end
	--]]
	if me.hp["water"]<=0.5*me.hp["watermax"] and me.hp["food"]<=0.5*me.hp["foodmax"]  then
		run("get ji from he;drink ji;drink ji;drink ji;put ji in he")
	end
	if me.hp["qi"]<=0.85*me.hp["qimax"] then
		run("yun recover")
	end
	if me.hp["jing"]<=0.85*me.hp["jingmax"] then
		run("yun regenerate")
	end
	if me.hp["neili"]<=0.4*me.hp["neilimax"] then
		self:yunneili()
		return false
	end

	tunanum=need_dznum(me.hp.qi,me.hp.qimax,me.hp.neili,me.hp.neilimax)
	tunanum=math.min((tonumber(skills_level_force)*15/100+1)*2,tunanum)
	run("tuna "..tostring(tunanum))
	local dzck=function() self:check() end
	busytest(dzck)
end

function tuna:yunneili()
	EnableTriggerGroup("tuna",false)
	EnableTriggerGroup("dazuo",true)
	local dz=function() self:check() end
	do_dazuo("0.4","curmaxneili",dz,dz)
end
tuna.stop=function()
	Note("===�Ѿ��ֶ�ֹͣ���ɣ�===")
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
end
tuna.resume=function()
	Note("===�Ѿ��ֶ��������ɣ�===")
	EnableTriggerGroup("tuna",true)
	busytest(tuna["main"])
end
-----��ľ�����Ϊ�Ѿ��ﵽ��ƿ��

tuna.overflow=function()
		OverFlow_tuna=1
end
function tuna:update()
-----��ľ�����Ϊ�Ѿ��ﵽ��ƿ��
	OverFlow_tuna=0
	addtri("tn_overflow",".*���.*��Ϊ�Ѿ��ﵽ��ƿ��\\w*","q_tuna","tuna.overflow")
	EnableTriggerGroup("q_tuna",1)
end
------------------------------------------------------------------------------------------------------------------------------
AddAlias("alias_tuna","#tuna (.+)","",alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression,"tuna.alias")
AddAlias("alias_tunastop","#tunastop","",alias_flag.Enabled + alias_flag.Replace,"tuna.stop")
AddAlias("alias_tunacontinue","#tunago","",alias_flag.Enabled + alias_flag.Replace ,"tuna.resume")

SetAliasOption("alias_tuna","group","tuna")
SetAliasOption("alias_tunastop","group","tuna")
SetAliasOption("alias_tunacontinue","group","tuna")

-----------------Tuna End--------------------------------------
function need_dznum(a,b,c,d)
--����һ��˼·����Ч������1/10��������ΪЧ����ߡ�
--a-->qi,b-->maxqi,c-neili��d-maxneil��if neili
need =d*2+1-c
	if d<1000 then
		need=(need+1)/2
	end
qi_dz=a-(b+9)/10
need=(need*100+129)/100         --sudu=100
need=math.min(qi_dz,need)
need=math.ceil(math.max(need,10))
	if qi_dz<10 then
		--print("����dz_qi:",qi_dz)
		--Send("l")
		return 10
	else
		return need
	end

end
-------------------------------------------------------------------------------------------
----***********************************************************************************----
----***********************************************************************************----
-------------------------------------------------------------------------------------------
xiulian={
	new=function()
		local _xiulian={}
		setmetatable(_xiulian,{__index=xiulian})
		return _xiulian
	end,
	interval=5,
	timeout=20,
	goal=1,
	skill="",
	sklevel=1,
	need_interrupt=0,
}

function xiulian:finish()
end

function xiulian:fail()
end

xiulian_alias=function(name, line, wildcards)
	do_xiulian(xiulian_ok,xiulian_fail)
end

do_xiulian=function(xiulian_ok,xiulian_fail)
	local tmp_xiulian=xiulian.new()
	tmp_xiulian.finish=xiulian_ok
	tmp_xiulian.fail=xiulian_fail
	tmp_xiulian:start()

end

function xiulian:start()
	local f=function() self:check() end
	getinfo(f)

end
function xiulian:check()
	force_cn=GetVariable("jifa_skname_force")
	max_level=math.ceil(math.pow(me.hp.exp*10,0.333333))+1
	for k,v in pairs(me.skills) do

		if v.name==force_cn then
			xlskill=k
			xllevel=v.lv
			print ("�����ļ��ܣ�",v.name,xlskill)
		end
	end
	self.skill=xlskill
	self.sklevel=xllevel

	local f=function() self:finish() end
	local e=function() self:run() end


	if self.skill==nil or self.sklevel>=max_level or Xiulian_Over==1 then
		print("�����Ѿ�������������֧�ֵ����ֵ��")
		busytest(f)
		else
		if self.goal==1 then self.goal=max_level end
		checkitok("skills",self.skill,self.goal,f,e)
	end
end
function xiulian:run()
	run("xiulian "..self.skill)
	wait.make(function()
	local l,w=wait.regexp("^(> |)(����ϥ���£�������֮������ʼ"..self.skill.."\\w*|�������֮���ع��������پ��ڹ���Ϊ������С\\w*|���Ǳ�ܱ������\\w*|����ȱ��ʵս���飬���޷�����������书\\w*)",5)
		if l==nil then
			self:run()
		return
		end
		if string.find(l,"�������֮���ع�����") then
			if self.need_interrupt==1 then
			self:finish()
			return
			else
			self:check()
			end
		return
		end

		if string.find(l,"���Ǳ�ܱ������") or string.find(l,"����ȱ��ʵս���飬���޷�����������书") then
		print("����������Ǳ�ܻ��鲻�㣡")
		self:finish()
		return
		end
	end)

end

function xiulian:stop()
	Note("===�Ѿ��ֶ�ֹͣ������===")
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	self:finish()
end

------
AddAlias("alias_xiulian","#xiulian","",alias_flag.Enabled + alias_flag.Replace,"xiulian_alias")

SetAliasOption("alias_xiulian","group","job_xiulian")
---------------------------------------------------------------------
------------*******************************************************
---------------------------------------------------------------------
qxuexi={}

function qxuexi:finish()
end
function qxuexi:fail()
end

qxuexi.alias=function(n,l,w)
	xx_str_tb=utils.split (w[1], ",")

	npcid=xx_str_tb[1]
	xxskill=xx_str_tb[2]
	goal=xx_str_tb[3]
	xxtimes=xx_str_tb[4]

	qxuexi_ok=xx_str_tb[5]
	qxuexi_fail=xx_str_tb[6]

	do_qxuexi(npcid,xxskill,goal,xxtimes,qxuexi_ok,qxuexi_fail)
end


qxuexi.stop=function()
	Note("===�Ѿ��ֶ�ֹͣѧϰ��===")
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
end
qxuexi.resume=function()
	Note("===�Ѿ��ֶ�����ѧϰ��===")
	EnableTriggerGroup("q_xuexi",true)
	busytest(qxuexi.main)
end

learn_num=1
case_learn=function()
	local skills=GetVariable("learnskill")
	skills=utils.split(skills,"|")
	--tprint(skills)
	if skills[learn_num]==nil then
		return nil
	end
	--print(skills[learn_num])
	return skills[learn_num]
end

do_qxuexi=function(npcid,xxskill,goal,xxtimes,qxuexi_ok,qxuexi_fail)
----npcid��ѧϰĿ��id
----goal������Ŀ�꣺���֡�
----xxskill��ѧϰ����id
----xxtimes��ѧϰ����

	if qxuexi_ok~=nil then
		qxuexi.finish=function()
			qxuexi_ok()
		end
	else qxuexi.finish=nil end
	if qxuexi_fail~=nil then
		qxuexi.finish=function()
			qxuexi_fail()
		end
	else qxuexi.fail=nil end
	
	qxuexi.finish=qxuexi_ok
	qxuexi.fail=qxuexi_fail
	learn_num=1
	qxuexi.update()
	if xxtimes==nil then xxtimes=50 end
	if xxskill==nil then xxskill=case_learn()  end
	qxuexi.times=xxtimes
	qxuexi.goal=goal
	qxuexi.npcid=npcid
	qxuexi.skill=xxskill

	EnableTriggerGroup("q_xuexi",true)
	call(qxuexi.main)
end
---------------------------------------------------
qxuexi.main=function()
	getinfo(qxuexi.check)
end
qxuexi.check=function()
	--[[
	if checkstatus("hp","foodstat","����") then
		run("eat liang")
	end
	if checkstatus("hp","waterstat","����") then
		run("drink jiudai")
	end
	--]]
	--[[
	if checkstatus("skills",qxuexi.skill,qxuexi.goal) then
		call(qxuexi.over)
	elseif checkstatus("hp","curmaxjing",0.6)==false then
		do_dazuo(0.6,"curmaxjing",qxuexi.cmd,qxuexi.cmd)
	else
		call(qxuexi.cmd)
	end
	--]]
	call(qxuexi.cmd)
end

qxuexi.cmd=function()
	run("xue "..qxuexi["npcid"].." "..qxuexi["skill"].." "..qxuexi["times"])
	--infoend(qxuexi.recover)
end
qxuexi.recover=function()
	run("yun regenerate")
end
qxuexi.cooltime=function()
	--call(qxuexi.main)
	busytest(qxuexi_end_fail)
end
----------------------------

qxuexi_end_ok=function()
	qxuexi.finish()
end
qxuexi_end_fail=function()
	qxuexi.fail()
end

qxuexi.update=function()
	addtri("qxuexi_cmd","^(> |)���������˼����������������ö��ˡ�","q_xuexi","qxuexi.cmd")
	addtri("qxuexi_main","^(> |)�����������","q_xuexi","qxuexi.cooltime")
	addtri("qxuexi_recover","^(> |)�����ھ��񲻼ѣ��޷���������˼����","q_xuexi","qxuexi.recover")
	addtri("qxuexi_cmd2","^(> |)�����ھ�������$","q_xuexi","qxuexi.cmd")

	addtri("qxuexi_over","^(> |)(��û����ô��Ǳ�ܡ�|����Ǳ����ѧ��������|���Ǳ�ܲ�����û�а취�ٳɳ��ˡ�)","q_xuexi","qxuexi.over")
	addtri("qxuexi_over2","^(> > |> |)���ʵս���黹���㣬���ܼ���ѧϰ����ܣ�|����ڹ�ˮƽ���޷�����ѧϰ������|��ļ���ˮƽ���޷�����ѧϰ������|���������±����ұ���ѧ�ˡ�|�������ĳ̶��Ѿ�������ʦ���ˡ�|ѧ�����󷨣�Ҫ�ĺ���������������������ò���ѽ��|��....(.+)֧֧����أ�������������ʦ���ϡ�","q_xuexi","qxuexi.chskill")

	addtri("qxuexi_omit3","^(> |)(�����̲��ò���ֹ�ˡ�|(.+)�̵���ϣ������������򣬻��ĵص��˵�ͷ��)","q_xuexi","qxuexi.recover")
	--addtri("qxuexi_omit1","^[> ]*����(.+)���\\w*","q_xuexi","")
	--addtri("qxuexi_omit2","^[> ]*�㹲�����.+��\\w*","q_xuexi","")
	----addtri("qxuexi_omit3","^[> ]*������.+��ָ�����ƺ���Щ�ĵ�\\w*","q_xuexi","")

		--SetTriggerOption("qxuexi_omit1","omit_from_output",1)
		--SetTriggerOption("qxuexi_omit2","omit_from_output",1)
		--SetTriggerOption("qxuexi_omit3","omit_from_output",1)
		SetTriggerOption("qxuexi_cmd","omit_from_output",1)
		SetTriggerOption("qxuexi_cmd2","omit_from_output",1)

	trigrpon("q_xuexi")

	AddAlias("alias_qxuexistop","#xxstop","",alias_flag.Enabled + alias_flag.Replace ,"qxuexi.stop")
	SetAliasOption("alias_qxuexistop","group","q_xuexi")
end
---------------------------------------------------
qxuexi.chskill=function()
	learn_num=learn_num+1
	qxuexi["skill"]=case_learn()
	if qxuexi["skill"]==nil then
		qxuexi.over()
	else
		qxuexi.cmd()
	end
end
qxuexi.over=function()
	print("ѧϰ������Ǳ�ܻ��鲻�㣡")
	busytest(qxuexi_end_ok)
end
----------------------------------------------------------------
qxuexi.loop=function()
	busytest(qxuexi.loopcmd)
end

qxuexi.loopcmd=function()
	do_qxuexi(qxuexi.npcid,qxuexi.skill,qxuexi.goal,qxuexi.times,qxuexi.loop,qxuexi.loop)
end
----------------------------------------------

qxuexi_end_ok=function()
	EnableTriggerGroup("q_xuexi",0)
	DiscardQueue()
	DeleteTemporaryTimers()
	qxuexi.finish()
	--qxuexi["end"]("ok")
end

qxuexi_end_fail=function()
	EnableTriggerGroup("q_xuexi",0)
	DiscardQueue()
	DeleteTemporaryTimers()
	qxuexi.fail()
	--qxuexi["end"]("fail")
end

AddAlias("alias_qxuexi","#xuexi (.+)","",alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression,"qxuexi.alias")

SetAliasOption("alias_qxuexi","group","job_xuexi")
-------------------------------------------------------
-------------------------------------------------------


dubook={}
dubook["ok"]=nil
dubook["fail"]=nil

do_dubook=function(bookid,skillid,goal,bktimes,dubook_ok,dubook_fail)
	dubook["ok"]=dubook_ok
	dubook["fail"]=dubook_fail
	---if skname==nil then skname=100000 end
	if goal==nil then goal=10000 end
	if bktimes==nil then bktimes=100 end
	dubook.bookid=bookid
	dubook.skillid=skillid
	dubook.goal=goal
	dubook.times=bktimes
	dubook.update()
	EnableTriggerGroup("q_dubook",1)
	if dubook_ok==nil then dubook["ok"]=dubook.loop end
	if dubook_fail==nil then dubook["fail"]=dubook.loop end

	getinfo(dubook.main)
end

dubook.main=function()
	if checkstatus("skills",dubook.skillid,dubook.goal) then
		call(dubook.over)
	else
		call(dubook.cmd)
	end --if
end

dubook.cmd=function()
	run("study "..dubook.bookid.." "..dubook.times)
end

dubook.cooltime=function()
	DeleteTemporaryTimers()
	run("skills")
	call(dubook.sleep)
end

dubook.recover=function()
	run("yun regenerate")
end
dubook.sleep=function()
	run("sleep")
end
dubook.sleepback=function()
	run("l;cha")
	call(dubook.main)
end

dubook.over=function()
	call(dubook_end_ok)
end
----------------------------------------------------------------
dubook.loop=function()
	busytest(dubook.loopcmd)
end

dubook.loopcmd=function()
	do_dubook(dubook.bookid,dubook.skill,dubook.goal,dubook.times,dubook.loop,dubook.loop)
end
----------------------------------------------

dubook.update=function()
triglist=[[

��ġ�����д�֡������ˣ�
��������ó�һ��˵�Ľ���׼���ú��ж���
�����ڹ���ƣ�룬�޷�ר�������ж���֪��
���ж��������йض���д�ֵļ��ɣ��ƺ��е��ĵá�

]]
addtri("qdubook_recover","^(> >|> |)���ж���ϣ���(.+)����������$", "q_dubook","dubook.recover")

addtri("qdubook_cmd","^(> >|> |)(���������˼����������������ö��ˡ�|�����ھ�������)$","q_dubook","dubook.cmd")
addtri("qdubook_slback","^(> >|> |)��һ��������ֻ���������档�ûһ���ˡ�$","q_dubook","dubook.sleepback")

addtri("qdubook_cooltime","^(> >|> |)�������������$","q_dubook","dubook.cooltime")

end



dubook["end"]=function(s)
EnableTriggerGroup("q_dubook",0)
	if ((s~="")and(s~=nil)) then
		call(dubook[s])
	end
	dubook["ok"]=nil
	dubook["fail"]=nil
end

dubook_end_ok=function()
	dubook["end"]("ok")
end

dubook_end_fail=function()
	dubook["end"]("fail")
end
----------------------------------------------------------------------
----------------------------------------------------------------------
baiji={

	new=function()
	local _baiji={}
		setmetatable(_baiji,{__index=baiji})
		return _baiji
	end,
	timeout=10,
}
function baiji:finish()
print("::�ݼ��ص�����::")
end
function baiji:fail()
end


alias_baiji=function(n,l,w)
	do_baiji(baiji_ok,baiji_fail)
end


do_baiji=function(baiji_ok,baiji_fail)
	local tmp_baiji=baiji.new()
	tmp_baiji.finish=baiji_ok
	tmp_baiji.fail=baiji_fail
	tmp_baiji:start()
end

function baiji:start()
	self:update()
run("baiji xiang 50;set no_more baiji")
	wait.make(function()
	local l,w=wait.regexp('^(> |)(��ľ��������޷������ݼ�|�����������|�趨����������no_more = "baiji"$)',self.timeout) --��ʱ
		----print("l=",l)
		wait.time(0.2)
		if l==nil then
		self:start()
		return
		end
		if string.find(l,"��ľ�����") then
		run("yun regenerate")
		self:start()
		return
		end
		if string.find(l,"�����������") then
		print("::��������::")
		run("hp;cha")
		run("eat liang;drink jiudai")
		wait.time(0.4)
			if checkstatus("skills","literate",501) then
				print("�ݼ��������ﵽ��дĿ��500lv����")
				self:finish()-------------????
				return
				elseif checkstatus("hp","curmaxjingli",0.9)==false then
					local f=function()		self:start()	end
						run("yun regenerate")
				do_dazuo(0.9,"curmaxjingli",f,f)
				return
			end
			self:start()
			return
		end

		if string.find(l,'�趨����������no_more = "baiji"') then
		----print("::��ʼ�ݼ�����::")
		wait.time(0.1)
		self:start()
		return
		end
		print(":::EndHere::::")
	wait.time(self.timeout)
	end)
end

AddAlias("alias_baiji","#baiji","",alias_flag.Enabled + alias_flag.Replace ,"alias_baiji")

SetAliasOption("alias_baiji","group","job_baiji")

function baiji:update()
	baiji_tri={

	"����ſ����������ȥ��",
	"����ſ�����ݼ�֮��ͻȻ�������飬�������еĵ�����������",
	"��ľ��������޷������ݼ�",
	"�����������",
	"�����ھ�������",
	}

	baiji_regexp=linktri(baiji_tri)


	addtri("qbaiji_set",'^(> |)\\s*�趨����������no_more = "baiji"$',"q_baiji","")
	addtri("qbaiji_noecho",baiji_regexp,"q_baiji","")

	SetTriggerOption("qbaiji_set","omit_from_output",1)
	SetTriggerOption("qbaiji_noecho","omit_from_output",1)
	SetTriggerOption("qbaiji_noecho","sequence","20")
	SetTriggerOption("qbaiji_set","sequence","20")

	EnableTriggerGroup("q_baiji",1)

end

dushibi={
	new=function()
		local _dushibi={}
		setmetatable(_dushibi,{__index=dushibi})
		return _dushibi
	end,
	interval=5,
	timeout=20,
}

function dushibi:finish()
end

function dushibi:fail()
end

dushibi_alias=function(name, line, wildcards)
	do_dushibi(dushibi_ok,dushibi_fail)
end

do_dushibi=function(dushibi_ok,dushibi_fail)
	local tmp_dushibi=dushibi.new()
	tmp_dushibi.finish=dushibi_ok
	tmp_dushibi.fail=dushibi_fail
	tmp_dushibi:start()

end

function dushibi:start()
	self:update()
	local f=function() self:check() end
	getinfo(f)
end

function dushibi:check()
	local f=function() self:main() end
	local e=function()
		do_dazuo(0.3,"curmaxneili",f,f)
	end

	checkitok("hp","curmaxneili",0.4,f,e)
end

function dushibi:cooltime()
end

function dushibi:main()
	run("watch ʯ�� 50;yun regenerate")
	wait.make(function()

	local l,w=wait.regexp(".*���ϻ���Ǹ��������ߣ���������һ��ҽ�顣|.*���Ѿ����ˣ�������Ϣһ���|.*����һ���񣬾��������ö���|.*���������㣬�޷�����ʯ�������й�����\\w*|.*�����������\\w*",5)
		if l==nil then
		self:main()
		return
		end
	 if string.find(l,"��������һ��ҽ�顣") then
	 print("::read shibi::")
	 run("watch ʯ�� 500")
		self:main()
		return
	 end
	 if string.find(l,"���Ѿ����ˣ�������Ϣһ��ɡ�") then
		run("yun regenerate")
		self:main()
		return
	 end
	if string.find(l,"����һ���񣬾��������ö��ˡ�") then
	 	self:main()
		return
		end
	if string.find(l,"����������") or  string.find(l,"�����������") then
		self:check()
		return
	end
	self:main()
	wait.time(5)
	end)
end

function dushibi:update()

	local noecho_trilist={
	"���Ѿ����ˣ�������Ϣһ��ɡ�",
	"�����ھ������档",
	"�����ھ������档",
	"����ר�Ĺۿ�ʯ�ڡ�",
			}
	local _noechotri=linktri(noecho_trilist)

	addtri("dushibi_noecho",_noechotri,"q_dushibi","")
	SetTriggerOption("dushibi_noecho","omit_from_output",1)
	EnableTriggerGroup("q_dushibi",1)

end

AddAlias("alias_dushibi","#dusb","",alias_flag.Enabled + alias_flag.Replace,"dushibi_alias")
SetAliasOption("alias_dushibi","group","job_dushibi")

----------------------------------------------------------------------
----------------------------------------------------------------------

ldpsay={}
ldpsay["ok"]=nil
ldpsay["fail"]=nil
ldpsay.failsay=false

go_cs_ldp=function()
	local cs2ldp="w;w;w;w;w;w;nw;w;w;w;nw;w;sw;w;sw;w;s;sw;su;w;sw;w;wu;wu;w;wu;wu;wu;wu;nw;nw;nu;wu;wu;sw;sw;wu;su;wu;wu;wu;su;su"
	run(cs2ldp)
end
go_ldp_cs=function()
	local ldp2cs="nd;nd;ed;ed;ed;nd;ed;ne;ne;ed;ed;sd;se;se;ed;ed;ed;ed;e;ed;ed;e;ne;e;nd;ne;n;e;ne;e;ne;e;se;e;e;e;se;e;e;e;e;e;e"
	run(ldp2cs)
end
do_ldpsay=function(goal,ldpsay_ok,ldpsay_fail)
	ldpsay["ok"]=ldpsay_ok
	ldpsay["fail"]=ldpsay_fail
	if goal==nil then goal=47 end
	ldpsay.skillid="force"
	ldpsay.goal=goal
	ldpsay.failsay=false
	ldpsay.update()
	EnableTriggerGroup("q_ldpsay",1)
	if ldpsay_ok==nil then ldpsay["ok"]=ldpsay.loop end
	if ldpsay_fail==nil then ldpsay["fail"]=ldpsay.loop end

	getinfo(ldpsay.main)
end

ldpsay.main=function()
	if checkstatus("skills",ldpsay.skillid,ldpsay.goal) then
		call(ldpsay.over)
	else
		gethp(ldpsay.cmd)
	end --if
end

ldpsay.cmd=function()
	if ldpsay.failsay then
		ldpsay.failsay=false
		run("yun refresh;e;w")
		gethp(ldpsay.cmd)
		return
	end
	if me.hp["jing"]<=(me.hp["jingmax"]*2/5) then
		if me.hp["neili"] >=10 then
			run("yun regenerate")
		else
			busytest(ldpsay.gosleep)
			return
		end
	end
	if me.hp["qi"]>(me.hp["qimax"]*2/5) then
		run("say")
	else
		if me.hp["neili"] >=10 then
			run("yun recover")
		else
			busytest(ldpsay.gosleep)
			return
		end
	end
	gethp(ldpsay.cmd)
end
--#TRIGGER {����%s(%d)/%s(%d) } {jinga=%1;jingb=%2;#math jingc @jingb*2/5;#if (@jinga>@jingc) {#t- jing;#t+ qi} {yun regenerate;hp}}
--#TRIGGER {��Ѫ��%s(%d)/%s(%d)} {qia=%1;qib=%2;#math qic @qib*2/5;#if (@qia>@qic) {say} {yun recover}}

ldpsay.gosleep=function()
	--local ldp2xxs="nd;nd;ed;ed;ed;nd;ed;ne;ne;ed;ed;sd;se;se;ed;ed;ed;ed;e;ed;ed;e;ne;e;nd;ne;n;e;ne;se;se;s;s;s;su;sd;s;e;e;e;e;e;e;ne;ne;ne;e;e;e;e;s;sw;w;w;w;w;w;w"
	local ldp2xxs="nd;nd;ed;ed;ed;nd;ed;ne;ne;ed;ed;sd;se;se;ed;ed;ed;ed;e;ed;ed;e;ne;enter;w"
	run(ldp2xxs)
	run("sleep")
end
ldpsay.over=function()
	call(ldpsay_end_ok)
end
----------------------------------------------------------------
ldpsay.loop=function()
	busytest(ldpsay.loopcmd)
end

ldpsay.loopcmd=function()
	do_ldpsay(dubook.goal,ldpsay.loop,ldpsay.loop)
end
----------------------------------------------
ldpsay.failsay=function(n,l,w)
	ldpsay.failsay=true
end
ldpsay.wakeup=function(n,l,w)
	--local xxs2ldp="e;e;e;e;e;e;n;e;n;w;w;w;w;sw;sw;sw;w;w;w;w;w;w;n;nu;nd;n;n;n;nw;nw;sw;w;s;sw;su;w;sw;w;wu;wu;w;wu;wu;wu;wu;nw;nw;nu;wu;wu;sw;sw;wu;su;wu;wu;wu;su;su"
	local xxs2ldp="e;out;sw;w;wu;wu;w;wu;wu;wu;wu;nw;nw;nu;wu;wu;sw;sw;wu;su;wu;wu;wu;su;su"
	run(xxs2ldp)
	getinfo(ldpsay.main)
end

ldpsay.update=function()
	
	addtri("ldpsay_failsay","^(> |)���������ﲻ֪����˵Щʲô","q_ldpsay","ldpsay.failsay")
	addtri("ldpsay_wakeup","^(> |)��һ��������ֻ���������档�ûһ����","q_ldpsay","ldpsay.wakeup")
end



ldpsay["end"]=function(s)
	EnableTriggerGroup("q_ldpsay",0)
	if ((s~="")and(s~=nil)) then
		call(ldpsay[s])
	end
	ldpsay["ok"]=nil
	ldpsay["fail"]=nil
end

ldpsay_end_ok=function()
	ldpsay["end"]("ok")
end

ldpsay_end_fail=function()
	ldpsay["end"]("fail")
end
----------------------------------------------------------------------
----------------------------------------------------------------------

----------------------------------------------------------------------
-- ����ģ�鿪ʼ
----------------------------------------------------------------------
qlw={}

function qlw:finish()
end
function qlw:fail()
end

qlw.end_ok=function()
	trigrpoff("q_lw")
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	qlw.finish()
end
qlw.end_fail=function()
	trigrpoff("q_lw")
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	qlw.fail()
end

function do_lw(job_ok,job_fail)
	if job_ok~=nil then
		qlw.finish=function()
			job_ok()
		end
	else qlw.finish=nil end
	if job_fail~=nil then
		qlw.fail=function()
			job_fail()
		end
	else qlw.fail=nil end
	lingwu_num=1
	qlw.skill=case_lingwu() 
	qlw.update()
	trigrpon("q_lw")
	me.canjob=false
	qlw.start()
end

function qlw.start()
	gethp(qlw.check)
end

function qlw.check()
	if me.canjob==true then
		me.canjob=false
		qlw.end_ok()
		return
	end
	if me.hp["qi_percent"]<100 then
		run("yun heal")
		busytest(qlw.start)
		return
	end
	if me.hp["neili"]<(me.hp["neilimax"]*1.2) then
		do_dazuo(me.hp["neilimax"]*1.75, "neili", qlw.start, qlw.start)
		return		
	end
	if me.hp["jing"]<=(me.hp["jingmax"]*2/3) then
		run("yun regenerate")
	end
	if me.hp["jingli"]<=(me.hp["jinglimax"]*2/3) then
		run("yun refresh")
	end
	busytest(qlw.cmd)
end

function qlw.cmd()
	local msg_tri={
		"�˵���ʲ�ر�֮������ʲô������ģ�",
		
		"��������æ���ء�",
		"���Ѿ���ս�����ˣ�ѧһ��ʵս����ɡ�",
		
		"��ֻ�ܲ����ɵ��书��",
		"�㲻���������������ڹ���",
		"������������书����������似��������",
		"����ⷽ��ļ��ܻ���һ�ϲ�ͨ����ô��ȴӻ���ѧ��",
		"�����û��ѧ������������ܰɣ� �����ȥ��̱��ˡ�",
		".+��û�������Լ�����ľ��磡",
		"���ʵս���黹���㣬���ܼ�����������ܣ�",
		".+���費�����޷��������һ���",
		
		"�����ھ��񲻼ѣ��޷���������˼����",
		
		"��û����ô��Ǳ�ܡ�",
		"����˼����ѧ��",
	}

	local _ftri=linktri(msg_tri)
	if qlw.skill==nil then
		qlw.end_ok()
		return
	end
	run("lingwu "..qlw.skill.." 20")
	wait.make(function()
		local l,w=wait.regexp(_ftri,2)
		if l==nil then
			qlw.cmd()
			return
		end
		if findstring(l,msg_tri[1]) then
			qlw.end_fail()
			return
		end
		if findstring(l,msg_tri[12]) then
			run("yun regenerate")
			qlw.start()
			return
		end
		if findstring(l,msg_tri[13]) then
			qlw.end_ok()
			return
		end
		if findstring(l,msg_tri[2],msg_tri[3]) then
			busytest(qlw.cmd)
			return
		end
		if findstring(l,msg_tri[4],msg_tri[5],msg_tri[6],msg_tri[7],msg_tri[8],msg_tri[9],msg_tri[10]) then
			lingwu_num=lingwu_num+1
			qlw.skill=case_lingwu() 
			busytest(qlw.cmd)
			return
		end
		if findstring(l,msg_tri[11]) then
			do_lian(qlw.start,qlw.start)
			return
		end
		if findstring(l,msg_tri[14]) then
			-- OK
			return
		end
	end)
end

function qlw.over()
	run("yun regenerate")
	busytest(qlw.start)
end

lingwu_num=1
case_lingwu=function()
	local skills=GetVariable("lingwuskill")
	skills=utils.split(skills,"|")
	if skills[lingwu_num]==nil then
		return nil
	end
	return skills[lingwu_num]
end

function qlw.update()
	addtri("qlw_lian","^(> |)��������ϣ���������վ��������","q_lw","qlw.over")
end
----------------------------------------------------------------------
-- ����ģ�����
----------------------------------------------------------------------

----------------------------------------------------------------------
-- ������ģ�鿪ʼ
----------------------------------------------------------------------
qlian={}

function qlian:finish()
end
function qlian:fail()
end

qlian.end_ok=function()
	trigrpoff("q_lian")
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	qlian.finish()
end
qlian.end_fail=function()
	trigrpoff("q_lian")
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	qlian.fail()
end

function do_lian(job_ok,job_fail)
	if job_ok~=nil then
		qlian.finish=function()
			job_ok()
		end
	else qlian.finish=nil end
	if job_fail~=nil then
		qlian.fail=function()
			job_fail()
		end
	else qlian.fail=nil end
	qlian.skill=case_lingwu() 
	if qlian.skill=="whip" then
		qlian.weapon="bian"
	else
		qlian.weapon=qlian.skill
	end
	qlian.update()
	trigrpon("q_lian")
	me.canjob=false
	qlian.start()
end

function qlian.start()
	gethp(qlian.check)
end

function qlian.check()
	if me.canjob==true then
		me.canjob=false
		qlian.end_ok()
		return
	end
	if me.hp["qi_percent"]<100 then
		run("yun heal")
		busytest(qlian.start)
		return
	end
	if me.hp["neili"]<(me.hp["neilimax"]*1.2) then
		do_dazuo(me.hp["neilimax"]*1.75, "neili",qlian.start,qlian.start)
		return		
	end
	if me.hp["jing"]<=(me.hp["jingmax"]*2/3) then
		run("yun regenerate")
	end
	if me.hp["jingli"]<=(me.hp["jinglimax"]*2/3) then
		run("yun refresh")
	end
	busytest(qlian.cmd)
end

function qlian.cmd()
	local msg_tri={
		"���ﲻ�������ĵط���",
		"�㻹��ר�Ĺ���ɣ�",
		
		"��������æ���ء�",
		
		"�㲻��ͨ����ϰ�м����������ܡ�",
		"��ֻ����ϰ�� enable ָ�������⼼�ܡ�",
		"�����û��ѧ������ܰɣ������ȥ��̱��ˡ�",
		"����ⷽ��ļ��ܻ���һ�ϲ�ͨ����ô��ȴӻ���ѧ��",
		"��Ļ��������δ���������ȴ�û������ܼ�����ߡ�",
		".+�Ѿ���ϰ�������ˣ������ȴ�û������ܼ�����ߡ�",
		"�����ڲ�����ϰ����ܡ�",
		
		"����ϥ���£���ʼ��ϰ",
		".+����ʼ��ϰ",
		
		"��ʹ�õ��������ԡ�",
		
	}

	local _ftri=linktri(msg_tri)
	if qlian.skill==nil then
		qlian.end_ok()
		return
	end
	run("wield "..qlian.weapon)
	run("lian "..qlian.skill.." 20")
	wait.make(function()
		local l,w=wait.regexp(_ftri,2)
		if l==nil then
			qlian.cmd()
			return
		end
		if findstring(l,msg_tri[1],msg_tri[2]) then
			qlian.end_fail()
			return
		end
		if findstring(l,msg_tri[3]) then
			busytest(qlian.cmd)
			return
		end
		if findstring(l,msg_tri[4],msg_tri[5],msg_tri[6],msg_tri[7],msg_tri[8],msg_tri[9],msg_tri[10],msg_tri[13]) then
			lingwu_num=lingwu_num+1
			qlian.end_ok()
			return
		end
		if findstring(l,msg_tri[11],msg_tri[12]) then
			-- OK
			return
		end
	end)
end

function qlian.over()
	run("unwield "..qlian.weapon)
	run("yun refresh")
	busytest(qlian.start)
end

function qlian.update()
	addtri("qlian_over","^(> |)����ϰ��ϣ���������һ��������Ŀ��(��|��)��","q_lian","qlian.over")
end
----------------------------------------------------------------------
-- ������ģ�����
----------------------------------------------------------------------
