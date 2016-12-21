---------------------------------------------------------------------------
-- File name   : quest_xkd.lua
-- Description : ���͵����ֻ����ˣ���������9.7K������>970
-- Author: Michen (xmichen@gmail.com)
-- Version:	2014.04.25
---------------------------------------------------------------------------
--/Hyperlink("hi","test\n","test2","blue","green",0)

print("quest:XKD Loading ok!")
qxkd={}

qxkd["ok"]=nil
qxkd["fail"]=nil

qxkd.fishing_ok=false
qxkd.lowneili=false
qxkd.lowjing=false
qxkd.noforce=false
qxkd.noexp=false
qxkd.nopot=false
qxkd.xuexue=1
qxkd.learncmd=nil
qxkd.needdazuo=false
qxkd.addneili=false

-- ��ʼ����
qxkd.start=function()
	SetVariable ("autologin","qxkd.start()")
	qxkd.fishing_ok=false
	qxkd.lowneili=false
	qxkd.lowjing=false
	qxkd.noforce=false
	qxkd.noexp=false
	qxkd.nopot=false
	qxkd.xuexue=1
	qxkd.learncmd=nil
	qxkd.needdazuo=false
	qxkd.addneili=false

	quest.stop=false
	qxkd.update()
	trigrpon("q_xkd")
	run("unset wimpy;set brief 1;tune rumor;tune chat;tune xkx;set brief 1;score;cha;jifa;hp;look")
	busytest(qxkd.checkwhere)
end

-- ��������
qxkd.allstop=function()
	SetVariable ("autologin","")
	quest.stop=true
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	rigrpoff("q_xkd")
	inittri()
end

-- ��鵱ǰλ�ã�������ʼ��ʲô�����ڵ�ǰλ����Ҫ��ʼ�������������������
-- ����ִ�еĶ���������ĺ�����
-- ����һ�����������߽�����ʱ������
qxkd.checkwhere=function()
	if roominfo["name"]=="����ͤ" then
		-- ��ʼ����
		run("get all;s;drop all;n;hp;move stone")
		busytest(qxkd.do_fishing)
		return
	elseif roominfo["name"]=="ʯ��" then
		-- ��ʼ��ǽ
		busytest(qxkd.do_studywall)
		return
	elseif roominfo["name"]=="ɳ̲" then
		run("n;n;n;n")
		run("get all;s;drop all;n;hp;move stone")
		busytest(qxkd.do_fishing)
		return
	elseif roominfo["name"]=="�鷿" then
		qxkd.xuexue=1
		qxkd.learncmd="xue shi literate 10"
		busytest(qxkd.do_learn)
		return
	elseif roominfo["name"]=="ɽ��" then
		qxkd.xuexue=2
		qxkd.learncmd="xue huangyi force 10"
		busytest(qxkd.do_learn)
		return
	elseif roominfo["name"]=="�ٲ�" then
		qxkd.xuexue=6
		qxkd.learncmd="xue dizi strike 10"
		busytest(qxkd.do_learn)
		return
	elseif roominfo["name"]=="��Ϣ��" then
		qxkd.xuexue=1
		qxkd.learncmd="xue shi literate 10"
		run("e;e")
		busytest(qxkd.do_learn)
	elseif roominfo["name"]=="��" then
		gethp(qxkd.checkdazuo)
	end
end

-- ��ʽ�ĵ��㺯��
qxkd.do_fishing=function()
	run("fishing")
	if me.hp["exp"]>9700 then
		-- ���鹻�ˣ�תȥ����:::::::::::::::::::::::::::::���ܲ������ﴦ��Ч�ʻ����һ���
		qxkd.needdazuo=true
		run("halt;halt;nu;drop cloth;drop rain coat;drop rain coat;climb tree;wear all;jump fall;n;w;sleep")
		return
	elseif qxkd.fishing_ok then
		-- �������ˣ�ȥѧϰ
		qxkd.fishing_ok=false
		run("halt;drop si yu;drop si yu;drop si yu;s;give hong dianwa to da han;give hong dianwa to da han;give hong dianwa to da han;s;s;give qili fuzi to yan bai;give qili fuzi to yan bai;give qili fuzi to yan bai;n;n;n;nu;drop cloth;drop rain coat;drop rain coat;climb tree;wear all;jump fall;s;e;drink;drink;drink;w;n;e;n;ask si pu about ������;get zhou;eat zhou;drop zhou;drop zhou;drop zhou;ask si pu about ����;enter;n;open door;enter;n")
		busytest(qxkd.do_studywall)
		return
	else
		-- û�����㣬����
		busytest(qxkd.do_fishing)
		return
	end
end

-- ��ʽ�Ķ�ǽ����
-- û����ʱyun regenerate
-- ��һ��ѧ���ڹ���ʱ��Ҫ������
-- û����ȥ����ȥ˯��������
-- ʵս���鲻���ˣ�ȥ˯����Ȼ��ȥѧʦ��
-- Ǳ�ܲ����ˣ�ȥ˯����Ȼ��ȥ����
qxkd.do_studywall=function()
	run("study wall")
	if qxkd.noforce then		-- û�м����ڹ�
		qxkd.noforce=false
		run("jifa force taixuan-gong;yun regenerate")
		busytest(qxkd.do_studywall)
		return
	elseif qxkd.lowjing then	-- ���񲻹�
		qxkd.lowjing=false
		run("yun regenerate")
		busytest(qxkd.do_studywall)
		return
	elseif qxkd.lowneili then	-- û������
		--qxkd.lowneili=false ��������õ�˯�Ѻ���ж�
		run("s;open door;out;s;out;s;w;n;w;cha;sleep")
		return
	elseif qxkd.noexp then		-- ���鲻��
		run("s;open door;out;s;out;s;w;n;w;cha;hp;sleep")
		return
	elseif qxkd.nopot then		-- ûǱ����
		run("s;open door;out;s;out;s;w;n;w;hp;sleep")
		return
	else
		busytest(qxkd.do_studywall)
		return
	end
end

-- �ж�Ҫѧʲô�����ҷ��ص���Ӧ�ص��·��
qxkd.golearn=function()
	local path=nil
	if qxkd.xuexue==1 then
		path="e;e"
		qxkd.learncmd="xue shi literate 10"
	elseif qxkd.xuexue==2 then
		path="e;s;out;sd;s;eu;eu"
		qxkd.learncmd="xue huangyi force 10"
	elseif qxkd.xuexue==3 then
		path="e;s;out;sd;s;eu;eu"
		qxkd.learncmd="xue huangyi dodge 10"
	elseif qxkd.xuexue==4 then
		path="e;s;out;sd;s;eu;eu"
		qxkd.learncmd="xue huangyi parry 10"
	elseif qxkd.xuexue==5 then
		path="e;s;out;sd;s;eu;eu"
		qxkd.learncmd="xue huangyi sword 10"
	elseif qxkd.xuexue==6 then
		path="e;s;out"
		qxkd.learncmd="xue dizi strike 10"
	else	-- ��ȥ����
		path="e;s;out;sd;move stone;hp"
		qxkd.learncmd=nil
	end
	return path
end

-- �ж�Ҫѧʲô�����ҷ��ص���Ӧ�ص��·��  ������Ѿ���ѧ��
qxkd.golearn2=function()
	qxkd.xuexue=qxkd.xuexue+1
	local path=nil
	if qxkd.xuexue==2 then
		path="w;s;out;sd;s;eu;eu"
		qxkd.learncmd="xue huangyi force 10"
	elseif qxkd.xuexue==3 then
		path="hi huangyi"
		qxkd.learncmd="xue huangyi dodge 10"
	elseif qxkd.xuexue==4 then
		path="hi huangyi"
		qxkd.learncmd="xue huangyi parry 10"
	elseif qxkd.xuexue==5 then
		path="hi huangyi"
		qxkd.learncmd="xue huangyi sword 10"
	elseif qxkd.xuexue==6 then
		path="wd;wd;n;nu"
		qxkd.learncmd="xue dizi strike 10"
	else	-- ��ȥ����
		path="sd;move stone;hp"
		qxkd.learncmd=nil
	end
	if qxkd.xuexue>=7 then
		qxkd.xuexue=1
	end
	return path
end

-- ��ʽ��ѧϰ����
qxkd.do_learn=function()
	local learnfail_tri={
		"^(> |)(���µ���|���µ���|��ѧʿ)������æ���ء�$",
		"^(> |)(���µ���|���µ���|��ѧʿ)������̫���ˣ�û�취����ʲô��$",
		"^(> |)�����ھ��񲻼ѣ��޷���������˼����$",
		"^(> |)�������ĳ̶��Ѿ�������ʦ���ˡ�$",
		"^(> |)���ʵս���黹���㣬���ܼ���ѧϰ����ܣ�$",
		"^(> |)���Ǳ�ܲ�����û�а취�ٳɳ��ˡ�$",
		"^(> |)�㿪ʼ��.+����й�.+�����ʡ�$",
	}
	local l_tri=linktri(learnfail_tri)
	run(qxkd.learncmd)
	wait.make(function()
		local l,w=wait.regexp(l_tri,5)
		if l==nil then
			Note("ѧϰ����δ֪���󣬳������¿�ʼ�����ˡ�")
			busytest(qxkd.start)
			return
		end
		if string.find(l,"������æ���ء�")  or string.find(l,"������̫���ˣ�û�취����ʲô��") or string.find(l,"�����ھ��񲻼ѣ��޷���������˼����") then
			busytest(qxkd.do_learn)
			return
		end
		if string.find(l,"�㿪ʼ��") then
			run("dance")
			return
		end
		if string.find(l,"�������ĳ̶��Ѿ�������ʦ���ˡ�") or string.find(l,"���ʵս���黹���㣬���ܼ���ѧϰ����ܣ�") then
			local golearn=qxkd.golearn2()
			run(golearn)
			if qxkd.learncmd==nil then
				busytest(qxkd.do_fishing)
			else
				busytest(qxkd.do_learn)
			end
			return
		end
		if string.find(l,"���Ǳ�ܲ�����û�а취�ٳɳ��ˡ�") then
			run("halt")
			if qxkd.xuexue==1 then
				run("w;s;out;sd")
			else
				run("wd;wd;n;sd")
			end
			run("move stone;hp")
			busytest(qxkd.do_fishing)
			return
		end
	end)
end

-- ����ģ��
qxkd.checkdazuo=function()
	if me.hp["neilimax"]>970 then
		run("halt;quit")
		Disconnect()
		return
	end
	
	if qxkd.addneili then				-- ���������ˣ�
		qxkd.addneili=false
		run("halt;s;e;n;ask si pu about ������;get zhou;eat zhou;drop zhou;drop zhou;drop zhou;s;w;s;e;drink;drink;drink;drink;drink;w;n;n;w;sleep")
		return
	end
	
	local qq=me.hp["neilimax"]*2-me.hp["neili"]
	if me.hp["qi"]>20 then
		if me.hp["qi"]>qq then
			run("dazuo "..qq)
		elseif me.hp["qi"]>10 then
			run("dazuo 10")
		else
			DoAfterSpecial(9, 'gethp(qxkd.checkdazuo)', 12)
		end
	else
			DoAfterSpecial(9, 'gethp(qxkd.checkdazuo)', 12)
	end
end

-- �����Ǵ�������ش�����
qxkd.is_studywall_wakeup=function(n,l,w)
	if qxkd.lowneili then			-- û�����Ĵ���
		qxkd.lowneili=false
		run("e;s;e;n;ask si pu about ����;enter;n;open door;enter;n")
		busytest(qxkd.do_studywall)
		return
	elseif qxkd.noexp then		-- ���鲻���Ĵ���
		qxkd.noexp=false
		local golearn=qxkd.golearn()
		run(golearn)
		if qxkd.learncmd==nil then
			busytest(qxkd.do_fishing)
		else
			busytest(qxkd.do_learn)
		end
		return
	elseif qxkd.nopot then		-- ûǱ�ܵĴ���
		qxkd.nopot=false
		run("e;s;out;sd;move stone;hp")
		busytest(qxkd.do_fishing)
		return
	elseif qxkd.needdazuo then		-- ������
		run("e")
		gethp(qxkd.checkdazuo)
		return
	else
		run("e;s;out;sd;move stone;hp")
		busytest(qxkd.do_fishing)
		return
	end
end

qxkd.is_fishing_done=function(n,l,w)
	qxkd.fishing_ok=true		-- qxkd.do_fishing ������
end
qxkd.is_studywall_lowneili=function(n,l,w)
	qxkd.lowneili=true			-- qxkd.is_studywall_wakeup ������
end
qxkd.is_studywall_lowjing=function(n,l,w)
	qxkd.lowjing=true			-- qxkd.do_studywall ������
end
qxkd.is_studywall_noforce=function(n,l,w)
	qxkd.noforce=true			-- qxkd.do_studywall ������
end
qxkd.is_studywall_noexp=function(n,l,w)
	qxkd.noexp=true				-- qxkd.is_studywall_wakeup ������
end
qxkd.is_studywall_nopot=function(n,l,w)
	qxkd.nopot=true				-- qxkd.is_studywall_wakeup ������
end

qxkd.is_studywall_dazuoover=function(n,l,w)
	gethp(qxkd.checkdazuo)
end
qxkd.is_studywall_addneili=function(n,l,w)
	qxkd.addneili=true			-- qxkd.checkdazuo ������
end
qxkd.is_studywall_faintover=function(n,l,w)
	DoAfter(9, "yun refresh;w;sleep")
end
qxkd.is_studywall_lowjingdz=function(n,l,w)
	DoAfterSpecial(9, 'gethp(qxkd.checkdazuo)', 12)
end
qxkd.is_studywall_begod=function(n,l,w)
	run("dazuo 10")
end

qxkd.is_studywall_learnover=function(n,l,w)
	run("halt")
	if w[2]=="���µ���" then
		run("drop cloth;drop rain coat;drop rain coat;climb tree;wear rain coat;jump fall;n")
	end
	if w[2]=="���µ���" then
		run("wd;wd;n;nu;drop cloth;drop rain coat;drop rain coat;climb tree;wear rain coat;jump fall;n")
	end
	if w[2]=="��ѧʿ" then
		run("w")
	end
	qxkd.noexp=true
	run("w;cha;sleep")
end

qxkd.update=function()
	addtri("is_fishing_done","^(> |)�㿴�����е�����������վ������$","q_xkd","qxkd.is_fishing_done")
	addtri("is_studywall_lowneili","^(> |)�������������$","q_xkd","qxkd.is_studywall_lowneili")
	addtri("is_studywall_lowjing","^(> |)��ľ��񲻺ã�����Ϣһ��ɣ�$","q_xkd","qxkd.is_studywall_lowjing")
	addtri("is_studywall_noforce","^(> |)�������� enable ָ��ѡ����Ҫʹ�õ��ڹ���$","q_xkd","qxkd.is_studywall_noforce")
	addtri("is_studywall_noexp","^(> |)���ʵս���鲻����$","q_xkd","qxkd.is_studywall_noexp")
	addtri("is_studywall_nopot","^(> |)���Ǳ�ܲ�����$","q_xkd","qxkd.is_studywall_nopot")
	addtri("is_studywall_wakeup","^(> |)��һ��������ֻ���������档�ûһ���ˡ�$","q_xkd","qxkd.is_studywall_wakeup")
	addtri("is_studywall_learnover","^(> |)(���µ���|���µ���|��ѧʿ)�̵���ϣ������������򣬻��ĵص��˵�ͷ��$","q_xkd","qxkd.is_studywall_learnover")
	
	addtri("is_studywall_dazuoover","^(> |)���˹���ϣ��������˿�����վ��������$","q_xkd","qxkd.is_studywall_dazuoover")
	addtri("is_studywall_addneili","^(> |)�������������","q_xkd","qxkd.is_studywall_addneili")
	addtri("is_studywall_faintover","^(> |)������������������֪��...","q_xkd","qxkd.is_studywall_faintover")
	addtri("is_studywall_lowjingdz","^(> |)�����ھ��������޷�������Ϣ","q_xkd","qxkd.is_studywall_lowjingdz")
	addtri("is_studywall_begod","^(> |)û�дﵽ�Ǹ�����$","q_xkd","qxkd.is_studywall_begod")
end

AddAlias("alias_qxkd_start","#xkdstart","",alias_flag.Enabled + alias_flag.Replace,"qxkd.start")
AddAlias("alias_qxkd_stop","#xkdstop","",alias_flag.Enabled + alias_flag.Replace,"qxkd.allstop")

SetAliasOption("alias_qxkd_start","group","job_xkd")
SetAliasOption("alias_qxkd_stop","group","job_xkd")

--[[
#CLASS {dazuo}
#TRIGGER {^???���˹���ϣ��������˿�����վ��������} {hp} "" {color}
#TRIGGER {^???�������������} {#t- dazuo;#wa 2000;halt;#wa 2000;halt;#wa 3000;halt;h;s;e;n;ask si pu about ������;eat zhou;drop zhou;s;w;s;e;#5 drink;w;n;n;w;#t+ dazuo;sleep} "" {color}
#TRIGGER {������������������֪��...} {#wa 9000;yun refresh;w;sleep}
#TRIGGER {^???�����ھ��������޷�������Ϣ} {#wa 9000;hp} "" {color}
#TRIGGER {û�дﵽ�Ǹ�����} {dazuo 10}
#TRIGGER {^???��һ��������ֻ���������档�ûһ����} {e;hp} "" {color}
#TRIGGER {^???��Ѫ��%s(%d)/%s%d%s~(*~%~)%s������%s(%d)%s/%s(%d)} {q=%1;nl=%2;maxnl=%3;#math qq (@maxnl*2-@nl);#if @maxnl>950 {halt;quit;#di} {#if @q>20 {#if (@qq>(@q-10)) {dazuo 10} {dazuo @qq}} {#wa 9000;hp}}}
#CLASS 0

#CLASS {wenti}
#TRIGGER {^???��һ��������ֻ���������档�ûһ����} {#t- wenti;#t+ xue;#wa 1000;e;s;e;n;ask si pu about ����;enter;n;open door;enter;n;#wa 1000;study wall}
#CLASS {xue} {enable}
#TRIGGER {^???ͻȻ�����ǽ���ϵ�С���������������������������������ת��������} {study wall}
#TRIGGER {^???�㷢�ֱ��ϱʻ����йᴮ֮�⣬} {study wall}
#TRIGGER {^???����ǽ�ϵ�����ģ��㷢������������֪Ϊ�δ���������} {study wall}
#TRIGGER {^???���ʵս���鲻����} {#wa 1000;s;open door;out;s;out;s;w;n;w;save;cha;hp;sleep}
#TRIGGER {^???��ľ��񲻺ã�����Ϣһ��ɣ�} {halt;yun regenerate}
#TRIGGER {^???�������������} {#t- xue;#t+ wenti;s;open door;out;s;out;s;w;n;w;save;cha;#wa 5000;sleep}
#TRIGGER {^???���µ��ӽ̵���ϣ������������򣬻��ĵص��˵�ͷ��} {halt;drop cloth;drop rain coat;drop rain coat;climb tree;wear rain coat;jump fall;n;w;save;cha;sleep}
#TRIGGER {^???���µ��ӽ̵���ϣ������������򣬻��ĵص��˵�ͷ��} {halt;wd;wd;n;nu;drop cloth;drop rain coat;drop rain coat;climb tree;wear rain coat;jump fall;n;w;save;cha;sleep}
#TRIGGER {^???��ѧʿ�̵���ϣ������������򣬻��ĵص��˵�ͷ��} {halt;w;w;save;cha;sleep}
#TRIGGER {^???���������˼����������������ö��ˡ�} {study wall}
#TRIGGER {^???���Ǳ�ܲ�����} {halt;#wa 1000;s;open door;out;s;out;s;w;n;w;#t- xue;#t- wenti;#t+ fishing;save;hp;sleep}
#TRIGGER {^???��һ��������ֻ���������档�ûһ���ˡ�} {xuebusy=0;#if @xuexue=1 {e;e;alias xx xue shi literate 10;xx};#if @xuexue=2 {e;s;out;sd;s;eu;eu;alias xx xue huangyi force 10;xx};#if @xuexue=3 {e;s;out;sd;s;eu;eu;alias xx xue huangyi dodge 10;xx};#if @xuexue=4 {e;s;out;sd;s;eu;eu;alias xx xue huangyi parry 10;xx};#if @xuexue=5 {e;s;out;sd;s;eu;eu;alias xx xue huangyi sword 10;xx};#if @xuexue=6 {e;s;out;alias xx xue dizi strike 10;xx};#if @xuexue=7 {e;s;out;sd;#t- xue;#t+ fishing;fishing;s;n;fishing;hp}}
#TRIGGER {^???{���µ���|���µ���|��ѧʿ}������æ���ء�} {#wa 500;xx}
#TRIGGER {^???���Ǳ�ܲ�����û�а취�ٳɳ��ˡ�} {halt;#if @xuexue=1 {w;s;out;sd;#t- xue;#t+ fishing;move stone;fishing;s;n;fishing;hp} {wd;wd;n;sd;#t- xue;#t+ fishing;move stone;fishing;s;n;fishing;hp}}
#TRIGGER {^???���ʵս���黹���㣬���ܼ���ѧϰ����ܣ�} {#if @xuebusy=0 {xuebusy=1;#if @xuexue=2 {alias xx xue huangyi dodge 30;xx};#if @xuexue=3 {alias xx xue huangyi parry 30;xx};#if @xuexue=4 {alias xx xue huangyi sword 30;xx}} {xuebusy=0;#if @xuexue=2 {alias xx xue huangyi parry 30;xx};#if @xuexue=3 {alias xx xue huangyi sword 30;xx}}}
#TRIGGER {^???{���µ���|���µ���|��ѧʿ}������̫���ˣ�û�취����ʲô��} {#wa 500;xx}
#TRIGGER {^???�����ھ��񲻼ѣ��޷���������˼����} {halt;#wa 1000;xx}
#TRIGGER {^???�������ĳ̶��Ѿ�������ʦ���ˡ�} {halt;#add xuexue 1;#wa 3000;#if @xuexue=2 {w;s;out;sd;s;eu;eu;alias xx xue huangyi force 30;xx};#if @xuexue=3 {alias xx xue huangyi dodge 30;xx};#if @xuexue=4 {alias xx xue huangyi parry 30;xx};#if @xuexue=5 {alias xx xue huangyi sword 30;xx};#if @xuexue=6 {wd;wd;n;nu;alias xx xue dizi strike 30;xx};#if @xuexue=7 {sd;#t- xue;#t+ fishing;fishing;s;n;fishing;hp}}
#TRIGGER {^???��������*ָ��ѡ����Ҫʹ�õ��ڹ���} {jifa force taixuan-gong;yun regenerate}
--]]

--[[
#TRIGGER {^???�㿴�����е�����������վ������} {#wa 1000;#3 drop si yu;s;#3 give hong dianwa to da han;s;s;#3 give qili fuzi to yan bai;n;n;n;nu;drop cloth;drop rain coat;drop rain coat;climb tree;wear all;jump fall}
#TRIGGER {^???���߽��ٲ�������Ծ�˽�ȥ��} {#t- fishing;#t- wenti;s;e;#3 drink;#wa 3000;halt;w;n;e;n;ask si pu about ������;#wa 1000;get zhou;#wa 1000;eat zhou;#wa 1000;#3 drop zhou;#wa 1000;ask si pu about ����;enter;n;open door;enter;n;#t- fishing;#t+ xue;study wall}
#TRIGGER {^???�����ĵ�վ���������૵�����������������������á�} {#wa 1000;fishing}
#TRIGGER {^??? ��ˮ*���飺%s(%d)} {expexp=%1;#if %1>9700 {#t- fishing;#t- xue;#t- wenti;#t+ dazuo;set brief 1;#ti 1 {sing2};#ts 120;halt;halt;nu;drop cloth;drop rain coat;drop rain coat;climb tree;wear all;jump fall;n;w;sleep}}
#TRIGGER {^???��һ��������ֻ���������档�ûһ����} {e;s;out;sd;#t- xue;#t+ fishing;move stone;fishing;s;n;fishing;hp} "" {color}
--]]

--[[
����ͤ		����ص�

--]]