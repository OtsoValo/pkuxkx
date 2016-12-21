---------------------------------------------------------------------------
-- File name   : quest_gumu.lua
-- Description : ��Ĺ��ȫ�Զ�������
--
-- Author: Michen (xmichen@gmail.com)
-- Version:	2014.05
---------------------------------------------------------------------------

-- ���۵ص�		2076
-- ����ص�		2065
-- LOVE�ص�		607

qgm={}
qgm.JOBD={}
qgm.JOBD.gumu_love=0
qgm.JOBD.gumu_love_limit=false
qgm.JOBD.caimi=0
qgm.JOBD.caimi_limit=false

function qgm.start()
	-- ��ʼ���ݿ��Թ�һ����ʱ����ÿ1���Ӽ��һ��
	-- �������ʱ�䵽�ˣ��趨��ǣ���LINGWUģ������
	
	AddTimer("gm_job_check",0,1,0,"", timer_flag.Enabled,"qgm.gm_job_check")
	qgm.check()
end

function qgm.gm_job_check()
	-- GM����Ҫ�����Ѿ�����10���ӣ�����ȥ����
	if (os.time()-qgm.JOBD.gumu_love)>600 then
		me.canjob=true
		return
	end
	-- ����ʱ�����ã�����������������
	if (os.time()-qgm.JOBD.caimi)>1800 then
		qgm.JOBD.caimi_limit=false
		me.canjob=true
		return
	end
end

function qgm.startlingwu()
	do_lw(qgm.lw_over,qgm.lw_over)
end

function qgm.startlove()
	--do_gmlove(qgm.job1_over,qgm.job1_fail)
end

function qgm.startcaimi()
	do_gmcaimi(qgm.job2_over,qgm.job2_fail)
end

function qgm.check()
	run("get ji from he;drink ji;put ji in he")
	-- ���Ǳ�����Ⱦ��飬��߾ͼ��һ�£����Ǳ�����ˣ�����ȥ��Ǳ��
	
	
	-- LOVE����ÿʮ������һ�Σ�����ﵽ�����ˣ�Ҫ��һ��Сʱ�ٸ�
	--if JOBD.gumu_love_limit==false and (os.time()-qgm.JOBD.gumu_love)>600 then
	-- �о�����û��Ҫ���������������ж��ģ�������ÿʮ���Ӿ���һ�ΰ�
	if (os.time()-qgm.JOBD.gumu_love)>600 then
		do_walkgo(607,qgm.startlove,qgm.startlove)
		--run("w;w;enter guan;turn left;d;ed;ed;ed;e;eu;out;n;e;se;e;s")
		--do_gmlove(qgm.job1_over,qgm.job1_fail)
		return
	end
	-- ��������ﵽ����֮�������һ�ε�����ʱ�����𣬵�һ��Сʱ����֪����������
	if qgm.JOBD.caimi_limit==false or (qgm.JOBD.caimi_limit==true and (os.time()-qgm.JOBD.caimi)>1800) then
		do_walkgo(2076,qgm.startcaimi,qgm.startcaimi)
		--run("e;n;n")
		--do_gmcaimi(qgm.job2_over,qgm.job2_fail)
		return
	end
	-- ���������ȥʹ��Ǳ�ܵĲ���
	if me.hp["pot"]>20 then
		do_walkgo(2065,qgm.startlingwu,qgm.startlingwu)
	else
		do_dazuo(1, "maxneiliadd",qgm.check,qgm.check)
	end
	--run("w;w;enter guan;turn left")
	--do_lw(qgm.lw_over,qgm.lw_over)
end

function qgm.lw_over()
	--run("u;e;e")
	if qlw.skill==nil or qlian.skill==nil then
		do_dazuo(1, "maxneiliadd",qgm.check,qgm.check)
	else
		busytest(qgm.check)
	end
	--busytest(qgm.check)
end

function qgm.job1_over()
	qgm.JOBD.gumu_love=os.time()
	if me.addexp<100 then
		qgm.JOBD.gumu_love_limit=true
	end
	--run("n;w;nw;w;s;enter;wd;w;wu;wu;wu;u;u;e;e")
	busytest(qgm.check)
end

function qgm.job1_fail()
	qgm.JOBD.gumu_love=os.time()
	--run("n;w;nw;w;s;enter;wd;w;wu;wu;wu;u;u;e;e")
	busytest(qgm.check)
end

function qgm.job2_over()
	qgm.JOBD.caimi=os.time()
	if me.addexp<10 then
		qgm.JOBD.caimi_limit=true
	end
	--run("n;n;s;s;w")
	busytest(qgm.check)
end

function qgm.job2_fail()
	qgm.JOBD.caimi=os.time()
	--run("n;n;s;s;w")
	busytest(qgm.check)
end