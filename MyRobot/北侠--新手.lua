require "tprint"
require "wait"
print("---------���ֳɳ�-------------------")

luapath=string.match(GetInfo(35),"^.*\\")

include=function(str)
	dofile(luapath..str)
end
loadmod=function(str)
	include(str)
end

print("����������")
loadmod("system.lua")
loadmod("hook.lua")
loadmod("alias.lua")

----------------����Ϊϵͳ��-----------------
--path = "6s 3w n"						--ȥ�������ڹ�
--path = "e;s;s;s;s;s;s;w;w;w;n;drink;yao liang;do 5 eat liang;drop liang;s;e;e;e;n;n;n;n;n;n;w;look ʯ��;"	--����Ӳ��
--path = "s;s;s;s;s;s;w;w;w;n;drink;yao liang;do 5 eat liang;drop liang;s;e;e;e;n;n;n;n;n;n;look ʯ��;"	--�����ڹ�
--path ="w;n;drink;yao liang;do 5 eat liang;drop liang;s;e;look ʯ��;"		--ҽ��
--path ="s;s;s;s;e;e;e;n;drink;yao liang;do 5 eat liang;drop liang;s;w;w;w;n;n;n;n;look ʯ��;"	--����д��
pathFood = "s;w;u;sit chair;knock table;get wan;get yuebing;do 5 drink wan;do 5 eat yuebing;drop wan;drop yuebing;d;e;n;say �Ա�������"
pathSleep = "s;w;n;e;u;enter;say ��ʼ˯��"
pathSleepBack = "out;d;w;s;e;n;say �Ա�������"
dz = 20
--path = "n 3w n w"
quest={}
--quest.stop=false

do_watch = function()					--�����������
	if quest.stop == false then return end
	Send("hp")
	DoAfterSpecial(1,'list_hp()',12)
end

do_learn = function()					--�����������
	if quest.stop == false then return end
	Send("hp")
	DoAfterSpecial(1,'list_hp()',12)
end

list_hp = function()					--�������״̬,���ղ�ͬ��״̬����ͬ���
	--tprint(me.hp)
	ResetTimer("slook")
	if me.hp["shiwu"] < 0 then
		busytest(go_food)
		return
	elseif me.hp["yinshui"] < 0 then
		busytest(go_food)
		return
	elseif me.hp["neili"] < 30 then
		busytest(go_sleep)
		return
	else
		busytest(go_learn)
	end
end

go_watch = function()
	Send("watch ʯ�� 35")
	Send("exert regenerate")
	busytest(do_watch)
end

go_learn = function()
	Send("xue fu zi for literate 5")
	Send("exert regenerate")
	busytest(do_learn)
end

go_food = function()					--ȥ�Զ���
	local walk_path
	Note("ȥ�Զ���")
	go(pathFood)
end

go_dazuo = function()
	Note("���ڿ�ʼ����")
	Send("exert recover")
	Send("dazuo " .. dz)
end

go_sleep = function()					--ȥ˯��
	Note("ȥ˯��")
	go(pathSleep)
end

goback_sleep = function()					--ȥ˯��
	Note("˯����ɣ���ȥ")
	go(pathSleepBack)
end

test = function()					--����
	Note("����")
end


