gps={}
gps_start={}
gps_watch={}
gps_dealwith={}
gps_99guai={}
gps_climbxy={}
gps_dl_fsg={}
gps_em_killjm={}
gps_lsd_back={}
gps_lsd_go={}
gps_nanyang={}
gps_qzh_mcx={}
gps_qzh_sl={}
gps_qzh_xmdq={}
gps_sgy_sd={}
gps_sl_gate={}
gps_sl_sl={}
gps_slh={}
gps_thd_back={}
gps_thd_go={}
gps_thd_ms={}
gps_thd_sg={}
gps_thd_thl={}
gps_thrownpc={}
gps_waitrelease={}
gps_xxmap={}
gps_xydcy={}
gps_xydcy_sl={}
gps_yz_lts={}
gps_yz_ym={}
gps_yztd_1_2={}
gps_yztd_2_1={}
gps_yztd_2_3={}
gps_yztd_3_2={}
gps_zhou={}
gps_zeikou={}

gps_cmd=""
gps_cmd_dest=nil
gps_cmd_zone=nil
gps_cmd_num=nil
GPS={
	End=true,
}
checkmove={
	NotGPSMove=true,
}
MathstepNum={
	next=0,
}
aliasStepNum={
	turnleft=1,
	enterguan=1,
	gumuenter=1,
	tsthsup=1,
	tsthsdown=1,
	askwangn=3,
	askwangsd=3,
	btssmqy=3,
	byjybykt=3,
	ccdmkz=2,
	clbdmclbdt=3,
	clbxtclbws=3,
	clbydclbss=3,
	dladfxy=2,
	dmkzcc=2,
	emhcazdemhcagc=3,
	emjld99guai=24,
	emqfa99guai=24,
	enterdong=2,
	enterpicture=1,
	fengqy=2,
	findway=2,
	gbkilljian=3,
	gbmdcenter=4,
	gbmddgc=2,
	gbmdemcp=2,
	gbmdqzhtdm=2,
	gbmdsc=2,
	gbmdslcf=2,
	gbmdtdm=2,
	gbmdtfw=3,
	gbmdxssl=2,
	gbqzlgbtdm=8,
	guohe=2,
	gyzguohe=3,
	gyzdmqy=3,
	gyzdmqy2=3,
	hsdlhssy=3,
	hshyhszl=3,
	hslwjggk=2,
	hslwchsbqf=3,
	hslwchskt=3,
	hspthsdlgf=3,
	hspthsqs=3,
	hspthsxlgf=3,
	hsptxy=2,
	hsxlhscf=3,
	hsxslhsxz=3,
	hsxypt=3,
	hylxydsm=13,
	hztyjdmqsl=3,
	kldsmhks=3,
	kljssk=3,
	klmlmsj=3,
	knockqz=3,
	leave9ld=2,
	lmbjxy=3,
	lsddytgk=4,
	lzbmcf=4,
	lzdjjfjjfdy=3,
	movegang=2,
	nantianyuhuang=3,
	nxsback=2,
	nxsjump=2,
	nycjnynm=2,
	opendoorup=2,
	opendoordown=3,
	opendooreast=3,
	opendoornorth=3,
	opendoorne=3,
	opendoornw=3,
	opendoorsouth=3,
	opendoorse=3,
	opendoorsw=2,
	opendoorwest=2,
	opengatesouth=2,
	openzhumeneast=3,
	openzhumenwest=3,
	qcqzsm=2,
	qcsdw=4,
	qldtht=3,
	qlmgdcyyc=17,
	qlqtfsd=3,
	qlxtdl=3,
	qlycmgdcy=19,
	qzcjgcjg3l=3,
	qzhmsnt=3,
	qzhntms=3,
	qzjyqc=7,
	qzlcmcx=2,
	qzlsgxm=2,
	qzqcjy=7,
	qzqcxy=7,
	qzsmqc=8,
	qzsmqzqc=2,
	qzsmxy=7,
	qztjqzyxd=3,
	qzxmlsg=2,
	qzxyclimbdown=1,
	qzxyclimbup=1,
	qzxyqc=7,
	sdwqc=4,
	sgysdsgyyd=11,
	sgyydsgymd=3,
	sgyydsgysd=4,
	slcsfzl=3,
	slgatesl=1,
	slgcslsmd=1,
	slhdaslhxa=2,
	slqfdslzl=3,
	slqypslsj=11,
	slssj=3,
	slslslsl=1,
	slsslslqyp=10,
	slzlsldmd=15,
	tgklsddy=5,
	thddms=1,
	thdhtzs=1,
	thdthlxj=1,
	thjsslx=2,
	thxzdd=7,
	tsysdxxgg1=1,
	wdhdzlwddxzl=3,
	wdhdzlwdhy=3,
	wdhdzlwdxxzl=3,
	wdxymwdsj=3,
	wdyzgwdbl=3,
	xsclxsdd=3,
	xsjgyxshy=3,
	xssmxsdgc=3,
	xxgg1tsysd=1,
	xxgg1xxgg2=1,
	xxgg2xxgg1=1,
	xxsdxxxyd=3,
	xxyptdmyptdy=3,
	xxyptdtyptms=3,
	xxysdxxh=3,
	xxysdxxxw=3,
	xyqzsm=6,
	xydcysl=2,
	xydcy1xydcy2=2,
	xydsmhyl=15,
	xydsmsczl=15,
	yellzhou=1,
	ynfslynfxj=3,
	yzhyyzwf=2,
	yzjwslyzjwxf=13,
	yzjwxfyzjwsl=14,
	yzsclknshp=3,
	yztd1yztd2=1,
	yztd2yztd1=1,
	yztd2yztd3=1,
	yztd3yztd2=1,
	yzxlyzxsq=3,
	yzymymzt=2,
	zsthdht=1,
	pressstone=2,
	tangcoffin=1,
	yunbt=0,
	yunem=0,
}

------------------------------------------------------------------------------------
-- gps_start
------------------------------------------------------------------------------------
function gps_start.dosomething1(n,l,w)
	local desc=Trim(w[3])
	if string.len(desc)==0 then xkxGPS.setDesc("none") else xkxGPS.setDesc(desc) end
end
function gps_start.dosomething2(n,l,w)
	entrance=w[1]
	xkxGPS.setEntrance(entrance)
end
function gps_start.dosomething3(n,l,w)
	roomname=w[2]
	xkxGPS.setRoomname(roomname)
	if findstring(roomname,"�¶�","����") then xkxGPS.setEntrance("none") end
end
function gps_start.dosomething4(n,l,w)
	if w[1]~=gps.EndRoomName then return end
	GPS.End=true
end
function gps_start.dosomething5(n,l,w)
	local _f,_t,_tb
	if w[2]=="checkGbSecretWay=err" then
		if gpserrnum>0 then set_GbSecretWay_err=set_GbSecretWay_err+1 else set_GbSecretWay_err=0 end
		if set_GbSecretWay_err>=3 then infobtn.set_GbSecretWay();run("score") end
		return
	end
	if w[2]=="gps=end" then
		alias.resetidle()
		if flytoid>0 then
			path=xkxGPS.search(roomno_now,flytoid)
			gps.End=false
			gps.EndRoomName=xkxGPS.EndRoomName
			gps.EndRoomEntrance=xkxGPS.EndRoomEntrance
			if path==nil or string.len(path)==0 then
				Simulate("Ŀ��ص�·��δͨ��flytoid="..tostring(flytoid).."\n")
				run("set gps=nopath")
				return
			end
			if path=="isHere" then
				print("��ʲô�ɣ�����������ô��")
				gps.End=true
				run("set walk over")
				return
			end
			xkxGPS.pathlist(path)
			pathindex=0
			_tb=utils.split(xkxGPS.pathArray2(pathindex),";")
			_t=string.gsub(_tb[table.getn(_tb)]," ","")
			MathstepNum.nextLastStepName=string.gsub(_t,"-","")
			if aliasStepNum[MathstepNum.nextLastStepName]==nil then _t=0 else _t=aliasStepNum[MathstepNum.nextLastStepName] end
			wait.make(function()
				_f=function()
							run("halt")
							alias.yjl()
							run(xkxGPS.pathArray2(pathindex))
					end
				if cmd.nums+MathstepNum.next<=40 then
					_f()
				else
					wait.time(1)
					_f()
				end
			end)
		end
		return
	end
	if w[2]=="gps=err" then
		alias.resetidle()
		print("���䶨λ��������������δ֪����")
		wait.make(function()
			_f=function()
						run("halt;go "..xkxGPS["entrance1"][math.random(1,table.getn(xkxGPS["entrance1"]))])
						alias.close_gps()
						if string.len(flytoname)>0 then alias.flytoid_name(flytoid);return end
						if string.len(flytonpc)>0 then alias.flytoid_npc(flytoid);return end
						if flytoid>0 then alias.flytoid(flytoid);return end
				end
			wait.time(1)
			_f()
		end)
		return
	end
	if w[2]=="gps=nopath" then
		alias.resetidle()
		checkmove.NotGPSMove=1
		wait.make(function()
			_f=function()
						run("halt;go "..xkxGPS["entrance1"][math.random(1,table.getn(xkxGPS["entrance1"]))])
						alias.close_gps()
						if string.len(flytoname)>0 then alias.flytoid_name(flytoid);return end
						if string.len(flytonpc)>0 then alias.flytoid_npc(flytoid);return end
						if flytoid>0 then alias.flytoid(flytoid);return end
				end
			wait.time(1)
			_f()
		end)
		return
	end
	if w[2]=="gps=start" then
		alias.resetidle()
		gpszeikou=""
		roomno_now=0
		roomno_now=xkxGPS.location()
		if roomno_now>0 then
			if roomno_now==1991 then alias.emkilljumang() else run("set gps=end") end
		else
			if buzhen then run("set gps=buzhen") else run("set gps=err") end
		end
		return
	end
	if w[2]=="gps=buzhen" then
		alias.resetidle()
		if buzhen then
			buzhen=false
			wait.make(function()
				_f=function()
							run("look;set gps=buzhen")
					end
				wait.time(10)
				_f()
			end)
		else
			run("halt")
			alias.close_gps()
			if string.len(flytoname)>0 then alias.flytoid_name(flytoid);return end
			if string.len(flytonpc)>0 then alias.flytoid_npc(flytoid);return end
			if flytoid>0 then alias.flytoid(flytoid);return end
		end
		return
	end
end
function gps_start.dosomething6(n,l,w)
	local _f,_t,_tb
	wait.make(function()
		if findstring(l,'�趨����������walk = "off"') then
			alias.close_boat()
			alias.resetidle()
			if dropweapon>0 then
				if have["jian"]>0 then for i=1,have["jian"],1 do run("drop jian") end end
				if have["dao"]>0 then for i=1,have["dao"],1 do run("drop dao") end end
				run("get ".._G[workflow.nowjob.."weapon"])
				dropweapon=0
			end
			if string.len(gpszeikou)==0 then
				if gpserrnum==0 then
					pathindex=pathindex+1
					if xkxGPS.pathListNum2>0 and pathindex<=xkxGPS.pathListNum2 then
						if xkxGPS.pathArray2(pathindex)~=nil then
							_tb=utils.split(xkxGPS.pathArray2(pathindex),";")
							_t=string.gsub(_tb[table.getn(_tb)]," ","")
						else
							_tb={}
							_t=0
						end
						MathstepNum.nextLastStepName=string.gsub(_t,"-","")
						if aliasStepNum[MathstepNum.nextLastStepName]==nil then _t=0 else _t=aliasStepNum[MathstepNum.nextLastStepName] end
						MathstepNum.next=tonumber(table.getn(_tb)+_t)
						if pathindex==(xkxGPS.pathListNum2-1) and xkxGPS.pathArray2(xkxGPS.pathListNum2)=="set walk over" and string.sub(xkxGPS.pathArray2(pathindex),-12)=="set walk off" then
							pathindex=pathindex+1
							_f=function()
										run("halt")
										_t=string.gsub(xkxGPS.pathArray2(pathindex-1),"set walk off","set walk over");
										run(_t)
								end
							if (cmd.nums+MathstepNum.next)<=40 then _f() else wait.time(1);_f() end
						else
							_f=function()
										run("halt")
										run(xkxGPS.pathArray2(pathindex))
								end
							if (cmd.nums+MathstepNum.next)<=40 then _f() else wait.time(1);_f() end
						end
					else
						_f=function()
									run("halt")
									run(xkxGPS.pathArray2(0))
							end
						wait.time(1);_f()
					end
				else
					_f=function()
								gpserrnum=0
								checkmove.NotGPSMove=1
								alias.close_gps()
								pcall(gps_cmd,gps_cmd_dest,gps_cmd_zone,gps_cmd_num)
								-- Execute(gps_cmd)
						end
					wait.time(1);_f()
				end
			else
				if me["menpai"]=="em" then
					_tb=utils.split(gpszeikou," ")
					run("kill ".._tb[3]..";halt;persuade ".._tb[3])
				else alias.fjskillskill(gpszeikou) end
			end
		end
		if findstring(l,'�趨����������walk = "over"') then
			alias.close_boat()
			alias.resetidle()
			flytosum=0
			flytoidx=0
			if dropweapon>0 then
				if have["jian"]>0 then for i=1,have["jian"],1 do run("drop jian") end end
				if have["dao"]>0 then for i=1,have["dao"],1 do run("drop dao") end end
				run("get ".._G[workflow.nowjob.."weapon"])
				dropweapon=0
			end
			if not GPS.End then
				gpserrnum=1
				checkmove.NotGPSMove=1
			end
			if string.len(flytoname)>0 then
				alias.walkover_flytoname()
			elseif string.len(flytonpc)>0 then
				alias.walkover_flytonpc()
			else alias.walkover_flytoid() end
		end
	end)
end
------------------------------------------------------------------------------------
-- gps_watch
------------------------------------------------------------------------------------
function gps_watch.dosomething1(n,l,w)
	if string.find(l,"�����������������Ҵϻ۵��ӣ�") then
		run("give wenying wuxue jingyao;drop wuxue jingyao")
		gpserrnum=tonumber(gpserrnum)+1
	end
	if string.find(l,"������һֻ����ͣ����������ʯ�ϡ�") then gpserrnum=tonumber(gpserrnum)+1 end
	if string.find(l,"����ûͷ��Ӭһ���ڶ���Ϲ�꣬���һͷײ�ڶ����ϡ�") then gpserrnum=tonumber(gpserrnum)+1 end
	if string.find(l,"ֻ����������˵���������¹��ٱְ��кι�ɣ�") then gpserrnum=tonumber(gpserrnum)+1 end
	if string.find(l,"�㱻�ݿܵ�ס��ȥ·��") or string.find(l,"�ݿ�����һ����Ц��ˬ��Ľ���������������Ȼ������Ī����") then
		gpszeikou="zeikou �ݿ� kou"
		gpserrnum=tonumber(gpserrnum)+1
		openclass("gps")
		openclass("gps_dealwith")
		openclass("gps_zeikou")
	end
	if string.find(l,"ë���ȵ������û�ţ�") then
		gpszeikou="zeikou ë�� zei"
		gpserrnum=tonumber(gpserrnum)+1
		openclass("gps")
		openclass("gps_dealwith")
		openclass("gps_zeikou")
	end
	if string.find(l,"ë���ȵ������û�ţ�") then
		gpszeikou="zeikou ë�� zei"
		gpserrnum=tonumber(gpserrnum)+1
		openclass("gps")
		openclass("gps_dealwith")
		openclass("gps_zeikou")
	end
	if string.find(l,"����ô��˽���㲻�ܴ��߳���һ�ѱ�����") then
		gpserrnum=tonumber(gpserrnum)+1
		dropweapon=1
	end
	if string.find(l,"�˵ز��ʺ�ʩչһέ�ɽ�������") then
		gpserrnum=tonumber(gpserrnum)+1
		run("set walk off")
	end
	if string.find(l,"��ʦ��������˵�������ʳ����ȥ��������������ߡ�") or string.find(l,"���̵���ָ��ָ�����ŵ�ʳ�˵�������ݽ̹棬���̵��Ӳ��ý�ʳ�������ʳ�") then
		gpserrnum=tonumber(gpserrnum)+1
		run("drop ya;drop jiuping;drop ji")
	end
	if string.find(l,"�����װͰ͵ؽе����Ŵ����㣬�콫������������") then
		gpszeikou="zeikou ���� zei"
		gpserrnum=tonumber(gpserrnum)+1
		openclass("gps")
		openclass("gps_dealwith")
		openclass("gps_zeikou")
	end
	if string.find(l,"�����˶���Ů����Ϣ֮������λ") then GPS.End=true end
	if string.find(l,"��Ķ�����û����ɣ������ƶ���") then
		if roomname~="�һ���" and not isopen("boat") then gpserrnum=tonumber(gpserrnum)+1 end
	end
	if string.find(l,"���Ҫ�����ض���һ�ɾ޴���������㵲���˶��ڣ�") then
		cm.havebuff=0
		cm.mengzhu=0
		GPS.End=true
	end
	if string.find(l,"�㻹û������ѧ��ȫ���黹") then
		gpserrnum=tonumber(gpserrnum)+1
		run("return book")
	end
	if string.find(l,"�㻹����վ�������߰ɣ�") then
		gpserrnum=tonumber(gpserrnum)+1
		run("stand")
	end
	if string.find(l,"�����һ�������˸��գ�") or string.find(l,"��һ��С�Ľ���̤�˸��գ�") then
		gpserrnum=tonumber(gpserrnum)+1
		run("yun recover")
	end
	if string.find(l,"ɽ���������Ͽ콫��������������Ȼ��ͱ�ָ�������뿪��") then
		gpszeikou="zeikou ɽ�� zei"
		gpserrnum=tonumber(gpserrnum)+1
		openclass("gps")
		openclass("gps_dealwith")
		openclass("gps_zeikou")
	end
	if string.find(l,"���ֵ������̰����������׹����������") then
		if gpserrnum<=3 then
			run("giveup")
			gpserrnum=tonumber(gpserrnum)+1
		end
	end
	if string.find(l,"ʯ���ԱߵĲݴ��к�ȻԾ��һ����Ӱ����ס���㣡") then
		gpserrnum=tonumber(gpserrnum)+1
		run("giveup")
	end
	if string.find(l,"�����ɵ��Ӷ�ݺݵ���в�����콫����������������ȡ�㹷����") then
		gpszeikou="zeikou �����ɵ��� dizi"
		gpserrnum=tonumber(gpserrnum)+1
		openclass("gps")
		openclass("gps_dealwith")
		openclass("gps_zeikou")
	end
	if string.find(l,"Ԭ����˵������������������Ϣ�����������") then
		-- û�д���
	end
	if string.find(l,"�������û�г�·��") then gpserrnum=tonumber(gpserrnum)+1 end
	if string.find(l,"�����ص���������㻹�ڣ�����һ��") then
		openclass("boat")
	end
	if string.find(l,"��Ŀǰ��û���κ�Ϊ gps=false �ı����趨��") then alias.close_gps() end
	if string.find(l,"���¾����ƺ���Ѱ���������в�ͬ��͸��ɭɭ������") then buzhen=true end
	if string.find(l,"һ��΢�紵�������澰���ƺ�����Щ�仯��") then buzhen=false end
end
function gps_watch.dosomething2(n,l,w)
	if not string.find(w[2],')') then roomname=w[2] end
end
------------------------------------------------------------------------------------
-- gps_dealwith
------------------------------------------------------------------------------------
function pfmkill()
	local _t
	_t=string.gsub(killnpcover,"-","%%-")
	if ((hp.exp<3000000 and string.find("emhcazd-emhcagc|dladf-xy|lmbj-xy|lzdjjf-jjfdy|xxyptdm-yptdy|xxyptdt-yptms|yzsclk-nshp",_t)) or (hp.exp<6000000 and string.find("gb-killjian|klmlm-sj|hspt-hsdlgf|hspt-hsxlgf|qzcjg-cjg3l|xxysd-xxh|xxysd-xxxw",_t)) or (hp.exp<10000000 and string.find("wdhdzl-wdhy|wdhdzl-wddxzl|wdhdzl-wdxxzl",_t))) then return true else return false end
end
function gps_dealwith.dosomething1(n,l,w)
	if findstring(l,"����������ڵ��ϣ������˼��¾����ˡ�","����������ڵ��ϣ������˼��¾����ˡ�","����Ϫ���ڵ��ϣ������˼��¾����ˡ�","����ү���ڵ��ϣ������˼��¾����ˡ�","��ɽ�絹�ڵ��ϣ������˼��¾����ˡ�","˾ͽ�ᵹ�ڵ��ϣ������˼��¾����ˡ�","���ڵ��ڵ��ϣ������˼��¾����ˡ�","���ĵ��ڵ��ϣ������˼��¾����ˡ�","�͵�ŵ���ڵ��ϣ������˼��¾����ˡ�","�������ڵ��ϣ������˼��¾����ˡ�","½���е��ڵ��ϣ������˼��¾����ˡ�","�������ڵ��ϣ������˼��¾����ˡ�","����橵��ڵ��ϣ������˼��¾����ˡ�","ʩ���ӵ��ڵ��ϣ������˼��¾����ˡ�","�߸������ڵ��ϣ������˼��¾����ˡ�","��ӥ���������ڵ��ϣ������˼��¾����ˡ�","��������ڵ��ϣ������˼��¾����ˡ�","˵���õ��ڵ��ϣ������˼��¾����ˡ�","�ʹ���ʿ���ڵ��ϣ������˼��¾����ˡ�","Уξ���ڵ��ϣ������˼��¾����ˡ�","һƷ����ʿ���ڵ��ϣ������˼��¾����ˡ�","�سǹٱ����������ʿ���ڵ��ϣ������˼��¾����ˡ�","��־�⵹�ڵ��ϣ������˼��¾����ˡ�","̷���˵��ڵ��ϣ������˼��¾����ˡ�","��ͨ���ڵ��ϣ������˼��¾����ˡ�","�������ڵ��ϣ������˼��¾����ˡ�","���ֱ����ڵ��ϣ������˼��¾����ˡ�","��۱����ڵ��ϣ������˼��¾����ˡ�","���ײ����ڵ��ϣ������˼��¾����ˡ�","��ľ����ڵ��ϣ������˼��¾����ˡ�","����ɮ���ڵ��ϣ������˼��¾����ˡ�","ʨ���ӵ��ڵ��ϣ������˼��¾����ˡ�","�ɻ��ӵ��ڵ��ϣ������˼��¾����ˡ�","�Ů���ڵ��ϣ������˼��¾����ˡ�","�ɹž��ٵ��ڵ��ϣ������˼��¾����ˡ�","���ϵ��ڵ��ϣ������˼��¾����ˡ�","��������.+��Ķ����ˡ�","�������.+��Ķ����ˡ�","��������������������ڱ��ϡ�","����ʤ���ڵ��ϣ������˼��¾����ˡ�") then
		if not pfmkill() then alias.KillNextNPC() end
	end
	if string.find(l,"����û������ˡ�") then
		alias.close_kill()
		if string.len(killnpcover)>0 then
			killnpcnum=99
			run(killnpcover)
			killnpcover=""
			killnpcnum=0
		end
	end
	if findstring(l,"�Ҷ����ڵ��ϣ������˼��¾����ˡ�") then
		if killnpcover=="btssm-qy" then if not pfmkill() then alias.KillNextNPC() end end
		if killnpcover=="gyzdm-qy2" then if not pfmkill() then alias.KillNextNPC() end end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkmove=yes �ı����趨��") then
		if trymovesuccess then
			alias.close_gps_dealwith()
			alias.movefinish()
		else
			if killnpcover~=nil and string.len(killnpcover)>0 then
				killnpcnum=tonumber(killnpcnum-1)
				run(killnpcover)
			end
		end
	end
	if findstring(l,"�Ҷ���ס�����ȥ·����ү���������������������") then
		trymovesuccess=false
		killnpcover="btssm-qy"
	end
	if findstring(l,"�Ҷ����˸�Ҿ��˵����������ׯ����������ׯ��������ͣ�������ذ�") then
		trymovesuccess=false
		killnpcover="gyzdm-qy2"
	end
	-- û����ͷ���
	if findstring(l,"��λŮʩ��������ذ�","��λʩ����ذ�","��ʱ������ֿ��һ��ѩ���Ľ䵶��") then
		alias.close_gps()
		alias.startworkflow()
	end
	if findstring(l,"��.+һ��","��Ŀǰ��û���κ�Ϊ .+ �ı����趨��") then
		alias.resetidle()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ killover=GPS �ı����趨��") then
		alias.KillNextNPC()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ check=dealwith �ı����趨��") then
		if not pfmkill() then
			if hp.qi<(hp.maxqi*100/hp.healthqi/2) then run("yun recover") end
			if hp.jingli<(hp.maxjingli/2) then alias.yjl() end
		end
		if string.len(gpszeikou)==0 then
			-- û��������·
			if gpserrnum>0 then
				-- ��������·��ǰ��·������Ҫ����
				wait.make(function()
					local _f=function()
								gpserrnum=0
								checkmove.NotGPSMove=1
								alias.close_gps()
								pcall(gps_cmd,gps_cmd_dest,gps_cmd_zone,gps_cmd_num)
								-- Execute(gps_cmd)
						end
					wait.time(1)
					_f()
				end)
			end
		end
	end
	if findstring(l,"ʨ����һ�Բ�����������������ǰ��","ǧ����������������Ů�����롣","�㲻�����ֵ��ӣ����ý����","��������ˡС�²��Ӵ�Ů�͡�","������������ǰ��˵���������ǹ�Ѻ������ͽ�ĵط�������ذɡ�","�ɻ��ӵ�ס���㣺�ҵ�С椿ɲ��Ǹ�����","��һ˵��: ��δ����ɣ������϶�¥��","�������������ǰ���ȵ���","�߸�����ס��˵���ɴ������˱��ɽ��أ���ֹ����","���ײ���ס��˵����׼����ʲ�ṩ�����Ƿ�үѽ��","����ү˵: �ҰѰ���������ҵĿ������ˣ�˭Ҳ�����ȥ��","����һ�Ѿ�ס�������˵�������ţ���","����ʤ������ס��˵����������æ�����ڲ�����ͣ�����ɽȥ�ɣ�","����ɮ��ס��˵�������˱����صأ���ذɣ�","����ʦ̫����ǰ˵������Ƕ��ҵ���������Ϣ�ĵط�����������","�͵�ŵǷ��˵������λ","������ס��˵���������Ǳ�����Ժ����λ","��������ȵ����粻����ɽ���㣬������أ�","½���кȵ��������ǻ�ɽ�ɵ���Ժ����λ","�ɹž���һ�ﲻ����վ������ǰ�������ȥ·��","��������������ǰ��������˲������׳��뱾���صأ�����������뿪��","��ۺȵ����㲻�����ֵ��ӣ����ý����ɽ���֣�","��ô��һ�㽭����ض�����������Ҳ��Т��һ�����ӡ�","�粻����ɽ���㣬������أ�","��ľ���ס��˵���������Ǳ��¸�ɮ����֮�أ�ʩ����ء�","ʩ������ס��˵����λʦ���治�����ͣ���ذɡ�","˵����������ס�㣬˵�������������̹���������λ","˾ͽ����������ǰ���ȵ���","��ӥ�������ȵ�����λ","��ʿ������һ�����������ǲ������ܽ�ȥ�ĵط���","��ʿ����ȵ������У������봳�뱾���صأ�","��ʿ������ȵ������У��������ڱ���ү���¾��ˣ�","Уξ��ס�����ȥ·��","����±��С�����ǧ��Ĺ�أ����","һƷ����ʿ��ס�����ȥ·��","���������˵���������Ǳ��ɳ���","����Ϫ�ȵ����������䵱�صأ�������ֹ����","��־����ס˵�����Բ������ĵ���⿪�ţ�","�Ů���ֵ�ס�����ȥ·����ׯ�����ڵ�ѵ���ߣ������������","һƷ����ʿһ�Բ����ص�����ǰ�档") then
		trymovesuccess=false
	end
end
function gps_dealwith.timer()
	if not pfmkill() then run("hp;set check=dealwith") end
end
------------------------------------------------------------------------------------
-- gps_99guai
------------------------------------------------------------------------------------
function gps_99guai.dosomething1(n,l,w)
	if findstring(l,"��Ȼһ���ȷ�Ϯ����һ�����������Դ��������£���������ˡ�") then mangsheexist=1 end
	if findstring(l,"����ȫ��Ť�������ڻ��裬��춽�ֱ�����ˡ�") then
		wait.make(function()
			local _f=function()
						alias.close_gps_dealwith()
						run(cmdonsheexist)
						alias.movefinish()
				end
			wait.time(3)
			_f()
		end)
	end
end
function gps_99guai.dosomething2(n,l,w)
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=jm �ı����趨��") then run("kill ju mang") end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ yinshe=end �ı����趨��") then
		if mangsheexist==1 then run("kill ju mang") else
			alias.close_gps_dealwith()
			run(cmdonsuccess)
			alias.movefinish()
		end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ yinshe=start �ı����趨��") then mangsheexist=0 end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ ��������ڲ��� �ı����趨��") then
		wait.make(function()
			local _f=function()
						run("set yinshe=start")
						run(yinshecmd)
						DoAfter(8,"set yinshe=end")
						--wait.make(function()
						--	local _ff=function() run("set yinshe=end") end
						--	wait.time(8)
						--	_ff()
						--end)
						--run("set yinshe=end")
				end
			wait.time(3)
			_f()
		end)
	end
end
------------------------------------------------------------------------------------
-- gps_climbxy
------------------------------------------------------------------------------------
function gps_climbxy.dosomething1(n,l,w)
	if findstring(l,"�Ǹ�����û������") then
		alias.close_gps_dealwith()
		alias.movefinish()
	end
	if findstring(l,"������������") then alias.checkbusy("climbup") end
	if findstring(l,"������������") then alias.checkbusy("climbdown") end
end
function gps_climbxy.dosomething2(n,l,w)
	if w[2]=="busyover=climbdown" then alias.yjl();run("climb down") end
	if w[2]=="busyover=climbup" then alias.yjl();run("climb up") end
end
------------------------------------------------------------------------------------
-- gps_dl_fsg
------------------------------------------------------------------------------------
function gps_dl_fsg.dosomething1(n,l,w)
	if findstring(l,"�ⲻ�ǻ��") then
		if not thrownpcfaint then
			run("get fu;w;drop fu;e")
			alias.trymove("s")
		end
	end
	if findstring(l,"�����ȵ��������˵ȣ������Ҵ���") then
		throw_npc="fu"
		trymovesuccess=false
		alias.tc(throw_npc)
	end
	if findstring(l,"��˼�����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
		thrownpcfaint=true
		wait.make(function()
			local _f=function()
						run("drop gold;drop armor;get fu;w;drop fu;e;get gold;get armor;wear armor")
						alias.trymove("s")
				end
			wait.time(2)
			_f()
		end)
	end
	if findstring(l,"��˼�鵹�ڵ��ϣ������˼��¾����ˡ�") then alias.trymove("s") end
end
function gps_dl_fsg.dosomething2(n,l,w)
	if w[2]=="checkmove=yes" then
		if trymovesuccess then
			closeclass("gps_dl_fsg")
			closeclass("gps_thrownpc")
		end
	end
end
------------------------------------------------------------------------------------
-- gps_em_killjm
------------------------------------------------------------------------------------
function gps_em_killjm.dosomething1(n,l,w)
	if findstring(l,"����ȫ��Ť�������ڻ��裬��춽�ֱ�����ˡ�") then alias.checkbusy("jmkilled") end
end
function gps_em_killjm.dosomething2(n,l,w)
	if w[2]=="busyover=jm" then run("kill ju mang") end
	if w[2]=="busyover=jmkilled" then
		alias.close_gps_dealwith()
		run("set gps=end")
	end
end
------------------------------------------------------------------------------------
-- gps_lsd_back
------------------------------------------------------------------------------------
function gps_lsd_back.dosomething1(n,l,w)
	if findstring(l,"����˵���������ڵ������ϰ��ɡ���") then
		alias.close_gps_dealwith()
		run("halt;out")
		alias.movefinish()
	end
	if findstring(l,"����˵��̾��Ư����һ�ĵ������ǸϽ��뿪�ɡ�") then run("locate") end
	if findstring(l,"������.+����ǰ����") then run("locate") end
	if findstring(l,"��������������.+Լ.+����.+Լ.+������") then run("w") end
	if findstring(l,"�������������ڡ�") then run("n") end
	if findstring(l,"������������������Լ.+������") then run("n") end
	if findstring(l,"������������������Լ.+������") then run("s") end
end
------------------------------------------------------------------------------------
-- gps_lsd_go
------------------------------------------------------------------------------------
function gps_lsd_go.dosomething1(n,l,w)
	local _f,a,b,c
	wait.make(function()
		if findstring(l,"����˵�������ߵ��������ϰ��ɡ���") then
			alias.close_gps_dealwith()
			run("halt;out")
			alias.movefinish()
		end
		if findstring(l,"����˵��̾��Ư����һ�ĵ������ǸϽ��뿪�ɡ�") then run("locate") end
		if findstring(l,"������.+����ǰ����") then run("locate") end
		if findstring(l,"������.+����ǰ����") then run("locate") end
		a,b,c=string.find(l,"�㼫ĿԶ��������(.+)�����������Ǹ���ľ�д�ĺ������������ͦ�Σ������źü�����ɽ��")
		if c~=nil then
			_f=function()
						run("stop;lookout")
				end
			if c=="��" then run("go west") end
			if c=="��" then run("go east") end
			if c=="��" then run("go south") end
			if c=="��" then run("go north") end
			if c=="����" or c=="����" then
				run("go south")
				wait.time(1);_f()
			end
			if c=="����" or c=="����" then
				run("go north")
				wait.time(1);_f()
			end
		end
	  
		if findstring(l,"�������������ڡ�") then run("s") end
		if findstring(l,"�������������ڶ�Լ(.+)������Լ(.+)����") then run("lookout") end
		a,b,c=string.find(l,"������������������Լ(.+)������")
		if c~=nil then
			if string.len(c)<6 then run("s") else if c=="��" then run("e") else run("s") end end
		end
	end)
end
------------------------------------------------------------------------------------
-- gps_nanyang
------------------------------------------------------------------------------------
function gps_nanyang.dosomething1(n,l,w)
	if findstring(l,"�ⲻ�ǻ��") then
		if not thrownpcfaint then alias.trymove("enter") end
	end
	if findstring(l,"�سǾ��ٳ����㣬�������б�������ס���ȥ·��") then
		throw_npc="bing"
		trymovesuccess=false
		alias.tc(throw_npc)
	end
	if findstring(l,"�سǹٱ�����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
		thrownpcfaint=true
		wait.make(function()
			local _f=function()
						alias.trymove("enter")
				end
			wait.time(1);_f()
		end)
	end
	if findstring(l,"�سǹٱ����ڵ��ϣ������˼��¾����ˡ�") then alias.trymove("enter") end
end
function gps_nanyang.dosomething2(n,l,w)
	if w[2]=="checkmove=yes" then
		if trymovesuccess then
			closeclass("gps_nanyang")
			closeclass("gps_thrownpc")
		end
	end
end
------------------------------------------------------------------------------------
-- gps_qzh_mcx
------------------------------------------------------------------------------------
function gps_qzh_mcx.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"�ⲻ�ǻ��") then
			if not thrownpcfaint then
				if throw_npc=="jiang" then run("get armor from jiang;drop armor;get jiang;south;drop jiang;north")
				else run("get bing;south;drop bing;north") end
				alias.trymove("ne")
			end
		end
		if findstring(l,"�ٱ���ȵ���������������˵Ȳ����ɴ˾�����") then
			throw_npc="bing"
			trymovesuccess=false
			alias.tc(throw_npc)
		end
		if findstring(l,"�佫��ȵ���������������˵Ȳ����ɴ˾�����") then
			throw_npc="jiang"
			trymovesuccess=false
			alias.tc(throw_npc)
		end
		if findstring(l,"�ٱ�����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
			thrownpcfaint=true
			_f=function()
						run("drop gold;drop armor;get bing;s;drop bing;n;get gold;get armor;wear armor")
						alias.trymove("ne")
					end
			wait.time(2);_f()
		end
		if findstring(l,"�佫����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
			thrownpcfaint=true
			_f=function()
						run("get armor from jiang;drop armor;drop gold;drop armor;get jiang;s;drop jiang;n;get gold;get armor;wear armor")
						alias.trymove("ne")
					end
			wait.time(2);_f()
		end
		if findstring(l,"�ٱ����ڵ��ϣ������˼��¾����ˡ�") then alias.trymove("ne") end
		if findstring(l,"�佫���ڵ��ϣ������˼��¾����ˡ�") then alias.trymove("ne") end
	end)
end
function gps_qzh_mcx.dosomething2(n,l,w)
	if w[2]=="checkmove=yes" then
		if trymovesuccess then
			closeclass("gps_qzh_mcx")
			closeclass("gps_thrownpc")
		end
	end
end
------------------------------------------------------------------------------------
-- gps_qzh_sl
------------------------------------------------------------------------------------
function gps_qzh_sl.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"�ⲻ�ǻ��") then
			if not thrownpcfaint then
				if throw_npc=="jiang" then run("get armor from jiang;drop armor;get jiang;w;drop jiang;e")
				else run("get bing;w;drop bing;e") end
				alias.trymove("n")
			end
		end
		if findstring(l,"�ٱ���ס�����ȥ·��") then
			throw_npc="bing"
			trymovesuccess=false
			alias.tc(throw_npc)
		end
		if findstring(l,"�佫��ס�����ȥ·��") then
			throw_npc="jiang"
			trymovesuccess=false
			alias.tc(throw_npc)
		end
		if findstring(l,"�ٱ�����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
			thrownpcfaint=true
			_f=function()
						run("drop gold;drop armor;get bing;w;drop bing;e;get gold;get armor;wear armor")
						alias.trymove("n")
					end
			wait.time(2);_f()
		end
		if findstring(l,"�佫����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
			thrownpcfaint=true
			_f=function()
						run("get armor from jiang;drop armor;drop gold;drop armor;get jiang;w;drop jiang;e;get gold;get armor;wear armor")
						alias.trymove("n")
					end
			wait.time(2);_f()
		end
		if findstring(l,"�ٱ����ڵ��ϣ������˼��¾����ˡ�") then alias.trymove("n") end
		if findstring(l,"�佫���ڵ��ϣ������˼��¾����ˡ�") then alias.trymove("n") end
	end)
end
function gps_qzh_sl.dosomething2(n,l,w)
	if w[2]=="checkmove=yes" then
		if trymovesuccess then
			closeclass("gps_qzh_sl")
			closeclass("gps_thrownpc")
		end
	end
end
------------------------------------------------------------------------------------
-- gps_qzh_xmdq
------------------------------------------------------------------------------------
function gps_qzh_xmdq.dosomething1(n,l,w)
	entrance=w[1]
	xkxGPS.setEntrance(entrance)
end
function gps_qzh_xmdq.dosomething2(n,l,w)
	local _tb,_f
	wait.make(function()
		alias.close_gps_dealwith()
		entrance=xkxGPS["entrance"]
		_tb=utils.split(entrance,"|")
		if table.getn(_tb)==4 then
			run("halt;west")
			alias.movefinish()
			return
		end
		if table.getn(_tb)==2 then
			run("halt;east")
			alias.movefinish()
			return
		end
		if workflow.nowjob=="ftb" then
			-- �����ftb�������򲻼����ȴ�
			alias.searchareanextpath()
			alias.close_gps_dealwith()
			return
		end
		_f=function()
					openclass("gps_dealwith")
					openclass("gps_qzh_xmdq")
					run("look;set checklook=yes")
			end
		wait.time(10);_f()
	end)
end
------------------------------------------------------------------------------------
-- gps_sgy_sd
------------------------------------------------------------------------------------
function gps_sgy_sd.dosomething1(n,l,w)
	if findstring(l,"���ã���ͻȻ��һ���Ʊ�") then gps_checkmianbi=true end
	if findstring(l,"ֻ�������ʯͷϡ�ﻩ��̮����������ס����ڡ�") then alias.close_gps_dealwith();alias.movefinish() end
end
function gps_sgy_sd.dosomething2(n,l,w)
	local _f
	wait.make(function()
		if not gps_checkmianbi then
			_f=function()
						for i=1,10,1 do run("mianbi") end
						run("set checkmianbi=yes")
				end
			wait.time(2);_f()
		else
			alias.wi("jian")
			run("strike wall;enter")
		end
	end)
end
------------------------------------------------------------------------------------
-- gps_sl_gate
------------------------------------------------------------------------------------
function gps_sl_gate.dosomething1(n,l,w)
	if findstring(l,"��������ǰ��������ô��Ҳû�á�") then
		wait.make(function()
			local _f=function() run("knock gate") end
			wait.time(5);_f()
		end)
	end
	if findstring(l,"�����Ѿ��ǿ����ˡ�","֨��һ�����������˰Ѵ��Ŵ���","��������������ţ�ֻ��֨��һ����һλ׳��ɮ��Ӧ���򿪴���") then
		--run("n")
		--alias.close_gps_dealwith()
		--alias.movefinish()
		alias.trymove("n")
	end
end
------------------------------------------------------------------------------------
-- gps_sl_sl
------------------------------------------------------------------------------------
function gps_sl_sl.dosomething1(n,l,w)
	alias.close_gps_dealwith()
	run("halt")
	if w[1]=="southdown" then run(w[2]) else run(w[1]) end
	alias.movefinish()
end
------------------------------------------------------------------------------------
-- gps_slh
------------------------------------------------------------------------------------
function gps_slh.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"ľ���ֱ��嵽������ȥ�ˡ�") then if not gps_slh_shangan then run("rowing") end end
		if findstring(l,"��������еļһ�����Ͽ���һЩ��֦��") then
			gps_slh_shuzhi=false
			_f=function() if not gps_slh_shuzhi then run("chop shuzhi") end end
			wait.time(3);_f()
		end
		if findstring(l,"�㻮�˰��죬ľ����춿����ˡ�") then alias.checkbusy("up") end
		if findstring(l,"�㿳�µ���֦�ƺ��㹻��") then
			gps_slh_shuzhi=true
			_f=function() run("make raft") end
			wait.time(3);_f()
		end
		if findstring(l,"���ÿ��µ���֦����һ��ľ����") then
			gps_slh_shuzhi=true
			_f=function()
						gps_slh_shangan=false
						run("ride raft;rowing")
				end
			wait.time(1);_f()
		end
		if findstring(l,"���պ�����") then
			gps_slh_shangan=true
			alias.close_gps_dealwith()
			alias.movefinish()
		end
	end)
end
function gps_slh.dosomething2(n,l,w)
	alias.uw()
	run("up")
end
------------------------------------------------------------------------------------
-- gps_thd_back
------------------------------------------------------------------------------------
function gps_thd_back.dosomething1(n,l,w)
	local _f,a,b,c,d
	wait.make(function()
		a,b,c,d=string.find(l,"%s+�������Եĳ�����%s+(%w+)%s+��%s+(%w+)��")
		if c~=nil and d~=nil then
			if c=="north" then run(d) else run(c) end
			run("start")
		end
		if findstring(l,"һ���洬Ӧ������ʻ�˹��������һ��̤�Ű����ɳ̲�ϡ�","����ˣ���ô���۾�û��������") then run("look") end
		if findstring(l,"����˵������ɽ�������ϰ��ɡ���") then
			alias.close_gps_dealwith()
			_f=function() run("halt;out");alias.movefinish() end
			wait.time(1);_f()
		end
		if findstring(l,"����һ���������������Ǵ������˰���") then
			run("n")
			_f=function() run("locate") end
			wait.time(2);_f()
		end
		if findstring(l,"����������ɽ��") then run("n") end
		a,b,c,d=string.find(l,"����������ɽ��Լ(.+)������Լ(.+)������")
		if c~=nil and d~=nil then
			--print("�� "..ctonum(c).." �� "..ctonum(d))
			run("s")
			_f=function() run("locate") end
			wait.time(1);_f()
		end
		a,b,c,d=string.find(l,"����������ɽ��Լ(.+)������Լ(.+)������")
		if c~=nil and d~=nil then
			--print("�� "..ctonum(c).." �� "..ctonum(d))
			if tonumber(ctonum(d))<3 then run("w") else run("n") end
			_f=function() run("locate") end
			wait.time(1);_f()
		end
		a,b,c=string.find(l,"����������ɽ��(.+)Լ.+������")
		if c~=nil then
			if c=="��" then run("s") end
			if c=="��" then run("n") end
			if c=="��" then run("s") end
			_f=function() run("locate") end
			wait.time(1);_f()
		end
	end)
end
------------------------------------------------------------------------------------
-- gps_thd_go
------------------------------------------------------------------------------------
function gps_thd_go.dosomething1(n,l,w)		
	local _f,a,b,c,d
	wait.make(function()
		a,b,c,d=string.find(l,"%s+�������Եĳ�����%s+(%w+)%s+��%s+(%w+)��")
		if c~=nil and d~=nil then
			if c=="west" then run(d) else run(c) end
			run("start")
		end
		if findstring(l,"һ���洬Ӧ������ʻ�˹��������һ��̤�Ű����ɳ̲�ϡ�","����ˣ���ô���۾�û��������") then run("look") end
		if findstring(l,"����˵�����һ����������ϰ��ɡ���") then
			alias.close_gps_dealwith()
			_f=function() run("halt;out");alias.movefinish() end
			wait.time(1);_f()
		end
		if findstring(l,"����һ���������������Ǵ������˰���") then
			run("e")
			_f=function() run("locate") end
			wait.time(2);_f()
		end
		a,b,c=string.find(l,"�㼫ĿԶ��������(.+)������һ�ɼ����˱ǻ���ĺ��紵����")
		if c~=nil then
			if string.find(c,"��") then
				run("e")
			else
				if string.find(c,"��") then
					run("w")
				else
					if c=="��" then
						run("n")
					else
						run("s")
					end
				end
			end
			_f=function() run("lookout") end
			wait.time(1);_f()
		end
		if findstring(l,"����������ɽ��") then
			_f=function() run("locate") end
			wait.time(1);_f()
		end
		a,b,c,d=string.find(l,"����������ɽ��Լ(.+)������Լ(.+)������")
		if c~=nil and d~=nil then
			if tonumber(ctonum(c))<19 then
				run("e")
			else
				if tonumber(ctonum(c))>21 then run("w") else run("s") end
			end
			_f=function() run("locate") end
			wait.time(1);_f()
		end
		a,b,c,d=string.find(l,"����������ɽ��Լ(.+)������Լ(.+)������")
		if c~=nil and d~=nil then
			if (math.abs(tonumber(ctonum(c))-20) + math.abs(tonumber(ctonum(d))-10))<4 then run("lookout")
			else
				if tonumber(ctonum(c))<19 then run("e")
				else
					if tonumber(ctonum(c))>21 then run("w")
					else
						if tonumber(ctonum(d))<10 then run("s") else run("n") end
					end
				end
				_f=function() run("locate") end
				wait.time(1);_f()
			end
		end
		a,b,c=string.find(l,"����������ɽ����Լ(.+)������")
		if c~=nil then
			if tonumber(ctonum(c))<19 then run("e")
			else
				if tonumber(ctonum(c))>21 then run("w") else run("s") end
			end
			_f=function() run("locate") end
			wait.time(1);_f()
		end
		if findstring(l,"��⵰��һ�ߴ���ȥ��") then
			print("����ô����Ǯ����")
			alias.close_gps_dealwith()
			alias.checkitems()
		end
	end)
end
------------------------------------------------------------------------------------
-- gps_thd_ms
------------------------------------------------------------------------------------
function gps_thd_ms.dosomething1(n,l,w)
	local gps_thad_guaname={"ǫ","Ǭ","��","��","��","��","��","ʦ","��","С��","��","̩","��","ͬ��","����",}
	local a,b,c,d=string.find(l,"�����ﲻ֪������������֮ʣ(.+)��������֮ʣ(.+)��������֮ʣ.+�����Ｘ�Σ�")
	if c~=nil and d~=nil then
		c=tonumber(ctonum(c))
		d=tonumber(ctonum(d))
		gps_thmsnum=tonumber(math.mod(d+3-c,3)*5+d)
		run("press "..gps_thad_guaname[gps_thmsnum+1])
	end
	if findstring(l,"ֻ���á�¡¡���������죬ʯ�Ż�����һ�໮��") then alias.checkbusy("ms") end
	if findstring(l,"��������ȻƮ��һ�������ᣬ") then run("look scroll") end
end
function gps_thd_ms.dosomething2(n,l,w)
	alias.close_gps_dealwith()
	run("enter")
	alias.movefinish()
end
------------------------------------------------------------------------------------
-- gps_thd_sg
------------------------------------------------------------------------------------
function gps_thd_sg.dosomething1(n,l,w)
	trymovesuccess=false
	run("fight sha gu;agree")
	wait.make(function()
		local _f=function() alias.trymove("enter") end
		wait.time(2);_f()
	end)
end
function gps_thd_sg.dosomething2(n,l,w)
	if trymovesuccess==true then alias.close_gps_dealwith() end
end
------------------------------------------------------------------------------------
-- gps_thd_thl
------------------------------------------------------------------------------------
function gps_thd_thl.dosomething1(n,l,w)
	local _f,a,b,c,entrance
	if findstring(l,"С�� -") then trymovesuccess=true end
	wait.make(function()
		a,b,c=string.find(l,"������̶ʱ����.+��.+��.+��(.+)ʱ.+��")
		if c~=nil then
			if c=="��" then entrance="east" end
			if c=="��" then entrance="southeast" end
			if c=="��" then entrance="southeast" end
			if c=="î" then entrance="southwest" end
			if c=="��" then entrance="northeast" end
			if c=="��" then entrance="northeast" end
			if c=="��" then entrance="west" end
			if c=="δ" then entrance="south" end
			if c=="��" then entrance="south" end
			if c=="��" then entrance="northwest" end
			if c=="��" then entrance="north" end
			if c=="��" then entrance="north" end
			run(entrance)
			_f=function() if trymovesuccess then alias.checkbusy("thl") else run("time") end end
			wait.time(1);_f()
		end
	end)
end
function gps_thd_thl.dosomething2(n,l,w)
	alias.close_gps_dealwith()
	alias.movefinish()
end
------------------------------------------------------------------------------------
-- gps_thrownpc
------------------------------------------------------------------------------------
function gps_thrownpc.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"����һ�ݣ�˵�����ã�����ܽ�ڴ���Ȱ�������˼ҵ������ϣ���ξ����ˡ�","��ʤ�����У����Ծ�����ߣ�Ц�������ã�","��˫��һ����Ц��˵�������ã�","�������Ц��˵���������ˣ�","���һ�ݣ�������Ҿ˵�����������ղ�������Ȼ������","������˼�����˵�����ⳡ�����������ˣ�����������","��ɫ΢�䣬˵��������������") then
			_f=function() alias.tc(throw_npc) end
			wait.time(1);_f()
		end
	end)
end
------------------------------------------------------------------------------------
-- gps_waitrelease
------------------------------------------------------------------------------------
function gps_waitrelease.dosomething1(n,l,w)
	if findstring(l,"�����˵���������Ĵ�����С��û����������") then
		alias.close_gps_dealwith()
		alias.movefinish()
	end
	if findstring(l,"���Ż����ؿ����ˣ�����") then
		run("up;id here;emote ����˵���������Ĵ�����С��û����������")
	end
end
function gps_waitrelease.timer()
	if math.random(3)==1 then run("chat ʧ�ܰ������ص����ˣ���������˴�ȡ���mush����") end
	if math.random(3)==2 then run("chat SOS~~~~�װ����ֵܽ����ǣ�����������˫�֣�����Ҵӵ��γ����ɡ���mush����") end
	if math.random(3)==3 then run("chat ����������������������������һ�������˰��Ҵӵ������ȳ����ɡ���mush����") end
end
------------------------------------------------------------------------------------
-- gps_xxmap
------------------------------------------------------------------------------------
function gps_xxmap.dosomething1(n,l,w)
	local a,b,c,d
	a,b,c=string.find(l,"����Ψһ�ĳ����� (.+)��")
	if c~=nil then
		checkmove.notgpsmove=1
		gps_xxgangou=c
		run(gps_xxgangou)
		alias.movefinish()
	end
	a,b,c,d=string.find(l,"�������Եĳ����� (%w+) �� (%w+)��")
	if c~=nil and d~=nil then
		checkmove.notgpsmove=1
		if gps_xxgg_dict==1433 and c=="eastdown" then
			gps_xxgangou=d
			run(gps_xxgangou)
			alias.movefinish()
			gps_xxgg_dict=0
			alias.close_gps_dealwith()
		end
		if gps_xxgg_dict==1433 and d=="eastdown" then
			gps_xxgangou=c
			run(gps_xxgangou)
			alias.movefinish()
			gps_xxgg_dict=0
			alias.close_gps_dealwith()
		end
		if gps_xxgg_dict==1432 then
			if c=="eastdown" then
				gps_xxgangou=d
				run(gps_xxgangou..";look")
			else
				if gps_xxgangou==d then run("go "..gps_xxgangou)
				else
					gps_xxgangou=c
					run("go "..gps_xxgangou)
				end
				run("look")
			end
		end
		if gps_xxgg_dict==1434 then
			if c=="eastdown" then
				alias.movefinish()
				gps_xxgg_dict=0
				alias.close_gps_dealwith()
			else
				if d=="eastdown" then
					alias.movefinish()
					gps_xxgg_dict=0
					alias.close_gps_dealwith()
				else
					if d==gps_xxgangou then run("go "..gps_xxgangou)
					else
						gps_xxgangou=c
						run("go "..gps_xxgangou)
					end
					run("look")
				end
			end
		end
	end
	
	a,b,c,d=string.find(l,"�������Եĳ����� northup��(%w+) �� (.+)��")
	if c==nil or d==nil then
		a,b,c,d=string.find(l,"�������Եĳ����� (%w+)��northup �� (.+)��")
		if c==nil or d==nil then
			a,b,c,d=string.find(l,"�������Եĳ����� (%w+)��(%w+) ��%s+northup��")
			if c==nil or d==nil then return end
		end
	end
	checkmove.notgpsmove=1
	if gps_xxgg_dict==1432 then
		alias.movefinish()
		gps_xxgg_dict=0
		alias.close_gps_dealwith()
	end
	if gps_xxgg_dict==1433 or gps_xxgg_dict==1434 then
		if c=="westup" then
			gps_xxgangou=d
			run(gps_xxgangou)
		else
			gps_xxgangou=c
			run(gps_xxgangou)
		end
		if gps_xxgg_dict==1433 then
			alias.movefinish()
			gps_xxgg_dict=0
			alias.close_gps_dealwith()
		else run("look") end
	end
end
------------------------------------------------------------------------------------
-- gps_xydcy
------------------------------------------------------------------------------------
function gps_xydcy.dosomething1(n,l,w)
	xkxGPS.setEntrance(w[2])
	entrance=xkxGPS.entrance
	if table.getn(xkxGPS["entrance1"])==5 then gps_xydcy_reachdest=1 end
end
function gps_xydcy.dosomething2(n,l,w)
	if gps_xydcy_reachdest==0 then run("east;set checkxydcy=yes")
	else
		alias.close_gps_dealwith()
		alias.movefinish()
	end
end
------------------------------------------------------------------------------------
-- gps_xydcy_sl
------------------------------------------------------------------------------------
function gps_xydcy_sl.dosomething1(n,l,w)
	gps_xydcy_reachdest=1
end
function gps_xydcy_sl.dosomething2(n,l,w)
	if gps_xydcy_reachdest==0 then run("north;set checkxydcy=yes")
	else
		alias.close_gps_dealwith()
		alias.movefinish()
	end
end
------------------------------------------------------------------------------------
-- gps_yz_lts
------------------------------------------------------------------------------------
function gps_yz_lts.dosomething1(n,l,w)
	if findstring(l,"�ⲻ�ǻ��") then
		if not thrownpcfaint then
			run("get ling;s;drop ling;n")
			alias.trymove("w")
		end
	end
	if findstring(l,"�躲�ֵ�ס���㣺��������լ��") then
		throw_npc="ling"
		trymovesuccess=false
		alias.tc(throw_npc)
	end
	if findstring(l,"����˼����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
		thrownpcfaint=true
		wait.make(function()
			local _f=function()
						run("drop gold;drop armor;get ling;s;drop ling;n;get gold;get armor;wear armor")
						alias.trymove("w")
				end
			wait.time(2)
			_f()
		end)
	end
	if findstring(l,"����˼���ڵ��ϣ������˼��¾����ˡ�") then alias.trymove("w") end
end
function gps_yz_lts.dosomething2(n,l,w)
	if trymovesuccess then
		closeclass("gps_yz_lts")
		closeclass("gps_thrownpc")
	end
end
------------------------------------------------------------------------------------
-- gps_yz_ym
------------------------------------------------------------------------------------
function gps_yz_ym.dosomething1(n,l,w)
	if findstring(l,"�ⲻ�ǻ��") then
		if not thrownpcfaint then
			run("get ya;n;drop ya;s")
			alias.trymove("s")
		end
	end
	if findstring(l,"���ۺȵ������������䡭������") then
		throw_npc="ya"
		trymovesuccess=false
		alias.tc(throw_npc)
	end
	if findstring(l,"���۽���һ�����ȣ����ڵ��ϻ��˹�ȥ��") then
		thrownpcfaint=true
		wait.make(function()
			local _f=function()
						run("drop gold;drop armor;get ya;n;drop ya;s;get gold;get armor;wear armor")
						alias.trymove("s")
				end
			wait.time(2)
			_f()
		end)
	end
	if findstring(l,"���۵��ڵ��ϣ������˼��¾����ˡ�") then alias.trymove("s") end
end
function gps_yz_ym.dosomething2(n,l,w)
	if trymovesuccess then
		closeclass("gps_yz_ym")
		closeclass("gps_thrownpc")
	end
end
------------------------------------------------------------------------------------
-- gps_yztd_1_2
------------------------------------------------------------------------------------
function gps_yztd_1_2.dosomething1(n,l,w)
	alias.close_gps_dealwith()
	if w[1]=="northwest" then gps_yztd122=w[2] else gps_yztd122=w[1] end
	gps_yztd322=""
	run("go "..gps_yztd122)
	alias.movefinish()
end
------------------------------------------------------------------------------------
-- gps_yztd_2_1
------------------------------------------------------------------------------------
function gps_yztd_2_1.dosomething1(n,l,w)
	alias.close_gps_dealwith()
	if w[1]==invDirection(gps_yztd122) or w[1]==invDirection(gps_yztd322) then gps_yztd221=w[2] else gps_yztd221=w[1] end
	run("halt;go "..gps_yztd221)
	alias.movefinish()
end
function gps_yztd_2_1.dosomething2(n,l,w)
	gps_yztd221=w[1]
	run("halt;go "..gps_yztd221..";look")
end
------------------------------------------------------------------------------------
-- gps_yztd_2_3
------------------------------------------------------------------------------------
function gps_yztd_2_3.dosomething1(n,l,w)
	alias.close_gps_dealwith()
	if w[1]==invDirection(gps_yztd122) or w[1]==invDirection(gps_yztd322) then gps_yztd223=w[2] else gps_yztd223=w[1] end
	run("halt;go "..gps_yztd223)
	alias.movefinish()
end
function gps_yztd_2_3.dosomething2(n,l,w)
	gps_yztd223=w[1]
	run("halt;go "..gps_yztd223..";look")
end
------------------------------------------------------------------------------------
-- gps_yztd_3_2
------------------------------------------------------------------------------------
function gps_yztd_3_2.dosomething1(n,l,w)
	alias.close_gps_dealwith()
	if w[1]=="northeast" then gps_yztd322=w[2] else gps_yztd322=w[1] end
	gps_yztd122=""
	run("halt;go "..gps_yztd322..";look")
	alias.movefinish()
end
------------------------------------------------------------------------------------
-- gps_zhou
------------------------------------------------------------------------------------
function gps_zhou.dosomething1(n,l,w) alias.movefinish() end
------------------------------------------------------------------------------------
-- gps_zeikou
------------------------------------------------------------------------------------
function gps_zeikou.dosomething1(n,l,w)
	local _f,_tb
	if findstring(l,"����һ�ݣ�˵�����ã�","ë��������ʯ��һ����ת�۾Ͳ�����","ë�����ڵ��ϣ������˼��¾����ˡ�","ͻȻ��һ����������սȦ�����ˣ�") then
		npcfaint=true
		run("set killover=zeikou")
		killaction=""
	end
	if findstring(l,"�ⲻ������ߣ��������������ָ�ӵġ�") then
		if not isopen("kill_bt") then run(tostring(safego)..";convert she") end
	end
	if findstring(l,"���߿��˿��㣬ͻȻ�Ƽ�һ��Ծ��׼ȷ�����������ϣ�����������") then
		if not isopen("kill_bt") then alias.close_gps_dealwith();alias.movefinish() end
	end
	if findstring(l,"����Ȱ��˭��","�ܵ���𷨸��У��������ֲ�����") then
		run("set killover=zeikou")
		killaction=""
	end
	wait.make(function()
		if findstring(l,"������Ȱ�����ˣ�","���Ȱ�������������β���������Ȱ�ˡ�","������Ҳ����") then
			_f=function()
						_tb=utils.split(gpszeikou," ")
						run("halt;persuade "..tostring(_tb[3]))
				end
			wait.time(2);_f()
		end
	end)
end
function gps_zeikou.dosomething2(n,l,w)
	gpszeikou=""
	closeclass("kill_"..me.menpai)
	closeclass("kill")
	if me.menpai=="bt" then run("convert she");return end
	if stat.zixia>0 then run("yun sangong") end
	if me.master=="������" and fjweapon=="jian" then run("jifa dodge dugu-jiujian") end
	alias.close_gps_dealwith()
	alias.movefinish()
end
function gps_zeikou.dosomething3(n,l,w)
	if not isopen("kill_bt") then
		sheid=tonumber(sheid+1)
		run("stop she "..sheid)
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function gps.update()
	local  gps_start_m_triggerlist={
	       {name="gps_start_dosth1",line=2,regexp="^(> > > |> > |> |)(.+) - \\n(.*)\\Z",script=function(n,l,w)    gps_start.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_start_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"gps_start",v.script,v.line)
	end
	local  gps_start_triggerlist={
	       {name="gps_start_dosth2",regexp="^\\s*����.{4}�ĳ����� (.*)��$",script=function(n,l,w)    gps_start.dosomething2(n,l,w)  end,},
	       {name="gps_start_dosth3",regexp="^(> > > |> > |> |)(\\S+) - ",script=function(n,l,w)    gps_start.dosomething3(n,l,w)  end,},
	       {name="gps_start_dosth4",regexp="^(\\S+)( - (\\S+)){0,1}",script=function(n,l,w)    gps_start.dosomething4(n,l,w)  end,},
	       {name="gps_start_dosth5",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ (\\S+) �ı����趨��",script=function(n,l,w)    gps_start.dosomething5(n,l,w)  end,},
	       {name="gps_start_dosth6",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    gps_start.dosomething6(n,l,w)  end,},
	}
	for k,v in pairs(gps_start_triggerlist) do
		addtri(v.name,v.regexp,"gps_start",v.script,v.line)
	end
	closeclass("gps_start")
	
	local _tb={
		"�����������������Ҵϻ۵��ӣ�\\n����ʦ̫�ܰ������ڴ˴��Ա������Ķ�����\\Z",
		"������һֻ����ͣ����������ʯ�ϡ�\\n����ûͷ��Ӭһ���ڶ���Ϲ�꣬���һͷײ�ڶ����ϡ�\\Z",
		"����ûͷ��Ӭһ���ڶ���Ϲ�꣬���һͷײ�ڶ����ϡ�\\n��������κ����ģ��ƺ�ײɵ�ˡ�\\Z",
		"ֻ����������˵���������¹��ٱְ��кι�ɣ�\\nʲô��\\Z",
		"�㱻�ݿܵ�ס��ȥ·��\\n�ݿܺȵ������û�ţ�\\Z",
		"�㱻��ס��ȥ·��\\në���ȵ������û�ţ�\\Z",
	}
	local  gps_watch_m_triggerlist={
	       {name="gps_watch_dosth1",line=2,regexp=linktri(_tb),script=function(n,l,w)    gps_watch.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_watch_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"gps_watch",v.script,v.line)
	end
	
	_tb={
		"����ô��˽���㲻�ܴ��߳���һ�ѱ�����",
		"�ݿ�����һ����Ц��ˬ��Ľ���������������Ȼ������Ī����",
		".+�˵ز��ʺ�ʩչһέ�ɽ�������",
		"��ʦ��������˵�������ʳ����ȥ��������������ߡ�",
		"�����װͰ͵ؽе����Ŵ����㣬�콫������������ ",
		"���̵���ָ��ָ�����ŵ�ʳ�˵�������ݽ̹棬���̵��Ӳ��ý�ʳ�������ʳ�",
		"�����˶���Ů����Ϣ֮������λ\\S+����������",
		"��Ķ�����û����ɣ������ƶ���",
		"���Ҫ�����ض���һ�ɾ޴���������㵲���˶��ڣ�",
		"�㻹û������ѧ��ȫ���黹\\(return\\)�������",
		"�㻹����վ�������߰ɣ�",
		"�����һ�������˸��գ�",
		"��һ��С�Ľ���̤�˸��գ�\\.\\.\\. ��\\.\\.\\.��",
		"ɽ���������Ͽ콫��������������Ȼ��ͱ�ָ�������뿪��",
		"���ֵ������̰����������׹����������",
		"ʯ���ԱߵĲݴ��к�ȻԾ��һ����Ӱ����ס���㣡",
		"�����ɵ��Ӷ�ݺݵ���в�����콫����������������ȡ�㹷����",
		"Ԭ����˵������������������Ϣ�����������",
		"�������û�г�·��",
		"�����ص���������㻹�ڣ�����һ��, ˵�����㻹û���ϰ���, �����㵽���ߡ�",
		"��Ŀǰ��û���κ�Ϊ gps=false �ı����趨��",
		"\\.*���¾����ƺ���Ѱ���������в�ͬ��͸��ɭɭ������",
		"\\.*һ��΢�紵�������澰���ƺ�����Щ�仯��",
	}
	local  gps_watch_triggerlist={
	       {name="gps_watch_dosth11",regexp=linktri(_tb),script=function(n,l,w)    gps_watch.dosomething1(n,l,w)  end,},
	       {name="gps_watch_dosth2",regexp="^(> > > |> > |> |)(\\S+)\\s+-\\s+",script=function(n,l,w)    gps_watch.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_watch_triggerlist) do
		addtri(v.name,v.regexp,"gps_watch",v.script,v.line)
	end
	closeclass("gps_watch")
	
	_tb={
		"(�䵱NPC|�������|�������|����Ϫ)���ڵ��ϣ������˼��¾����ˡ�",
		"����û������ˡ�",
		"(����NPC|�Ҷ�)���ڵ��ϣ������˼��¾����ˡ�",
		"(����NPC|����ү)���ڵ��ϣ������˼��¾����ˡ�",
		"(���ְ�NPC|��ɽ��|˾ͽ��|����)���ڵ��ϣ������˼��¾����ˡ�",
		"(����NPC|����)���ڵ��ϣ������˼��¾����ˡ�",
		"(��ɽNPC|�͵�ŵ|����|½����|������|�����|ʩ����|�߸���)���ڵ��ϣ������˼��¾����ˡ�",
		"(��ɽNPC|������|�����)��\\S+��Ķ����ˡ�",
		"(����NPC|��ӥ������|�����)���ڵ��ϣ������˼��¾����ˡ�",
		"(����NPC|˵����)���ڵ��ϣ������˼��¾����ˡ�",
		"(����NPC|�ʹ���ʿ|Уξ|һƷ����ʿ)���ڵ��ϣ������˼��¾����ˡ�",
		"(����NPC|�سǹٱ�)���ڵ��ϣ������˼��¾����ˡ�",
		"(����ɽNPC|���������ʿ)���ڵ��ϣ������˼��¾����ˡ�",
		"(ȫ��NPC|��־��|̷����)���ڵ��ϣ������˼��¾����ˡ�",
		"(����NPC|��ͨ|����|��۱���|���ֱ���)���ڵ��ϣ������˼��¾����ˡ�",
		"(ѩɽNPC|���ײ�|��ľ���|����ɮ)���ڵ��ϣ������˼��¾����ˡ�",
		"(����NPC|ʨ����|�ɻ���)���ڵ��ϣ������˼��¾����ˡ�",
		"(����NPC|�Ů|�ɹž���)���ڵ��ϣ������˼��¾����ˡ�",
		"(�䵱NPC|\\S*��������������������ڱ��ϡ�)",
		"(����NPC|ʨ����һ�Բ�����������������ǰ��)",
		"\\S*(����NPC|ǧ����������������Ů�����롣|�㲻�����ֵ��ӣ����ý����|��������ˡС�²��Ӵ�Ů�͡�)",
		"\\S*(û����|��λŮʩ��������ذ�|��λʩ����ذ�|��ʱ������ֿ��һ��ѩ���Ľ䵶��)",
		"(���ְ�NPC|������������ǰ��˵���������ǹ�Ѻ������ͽ�ĵط�������ذɡ�)",
		"(����NPC|�ɻ��ӵ�ס���㣺�ҵ�С椿ɲ��Ǹ�����)",
		"(����NPC|��һ˵��: ��δ����ɣ������϶�¥��)",
		"(����NPC|�������������ǰ���ȵ���)",
		"(��ɽNPC|�߸�����ס��˵���ɴ������˱��ɽ��أ���ֹ����)",
		"(ѩɽNPC|���ײ���ס��˵����׼����ʲ�ṩ�����Ƿ�үѽ��)",
		"(����NPC|����ү˵: �ҰѰ���������ҵĿ������ˣ�˭Ҳ�����ȥ��)",
		"(����NPC|�Ҷ���ס�����ȥ·����ү���������������������)",
		"(����ׯNPC|�Ҷ����˸�Ҿ��˵����������ׯ����������ׯ��������ͣ�������ذ�)",
		"(ؤ��NPC|����һ�Ѿ�ס�������˵�������ţ���)",
		"(ؤ��NPC|����)���ڵ��ϣ������˼��¾����ˡ�",
		"(̩ɽNPC|����ʤ������ס��˵����������æ�����ڲ�����ͣ�����ɽȥ�ɣ�)",
		"(̩ɽNPC|����ʤ���ڵ��ϣ������˼��¾����ˡ�)",
		"(ѩɽNPC|����ɮ��ס��˵�������˱����صأ���ذɣ�)",
		"(����NPC|����ʦ̫����ǰ˵������Ƕ��ҵ���������Ϣ�ĵط�����������)",
		"(��ɽNPC|�͵�ŵǷ��˵������λ)",
		"(��ɽNPC|������ס��˵���������Ǳ�����Ժ����λ)",
		"(�䵱NPC|��������ȵ����粻����ɽ���㣬������أ�)",
		"(��ɽNPC|½���кȵ��������ǻ�ɽ�ɵ���Ժ����λ)",
		"(����NPC|�ɹž���һ�ﲻ����վ������ǰ�������ȥ·��)",
		"(��ɽNPC|��������������ǰ��������˲������׳��뱾���صأ�����������뿪��)",
		"(����NPC|��ۺȵ����㲻�����ֵ��ӣ����ý����ɽ���֣�)",
		"\\S*(���ְ�NPC|��ô��һ�㽭����ض�����������Ҳ��Т��һ�����ӡ�)",
		"\\S*(�䵱NPC|�粻����ɽ���㣬������أ�)",
		"(ѩɽNPC|��ľ���ס��˵���������Ǳ��¸�ɮ����֮�أ�ʩ����ء�)",
		"(��ɽNPC|ʩ������ס��˵����λʦ���治�����ͣ���ذɡ�)",
		"(����NPC|˵����������ס�㣬˵�������������̹���������λ\\S+�����ҽ̵��ӣ���ֹ��!)",
		"(���ְ�NPC|˾ͽ����������ǰ���ȵ���)",
		"(����NPC|��ӥ�������ȵ�����λ)",
		"(����NPC|��ʿ������һ�����������ǲ������ܽ�ȥ�ĵط���)",
		"(����ɽNPC|��ʿ����ȵ������У������봳�뱾���صأ�)",
		"(����ɽNPC|��ʿ������ȵ������У��������ڱ���ү���¾��ˣ�)",
		"(����NPC|Уξ��ס�����ȥ·��)",
		"(����NPC|����±��С�����ǧ��Ĺ�أ����)",
		"(����NPC|һƷ����ʿ��ס�����ȥ·��)",
		"(��ɽNPC|���������˵���������Ǳ��ɳ���)",
		"(�䵱NPC|����Ϫ�ȵ����������䵱�صأ�������ֹ����)",
		"(ȫ��NPC|��־����ס˵�����Բ������ĵ���⿪�ţ�)",
		"(����NPC|�Ů���ֵ�ס�����ȥ·����ׯ�����ڵ�ѵ���ߣ������������)",
		"(����ׯNPC|�Ҷ�)���ڵ��ϣ������˼��¾����ˡ�",
		"��Ŀǰ��û���κ�Ϊ checkmove=yes �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ check=dealwith �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ killover=GPS �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ (.+) �ı����趨��",
		"��.+һ��",
	}
	local  gps_dealwith_triggerlist={
	       {name="gps_dealwith_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_dealwith.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_dealwith_triggerlist) do
		addtri(v.name,v.regexp,"gps_dealwith",v.script,v.line)
	end
	AddTimer("gps_dealwith_kill_timer", 0, 0, 5, "", timer_flag.Enabled + timer_flag.Replace, "gps_dealwith.timer")
	SetTimerOption("gps_dealwith_kill_timer", "group", "gps_dealwith")
	closeclass("gps_dealwith")
	
	_tb={
		"��Ȼһ���ȷ�Ϯ����һ�����������Դ��������£���������ˡ�",
		"����ȫ��Ť�������ڻ��裬��춽�ֱ�����ˡ�",
	}
	local  gps_99guai_triggerlist={
	       {name="gps_99guai_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_99guai.dosomething1(n,l,w)  end,},
	       {name="gps_99guai_dosth2",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    gps_99guai.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_99guai_triggerlist) do
		addtri(v.name,v.regexp,"gps_99guai",v.script,v.line)
	end
	closeclass("gps_99guai")
	
	_tb={
		"�Ǹ�����û������",
		"������������",
		"������������",
	}
	local  gps_climbxy_triggerlist={
	       {name="gps_climbxy_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_climbxy.dosomething1(n,l,w)  end,},
	       {name="gps_climbxy_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ (.+) �ı����趨��",script=function(n,l,w)    gps_climbxy.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_climbxy_triggerlist) do
		addtri(v.name,v.regexp,"gps_climbxy",v.script,v.line)
	end
	closeclass("gps_climbxy")
	
	_tb={
		"�ⲻ�ǻ��",
		"�����ȵ��������˵ȣ������Ҵ���",
		"��˼�����һ�����ȣ����ڵ��ϻ��˹�ȥ��",
		"��˼�鵹�ڵ��ϣ������˼��¾����ˡ�",
	}
	local  gps_dl_fsg_triggerlist={
	       {name="gps_dl_fsg_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_dl_fsg.dosomething1(n,l,w)  end,},
	       {name="gps_dl_fsg_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ (.+) �ı����趨��",script=function(n,l,w)    gps_dl_fsg.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_dl_fsg_triggerlist) do
		addtri(v.name,v.regexp,"gps_dl_fsg",v.script,v.line)
	end
	closeclass("gps_dl_fsg")
	
	_tb={
		"����ȫ��Ť�������ڻ��裬��춽�ֱ�����ˡ�",
	}
	local  gps_em_killjm_triggerlist={
	       {name="gps_em_killjm_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_em_killjm.dosomething1(n,l,w)  end,},
	       {name="gps_em_killjm_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ (.+) �ı����趨��",script=function(n,l,w)    gps_em_killjm.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_em_killjm_triggerlist) do
		addtri(v.name,v.regexp,"gps_em_killjm",v.script,v.line)
	end
	closeclass("gps_em_killjm")
	
	_tb={
		"����˵���������ڵ������ϰ��ɡ���",
		"����˵��̾��Ư����һ�ĵ������ǸϽ��뿪�ɡ�",
		"������.+����ǰ����",
		"��������������.+Լ.+����.+Լ.+������",
		"�������������ڡ�",
		"������������������Լ.+������",
		"������������������Լ.+������",
	}
	local  gps_lsd_back_triggerlist={
	       {name="gps_lsd_back_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_lsd_back.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_lsd_back_triggerlist) do
		addtri(v.name,v.regexp,"gps_lsd_back",v.script,v.line)
	end
	closeclass("gps_lsd_back")
	
	_tb={
		"����˵�������ߵ��������ϰ��ɡ���",
		"����˵��̾��Ư����һ�ĵ������ǸϽ��뿪�ɡ�",
		"������.+����ǰ����",
		"�㼫ĿԶ��������(.+)�����������Ǹ���ľ�д�ĺ������������ͦ�Σ������źü�����ɽ��",
		"�������������ڡ�",
		"�������������ڶ�Լ(.+)������Լ(.+)����",
		"������������������Լ(.+)������",
	}
	local  gps_lsd_go_triggerlist={
	       {name="gps_lsd_go_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_lsd_go.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_lsd_go_triggerlist) do
		addtri(v.name,v.regexp,"gps_lsd_go",v.script,v.line)
	end
	closeclass("gps_lsd_go")
	
	_tb={
		"�سǹٱ����ڵ��ϣ������˼��¾����ˡ�",
		"�سǹٱ�����һ�����ȣ����ڵ��ϻ��˹�ȥ��",
		"�سǾ��ٳ����㣬�������б�������ס���ȥ·��",
		"�ⲻ�ǻ��",
	}
	local  gps_nanyang_triggerlist={
	       {name="gps_nanyang_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_nanyang.dosomething1(n,l,w)  end,},
	       {name="gps_nanyang_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ (.+) �ı����趨��",script=function(n,l,w)    gps_nanyang.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_nanyang_triggerlist) do
		addtri(v.name,v.regexp,"gps_nanyang",v.script,v.line)
	end
	closeclass("gps_nanyang")
	
	_tb={
		"(�佫|�ٱ�)���ڵ��ϣ������˼��¾����ˡ�",
		"(�佫|�ٱ�)����һ�����ȣ����ڵ��ϻ��˹�ȥ��",
		"(�佫|�ٱ�)��ȵ���������������˵Ȳ����ɴ˾�����",
		"�ⲻ�ǻ��",
	}
	local  gps_qzh_mcx_triggerlist={
	       {name="gps_qzh_mcx_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_qzh_mcx.dosomething1(n,l,w)  end,},
	       {name="gps_qzh_mcx_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ (.+) �ı����趨��",script=function(n,l,w)    gps_qzh_mcx.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_qzh_mcx_triggerlist) do
		addtri(v.name,v.regexp,"gps_qzh_mcx",v.script,v.line)
	end
	closeclass("gps_qzh_mcx")
	
	_tb={
		"(�佫|�ٱ�)���ڵ��ϣ������˼��¾����ˡ�",
		"(�佫|�ٱ�)����һ�����ȣ����ڵ��ϻ��˹�ȥ��",
		"(�佫|�ٱ�)��ס�����ȥ·��",
		"�ⲻ�ǻ��",
	}
	local  gps_qzh_sl_triggerlist={
	       {name="gps_qzh_sl_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_qzh_sl.dosomething1(n,l,w)  end,},
	       {name="gps_qzh_sl_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ (.+) �ı����趨��",script=function(n,l,w)    gps_qzh_sl.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_qzh_sl_triggerlist) do
		addtri(v.name,v.regexp,"gps_qzh_sl",v.script,v.line)
	end
	closeclass("gps_qzh_sl")
	
	local  gps_qzh_xmdq_triggerlist={
	       {name="gps_qzh_xmdq_dosth1",regexp="^\\s*����.{4}�ĳ����� (.*)��$",script=function(n,l,w)    gps_qzh_xmdq.dosomething1(n,l,w)  end,},
	       {name="gps_qzh_xmdq_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ checklook=yes �ı����趨��",script=function(n,l,w)    gps_qzh_xmdq.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_qzh_xmdq_triggerlist) do
		addtri(v.name,v.regexp,"gps_qzh_xmdq",v.script,v.line)
	end
	closeclass("gps_qzh_xmdq")
	
	_tb={
		"���ã���ͻȻ��һ���Ʊ�\\(strike\\)�ĳ嶯��",
		"ֻ�������ʯͷϡ�ﻩ��̮����������ס����ڡ�",
	}
	local  gps_sgy_sd_triggerlist={
	       {name="gps_sgy_sd_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_sgy_sd.dosomething1(n,l,w)  end,},
	       {name="gps_sgy_sd_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ checkmianbi=yes �ı����趨��",script=function(n,l,w)    gps_sgy_sd.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_sgy_sd_triggerlist) do
		addtri(v.name,v.regexp,"gps_sgy_sd",v.script,v.line)
	end
	closeclass("gps_sgy_sd")
	
	_tb={
		"��������ǰ��������ô��Ҳû�á�",
		"�����Ѿ��ǿ����ˡ�",
		"��������������ţ�ֻ��֨��һ����һλ׳��ɮ��Ӧ���򿪴���",
		"֨��һ�����������˰Ѵ��Ŵ���",
	}
	local  gps_sl_gate_triggerlist={
	       {name="gps_sl_gate_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_sl_gate.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_sl_gate_triggerlist) do
		addtri(v.name,v.regexp,"gps_sl_gate",v.script,v.line)
	end
	closeclass("gps_sl_gate")
	
	local  gps_sl_sl_triggerlist={
	       {name="gps_sl_sl_dosth1",regexp="�������Եĳ�����\\s+(\\w+)\\s+��\\s+(\\w+)��",script=function(n,l,w)    gps_sl_sl.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_sl_sl_triggerlist) do
		addtri(v.name,v.regexp,"gps_sl_sl",v.script,v.line)
	end
	closeclass("gps_sl_sl")
	
	_tb={
		"ľ���ֱ��嵽������ȥ�ˡ�",
		"��������еļһ�����Ͽ���һЩ��֦��",
		"�㻮�˰��죬ľ����춿����ˡ�",
		"�㿳�µ���֦�ƺ��㹻��\\(make\\)һ��ľ��\\(raft\\)�ˡ�",
		"���ÿ��µ���֦����һ��ľ����",
		"���պ�����\\s+-",
	}
	local  gps_slh_triggerlist={
	       {name="gps_slh_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_slh.dosomething1(n,l,w)  end,},
	       {name="gps_slh_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ busyover=up �ı����趨��",script=function(n,l,w)    gps_slh.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_slh_triggerlist) do
		addtri(v.name,v.regexp,"gps_slh",v.script,v.line)
	end
	closeclass("gps_slh")
	
	_tb={
		"\\s+�������Եĳ�����\\s+(\\w+)\\s+��\\s+(\\w+)��",
		"(һ���洬Ӧ������ʻ�˹��������һ��̤�Ű����ɳ̲�ϡ�|����ˣ���ô���۾�û��������)",
		"����˵������ɽ�������ϰ��ɡ���",
		"����һ���������������Ǵ������˰���",
		"����������ɽ��",
		"����������ɽ��Լ(.+)������Լ(.+)������",
		"����������ɽ��Լ(.+)������Լ(.+)������",
		"����������ɽ��(.+)Լ.+������",
	}
	local  gps_thd_back_triggerlist={
	       {name="gps_thd_back_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_thd_back.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_thd_back_triggerlist) do
		addtri(v.name,v.regexp,"gps_thd_back",v.script,v.line)
	end
	closeclass("gps_thd_back")
	
	_tb={
		"\\s+�������Եĳ�����\\s+(\\w+)\\s+��\\s+(\\w+)��",
		"(һ���洬Ӧ������ʻ�˹��������һ��̤�Ű����ɳ̲�ϡ�|����ˣ���ô���۾�û��������)",
		"����˵�����һ����������ϰ��ɡ���",
		"����һ���������������Ǵ������˰���",
		"�㼫ĿԶ��������(.+)������һ�ɼ����˱ǻ���ĺ��紵����",
		"����������ɽ��",
		"����������ɽ��Լ(.+)������Լ(.+)������",
		"����������ɽ��Լ(.+)������Լ(.+)������",
		"����������ɽ����Լ(.+)������",
		"��⵰��һ�ߴ���ȥ��",
	}
	local  gps_thd_go_triggerlist={
	       {name="gps_thd_go_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_thd_go.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_thd_go_triggerlist) do
		addtri(v.name,v.regexp,"gps_thd_go",v.script,v.line)
	end
	closeclass("gps_thd_go")
	
	_tb={
		"�����ﲻ֪������������֮ʣ(.+)��������֮ʣ(.+)��������֮ʣ(.+)�����Ｘ�Σ�",
		"ֻ���á�¡¡���������죬ʯ�Ż�����һ�໮��",
		"��������ȻƮ��һ�������ᣬ",
	}
	local  gps_thd_ms_triggerlist={
	       {name="gps_thd_ms_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_thd_ms.dosomething1(n,l,w)  end,},
	       {name="gps_thd_ms_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ busyover=ms �ı����趨��",script=function(n,l,w)    gps_thd_ms.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_thd_ms_triggerlist) do
		addtri(v.name,v.regexp,"gps_thd_ms",v.script,v.line)
	end
	closeclass("gps_thd_ms")

	local  gps_thd_sg_triggerlist={
	       {name="gps_thd_sg_dosth1",regexp="ɵ��ɵЦ�˼������쿪˫��һ����˵����Ҫ��ȥ��������һ����ɣ�",script=function(n,l,w)    gps_thd_sg.dosomething1(n,l,w)  end,},
	       {name="gps_thd_sg_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ checkmove=yes �ı����趨��",script=function(n,l,w)    gps_thd_sg.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_thd_sg_triggerlist) do
		addtri(v.name,v.regexp,"gps_thd_sg",v.script,v.line)
	end
	closeclass("gps_thd_sg")
	
	_tb={
		"С�� -",
		"������̶ʱ����.+��.+��.+��(.+)ʱ.+��",
	}
	local  gps_thd_thl_triggerlist={
	       {name="gps_thd_thl_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_thd_thl.dosomething1(n,l,w)  end,},
	       {name="gps_thd_thl_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ busyover=thl �ı����趨��",script=function(n,l,w)    gps_thd_thl.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_thd_thl_triggerlist) do
		addtri(v.name,v.regexp,"gps_thd_thl",v.script,v.line)
	end
	closeclass("gps_thd_thl")
	
	_tb={
		"ֻ��.+����һ�ݣ�˵�����ã�����ܽ�ڴ���Ȱ�������˼ҵ������ϣ���ξ����ˡ�",
		"��ʤ�����У����Ծ�����ߣ�Ц�������ã�",
		"��˫��һ����Ц��˵�������ã�",
		"�������Ц��˵���������ˣ�",
		".+���һ�ݣ�������Ҿ˵�����������ղ�������Ȼ������",
		".+������˼�����˵�����ⳡ�����������ˣ�����������",
		".+��ɫ΢�䣬˵��������������",
	}
	local  gps_thrownpc_triggerlist={
	       {name="gps_thrownpc_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_thrownpc.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_thrownpc_triggerlist) do
		addtri(v.name,v.regexp,"gps_thrownpc",v.script,v.line)
	end
	closeclass("gps_thrownpc")
	
	_tb={
		"�����˵���������Ĵ�����С��û����������",
		"���Ż����ؿ����ˣ�����",
	}
	local  gps_waitrelease_triggerlist={
	       {name="gps_waitrelease_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_waitrelease.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_waitrelease_triggerlist) do
		addtri(v.name,v.regexp,"gps_waitrelease",v.script,v.line)
	end
	AddTimer("gps_waitrelease_timer", 0, 0, 30, "", timer_flag.Enabled + timer_flag.Replace, "gps_waitrelease.timer")
	SetTimerOption("gps_waitrelease_timer", "group", "gps_waitrelease")
	closeclass("gps_waitrelease")
	
	_tb={
		"\\s+����Ψһ�ĳ����� (.+)��",
		"\\s+�������Եĳ����� northup��(\\w+) �� (.+)��",
		"\\s+�������Եĳ����� (\\w+)��northup �� (.+)��",
		"\\s+�������Եĳ����� (\\w+)��(\\w+) ��\\s+northup��",
		"\\s+�������Եĳ����� (\\w+) �� (\\w+)��",
	}
	local  gps_xxmap_triggerlist={
	       {name="gps_xxmap_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_xxmap.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_xxmap_triggerlist) do
		addtri(v.name,v.regexp,"gps_xxmap",v.script,v.line)
	end
	closeclass("gps_xxmap")

	local  gps_xydcy_triggerlist={
	       {name="gps_xydcy_dosth1",regexp="^(> > > |> > |> |)���ԭ\\s+-\\s+(.+)",script=function(n,l,w)    gps_xydcy.dosomething1(n,l,w)  end,},
	       {name="gps_xydcy_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ checkxydcy=yes �ı����趨��",script=function(n,l,w)    gps_xydcy.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_xydcy_triggerlist) do
		addtri(v.name,v.regexp,"gps_xydcy",v.script,v.line)
	end
	closeclass("gps_xydcy")

	local  gps_xydcy_sl_triggerlist={
	       {name="gps_xydcy_sl_dosth1",regexp="^(> > > |> > |> |)����\\s+-",script=function(n,l,w)    gps_xydcy_sl.dosomething1(n,l,w)  end,},
	       {name="gps_xydcy_sl_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ checkxydcy=yes �ı����趨��",script=function(n,l,w)    gps_xydcy_sl.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_xydcy_sl_triggerlist) do
		addtri(v.name,v.regexp,"gps_xydcy_sl",v.script,v.line)
	end
	closeclass("gps_xydcy_sl")
	
	_tb={
		"����˼���ڵ��ϣ������˼��¾����ˡ�",
		"����˼����һ�����ȣ����ڵ��ϻ��˹�ȥ��",
		"�躲�ֵ�ס���㣺��������լ��",
		"�ⲻ�ǻ��",
	}
	local  gps_yz_lts_triggerlist={
	       {name="gps_yz_lts_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_yz_lts.dosomething1(n,l,w)  end,},
	       {name="gps_yz_lts_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ checkmove=yes �ı����趨��",script=function(n,l,w)    gps_yz_lts.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_yz_lts_triggerlist) do
		addtri(v.name,v.regexp,"gps_yz_lts",v.script,v.line)
	end
	closeclass("gps_yz_lts")
	
	_tb={
		"���۵��ڵ��ϣ������˼��¾����ˡ�",
		"���۽���һ�����ȣ����ڵ��ϻ��˹�ȥ��",
		"���ۺȵ������������䡭������",
		"�ⲻ�ǻ��",
	}
	local  gps_yz_ym_triggerlist={
	       {name="gps_yz_ym_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_yz_ym.dosomething1(n,l,w)  end,},
	       {name="gps_yz_ym_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ checkmove=yes �ı����趨��",script=function(n,l,w)    gps_yz_ym.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_yz_ym_triggerlist) do
		addtri(v.name,v.regexp,"gps_yz_ym",v.script,v.line)
	end
	closeclass("gps_yz_ym")
	
	local  gps_yztd_1_2_triggerlist={
	       {name="gps_yztd_1_2_dosth1",regexp="\\s*�������Եĳ�����\\s+(\\w+)\\s*��\\s*(\\w+)��",script=function(n,l,w)    gps_yztd_1_2.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_yztd_1_2_triggerlist) do
		addtri(v.name,v.regexp,"gps_yztd_1_2",v.script,v.line)
	end
	closeclass("gps_yztd_1_2")
	
	local  gps_yztd_2_1_triggerlist={
	       {name="gps_yztd_2_1_dosth1",regexp="^\\s*�������Եĳ�����\\s+(\\w+)\\s*��\\s*(\\w+)��",script=function(n,l,w)    gps_yztd_2_1.dosomething1(n,l,w)  end,},
	       {name="gps_yztd_2_1_dosth2",regexp="^\\s*����Ψһ�ĳ�����\\s*(\\w+)��",script=function(n,l,w)    gps_yztd_2_1.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_yztd_2_1_triggerlist) do
		addtri(v.name,v.regexp,"gps_yztd_2_1",v.script,v.line)
	end
	closeclass("gps_yztd_2_1")
	
	local  gps_yztd_2_3_triggerlist={
	       {name="gps_yztd_2_3_dosth1",regexp="^\\s*�������Եĳ�����\\s+(\\w+)\\s*��\\s*(\\w+)��",script=function(n,l,w)    gps_yztd_2_3.dosomething1(n,l,w)  end,},
	       {name="gps_yztd_2_3_dosth2",regexp="^\\s*����Ψһ�ĳ�����\\s*(\\w+)��",script=function(n,l,w)    gps_yztd_2_3.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_yztd_2_3_triggerlist) do
		addtri(v.name,v.regexp,"gps_yztd_2_3",v.script,v.line)
	end
	closeclass("gps_yztd_2_3")
	
	local  gps_yztd_3_2_triggerlist={
	       {name="gps_yztd_3_2_dosth1",regexp="\\s*�������Եĳ�����\\s+(\\w+)\\s*��\\s*(\\w+)��",script=function(n,l,w)    gps_yztd_3_2.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_yztd_3_2_triggerlist) do
		addtri(v.name,v.regexp,"gps_yztd_3_2",v.script,v.line)
	end
	closeclass("gps_yztd_3_2")
	
	local  gps_zhou_triggerlist={
	       {name="gps_zhou_dosth1",regexp="��Ȼ�и�����ס�㣬���˶�������������ںڰ�����ת��ת�����þͳ��˶���",script=function(n,l,w)    gps_zhou.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(gps_zhou_triggerlist) do
		addtri(v.name,v.regexp,"gps_zhou",v.script,v.line)
	end
	closeclass("gps_zhou")
	
	_tb={
		"ֻ��.+����һ�ݣ�˵�����ã�.+�ڴ���Ȱ�������˼ҵ������ϣ���ξ����ˡ�",
		"ֻ��.+����һ�ݣ�˵�����ã�.+������Ȱ�����Ұ��֡�",
		"�ⲻ������ߣ��������������ָ�ӵġ�",
		"ë��������ʯ��һ����ת�۾Ͳ�����",
		"���߿��˿��㣬ͻȻ�Ƽ�һ��Ծ��׼ȷ�����������ϣ�����������",
		"����Ȱ��˭��",
		"������Ȱ�����ˣ�",
		"���Ȱ�������������β���������Ȱ�ˡ�",
		"ë�����ڵ��ϣ������˼��¾����ˡ�",
		".+ͻȻ��һ����������սȦ�����ˣ�",
		".+������Ҳ����",
		".+�ܵ���𷨸��У��������ֲ�����",
	}
	local  gps_zeikou_triggerlist={
	       {name="gps_zeikou_dosth1",regexp=linktri(_tb),script=function(n,l,w)    gps_zeikou.dosomething1(n,l,w)  end,},
	       {name="gps_zeikou_dosth2",regexp="^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ killover=zeikou �ı����趨��",script=function(n,l,w)    gps_zeikou.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(gps_zeikou_triggerlist) do
		addtri(v.name,v.regexp,"gps_zeikou",v.script,v.line)
	end
	script=function(n,l,w)    gps_zeikou.dosomething3(n,l,w)  end
	addtri_multiline("gps_zeikou_dosth3","^(> > > |> > |> |)��������ʾ�����ͣ������\\n���ǹ���������\\Z","gps_zeikou",script,2)
	closeclass("gps_zeikou")
	
	local noecho_trilist={
			"^(> > > |> > |> |)��Ŀǰ��û���κ�Ϊ (\\S+) �ı����趨��",
			}
	local _noechotri=linktri(noecho_trilist)

	--addtri("gps_noecho",_noechotri,"gps","")
	--SetTriggerOption("gps_noecho","omit_from_output",1)
end
gps.update()

--[[
��Ĺ��ͼ����
UPDATE Room SET Entrance='out|westdown', EntranceSafe='out' WHERE RoomNO=641;
INSERT INTO Entrance VALUES('gumuenter',4408,2060,641,'');
INSERT INTO Room VALUES('�ڵ���Ǳ����,��ֻ����ˮ�����,���Ӳ��������ı�ǿ���ˮ����ǰ','eastup|west','','','����ˮ��',2060,'��Ĺ��',0);
INSERT INTO Entrance VALUES('eu',4409,641,2060,'');
INSERT INTO Entrance VALUES('w',4410,2061,2060,'');
INSERT INTO Room VALUES('�ڵ���Ǳ����,��ֻ����ˮ�����,���Ӳ��������ı�ǿ���ˮ����ǰ','east|westup','','','����ˮ��',2061,'��Ĺ��',0);
INSERT INTO Entrance VALUES('e',4411,2060,2061,'');
INSERT INTO Entrance VALUES('wu',4412,2062,2061,'');
INSERT INTO Room VALUES('�ܵ���������ڣ����ֲ�����ָ��ˮ����������ϥ�ǣ����Ҳ�������','eastdown|westup','','','�ܵ�',2062,'��Ĺ��',0);
INSERT INTO Entrance VALUES('ed',4413,2061,2062,'');
INSERT INTO Entrance VALUES('wu',4414,2063,2062,'');
INSERT INTO Room VALUES('�ܵ���������ڣ����ֲ�����ָ����ֻ��Խ��Խ�ͣ�ʪ��ҲԽ��Խ��','eastdown|westup','','','�ܵ�',2063,'��Ĺ��',0);
INSERT INTO Entrance VALUES('ed',4415,2062,2063,'');
INSERT INTO Entrance VALUES('wu',4416,2064,2063,'');
INSERT INTO Room VALUES('�ܵ���������ڣ����ֲ�����ָ����ֻ��Խ��Խ�ͣ�ʪ��ҲԽ��Խ��','eastdown|up','','','�ܵ�',2064,'��Ĺ��',0);
INSERT INTO Entrance VALUES('ed',4417,2063,2064,'');
INSERT INTO Entrance VALUES('u',4418,2065,2064,'');
INSERT INTO Room VALUES('����Ҳ������֮����̧ͷ�����������Ҷ����������д�����ּ����ţ�','down|up','','','ʯ��',2065,'��Ĺ��',0);
INSERT INTO Entrance VALUES('d',4419,2064,2065,'');
INSERT INTO Entrance VALUES('u',4420,2066,2065,'');
INSERT INTO Room VALUES('ʯ���з������ʯ��(guan)����������ʯ�׹׸������ܸ��š���˵��','east','','','ʯ��',2066,'��Ĺ��',0);
INSERT INTO Entrance VALUES('enterguan',4421,2067,2066,'');
INSERT INTO Entrance VALUES('e',4422,2068,2066,'');
INSERT INTO Room VALUES('����Կ���ʯ�׵ײ��и�����һ�ֵİ�����','out','','','��',2067,'��Ĺ��',0);
INSERT INTO Entrance VALUES('out',4423,2066,2067,'');
INSERT INTO Entrance VALUES('turnleft',4424,2065,2067,'');
INSERT INTO Room VALUES('����ɭɭ���ߵ���Ҳ��֪����ͨ���Ĩ�ġ�ǽ�ϵ�һ֦С��������','east|south|west','','','�ߵ�',2068,'��Ĺ��',0);
INSERT INTO Entrance VALUES('w',4425,2066,2068,'');
INSERT INTO Entrance VALUES('s',4426,2069,2068,'');
INSERT INTO Entrance VALUES('e',4427,2070,2068,'');
INSERT INTO Room VALUES('��춹�Ĺ��ֻ��Ů���ӣ�Ĺ��Ҳֻ�д�һ����Ϣ�ҡ����м���ʯ����','north','','','������Ϣ��',2069,'��Ĺ��',0);
INSERT INTO Entrance VALUES('n',4428,2068,2069,'');
INSERT INTO Room VALUES('��������õļ�Ϊ�򵥣�����ľ�κ��������ӷ��������У���ǽ����','east|north|south|west','','','����',2070,'��Ĺ��',0);
INSERT INTO Entrance VALUES('w',4429,2068,2070,'');
INSERT INTO Entrance VALUES('s',4430,2071,2070,'');
INSERT INTO Entrance VALUES('n',4431,2072,2070,'');
INSERT INTO Entrance VALUES('e',4432,2074,2070,'');
INSERT INTO Room VALUES('������������ˡ�ֻ�����Ͽտյ�����ûʲ����衣�������ӿ���ǽ','north','','','����',2071,'��Ĺ��',0);
INSERT INTO Entrance VALUES('n',4433,2070,2071,'');
INSERT INTO Room VALUES('����ɭɭ���ߵ���Ҳ��֪����ͨ���Ĩ�ġ�ǽ�ϵ�һ֦С��������','east|north|south|west','north|south','','�ߵ�',2072,'��Ĺ��',0);
INSERT INTO Entrance VALUES('s',4434,2070,2072,'');
INSERT INTO Entrance VALUES('n',4435,2073,2072,'');
INSERT INTO Room VALUES('����ɭɭ���ߵ���Ҳ��֪����ͨ���Ĩ�ġ�ǽ�ϵ�һ֦С��������','east|south|west','south','','�ߵ�',2073,'��Ĺ��',0);
INSERT INTO Entrance VALUES('s',4436,2072,2073,'');
INSERT INTO Room VALUES('����ɭɭ���ߵ���Ҳ��֪����ͨ���Ĩ�ġ�ǽ�ϵ�һ֦С��������','north|south|west','','','�ߵ�',2074,'��Ĺ��',0);
INSERT INTO Entrance VALUES('w',4437,2070,2074,'');
INSERT INTO Entrance VALUES('n',4438,2075,2074,'');
INSERT INTO Entrance VALUES('s',4439,2077,2074,'');
INSERT INTO Room VALUES('��������Ǹ�������ֻ��ʯ���е����Ϸ���Щ��͵��ӡ�ǽ�Ǳ߶�����','north|south','','','����',2075,'��Ĺ��',0);
INSERT INTO Entrance VALUES('s',4440,2074,2075,'');
INSERT INTO Entrance VALUES('n',4441,2076,2075,'');
INSERT INTO Room VALUES('�����Ǹ��䷿������۷����������ķ�����ȥ�����в�����壬������Ʒ','south','','','�䷿',2076,'��Ĺ��',0);
INSERT INTO Entrance VALUES('s',4442,2075,2076,'');
INSERT INTO Room VALUES('��ʯ����״�������أ���խ�Ͽ���Ϊ���Σ����߰�Բ������ȴ��','east|north','','','������',2077,'��Ĺ��',0);
INSERT INTO Entrance VALUES('n',4443,2074,2077,'');
INSERT INTO Entrance VALUES('e',4444,2078,2077,'');
INSERT INTO Room VALUES('��ʯ�Һ�������ʯ���Ǵ����Գƣ����ִ����෴�����Ǳ�����խ����Բ����,','west','','','������',2078,'��Ĺ��',0);
INSERT INTO Entrance VALUES('w',4445,2077,2078,'');
UPDATE Entrance set Condition=null WHERE ID>=4408 and ID<=4445;

--------------------------------------------------------------------------------------------------------------------------------

UPDATE Room SET EntranceSafe='east|west' WHERE RoomNO=841;
UPDATE Room SET EntranceSafe='east|west' WHERE RoomNO=840;
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|north|northeast|northwest|southeast|southwest|west','','','����',2079,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4446,2080,2079,null);
INSERT INTO Entrance VALUES('n',4447,2082,2079,null);
INSERT INTO Entrance VALUES('ne',4448,2083,2079,null);
INSERT INTO Entrance VALUES('nw',4449,2084,2079,null);
INSERT INTO Entrance VALUES('se',4450,841,2079,null);
INSERT INTO Entrance VALUES('sw',4451,840,2079,null);
INSERT INTO Entrance VALUES('w',4452,2081,2079,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','north|west','','','����',2080,'��ɽ������',0);
INSERT INTO Entrance VALUES('n',4453,2083,2080,null);
INSERT INTO Entrance VALUES('w',4454,2079,2080,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|north|northwest','','','����',2081,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4455,2079,2081,null);
INSERT INTO Entrance VALUES('n',4456,2084,2081,null);
INSERT INTO Entrance VALUES('nw',4457,2097,2081,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|north|south|west','','','����',2082,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4458,2083,2082,null);
INSERT INTO Entrance VALUES('n',4459,2096,2082,null);
INSERT INTO Entrance VALUES('s',4460,2079,2082,null);
INSERT INTO Entrance VALUES('w',4461,2084,2082,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','northeast|south|southwest|west','','','����',2083,'��ɽ������',0);
INSERT INTO Entrance VALUES('ne',4462,2094,2083,null);
INSERT INTO Entrance VALUES('s',4463,2080,2083,null);
INSERT INTO Entrance VALUES('sw',4464,2079,2083,null);
INSERT INTO Entrance VALUES('w',4465,2082,2083,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|south|southeast|southwest','','','����',2084,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4466,2082,2084,null);
INSERT INTO Entrance VALUES('s',4467,2081,2084,null);
INSERT INTO Entrance VALUES('se',4468,2079,2084,null);
INSERT INTO Entrance VALUES('sw',4469,2097,2084,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|north|northwest|southeast|southwest|west','','','����',2085,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4470,2087,2085,null);
INSERT INTO Entrance VALUES('n',4471,841,2085,null);
INSERT INTO Entrance VALUES('nw',4472,840,2085,null);
INSERT INTO Entrance VALUES('se',4473,2089,2085,null);
INSERT INTO Entrance VALUES('sw',4474,2088,2085,null);
INSERT INTO Entrance VALUES('w',4475,2086,2085,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|south','','','����',2086,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4476,2085,2086,null);
INSERT INTO Entrance VALUES('s',4477,2088,2086,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','south|southeast|southwest|west','','','����',2087,'��ɽ������',0);
INSERT INTO Entrance VALUES('s',4478,2091,2087,null);
INSERT INTO Entrance VALUES('se',4479,2090,2087,null);
INSERT INTO Entrance VALUES('sw',4480,2089,2087,null);
INSERT INTO Entrance VALUES('w',4481,2085,2087,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|north|northeast|south','','','����',2088,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4482,2089,2088,null);
INSERT INTO Entrance VALUES('n',4483,2086,2088,null);
INSERT INTO Entrance VALUES('ne',4484,2085,2088,null);
INSERT INTO Entrance VALUES('s',4485,2093,2088,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','northeast|northwest|south|southwest|west','','','����',2089,'��ɽ������',0);
INSERT INTO Entrance VALUES('ne',4486,2087,2089,null);
INSERT INTO Entrance VALUES('nw',4487,2085,2089,null);
INSERT INTO Entrance VALUES('s',4488,2092,2089,null);
INSERT INTO Entrance VALUES('sw',4489,2093,2089,null);
INSERT INTO Entrance VALUES('w',4490,2088,2089,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','northwest|southwest','','','����',2090,'��ɽ������',0);
INSERT INTO Entrance VALUES('nw',4491,2087,2090,null);
INSERT INTO Entrance VALUES('sw',4492,2091,2090,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','north|northeast|west','','','����',2091,'��ɽ������',0);
INSERT INTO Entrance VALUES('n',4493,2087,2091,null);
INSERT INTO Entrance VALUES('ne',4494,2090,2091,null);
INSERT INTO Entrance VALUES('w',4495,2092,2091,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|north|west','','','����',2092,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4496,2091,2092,null);
INSERT INTO Entrance VALUES('n',4497,2089,2092,null);
INSERT INTO Entrance VALUES('w',4498,2093,2092,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|north|northeast','','','����',2093,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4499,2092,2093,null);
INSERT INTO Entrance VALUES('n',4500,2088,2093,null);
INSERT INTO Entrance VALUES('ne',4501,2089,2093,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','east|southwest','','','����',2094,'��ɽ������',0);
INSERT INTO Entrance VALUES('e',4502,2095,2094,null);
INSERT INTO Entrance VALUES('sw',4503,2083,2094,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','west','','','����',2095,'��ɽ������',0);
INSERT INTO Entrance VALUES('w',4504,2094,2095,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','south','','','����',2096,'��ɽ������',0);
INSERT INTO Entrance VALUES('s',4505,2082,2096,null);
INSERT INTO Room VALUES('���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������','northeast|southeast','','','����',2097,'��ɽ������',0);
INSERT INTO Entrance VALUES('ne',4506,2084,2097,null);
INSERT INTO Entrance VALUES('se',4507,2081,2097,null);

INSERT INTO Entrance VALUES('ne',4508,2079,840,null);
INSERT INTO Entrance VALUES('se',4509,2085,840,null);
INSERT INTO Entrance VALUES('nw',4510,2079,841,null);
INSERT INTO Entrance VALUES('s',4511,2085,841,null);
--------------------------------------------------------------------------------------------------------------------------------

delete from Room where roomno>=2098 and roomno<=2109;
delete from Entrance where id>=4508 and id<=4529;
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','north|northeast|northwest|south','','','��������',2098,'��������',0);
INSERT INTO Entrance VALUES('n',4508,2099,2098,null);
INSERT INTO Entrance VALUES('ne',4509,2101,2098,null);
INSERT INTO Entrance VALUES('nw',4510,2100,2098,null);
INSERT INTO Entrance VALUES('s',4511,1440,2098,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','south|west','','','��������',2099,'��������',0);
INSERT INTO Entrance VALUES('s',4512,2098,2099,null);
INSERT INTO Entrance VALUES('w',4513,2100,2099,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','east|southeast','','','��������',2100,'��������',0);
INSERT INTO Entrance VALUES('e',4514,2098,2100,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','east|west','','','��������',2101,'��������',0);
INSERT INTO Entrance VALUES('w',4515,1458,2101,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','west','','','��������',2102,'��������',0);
INSERT INTO Entrance VALUES('w',4516,2101,2102,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','east|northeast','','','��������',2103,'��������',0);
INSERT INTO Entrance VALUES('e',4517,1428,2103,null);
INSERT INTO Entrance VALUES('ne',4518,2104,2103,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','northeast|southwest','','','��������',2104,'��������',0);
INSERT INTO Entrance VALUES('ne',4519,2105,2104,null);
INSERT INTO Entrance VALUES('sw',4520,2103,2104,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','northeast|southwest','','','��������',2105,'��������',0);
INSERT INTO Entrance VALUES('sw',4521,2104,2105,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','east|southwest','','','��������',2106,'��������',0);
INSERT INTO Entrance VALUES('e',4522,1436,2106,null);
INSERT INTO Entrance VALUES('sw',4523,2098,2106,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','south|west','','','��������',2107,'��������',0);
INSERT INTO Entrance VALUES('s',4524,2100,2107,null);
INSERT INTO Entrance VALUES('w',4525,1434,2107,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','south|west','','','��������',2108,'��������',0);
INSERT INTO Entrance VALUES('s',4526,2098,2108,null);
INSERT INTO Entrance VALUES('w',4527,1335,2108,null);
INSERT INTO Room VALUES('���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�','south|west','','','��������',2109,'��������',0);
INSERT INTO Entrance VALUES('s',4528,2106,2109,null);
INSERT INTO Entrance VALUES('w',4529,1324,2109,null);
INSERT INTO Entrance VALUES('n',4530,2098,1440,null);

��������
���������޺��Աߵ�ɭ�֣��ߴ���������������еĹ��߶�����ס�ˡ�
2098			1				n(2)			ne(4)		nw(3)		s(xxh5)
2099			2				s(1)			w(3)
2100			3				e(1)			se()
2101			4				e()			w(shankou)
2102			5				w(4)
2103			6				e(xxroad10)		ne(7)
2104			7				ne(8)		sw(6)
2105			8				ne()			sw(7)
2106			9				e(xxh2)		sw(1)
2107			10			s(3)			w(yinshan)
2108			11			s(1)			w(saimachang)
2109			12			s(9)			w(silk1)
saimachang	1335
silk1				1324
yinshan			1434
xxh2				1436
xxh5				1440
shankou		1458
xxroad10		1428


���������ű�����������������������ľ�ߴ����ڵ���ɫ��������������
2097			19			ne(6)		se(3)
2096			18			s(4)
2095			17			w(16)
2094			16			e(17)		sw(5)
2093			15			ne(11)		n(10)		e(14)
2092			14			n(11)		w(15)		e(13)
2091			13			w(14)		n(9)			ne(12)
2090			12			nw(9)		sw(13)
2089			11			nw(7)		ne(9)		sw(15)		s(14)		w(10)
2088			10			ne(7)		n(8)			s(15)		e(11)
2087			9				sw(11)		se(12)		s(13)		w(7)
2086			8				s(10)		e(7)
2085			7				n(tulu3)		nw(tulu2)	sw(10)		se(11)		w(8)				e(9)
2084			6				sw(19)		se(1)		s(3)			e(4)
2083			5				sw(1)		ne(16)		s(2)			w(4)
2082			4				s(1)			n(18)		w(6)			e(5)
2081			3				n(6)			e(1)			nw(19)
2080			2				n(5)			w(1)
2079			1				nw(6)		ne(5)		se(tulu3)	sw(tulu2)	n(4)				w(3)			e(2)
tulu3=841 east|northwest|south|west   840  east|northeast|southeast|west

--------------------------------------------------------------------------------------------------------------------------------
--DELETE FROM Room WHERE Roomno>=2110;
--DELETE FROM Entrance WHERE ID>=4531;
INSERT INTO Room VALUES('�����۴������ܣ�����ʯ�������ǿ���������Ϊ�׸ǰ�صĹ�','out','','','ʯ����',2110,'��������',0);
INSERT INTO Entrance VALUES('out',4531,1445,2110,null);
INSERT INTO Entrance VALUES('pressstone',4532,2111,2110,null);
INSERT INTO Room VALUES('����һ�����겻�����յ��������������ʪ�������������ܡ�','east|north|south|up|west','','','��',2111,'��������',0);
INSERT INTO Entrance VALUES('u',4533,2110,2111,null);
INSERT INTO Entrance VALUES('e',4534,2112,2111,null);
INSERT INTO Entrance VALUES('s',4535,2113,2111,null);
INSERT INTO Entrance VALUES('w',4536,2114,2111,null);
INSERT INTO Entrance VALUES('n',4537,2115,2111,null);
INSERT INTO Room VALUES('����һ����С��ʯ����������ֻ�ݵ��¼����ˡ���ǰ����ʯ��','west','','','Сʯ��',2112,'��������',0);
INSERT INTO Entrance VALUES('w',4538,2111,2112,null);
INSERT INTO Room VALUES('����һ����С��ʯ����������ֻ�ݵ��¼����ˡ���ǰ����ʯ��','north','','','Сʯ��',2113,'��������',0);
INSERT INTO Entrance VALUES('n',4539,2111,2113,null);
INSERT INTO Room VALUES('����һ����С��ʯ����������ֻ�ݵ��¼����ˡ���ǰ����ʯ��','east','','','Сʯ��',2114,'��������',0);
INSERT INTO Entrance VALUES('e',4540,2111,2114,null);
INSERT INTO Room VALUES('����һ����С��ʯ����������ֻ�ݵ��¼����ˡ���ǰ����ʯ��','south','','','Сʯ��',2115,'��������',0);
INSERT INTO Entrance VALUES('s',4541,2111,2115,null);
INSERT INTO Entrance VALUES('tangcoffin',4542,2110,1445,null);

--------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Room VALUES('�������Ǵ�������һ��Ƨ�����ڣ����¾����˼���ǰǰ���ᣬ���СС��','southup|west','west','׿��|����','���ǹ�',2116,'�رߴ�ѩɽ',0);
INSERT INTO Entrance VALUES('w',4543,2117,2116,null);
INSERT INTO Entrance VALUES('su',4544,414,2116,null);
INSERT INTO Room VALUES('һ����������������Ī���·���ӿ������С·��Ȼ���ʣ������ǰ��','east','','','¹ҰԷ',2117,'�رߴ�ѩɽ',0);
INSERT INTO Entrance VALUES('e',4545,2116,2117,null);
INSERT INTO Entrance VALUES('enterpicture',4546,2116,434,"xs");
delete from Room where roomno=2116 or roomno=2117;
delete from entrance where id>=4543 and id<=4546;
INSERT INTO Entrance VALUES('enterpicture',4543,1854,434,"xs");
--]]

