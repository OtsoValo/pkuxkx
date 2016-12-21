---------------------------------------------------------------------------
-- File name   : quest_gumu_caimi.lua
-- Description : GUMU����һģ��
--
-- Author: Michen (xmichen@gmail.com)
-- Version:	2014.05
---------------------------------------------------------------------------

-- ��ͼλ�� 737   636

qgmcaimi={}

qgmcaimi["gotmi"]=0
qgmcaimi["yufeng_keep"]=5	-- ���ϱ������ٸ���佬

function qgmcaimi:finish()
end
function qgmcaimi:fail()
end

qgmcaimi.end_ok=function()
	trigrpoff("q_qgmcaimi")
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	qgmcaimi.finish()
end
qgmcaimi.end_fail=function()
	trigrpoff("q_qgmcaimi")
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	qgmcaimi.fail()
end

function do_gmcaimi(job_ok,job_fail)
	if job_ok~=nil then
		qgmcaimi.finish=function()
			job_ok()
		end
	else qgmcaimi.finish=nil end
	if job_fail~=nil then
		qgmcaimi.fail=function()
			job_fail()
		end
	else qgmcaimi.fail=nil end
	qgmcaimi.start()
end

-- ��ʼ����
qgmcaimi.start=function()
	quest.stop=false
	qgmcaimi.update()
	trigrpon("q_qgmcaimi")
	me.items["yufeng jiang"]=0
	run("set brief 2;score;cha;jifa;hp")
	local Ic=Item.new()
	Ic:CatchStart()
	qgmcaimi["gotmi"]=0
	busytest(qgmcaimi.main)
end

--[[
-- ��ʼ����
do_gmcaimi=function(qgmcaimi_ok,qgmcaimi_fail)
	qgmcaimi["ok"]=qgmcaimi_ok
	qgmcaimi["fail"]=qgmcaimi_fail
	call(qgmcaimi.main)
end
--]]
-- ����������
qgmcaimi.main=function()
	if quest.stop then
		qgmcaimi.end_fail()
		return
	end
	me.expcheck=1
	gethp(qgmcaimi.check)
end

-- ���Ǳ��
function qgmcaimi.checkpot()
	if (Xue_first==True and me.hp["pot"]>=(me.hp["potmax"]*4/5)) then
		trigrpoff("q_qgmcaimi")
		-- ���Ǳ�ܴﵽ���ޣ�������ѧϰ���ȣ���Ҫȥ��Ǳ����
		if Pot_use=="lw" then
			run("s;w;w;w;enter guan;turn left")
			-- ��ʼ����
		elseif Pot_use=="xue" then
			run("s;s;e")
			-- ȥѧϰ
			qlingwu.start()
		elseif Pot_use=="lit" then
			-- ѧ����д��ȥ
		end
	else
		-- ��������
		run("n")
		busytest(qgmcaimi.main)
	end
end
-- ���۹���
function qgmcaimi.check()
	if qgmcaimi["gotmi"]==0 then
		run("yun refresh;collect")
		wait.make(function()
			local l,w=wait.regexp('^(> |)ʲô��$', 1)
			if l~=nil then
				Note("�ص���ܴ����ˣ��޷����ۣ���Ҫ���¶�λ��")
				qgmcaimi.end_fail()
				return
			else
				busytest(qgmcaimi.check)
			end
		wait.time(1)
		end)
	end
	if qgmcaimi["gotmi"]==1 then
		qgmcaimi["gotmi"]=0
		me.expcheck=1
		run("s;pour bottle;hp")
		
		-- ������ϻ���û����佬��û�о���һƿ
		local Ic=Item.new()
		Ic:CatchStart()
		Ic.CatchEnd=function(pp)
			msg="GM caimi job:���ι�����þ���"..me.addexp.."�㣬Ǳ��"..me.addpot.."�㡣"
			print(msg)
			infoNote("exp", msg)
			if ((me.items["yufeng jiang"]==nil) or (me.items["yufeng jiang"]<qgmcaimi["yufeng_keep"])) then
				run("get yufeng jiang")
				run("search yufengjiang")
				run("n")
				busytest(qgmcaimi.end_ok)
			else
				run("n")
				busytest(qgmcaimi.end_ok)
			end
			-- ���û�еõ����飬����Ҫ��������
			--gethp(qgmcaimi.checkpot)
		end
	end
	if qgmcaimi["gotmi"]==2 then
		-- û���ۿ��Բ��ˣ�Ҫôʹ����佬��Ҫô������
		local Ic=Item.new()
		Ic:CatchStart()
		Ic.CatchEnd=function(pp)
			if me.items["yufeng jiang"]~=nil and me.items["yufeng jiang"]>=1 then
				--print("����")
				qgmcaimi["gotmi"]=0
				run("zhaofeng")
				busytest(qgmcaimi.check)		-- ��������
			else
				--print("������")
				-- ��������
				qgmcaimi.end_fail()
			end
		end
	end
end

function qgmcaimi.is_collect_done()
	qgmcaimi["gotmi"]=1
end
function qgmcaimi.is_collect_none()
	qgmcaimi["gotmi"]=2
end

qgmcaimi.allstop=function()
	quest.stop=true
end

----------------------------
AddAlias("alias_GMcaimi_start","#gmcaimi","",alias_flag.Enabled + alias_flag.Replace,"qgmcaimi.start")
AddAlias("alias_GMcaimi_stop","#gmcaimistop","",alias_flag.Enabled + alias_flag.Replace,"qgmcaimi.allstop")

AddAlias("alias_GMcaimi_continue","#gmcaimigoon","",alias_flag.Enabled + alias_flag.Replace,"qgmcaimi.resume")

SetAliasOption("alias_GMcaimi_start","group","job_GMcaimi");
SetAliasOption("alias_GMcaimi_stop","group","job_GMcaimi");
SetAliasOption("alias_GMcaimi_continue","group","job_GMcaimi")
----------------------------

qgmcaimi.update=function()
	addtri("is_collect_done","^(> |)��Ū�˺ܾã�����װ����һƿ���ۡ�","q_qgmcaimi","qgmcaimi.is_collect_done")
	addtri("is_collect_done1","^(> |)���Ѿ��ռ���һƿ��佬�ˣ���ŵ�����ȥ�ɡ�","q_qgmcaimi","qgmcaimi.is_collect_done")
	addtri("is_collect_none","^(> |)�䳲���ƺ��Ѿ�û�з����ˡ�","q_qgmcaimi","qgmcaimi.is_collect_none")
end

