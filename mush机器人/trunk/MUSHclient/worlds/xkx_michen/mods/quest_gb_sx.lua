---------------------------------------------------------------------------
-- File name   : quest_gb_sx.lua
-- Description : gb��������
-- Author: Michen (xmichen@gmail.com)
-- Version:	2014.05.05
---------------------------------------------------------------------------
		
print("quest:XKD Loading ok!")

qgbsx={}

function qgbsx:finish()
end
function qgbsx:fail()
end

qgbsx.end_ok=function()
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	qgbsx.finish()
end
qgbsx.end_fail=function()
	unhookall()
	DiscardQueue()
	DeleteTemporaryTimers()
	qgbsx.fail()
end

function do_gbsx(sx_ok,sx_fail)
	if sx_ok~=nil then
		qgbsx.finish=function()
			sx_ok()
		end
	else qgbsx.finish=nil end
	if sx_fail~=nil then
		qgbsx.finish=function()
			sx_fail()
		end
	else qgbsx.fail=nil end
	qgbsx.start()
end

function qgbsx.start()
	qgbsx.askjob()
end

function qgbsx.askjob()
	local msg_tri={
		"³�нŶ���˵�����������ܺ�����(.+)����������͵���",
		
		"����û�� lu youjiao ����ˡ�",
		"³�н�˵�����㻹û����ҽ����Ĺ����������������ң�",
		"³�н�˵����������ûҪ������ȥ�ɣ�������������ɡ�",
		
		"��æ���أ���Ȼ�����ʻ��ɡ�",
		"�Է���æ���أ���Ȼ�����ʻ��ɡ�",
		"���Ǻ���Ȼ�ģ������ڵ�״��û�а취�����κδ𸲡�",
		"�ޣ����������������",
		"�ޣ����������",
	}

	local _ftri=linktri(msg_tri)
	run("ask lu youjiao about job")
	wait.make(function()
		local l,w=wait.regexp(_ftri,5)
		if l==nil then
			--wait.time(1)
			qgbsx.askjob()
			return
		end
		if findstring(l,msg_tri[2]) then
			tprint(w)
		end
		if findstring(l,msg_tri[2],msg_tri[3],msg_tri[4]) then
			print("����ʧ�ܣ���������ģ�顣")
			qgbsx.end_fail()
			return
		end
		if findstring(l,msg_tri[5],msg_tri[6],msg_tri[7],msg_tri[8],msg_tri[9]) then
			run("dazuo 20")
			busytest(qgbsx.askjob())
			return
		end
	end)
end
