mp_qz={}
mp_qz_pre={}
mp_qz_watch={}
mp_qz_start={}
mp_qz_boyao={}
mp_qz_boyao_ti={}

bdz={
	askqiu=0,
	askzhao=0,
	doing=0,
}
qzjob=""
yaoname=""
mpjobLimited_pre=0
--me.quit=1

function mp_qz.haveyao()
	return tonumber(have.heshouwu)+tonumber(have.shengdi)+tonumber(have.chuanbei)+tonumber(have.shengdi)+tonumber(have.jinyinhua)+tonumber(have.jugeng)+tonumber(have.huanglian)+tonumber(have.gouzhizi)+tonumber(have.fuling)
end
------------------------------------------------------------------------------------
-- mp_qz_pre
------------------------------------------------------------------------------------
function mp_qz_pre.dosomething1(n,l,w)
	local _f,_tb
	wait.make(function()
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=goboyao �ı����趨��") then
			closeclass("mp_qz_pre")
			openclass("mp_qz_boyao")
			boyaocmd=""
			alias.flytoid(763)
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=golz �ı����趨��") then
			closeclass("mp_qz_pre")
			openclass("mp_qz_start")
			alias.flytoid(723)
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=goquit �ı����趨��") then
			_tb={780,809,810,779,778,777,}
			alias.flytoid(_tb[math.random(1,6)])
		end
		if findstring(l,"�Է���æ���أ���Ȼ�����ʻ��ɡ�","��æ���أ���Ȼ�����ʻ��ɡ�") then
			alias.resetidle()
			_f=function() run("ask qiu chuji about job") end
			wait.time(1);_f()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkexpover=mp �ı����趨��") then
			alias.resetidle()
			--if add.exp>10 and mpLimited.MarkExp<me.menpaiLimited then mpLimited.MarkExp=me.menpaiLimited end
			--if add.exp<10 then
			--	if mpjobLimited_pre~=nil and mpjobLimited_pre>1 then
			--		Simulate("���Ȼ�ķ����ң��޷����о��񣬿�������������̫���ˣ�ģ�⣩\n")
			--	else
			--		mpjobLimited_pre=mpjobLimited_pre+1
			--		print("����lz����δ������δ���exp�����"..mpjobLimited_pre.."/3����")
			--	end
			--else mpjobLimited_pre=0 end
			if add.exp>10 and mpLimited.MarkExp<me.menpaiLimited then
				mpLimited.MarkExp=me.menpaiLimited
			else
				if mpjobLimited_pre~=nil and mpjobLimited_pre>1 then
					mpjobLimited_pre=0
					Simulate("���Ȼ�ķ����ң��޷����о��񣬿�������������̫���ˣ�ģ�⣩\n")
				else
					mpjobLimited_pre=mpjobLimited_pre+1
					print("����lz����δ������δ���exp�����"..mpjobLimited_pre.."/3����")
				end
			end
			alias.checkbusy("lz")
		end
		if findstring(l,"�������磬���ֵ�ͼ��780�������","�������磬���ֵ�ͼ��809�������","�������磬���ֵ�ͼ��810�������","�������磬���ֵ�ͼ��779�������","�������磬���ֵ�ͼ��778�������","�������磬���ֵ�ͼ��777�������") then
			alias.resetidle()
			openclass("quit")
		end
		if findstring(l,"����û�� qiu chuji ����ˡ�") then
			alias.resetidle()
			bdz.askqiu=0
			bdz.askzhao=0
			bdz.doing=0
			_f=function() run("ask qiu chuji about job") end
			wait.time(5);_f()
		end
		if findstring(l,"�������磬���ֵ�ͼ��"..tostring(me.menpaiJobStart).."�������") then
			alias.resetidle()
			bdz.doing=0
			if bdz.askqiu==0 then
				run("ask qiu chuji about job")
			else
				closeclass("mp_qz_pre")
				openclass("mp_qz_start")
				alias.flytoid(723)
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dealwithitems=over �ı����趨��") then
			alias.resetidle()
			alias.flytoid(me.menpaiJobStart)
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=lz �ı����趨��") then
			alias.yjl()
			alias.et()
			alias.uw()
			alias.startworkflow()
		end
		if findstring(w[0],"�����𴦻������йء�job������Ϣ��\n�𴦻�˵�����㻹��æ�Ÿɱ�����أ�","�����𴦻������йء�job������Ϣ��\n�𴦻�˵������ȥ�ú���ϰһ�½����������мܰ�","�����𴦻������йء�job������Ϣ��\n�𴦻�˵��������ûʲôҪ������ȥ������ȥ��Ϣ�ɡ�") then
			alias.resetidle()
			bdz.askqiu=0
			bdz.askzhao=0
			bdz.doing=0
			_f=function() run("ask qiu chuji about job") end
			wait.time(1);_f()
		end
	end)
end
function mp_qz_pre.dosomething2(n,l,w)
	if findstring(w[0],"�����𴦻������йء�job������Ϣ��\n�𴦻�������ü���ƺ������˵Щʲô��\n�𴦻�˵�����㻹û������񣬾�����Ҫ�µģ�") then
		alias.resetidle()
		bdz.askqiu=0
		bdz.askzhao=0
		bdz.doing=0
		if qzjob=="bdz" then alias.checkbusy("golz")
		else alias.checkbusy("goquit") end
		--elseif tonumber(me.quit)~=nil and tonumber(me.quit)>0 then alias.checkbusy("goquit")
		--elseif mp_qz.haveyao()>0 then
		--	if have.fuling>0 then run("give qiu fuling") end
		--	if have.gouzhizi>0 then run("give qiu zi") end
		--	if have.huanglian>0 then run("give qiu huanglian") end
		--	if have.jugeng>0 then run("give qiu jugeng") end
		--	if have.jinyinhua>0 then run("give qiu hua") end
		--	if have.shengdi>0 then run("give qiu shengdi") end
		--	if have.chuanbei>0 then run("give qiu chuanbei") end
		--	if have.heshouwu>0 then run("give qiu heshouwu") end
		--	run("ask qiu about job")
		--else alias.checkbusy("goboyao") end
	end
	if findstring(w[0],"�����𴦻������йء�job������Ϣ��\n�𴦻����˵�ͷ��\n�𴦻�˵�����ã���������õĲ�ҩ�������ˣ���ȥɽ��������ȥ��һЩ������") then
		alias.resetidle()
		bdz.askqiu=0
		bdz.askzhao=0
		bdz.doing=0
		--qzjob="boyao"
		--if tonumber(me.quit)~=nil and tonumber(me.quit)>0 then alias.checkbusy("goquit") else alias.checkbusy("goboyao") end
		alias.checkbusy("goquit")
	end
	if findstring(w[0],"�����𴦻������йء�job������Ϣ��\n�𴦻����˵�ͷ��\n�𴦻�˵�����ã������˵��ǿ��Ҫ��������������") then
		alias.resetidle()
		bdz.askqiu=1
		bdz.askzhao=0
		bdz.doing=0
		qzjob="bdz"
		alias.checkbusy("golz")
	end
end
------------------------------------------------------------------------------------
-- mp_qz_start
------------------------------------------------------------------------------------
function mp_qz_start.dosomething1(n,l,w)
	local _f,_tb
	wait.make(function()
		if findstring(l,"����������е�����ǿ��ѹ�ص��վ��������") then
			if havefj>0 then
				alias.uw()
				alias.startworkflow()
			else run("hp;set check=neili") end
		end
		if findstring(l,"��������Ϣ��Ӳ�����ؽ���Ϣѹ����ȥ������վ��������","��Ӳ�����ջ���ʽ����������ϰ�ˡ�") then
			if havefj>0 then
				alias.uw()
				alias.startworkflow()
			else
				alias.yjl()
				run("hp;set check=neili")
			end
		end
		if findstring(l,"��־���������һ�ݣ�ʹһ��.+���˳���������󡹡�") then
			if bdz.doing==0 and bdz.askzhao==0 then
				run("halt")
				if isopen("dazuo") then closeclass("dazuo") end
				if isopen("skills_lian") then closeclass("skills_lian") end
				if isopen("skills_jingyao") then closeclass("skills_jingyao") end
				run("ask zhao zhijing about �������")
			elseif bdz.doing>0 then
				bdz.askqiu=0
				bdz.askzhao=0
				bdz.doing=0
				closeclass("mp_qz_start")
				openclass("mp_qz_pre")
				alias.checkexp("mp")
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkhp=addneili �ı����趨��") then
			if havefj>0 and hp.neili>(hp.maxneili*set_neili_job/100) then alias.tdz() end
		end
		if findstring(l,"����û�� zhao zhijing ����ˡ�") then
			if tonumber(roomno_now)==723 then
				alias.resetidle()
				bdz.askzhao=0
				bdz.doing=0
				alias.dz(set_neili)
			end
		end
		if findstring(l,"һ��.+�������˹���,���㱨ȭ���������·�"..me.fjmasternick.."֮���������ٻ�.+����������") then
			run("halt")
			if bdz.doing>0 then run("nu") end
		end
		if findstring(l,"���������ϵ�.+��Ҫ�����������ˡ�") then
			alias.resetidle()
			if havefj>0 then
				alias.uw()
				alias.startworkflow()
			else run("yun regenerate;hp;set check=neili") end
		end
		if findstring(l,"��־������"..me.charname.."������׼����") then
			alias.resetidle()
			if isopen("dazuo") then closeclass("dazuo") end
			if isopen("skills_lian") then closeclass("skills_lian") end
			if isopen("skills_jingyao") then closeclass("skills_jingyao") end
			run("halt")
			if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
			_f=function() run("ask zhao zhijing about �������") end
			wait.time(3);_f()
		end
		if findstring(l,"��־�����������������˵�����ã�ʱ���ѵ������ڿ�ʼ��ϰ��������󡹣�") then
			alias.resetidle()
			if bdz.doing==0 and bdz.askzhao==1 then bdz.doing=1 end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ lian=over �ı����趨��") then
			alias.resetidle()
			if have.jingyao>0 and hp.pot>0 then
				-- #if @debug {#say ����Ҫ}
				openclass("skills_jingyao")
				alias.dujingyao()
			else
				-- #if @debug {#say û�о�Ҫ��û��Ǳ�ܣ����д���}
				alias.dz("addneili")
			end
		end
		if findstring(l,"��æ���أ���Ȼ�����ʻ��ɡ�") then
			alias.resetidle()
			if bdz.doing==0 then
				_f=function() run("ask zhao zhijing about �������") end
				wait.time(1);_f()
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			alias.resetidle()
			if havefj>0 then alias.startfj() else alias.lianwu() end
		end
		if findstring(l,"�������磬���ֵ�ͼ��723�������") then
			alias.resetidle()
			run("ask zhao zhijing about �������")
		end
		if findstring(l,"���������һ�ݣ�ʹһ��.+���˳���������󡹡�","��������֧��ֻ���������һ��") then
			alias.resetidle()
			bdz.askqiu=0
			bdz.askzhao=0
			bdz.doing=0
			closeclass("mp_qz_start")
			openclass("mp_qz_pre")
			alias.checkexp("mp")
		end
		if findstring(l,"�Է���æ���أ���Ȼ�����ʻ��ɡ�") then
			alias.resetidle()
			bdz.askzhao=0
			bdz.doing=0
			alias.dz(set_neili)
		end
		if findstring(l,"���Ǻ���Ȼ�ģ���־�����ڵ�״��û�а취��") then
			alias.resetidle()
			bdz.askzhao=0
			bdz.doing=0
			run("yun lifeheal zhao")
			_f=function() run("ask zhao zhijing about �������") end
			wait.time(3);_f()
		end
	end)
end
function mp_qz_start.dosomething2(n,l,w)
	if findstring(w[0],"�����ڲ�æ��\n���������� - ") then
		alias.resetidle()
		bdz.askqiu=0
		bdz.askzhao=0
		bdz.doing=0
		closeclass("mp_qz_start")
		openclass("mp_qz_pre")
		alias.checkexp("mp")
	end
	if findstring(w[0],"������־�������йء�������󡹵���Ϣ��\n��־��˵����û�������˵���ɣ�����������ϰ��������󡹣�") then
		alias.resetidle()
		bdz.askqiu=0
		bdz.askzhao=0
		bdz.doing=0
		closeclass("mp_qz_start")
		openclass("mp_qz_pre")
		alias.flytoid(me.menpaiJobStart)
	end
	if findstring(w[0],"������־�������йء�������󡹵���Ϣ��\n��־��˵������ϧ�������ѹ��ˣ�","������־�������йء�������󡹵���Ϣ��\n��־��˵����û����������æ��") then
		alias.resetidle()
		bdz.askqiu=1
		bdz.askzhao=0
		bdz.doing=0
		alias.dz(set_neili)
	end
	if findstring(w[0],"������־�������йء�������󡹵���Ϣ��\n��־��˵����û������ȫ��������") then
		alias.resetidle()
		bdz.askqiu=1
		bdz.askzhao=0
		bdz.doing=0
		run("yun lifeheal zhao")
		alias.dz(set_neili)
	end
	if findstring(w[0],"������־�������йء�������󡹵���Ϣ��\n��־��˵�����ã���������׼������һ������������ƶ��һ����ϰ��������󡹣�","������־�������йء�������󡹵���Ϣ��\n��־��˵������ʲô��ʱ��һ���ͻῪʼ��ϰ��������󡹣�") then
		alias.resetidle()
		bdz.askqiu=1
		bdz.askzhao=1
		bdz.doing=0
		alias.dz(set_neili)
	end
end
function mp_qz_start.dosomething3(n,l,w)
	if findstring(w[0],"������־�������йء�������󡹵���Ϣ��\n��־��.+\n��־��˵�����ã���������׼������һ������������ƶ��һ����ϰ��������󡹣�") then
		alias.resetidle()
		bdz.askqiu=1
		bdz.askzhao=1
		bdz.doing=0
		alias.dz(set_neili)
	end
end
function mp_qz_start.dosomething4(n,l,w)
	if findstring(w[0],"������־�������йء�������󡹵���Ϣ��\n��־��.+\n��־��.+\n��־��˵�����ã���������׼������һ������������ƶ��һ����ϰ��������󡹣�") then
		alias.resetidle()
		bdz.askqiu=1
		bdz.askzhao=1
		bdz.doing=0
		alias.dz(set_neili)
	end
end
function mp_qz_start.dosomething5(n,l,w)
	if findstring(w[0],"������־�������йء�������󡹵���Ϣ��\n��־��.+\n��־��.+\n��־��.+\n��־��˵�����ã���������׼������һ������������ƶ��һ����ϰ��������󡹣�") then
		alias.resetidle()
		bdz.askqiu=1
		bdz.askzhao=1
		bdz.doing=0
		alias.dz(set_neili)
	end
end
------------------------------------------------------------------------------------
-- mp_qz_watch
------------------------------------------------------------------------------------
function mp_qz_watch.dosomething1(n,l,w)
	if findstring(l,"λ�ϵ�����һ����һ��","λ�ϵ����������������","λ�ϵ�����������Ʈ��","λ�ϵ������н�һָ���������࣬һʽ","λ�ϵ���̤���ţ���ƫ��","λ�ϵ���ͦ������������������ƮƮ��������硣","λ�ϵ�����ǰ��ȥһ�󲽣�ʹ��","λ�ϵ�������һ������һʽ","λ�ϵ����������Ž���������̤��һ��") then
		alias.resetidle()
		run("hp")
		if havefj>0 then run("halt;nu") end
	end
	if findstring(l,"����ҩ�����������ܵĹ�ľ�Ӳݣ���ϸ�ؿ���û�в�ҩ��") then
		alias.resetidle()
	end
	if findstring(l,"���Ȼ�ķ����ң��޷����о��񣬿�������������̫����") then
		if mpLimited.mpexp<4000 and mpjobLimited_pre<1 then
			print("������ϵͳBUG��û�����ޣ���������0 EXP������ϵͳ��������޵�����ʾ")
		else
			mpJobLimited=1
			mpjobLimited_pre=0
			print("ͳ�Ƶ���lz����Ϊ��"..tostring(mpLimited.mpexp))
			if mpLimited.MarkTime<(os.time()-3600) then
				-- #if @debug {#say ��lzʱ��ȴ��Ȼbusy���Ƴ�2����}
				mpLimited.MarkTime=os.time()-3600+120
			end
		end
	end
end
------------------------------------------------------------------------------------
-- mp_qz_boyao
------------------------------------------------------------------------------------
function mp_qz_boyao.dosomething1(n,l,w)
	local _f,a,b,c
	if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ���𴦻���") then
		run("give qiu "..yaoname)
	end
	if findstring(l,"С���Ӷ���������ɱ���㣡","С���ӷ��������ͺ�ͻȻ���𹥻��㣡","С����ŭ��һ�������˹��������㣡","ͻȻ�Ӳݴ��о���һֻС���ӣ���������˾��ţ������Ƶ����㷢�������") then
		boyaocmd="kill baozi"
	end
	if findstring(l,"ͻȻ�Ӳݴ��о���һֻ�۷䣬��������˾��ţ������Ƶ����㷢�������") then
		boyaocmd="kill bee"
	end
	if findstring(l,"ͻȻ�Ӳݴ��о���һֻ÷��¹����������˾��ţ������Ƶ����㷢�������") then
		boyaocmd="kill deer"
	end
	if findstring(l,"ͻȻ�Ӳݴ��о���һֻ���ӣ���������˾��ţ������Ƶ����㷢�������") then
		boyaocmd="kill monkey"
	end
	if findstring(l,"ͻȻ�Ӳݴ��о���һֻ���ߣ���������˾��ţ������Ƶ����㷢�������") then
		boyaocmd="kill snake"
	end
	if findstring(l,"ͻȻ�Ӳݴ��о���һֻ��ѻ����������˾��ţ������Ƶ����㷢�������") then
		boyaocmd="kill wuya"
	end
	if findstring(l,"ͻȻ�Ӳݴ��о���һֻҰ�ã���������˾��ţ������Ƶ����㷢�������") then
		boyaocmd="kill ye tu"
	end
	if findstring(l,"�������磬���ֵ�ͼ��803�������","�������磬���ֵ�ͼ��800�������") then
		run("get chu from pzy")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=wa �ı����趨��") then
		alias.resetidle()
		wait.make(function()
			_f=function() alias.yjl();run("wa") end
			wait.time(2);_f()
		end)
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=wayao �ı����趨��") then
		alias.resetidle()
		if mp_qz.haveyao()>=2 then alias.flytonpc("�𴦻�") else openclass("mp_qz_boyao_ti") end
	end
	if findstring(l,"�������磬���ֵ�ͼ��763�������") then
		alias.resetidle()
		openclass("mp_qz_boyao_ti")
		boyaocmd=""
	end
	if findstring(l,"������ܵĹ�ľ�Ӳݶ������ˣ�����û����ʲô����������ûָ���ˣ�") then
		alias.resetidle()
		closeclass("mp_qz_boyao_ti")
		alias.checkbusy("move")
	end
	if findstring(l,"��û�й��ߣ��޷�������ľɽ��Ѱ�Ҳ�ҩ��") then
		alias.resetidle()
		closeclass("mp_qz_boyao_ti")
		if me.sex then alias.flytoid(803) else alias.flytoid(800) end
	end
	a,b,c=string.find(l,"����ֽ��ţ�һʧ�֣�ҩ����(.+)��Ϊ���أ����ڵ��ϲ����ˣ�")
	if c~=nil then
		alias.resetidle()
		boyaocmd=""
		closeclass("mp_qz_boyao_ti")
		if findstring(c,"������") then
			have.heshouwu=have.heshouwu-1
			yaoname="heshouwu"
		end
		if findstring(c,"����") then
			have.chuanbei=have.chuanbei-1
			yaoname="chuanbei"
		end
		if findstring(c,"����") then
			have.shengdi=have.shengdi-1
			yaoname="shengdi"
		end
		if findstring(c,"������") then
			have.jinyinhua=have.jinyinhua-1
			yaoname="hua"
		end
		if findstring(c,"�չ�") then
			have.jugeng=have.jugeng-1
			yaoname="jugeng"
		end
		if findstring(c,"����") then
			have.huanglian=have.huanglian-1
			yaoname="huanglian"
		end
		if findstring(c,"������") then
			have.gouzhizi=have.gouzhizi-1
			yaoname="zi"
		end
		if findstring(c,"����") then
			have.fuling=have.fuling-1
			yaoname="fuling"
		end
	end
	a,b,c=string.find(l,"����ҩ��С������İ�(.+)�����������")
	if c~=nil then
		alias.resetidle()
		boyaocmd=""
		closeclass("mp_qz_boyao_ti")
		if findstring(c,"������") then
			have.heshouwu=have.heshouwu+1
			yaoname="heshouwu"
		end
		if findstring(c,"����") then
			have.chuanbei=have.chuanbei+1
			yaoname="chuanbei"
		end
		if findstring(c,"����") then
			have.shengdi=have.shengdi+1
			yaoname="shengdi"
		end
		if findstring(c,"������") then
			have.jinyinhua=have.jinyinhua+1
			yaoname="hua"
		end
		if findstring(c,"�չ�") then
			have.jugeng=have.jugeng+1
			yaoname="jugeng"
		end
		if findstring(c,"����") then
			have.huanglian=have.huanglian+1
			yaoname="huanglian"
		end
		if findstring(c,"������") then
			have.gouzhizi=have.gouzhizi+1
			yaoname="zi"
		end
		if findstring(c,"����") then
			have.fuling=have.fuling+1
			yaoname="fuling"
		end
		alias.checkbusy("wayao")
	end
	if findstring(l,"����ҩ�����ϵĲ��������ܵ�ɽ�ݣ���Ȼ�����Ӳ�֮����һ���ر�Ĳݣ�") then
		alias.resetidle()
		boyaocmd=""
		closeclass("mp_qz_boyao_ti")
		alias.checkbusy("wa")
	end
	if findstring(l,"���.+�����ѳ�һ��ҩ����") then
		alias.startmp()
	end
	if findstring(l,"���Ҳ��� pzy ����������") then
		alias.close_mp()
		openclass("quit")
		-- alias.startworkflow()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=move �ı����趨��") then
		run("yun refresh;halt;s;n")
		boyaocmd=""
		wait.make(function()
			_f=function() openclass("mp_qz_boyao_ti") end
			wait.time(1);_f()
		end)
	end
	if findstring(l,"�����Ѿ��ҹ��ˣ�����Ҳ�Ҳ���ʲô�ˣ�") then
		run("yun refresh;s;n")
	end
end
function mp_qz_boyao.dosomething2(n,l,w)
	local a,b,c
	a,b,c=string.find(w[0],"�𴦻�˵����(.+)%?\n����𴦻�.+��")
	if c~=nil then
		if findstring(c,"������") then
			have.heshouwu=have.heshouwu-1
			yaoname="heshouwu"
		end
		if findstring(c,"����") then
			have.chuanbei=have.chuanbei-1
			yaoname="chuanbei"
		end
		if findstring(c,"����") then
			have.shengdi=have.shengdi-1
			yaoname="shengdi"
		end
		if findstring(c,"������") then
			have.jinyinhua=have.jinyinhua-1
			yaoname="hua"
		end
		if findstring(c,"�չ�") then
			have.jugeng=have.jugeng-1
			yaoname="jugeng"
		end
		if findstring(c,"����") then
			have.huanglian=have.huanglian-1
			yaoname="huanglian"
		end
		if findstring(c,"������") then
			have.gouzhizi=have.gouzhizi-1
			yaoname="zi"
		end
		if findstring(c,"����") then
			have.fuling=have.fuling-1
			yaoname="fuling"
		end
	end
	if findstring(w[0],"�𴦻���������������ͷ��\n�𴦻�˵����"..me.charname.."�ɵĲ�����ȥ��Ϣһ�°ɣ�") then
		alias.resetidle()
		closeclass("mp_qz_boyao")
		openclass("mp_qz_pre")
		alias.checkexp("mp")
	end
end
------------------------------------------------------------------------------------
-- mp_qz_boyao_ti
------------------------------------------------------------------------------------
function mp_qz_boyao_ti.dosomething1(n,l,w)
	local _tb
	if findstring(l,"�����.+�ȵ�����.+��") then
		if findstring(boyaocmd,"baozi") then
			_tb=utils.split(fjpfm,"|")
			boyaocmd=_tb[1]
			alias.uw()
			if string.len(mpweapon)>0 then
				if mpweapon=="staff" then alias.wi(staffid) else alias.wi(mpweapon) end
			else alias.uw() end
			run("jiali "..mpjiali..";jiajin "..mpjiajin)
		else boyaocmd="" end
	end
	if findstring(l,"���ӵ��ڵ��ϣ������˼��¾����ˡ�","�۷���ڵ��ϣ������˼��¾����ˡ�","����ҩ�����������ܵĹ�ľ�Ӳݣ���ϸ�ؿ���û�в�ҩ��","��ѻ����һ�����������У��Ե��ڵ������ˡ�","С���ӲҺ�һ�������ˣ�","Ұ����ҵĺ��˼��������ˡ�") then
		boyaocmd=""
	end
	if findstring(l,"С���ӵ͵͵غ���һ���������ڵ������˹�ȥ��") then
		boyaocmd="kill baozi"
	end
	if findstring(l,"÷��¹������˻��ƹ��һ��ˤ���ڵ��ϡ�") then
		boyaocmd="kill deer"
	end
	if findstring(l,"���ӽ���һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
		boyaocmd="kill monkey"
	end
	if findstring(l,"Ұ�ó�����˻��ƹ��һ��ˤ���ڵ��ϡ�") then
		boyaocmd="kill ye tu"
	end
end
function mp_qz_boyao_ti.timer()
	run("hp")
	if stat.havedu>0 then alias.startliaoshang()
	elseif havefj>0 then alias.startfj()
	else
		run(boyaocmd)
		run("bo")
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function mp_qz.update()
	local  mp_qz_boyao_triggerlist={
	       {name="mp_qz_boyao_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_qz_boyao.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_qz_boyao_triggerlist) do
		addtri(v.name,v.regexp,"mp_qz_boyao",v.script,v.line)
	end
	local _tb2={
		"�𴦻�˵����.+%?\\n����𴦻�.+��\\Z",
		"�𴦻���������������ͷ��\\n�𴦻�˵��(.+)\\Z",
	}
	local  mp_qz_boyao_m_triggerlist={
	       {name="mp_qz_boyao_m_dosth2",line=2,regexp=linktri2(_tb2),script=function(n,l,w)    mp_qz_boyao.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(mp_qz_boyao_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_qz_boyao",v.script,v.line)
	end
	closeclass("mp_qz_boyao")
	
	local  mp_qz_boyao_ti_triggerlist={
	       {name="mp_qz_boyao_ti_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_qz_boyao_ti.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_qz_boyao_ti_triggerlist) do
		addtri(v.name,v.regexp,"mp_qz_boyao_ti",v.script,v.line)
	end
	AddTimer("mp_qz_boyao_ti_timer", 0, 0, 2, "", timer_flag.Enabled + timer_flag.Replace, "mp_qz_boyao_ti.timer")
	SetTimerOption("mp_qz_boyao_ti_timer", "group", "mp_qz_boyao_ti")
	closeclass("mp_qz_boyao_ti")
	
	local  mp_qz_pre_triggerlist={
	       {name="mp_qz_pre_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_qz_pre.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_qz_pre_triggerlist) do
		addtri(v.name,v.regexp,"mp_qz_pre",v.script,v.line)
	end
	local _tb2={
		"�����𴦻������йء�job������Ϣ��\\n(.+)\\Z",
	}
	local _tb3={
		"�����𴦻������йء�job������Ϣ��\\n(.+)\\n(.+)\\Z",
	}
	local  mp_qz_pre_m_triggerlist={
	       {name="mp_qz_pre_m_dosth2",line=2,regexp=linktri2(_tb2),script=function(n,l,w)    mp_qz_pre.dosomething1(n,l,w)  end,},
	       {name="mp_qz_pre_m_dosth3",line=3,regexp=linktri2(_tb3),script=function(n,l,w)    mp_qz_pre.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(mp_qz_pre_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_qz_pre",v.script,v.line)
	end
	closeclass("mp_qz_pre")
	
	local  mp_qz_start_triggerlist={
	       {name="mp_qz_start_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_qz_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_qz_start_triggerlist) do
		addtri(v.name,v.regexp,"mp_qz_start",v.script,v.line)
	end
	local _tb2={
		"�����ڲ�æ��\\n(.+)\\Z",
		"������־�������йء�������󡹵���Ϣ��\\n(.+)\\Z",
	}
	local _tb3={
		"������־�������йء�������󡹵���Ϣ��\\n(.+)\\n(.+)\\Z",
	}
	local _tb4={
		"������־�������йء�������󡹵���Ϣ��\\n(.+)\\n(.+)\\n(.+)\\Z",
	}
	local _tb5={
		"������־�������йء�������󡹵���Ϣ��\\n(.+)\\n(.+)\\n(.+)\\n(.+)\\Z",
	}
	local  mp_qz_start_m_triggerlist={
	       {name="mp_qz_start_m_dosth2",line=2,regexp=linktri2(_tb2),script=function(n,l,w)    mp_qz_start.dosomething2(n,l,w)  end,},
	       {name="mp_qz_start_m_dosth3",line=3,regexp=linktri2(_tb3),script=function(n,l,w)    mp_qz_start.dosomething3(n,l,w)  end,},
	       {name="mp_qz_start_m_dosth4",line=4,regexp=linktri2(_tb4),script=function(n,l,w)    mp_qz_start.dosomething4(n,l,w)  end,},
	       {name="mp_qz_start_m_dosth5",line=5,regexp=linktri2(_tb5),script=function(n,l,w)    mp_qz_start.dosomething5(n,l,w)  end,},
	}
	for k,v in pairs(mp_qz_start_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"mp_qz_start",v.script,v.line)
	end
	closeclass("mp_qz_start")

	local  mp_qz_watch_triggerlist={
	       {name="mp_qz_watch_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    mp_qz_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(mp_qz_watch_triggerlist) do
		addtri(v.name,v.regexp,"mp_qz_watch",v.script,v.line)
	end
	local noecho_trilist={
			".*��־��.*",".*��־̹.*",".*��־��.*",".*��־ƽ.*",".*��־��.*",".*��־��.*",
			".*�����.*",".*����.*",".*���ַ���.*",".*������.*",".*ŷ����.*",".*������.*",".*ɳͨ��.*",".*������.*",
			".*���ֻ������ػ�������Ƥ��.*",
			".*���ֻ�����������.*",
			".*���һ������.*",
			".*����һ���˿�.*",
			".*�̳�һ������.*",
			".*��������.*",
			".*Ѫ���ܵ��˿�.*",
			".*Ѫ��ģ����Ѫ����.*",
			".*��������Ƥ��.*",
			".*����������.*",
			".*ϸ����Ѫ��.*",
			".*�͵�һ��.*",
			".*�������.*",
			".*������󰵺�.*",
			".*�������Խ��.*",
			".*�����������.*",
			"λ�ϵ�.+���һ����һ��","λ�ϵ�.+�������������","λ�ϵ�.+��������Ʈ��","λ�ϵ�.+���н�һָ���������࣬һʽ","λ�ϵ�.+̤���ţ���ƫ��","λ�ϵ�.+ͦ������������������ƮƮ��������硣","λ�ϵ�.+��ǰ��ȥһ�󲽣�ʹ��","λ�ϵ�.+����һ������һʽ","λ�ϵ�.+�������Ž���������̤��һ��",
			}
	local _noechotri=linktri(noecho_trilist)

	addtri("mp_qz_watch_gag_dosth1",_noechotri,"mp_qz_watch","")
	SetTriggerOption("mp_qz_watch_gag_dosth1","omit_from_output",1)
	closeclass("mp_qz_watch")
end
mp_qz.update()
