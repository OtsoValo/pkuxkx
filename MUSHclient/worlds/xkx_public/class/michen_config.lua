require "InfoBox"

infobtn={
	win=nil,
}

function _isopen(a)
	if a~=nil and a>0 then return "����" else return "�ر�" end
end
function infobtn.accountconfig()
	local account=utils.inputbox("������������Ϸ�ʺţ�","XKX Robot By Michen",GetAlphaOption("player"))
	if account~=nil then SetAlphaOption("player",account) end
	local password=utils.inputbox("���������ĵ�½���룺","XKX Robot By Michen",GetAlphaOption("password"))
	if password~=nil then SetAlphaOption("password",password) end
	Save()
end
function infobtn.idle()
	if setting_resetidle>0 then setting_resetidle=0 else setting_resetidle=1 end
	if setting_resetidle>0 then resetidle=1 else resetidle=0 end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.idle" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("������".._isopen(setting_resetidle))
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.fj()
	if workflow.fj>0 then workflow.fj=0 else workflow.fj=1 end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.fj" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("FJģ��".._isopen(workflow.fj))
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.mp()
	if workflow.mp>0 then workflow.mp=0 else workflow.mp=1 end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.mp" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("MPģ��".._isopen(workflow.mp))
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.xf()
	if workflow.xf>0 then workflow.xf=0 else workflow.xf=1 end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.xf" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("XFģ��".._isopen(workflow.xf))
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.cm()
	if workflow.cm>0 then workflow.cm=0 else workflow.cm=1 end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.cm" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("CMģ��".._isopen(workflow.cm))
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.ftb()
	if workflow.ftb>0 then workflow.ftb=0 else workflow.ftb=1 end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.ftb" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("FTBģ��".._isopen(workflow.ftb))
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.set_neili_job()
	local neili=utils.inputbox("���������ﵽ��������İٷ�֮���ٿ�ʼ����","XKX Robot By Michen",set_neili_job)
	if neili~=nil then
		for k,v in pairs(infobtn.button) do
			if v[2]=="infobtn.set_neili_job" then
				local tw=infobtn.win.Bars[k]
				tw:Caption("��������"..tostring(set_neili_job).."%")
				infobtn.win:Update()
				break
			end
		end
		set_neili_job=neili
	end
end
function infobtn.set_neili_global()
	local neili=utils.inputbox("ȫ�������ﵽ��������İٷ�֮���ٿ�ʼ����","XKX Robot By Michen",set_neili_global)
	if neili~=nil then
		for k,v in pairs(infobtn.button) do
			if v[2]=="infobtn.set_neili_global" then
				local tw=infobtn.win.Bars[k]
				tw:Caption("ȫ������"..tostring(set_neili_global).."%")
				infobtn.win:Update()
				break
			end
		end
		set_neili_job=neili
	end
end
function infobtn.set_GbSecretWay()
	if set_GbSecretWay>0 then set_GbSecretWay=0 else set_GbSecretWay=1 end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.set_GbSecretWay" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("�깷��".._isopen(set_GbSecretWay))
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.resetstatus()
	mark.time=os.time()
	mark.sTime=os.time()
	addneili.fj=0
	addneili.dazuo=0
	addneili.dahuandan=0
	addneili.putizi=0
	list.shizhe=""
	list.putizi=""
	list.pk=""
	cmd.waitcount=0
	sum.fj=0
	sum.mp=0
	sum.ftb=0
	sum.death=0
	sum.lifesave=0
	count.fj=0
	count.mp=0
	count.ftb=0
	count.death=0
	count.lifesave=0
	resetExplist=""
	ErrList=""
	DeathList=""
end
function infobtn.skillconfig()
	local lingwuskill=utils.editbox("��������Ҫ����ļ����б�(��˳��д�룬��|�ָ����磺force|dodge|parry)��","XKX Robot By Michen",skills_lingwu)
	if lingwuskill~=nil then skills_lingwu=lingwuskill end
	local learnskill=utils.editbox("��������Ҫѧϰ�ļ����б�(��˳��д�룬��|�ָ����磺force|dodge|parry)��","XKX Robot By Michen",skills_xue)
	if learnskill~=nil then skills_xue=learnskill end
end
function infobtn.potuseC()
	if usepot=="none" then return "������"
	elseif usepot=="xue" then return "ѧϰ"
	elseif usepot=="lingwu" then return "����"
	else return "��Ҫ" end
end
function infobtn.potuse()
	if usepot=="none" then usepot="xue"
	elseif usepot=="xue" then usepot="lingwu"
	elseif usepot=="lingwu" then usepot="jingyao"
	else usepot="none" end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.potuse" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("Ǳ�ܣ�"..infobtn.potuseC())
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.xuelitC()
	if havegoldxuelit>0 then
		if xuelit>0 then return "����"
		else return "ûǮ" end
	else
		if xuelit>0 then return "ѧϰ"
		else return "��ѧ" end
	end
end
function infobtn.xuelit()
	if havegoldxuelit==1 then
		if xuelit==0 then
			havegoldxuelit=0
			xuelit=1
		else
			havegoldxuelit=1
			xuelit=0
		end
	else
		if xuelit==0 then
			havegoldxuelit=1
			xuelit=1
		else
			havegoldxuelit=0
			xuelit=0
		end
	end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.xuelit" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("����д��"..infobtn.xuelitC())
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.xuefirstC()
	if xuefirst>0 then return "����" else return "����" end
end
function infobtn.xuefirst()
	if xuefirst==0 then xuefirst=1 else xuefirst=0 end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.xuefirst" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("ѧϰ"..infobtn.xuefirstC().."����")
			infobtn.win:Update()
			break
		end
	end
end
function infobtn.lingwuatC()
	if lingwuat=="menpai" then return "����" else return "����" end
end
function infobtn.lingwuat()
	if lingwuat=="menpai" then lingwuat="shaolin" else lingwuat="menpai" end
	for k,v in pairs(infobtn.button) do
		if v[2]=="infobtn.lingwuat" then
			local tw=infobtn.win.Bars[k]
			tw:Caption("����ص�"..infobtn.lingwuatC())
			infobtn.win:Update()
			break
		end
	end
end
infobtn.button={
	{"��½����","infobtn.accountconfig","�ʺŵ�½��Ϣ�Ȼ�������",},
	{"��ʼ����","startjob","��ʼ�һ���",},
	{"�趨ͳ��ʱ��","infobtn.resetstatus","���¿�ʼͳ��",},
	{"ֹͣ���й���","alias.initialize_trigger","ֹͣ���й���",},
	{"������".._isopen(setting_resetidle),"infobtn.idle","������رշ���������",},
	{"�깷��".._isopen(set_GbSecretWay),"infobtn.set_GbSecretWay","�Ƿ��깷��",},
	{"FJģ��".._isopen(workflow.fj),"infobtn.fj","������ر�FJģ��",},
	{"MPģ��".._isopen(workflow.mp),"infobtn.mp","������ر�MPģ��",},
	{"XFģ��".._isopen(workflow.xf),"infobtn.xf","������ر�XFģ��",},
	{"CMģ��".._isopen(workflow.cm),"infobtn.cm","������ر�CMģ��",},
	{"FTBģ��".._isopen(workflow.ftb),"infobtn.ftb","������ر�FTBģ��",},
	{"��������","infobtn.skillconfig","����ѧϰ������ļ����嵥",},
	{"��������"..tostring(set_neili_job).."%","infobtn.set_neili_job","�����ﵽ���������"..tostring(set_neili_job).."%ʱ��ʼ����",},
	{"ȫ������"..tostring(set_neili_global).."%","infobtn.set_neili_global","�����ﵽ���������"..tostring(set_neili_global).."%ʱ��ʼ����",},
	{"Ǳ�ܣ�"..infobtn.potuseC(),"infobtn.potuse","����Ǳ�ܵ���;",},
	{"����д��"..infobtn.xuelitC(),"infobtn.xuelit","�����Ƿ�ѧϰ����д��",},
	{"ѧϰ"..infobtn.xuefirstC().."����","infobtn.xuefirst","�����Ƿ�ѧϰ�Ƿ�����",},
	{"����ص�"..infobtn.lingwuatC(),"infobtn.lingwuat","��������ĵص�",},
}
function infobtn.update()
	infobtn.win = infobtn.win or InfoBox:New("config")
	infobtn.win.columns=2
	infobtn.win:WindowPosition(infobtn.win.windowPositions.NE)
	infobtn.win.Bar.barStyle = InfoBox.barStyles.flat
	for k,v in pairs(infobtn.button) do
		local tw = infobtn.win.Bars[k] or infobtn.win:AddBar(v[1])
		tw.barStyle = InfoBox.barStyles.flat
		tw.button={mouseDown=v[2],tooltipText=v[3],cursor=1}
	end
	infobtn.win:Update()
end

function infobtn.close()
	infobtn.win:CloseWindow()
end
infobtn.update()
