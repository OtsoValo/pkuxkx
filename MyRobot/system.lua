------------ȡ������hp״̬---------------------
me={}
me.hp={}
hp=function()
	me.hp={}
--	trigrpon("hp")
	Send("hp")
--	trigrpoff("hp")
end
--�鿴hp״̬

--�õ������״̬
get_hp = function(name)
	me.hp={}
	me.hp["jing"]		= tonumber(GetTriggerWildcard ("hp", "jing"));
	me.hp["max_jing"]	= tonumber(GetTriggerWildcard ("hp", "max_jing"));
	me.hp["jing_b"]		= tonumber(GetTriggerWildcard ("hp", "jing_b"));
	me.hp["jingli"]		= tonumber(GetTriggerWildcard ("hp", "jingli"));
	me.hp["max_jingli"]	= tonumber(GetTriggerWildcard ("hp", "max_jingli"));
	me.hp["jia_jing"]	= tonumber(GetTriggerWildcard ("hp", "jia_jing"));
	me.hp["qi"]			= tonumber(GetTriggerWildcard ("hp", "qi"));
	me.hp["max_qi"]		= tonumber(GetTriggerWildcard ("hp", "max_qi"));
	me.hp["qi_b"]		= tonumber(GetTriggerWildcard ("hp", "qi_b"));
	me.hp["neili"]		= tonumber(GetTriggerWildcard ("hp", "neili"));
	me.hp["max_neili"]	= tonumber(GetTriggerWildcard ("hp", "max_neili"));
	me.hp["jia_neili"]	= tonumber(GetTriggerWildcard ("hp", "jia_neili"));
	me.hp["shiwu"]		= tonumber(GetTriggerWildcard ("hp", "shiwu"));
	me.hp["max_shiwu"]	= tonumber(GetTriggerWildcard ("hp", "max_shiwu"));
	me.hp["yinshui"]	= tonumber(GetTriggerWildcard ("hp", "yinshui"));
	me.hp["max_yinshui"]= tonumber(GetTriggerWildcard ("hp", "max_yinshui"));
	me.hp["pot"]		= tonumber(GetTriggerWildcard ("hp", "pot"));
	me.hp["exp"]		= tonumber(GetTriggerWildcard ("hp", "exp"));
end

get_me = function()
	Send("hp")
	--Note(me.hp["shiwu"])
	DoAfterSpecial(1,'_test()',12)
end

------------ȡ������hp״̬--------����-------------


_test = function()
	Note(me.hp["shiwu"])
end


----------busytest���-----------------
busytestcmd = "checkbusy"

busytest=function(busyhook,t,...)
	if t==nil then t=1 end
	busytestdelay=t
	hook(hooks.isbusy,busyhook,...)
	Send(busytestcmd)
end

system_isbusy=function(name, line, wildcards)		--���busy,�涨ʱ�����������Ƿ�busy
	if hooks.isbusy~=nil then
		--DoAfterSpecial(busytestdelay,'run(\"suicide t\")',12)
		DoAfter (busytestdelay, busytestcmd)
	end
end

system_nobusy=function(name, line, wildcards)		--�����buys,�����д�����hook�е�����
	callhook(hooks.isbusy,true)
end




----------busytest���-------����----------



----------�������---------

go = function(path)
	local pp,mytime
	pp = path
	pp = convpath(pp)
--	tprint(pp)
	mytime = 1
	for i = 1,#pp do
		DoAfter (mytime, pp[i])
		mytime = mytime + 1
	end
end

convpath=function(path)			--��·���������
	local i=0
	_convpath={}
	re = rex.new("([^;]+)")	--	e = rex.new (pattern, flags)����һ��������ʽģʽ������һ��������ʽ����
	n=re:gmatch(path,function (m, t)
		i=i+1
		_convpath[i]=m
	end)
	return _convpath
end
-----------------