---------------------------------------------------------------------------
-- File name   : quest_qzwd.lua
-- Description : ǧ������ģ�飬�ٺ�
--
-- Author: Michen (xmichen@gmail.com)
-- Version:	2014.05
---------------------------------------------------------------------------

print("quest:QZWD Loading ok!")

--[[
ץ�� 
����
xiulian
����֮��Ĵ���
�������ﶴҪ����

��Ȫ 1350		ne 1349 ɽ��ĵ� 1427 
ʯ�ݶ� 1153 �Թ����� ɽ���(���ߵ�)1763 use fire;enter   ��(��ɽ 1953
�ɹŰ�(move qi) 1787
�����Ϣ�� 37

%if( (%eval( %eval( %stime( %time( yy-mm-dd hh:nn:ss))-@mark.sTime)/60)/60)>0, %if( (%eval( %eval( %stime( %time( yy-mm-dd hh:nn:ss))-@mark.sTime)/60)/60/24)>0, %eval( %eval( %eval( %eval( %stime( %time( yy-mm-dd hh:nn:ss))-@mark.sTime)/60)/60)/24)��%mod( %eval( %eval( %eval( %stime( %time( yy-mm-dd hh:nn:ss))-@mark.sTime)/60)/60), 24)Сʱ, %eval( %eval( %eval( %stime( %time( yy-mm-dd hh:nn:ss))-@mark.sTime)/60)/60)Сʱ)%mod( %eval( %eval( %stime( %time( yy-mm-dd hh:nn:ss))-@mark.sTime)/60), 60)����, %mod( %eval( %eval( %stime( %time( yy-mm-dd hh:nn:ss))-@mark.sTime)/60), 60)����)

yin li 1772   e;get fire
--]]
qqzwd={
	have_spider=true,
	sleep_room=37,
	xiulian_room=1350,
	spider_id=0,
}

spider_locate={
	{1324,1325,1349,1427},					--��֩��
	{1953,1153,1349,1427},					--����
	{1787,1953,1153,1349},					--��ѩ��
}

function qqzwd.start()
	qqzwd.update()
	trigrpon("q_qzwd")
	run("score;cha;jifa")
	run("get ji from shi he;drink ji;put ji in shi he")
	gethp(qqzwd.check)
end

function qqzwd.check()
	if me.hp["neili"]<(me.hp["neilimax"]*2*0.9) then
		do_dazuo(me.hp["neilimax"]*2*0.9, "neili",qqzwd.check,qqzwd.check)
		return
	end
	busytest(qqzwd.xiulian)
end

function qqzwd.xiulian()
	local msg_tri={
		"���ﲻ����ϰ��",
		
		"����æ���ء�",
		"������, (.+)����û���������",
		"�������̫�͡�",
		
		"�����Щ��֩����������ǧ�����֡�",
		"(.+)�޷�������ǧ�����֡�",
		
		"��ӻ���ȡ�����У��򿪺иǣ���˫������ʳָ������С�",
	}

	local _ftri=linktri(msg_tri)
	run("xiulian")
	wait.make(function()
		local l,w=wait.regexp(_ftri,2)
		if l==nil then
			--wait.time(1)
			qqzwd.xiulian()
			return
		end
		if findstring(l,msg_tri[1]) then
			do_walkgo(1350,qqzwd.start,qqzwd.start)
			return
		end
		if findstring(l,msg_tri[2],msg_tri[3],msg_tri[4]) then
			qqzwd.start()
			return
		end
		if findstring(l,msg_tri[5],msg_tri[6]) then
			run("get all from jin he;drop zhusi;cha")
			busytest(qqzwd.getzhizhu)
			return
		end
	end)
end

function qqzwd.getzhizhu()
	local where=0
	qqzwd.spider_id=qqzwd.spider_id+1
	
	if me.skills["qianzhu-wandu"]["lv"]<80 then
		if qqzwd.spider_id>#spider_locate[1] then qqzwd.spider_id=1;run("yun refresh") end
		where=spider_locate[1][qqzwd.spider_id]
	elseif me.skills["qianzhu-wandu"]["lv"]<150 then
		if qqzwd.spider_id>#spider_locate[2] then qqzwd.spider_id=1;run("yun refresh") end
		where=spider_locate[2][qqzwd.spider_id]
	else
		if qqzwd.spider_id>#spider_locate[3] then qqzwd.spider_id=1;run("yun refresh") end
		where=spider_locate[3][qqzwd.spider_id]
	end
	do_walkgo(where,qqzwd.do_zhua,qqzwd.getzhizhu)
end
function qqzwd.do_zhua()
	if me.skills["qianzhu-wandu"]["lv"]<80 then
		-- û�¸� 
	elseif me.skills["qianzhu-wandu"]["lv"]<150 then
		run("zhua hua zhu")
	else
		run("move qi;zhua caixue zhu")
	end
	run("zhua zhizhu")
	qqzwd.sleep_wakeup()
end

function qqzwd.xiulian_over(n,l,w)
	gethp(qqzwd.check)
end
function qqzwd.faint_wakeup(n,l,w)
	-- �����GB�����ߵ���ϰ�ĵط�˯��
	-- ������������ɣ�������ȥȪ��˯������
	run("yun refresh")
	if me.menpai=="gb" then qqzwd.sleep_room=qqzwd.xiulian_room else qqzwd.sleep_room=37 end
	do_walkgo(qqzwd.sleep_room,qqzwd.do_sleep,qqzwd.faint_wakeup)
end
function qqzwd.do_sleep()
	run("sleep")
end
function qqzwd.sleep_wakeup(n,l,w)
	do_walkgo(qqzwd.xiulian_room,qqzwd.start,qqzwd.sleep_wakeup)
end

function qqzwd.update()
	addtri("qqzwd_faint_wakeup","^(> > |> |)������һ��ѣ�θд�����������������֪��....","q_qzwd","qqzwd.faint_wakeup")
	addtri("qqzwd_xiulian_over","^(> > |> |)���˹���ϣ� ���������˿�����","q_qzwd","qqzwd.xiulian_over")
	addtri("qqzwd_sleep_wakeup","^(> > |> |)��һ��������ֻ���������档�ûһ���ˡ�","q_qzwd","qqzwd.sleep_wakeup")
end

