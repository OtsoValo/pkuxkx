---------------------------------------------------------------------------
-- File name   : quest_xx_btjob.lua
-- Description : �����ɵ����մ򹤷���,���õ���ҧ�Ҷ�������ֻ�ܵ�80K
--						Ŀǰ�и����⣬������þ��鲻���ȣ���ôһСʱ��2K�������ǳ���
--						������þ������ȣ������޵�ʱ���������û����������...
--
-- Author: Michen (xmichen@gmail.com)
-- Version:	2014.05
---------------------------------------------------------------------------

print("quest:xx do bt job Loading ok!")

qxxbt={
	nowplace=0,
	sucked=false,
	keplace=926,
	masterplace=0,
	masterid=nil,
	limit=false,
	expfirst=true,		-- �Ƿ�������
}

qxxbt.npcplace={
	{924,"jiading","�Ҷ�",},
	{923,"jiading","�Ҷ�",},
	{1057,"shou","������",},
	{1026,"shan","С�",},
	--{1056,"porter","����",},
}
function qxxbt.start()
	qxxbt.update()
	trigrpon("q_xxbt")
	run("get ji from shi he;drink ji;put ji in shi he")
	run("score;cha")
	busytest(qxxbt.startcheck)
end

function qxxbt.startcheck()
	run("convert she")
	gethp(qxxbt.check)
end

function qxxbt.check()
	if me.hp["qi_percent"] < 100 then
		run("yun heal")
		busytest(qxxbt.startcheck)
		return
	end
	if (me.hp["pot"]>(me.hp["potmax"]/2) and qxxbt.expfirst==false) or qxxbt.limit then
		-- ȥ��Ǳ��
		if me.score["gold"]>10 then		-- literate
			if (me.skills["literate"]["lv"]==nil or me.skills["literate"]["lv"]<30) then	-- xue xiucai
				qxxbt.masterid="xiucai"
				qxxbt.masterplace=819
			elseif me.skills["literate"]["lv"]<100 then												-- xue ouyang
				qxxbt.masterid="ouyang"
				qxxbt.masterplace=83
			else																										-- xue zhuxi
				qxxbt.masterid="zhu"
				qxxbt.masterplace=1020
			end
		else											-- xue master
			qxxbt.masterid=me.masterid
			qxxbt.masterplace=me.masterroom
		end
		qxxbt.limit=false
		qxxbt.gomaster()
	else
		-- ȥ����
		if me.hp["neili"]<=(me.hp["neilimax"]*8/5) then
			do_dazuo(me.hp["neilimax"]*8/5, "neili",qxxbt.start,qxxbt.start)
			return
		else
			if me.hp["qi"]<100 then
				delay(15,qxxbt.startcheck)
			else
				qxxbt.gonpc()
			end
		end
	end
end
		
function qxxbt.gomaster()
	do_walkgo(qxxbt.masterplace,qxxbt.learnmaster,qxxbt.gomaster)
end
function qxxbt.gosleep()
	do_walkgo(37,qxxbt.dosleep,qxxbt.gosleep)
end
function qxxbt.dosleep()
	run("sleep")
end

function qxxbt.wakeup(n,l,w)
	do_walkgo(qxxbt.keplace,qxxbt.start,qxxbt.start)
end

function qxxbt.learnmaster()
	if qxxbt.masterid=="xiucai" or qxxbt.masterid=="ouyang" or qxxbt.masterid=="zhu" then
		do_qxuexi(qxxbt.masterid,"literate",nil,10,qxxbt.gosleep,qxxbt.gosleep)
	else
		do_qxuexi(qxxbt.masterid,nil,nil,10,qxxbt.gosleep,qxxbt.gosleep)
	end
end

function qxxbt.gonpc()
	local where=0
	qxxbt.nowplace=qxxbt.nowplace+1
	
	if qxxbt.nowplace>#qxxbt.npcplace then qxxbt.nowplace=1 end
	where=qxxbt.npcplace[qxxbt.nowplace][1]
		
	do_walkgo(where,qxxbt.findnpc,qxxbt.gonpc)
end
function qxxbt.findnpc()
	local msg_tri={
		"�����"..qxxbt.npcplace[qxxbt.nowplace][3].."�ݺݵ�һ����ͷ���£���Ц��������ҷ���ȥ�ɣ�",
		"��Ҫ��˭�� idle ���������",
	}

	local _ftri=linktri(msg_tri)
	qxxbt.sucked=false
	run("yield yes;idle "..qxxbt.npcplace[qxxbt.nowplace][2])
	wait.make(function()
		local l,w=wait.regexp(_ftri,2)
		if l==nil then
			--wait.time(1)
			qxxbt.findnpc()
			return
		end
		if findstring(l,msg_tri[1]) then
			-- ��ʼ��Ѫ��
			qxxbt.train()
			return
		end
		if findstring(l,msg_tri[2]) then
			qxxbt.gonpc()
			return
		end
	end)
end

function qxxbt.train()
	if qxxbt.sucked==false then
		run("convert staff;attack "..qxxbt.npcplace[qxxbt.nowplace][2])
		delay(2,qxxbt.train)
	else
		run("score;cha;hp")
		do_walkgo(qxxbt.keplace,qxxbt.startcheck,qxxbt.train)
	end
end

function qxxbt.trainsuck()
	qxxbt.sucked=true
end

function qxxbt.joblimit()
	qxxbt.limit=true
end

function qxxbt.update()
	addtri("qxxbt_trainsuck","^(> > |> |)�������һ��ҧס(.+)���ʺ����͵�����Ѫ����","q_xxbt","qxxbt.trainsuck")
	addtri("qxxbt_traindie","^(> > |> |)(.+)���ڵ��ϣ������˼��¾����ˡ�","q_xxbt","qxxbt.trainsuck")
	addtri("qxxbt_wakeup","^(> > |> |)��һ��������ֻ���������档�ûһ���ˡ�","q_xxbt","qxxbt.wakeup")
	addtri("qxxbt_joblimit","^(> > |> |)���Ȼ����һ��˵������ƣ�������������ι��̫����","q_xxbt","qxxbt.joblimit")
	
end
--[[
--���ﲢ�޴��ˣ�
#CLASS {FStrain}
#TRIGGER {��Ŀǰ��û���κ�Ϊ startfs �ı����趨��} {per=0;pernpc=0;badfs=0;jiajin basic;idle @npcid}
#TRIGGER {@npcname���ڵ��ϣ������˼��¾����ˡ�} {idle @npcid}
#TRIGGER {�����@npcname�ݺݵ�һ����ͷ���£���Ц��������ҷ���ȥ�ɣ�} {#ti 1 {convert staff;attack @npcid};#ts 2}
#TRIGGER {��Ҫ��˭�� idle ���������} {#t- fstrain
@backfs
#wa 1000
#NOP add fsdidian 1
startfs}
#TRIGGER {�������һ��ҧס@npcname���ʺ����͵�����Ѫ����} {stop she;convert she;tj=1;hp;#t+ fsback;#t- fstrain;#ti 1 {h;w;wu};#ts 1}
#TRIGGER {^???���˹���ϣ��������˿�����վ��������} {hp;#if @qirate<100 {yun heal};#if @qi<@max_qi*4/5 {yun recover};#if (@now_neili<@max_neili*5/3) {dazuo 300} {set startfs}}
#TRIGGER {���Ȼ����һ��˵������ƣ�������������ι��̫����} {badfs=1}
#TRIGGER {��ո�ѹ��ס�������ƣ����ǲ�Ҫ����������} {#t- FStrain;#wa 1000;#t+ FStrain;yun heal}
--]]