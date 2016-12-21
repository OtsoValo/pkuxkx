---------------------------------------------------------------------------
-- File name   : quest.mod
-- Description : ���ļ�Ϊ��һ���ű���ܡ��ļ�����������ע���ļ���
--
-- Author: ��С��littleknife (applehoo@126.com)
-- Version:	2012.01.05.1329
-- Usage: ���ڸ���quest_xxx.mod�ļ���ע���Լ��趨��
--[[
----�磺�༭��һ������ģ�飬��quest_job.mod
	----Ӧ������ע�ᣬͬʱ�趨��quest��������ã��������ļ���������
	----��ʼ�趨Ϊ����ʼ����ͣ�����ء������������ļ��ȿ�ݰ�ť��
	----cfgΪÿ����������������趨��
--]]
---------------------------------------------------------------------------
print("����ģ������Start....")
require "tprint"
--[[
----usage:
-->>qlist:use(qlist_name)
local q=qlist.new()
	q:use("hubiao")
	print(q.name)
	print(q.filename)
	print(q.startcmd)
	print(q.stopcmd)
	print(q.backcmd)
	print(q.continuecmd)

--]]
quest={}
qlist={
	new=function()
     local ql={}
	 setmetatable(ql,{__index=qlist})
	 ql.qlist_table={}
	 return ql
   end,
	qlist_table={},
}
-------------------------------------------------------------------------
-------------------------------------------------------------------------
function qlist:register()
		-----��ͬ���������Ӧ��autoperform
	local _qlist={}
	----***************************************
	_qlist={}
	_qlist.name="lingwu"
	_qlist.cnname="����"
	_qlist.filename="quest_lingwu.lua"
	_qlist.startcmd="#lingwu"
	_qlist.stopcmd="#lwstop"
	_qlist.backcmd=""
	_qlist.continuecmd="#lwgoon"
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
	_qlist={}
	_qlist.name="qgm"
	_qlist.cnname="��Ĺȫ�Զ�����"
	_qlist.filename="quest_gumu.mod"
	_qlist.startcmd=""
	_qlist.stopcmd=""
	_qlist.backcmd=""
	_qlist.continuecmd=""
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
	_qlist={}
	_qlist.name="gmlove"
	_qlist.cnname="��Ĺ������Ů����"
	_qlist.filename="quest_gumu_love.lua"
	_qlist.startcmd="#gmlove"
	_qlist.stopcmd="#gmlovestop"
	_qlist.backcmd=""
	_qlist.continuecmd="#gmlovegoon"
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
	_qlist={}
	_qlist.name="gmcaimi"
	_qlist.cnname="��Ĺ��������"
	_qlist.filename="quest_gumu_caimi.lua"
	_qlist.startcmd="#gmcaimi"
	_qlist.stopcmd="#gmcaimistop"
	_qlist.backcmd=""
	_qlist.continuecmd="#gmcaimigoon"
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
	_qlist={}
	_qlist.name="qxkd"
	_qlist.cnname="���͵�ȫ�Զ�"
	_qlist.filename="quest_xkd.lua"
	_qlist.startcmd="#xkdstart"
	_qlist.stopcmd="#xkdstop"
	_qlist.backcmd=""
	_qlist.continuecmd=""
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
	_qlist={}
	_qlist.name="qxxmp"
	_qlist.cnname="������������"
	_qlist.filename="quest_xx_job.lua"
	_qlist.startcmd="#xxmpstart"
	_qlist.stopcmd="#xxmpstop"
	_qlist.backcmd=""
	_qlist.continuecmd=""
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
	_qlist={}
	_qlist.name="qclb"
	_qlist.cnname="���ְ�����"
	_qlist.filename="quest_clb.lua"
	_qlist.startcmd="#clbstart"
	_qlist.stopcmd="#clbstop"
	_qlist.backcmd=""
	_qlist.continuecmd=""
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
	_qlist={}
	_qlist.name="qgbsx"
	_qlist.cnname="ؤ����������"
	_qlist.filename="quest_gb_sx.lua"
	_qlist.startcmd="#gbsxstart"
	_qlist.stopcmd="#gbsxstop"
	_qlist.backcmd=""
	_qlist.continuecmd=""
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
	_qlist={}
	_qlist.name="qqzwd"
	_qlist.cnname="ǧ������"
	_qlist.filename="quest_qzwd.lua"
	_qlist.startcmd=""
	_qlist.stopcmd=""
	_qlist.backcmd=""
	_qlist.continuecmd=""
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
	_qlist={}
	_qlist.name="qxxbt"
	_qlist.cnname="�������ַ���"
	_qlist.filename="quest_xx_btjob.lua"
	_qlist.startcmd=""
	_qlist.stopcmd=""
	_qlist.backcmd=""
	_qlist.continuecmd=""
	_qlist.cfg={}
	table.insert(self.qlist_table,_qlist)
	----***************************************
end

function qlist:use(qlist_name)
	self:register()
	for _,a in ipairs(self.qlist_table) do
	  if a.name==qlist_name then
		qlist.filename=a.filename
		qlist.startcmd=a.startcmd
		qlist.stopcmd=a.stopcmd
		qlist.backcmd=a.backcmd
		qlist.continuecmd=a.continuecmd
		qlist.cnname=a.cnname
		qlist.cfg=a.cfg
		break
	  end
   end
end

function qlist:fileLoad()
	self:register()

	for _,a in ipairs(self.qlist_table) do
		if a.filename~=nil then
		loadmod(a.filename)
		end
   end
   print("����ģ������Over....")
end
qlist.listjob=function()
	local q=qlist.new()
	q:register()
	print("-------------------------------")
	for _,a in ipairs(q.qlist_table) do
		for k,v in pairs(a) do
			if v=="" then a[k]="��" end
		end
		print("����ģ������[",a.cnname,"]")
		print("�����ļ�����[",a.filename,"]")
		print("Ĭ�Ͽ�ʼ���[",a.startcmd,"]")
		print("Ĭ��ֹͣ���[",a.stopcmd,"]")
		print("Ĭ�Ϸ������[",a.backcmd,"]")
		print("Ĭ�ϼ������[",a.continuecmd,"]")
		print("Ĭ�����ã�[")
		tprint(a.cfg)
		print("]")
		print("-------------------------------")
	  end
end

qlist:fileLoad()
addali("alias_questlist","#qlist","quest","qlist.listjob")







