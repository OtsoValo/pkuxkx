checki={}
dealwith_bi={}
dealwith_bian={}
dealwith_chain={}
dealwith_dao={}
dealwith_xs={}
dealwith_fuling={}
dealwith_gold={}
dealwith_gun={}
dealwith_he={}
dealwith_ji={}
dealwith_jian={}
dealwith_jiudai={}
dealwith_sellyao={}
dealwith_shengzi={}
dealwith_staff={}
dealwith_stick={}
dealwith_yaodai={}
dealwith_tyl={}
check_exp={}
check_items={}
------------------------------------------------------------------------------------
-- dealwith_bi
------------------------------------------------------------------------------------
function dealwith_bi.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"��ɽ�絹�ڵ��ϣ������˼��¾����ˡ�","��һ�ɵ��ڵ��ϣ������˼��¾����ˡ�") then run("get bi from corpse;get bi") end
		if findstring(l,"��ӷ�һ�ɵ�ʬ�������ѳ�һ֧�йٱʡ�","�����ɽ���ʬ�������ѳ�һ֧�йٱʡ�","�����һ֧�йٱʡ�") then
			have.bi=have.bi+1
			closeclass("dealwith_bi")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"����һ�ɴ����йء�����ʮ�����ɣ�������Ϣ��") then run("kill fan;yun jiemai fan") end
		if findstring(l,"������ɽ������йء�����ʮ�����ɣ�������Ϣ��") then run("kill qiu;yun jiemai qiu") end
		if findstring(l,"�������磬���ֵ�ͼ��1094�������") then run("ask fan about ����ʮ�����ɣ�") end
		if findstring(l,"�������磬���ֵ�ͼ��1101�������") then run("ask qiu about ����ʮ�����ɣ�") end
		if findstring(l,"����û�� fan ����ˡ�") then alias.flytoid(1101) end
		if findstring(l,"����û�� qiu ����ˡ�") then alias.flytoid(1094) end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_bian
------------------------------------------------------------------------------------
function dealwith_bian.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"����Ů���ڵ��ϣ������˼��¾����ˡ�","�����˵��ڵ��ϣ������˼��¾����ˡ�") then run("get bian from corpse;get bian") end
		if findstring(l,"�������Ů��ʬ�������ѳ�һ����ޡ�","��������˵�ʬ�������ѳ�һ����ޡ�","�����һ����ޡ�") then
			have.whip=have.whip+1
			closeclass("dealwith_bian")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"��������Ů�����йء�����ʮ�����ɣ�������Ϣ��") then run("kill nu") end
		if findstring(l,"����������ˡ��ٺٺ١���Ц�˼�����") then run("kill ren") end
		if findstring(l,"�������磬���ֵ�ͼ��312�������") then run("ask nu about ����ʮ�����ɣ�") end
		if findstring(l,"��Ҫ��˭�� hehe ���������") then
			closeclass("dealwith_bian")
			_f=function() alias.startworkflow() end
			wait.time(1);_f()
		end
		if findstring(l,"����û�� nu ����ˡ�") then run("hehe ren") end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_chain
------------------------------------------------------------------------------------
function dealwith_chain.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"����������������һ��������","����̩˵��������ȥ���������д�ܶ�Ź�İ������͸����괦�á�") then
			closeclass("dealwith_chain")
			have.chain=have.chain+1
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"������Ķ���������û�С�") then
			alias.resetidle()
			_f=function() alias.flytonpc("����̩") end
			wait.time(10);_f()
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ������̩��") then run("give mu xiang to gao shengtai;give chain to gao shengtai;ask gao shengtai about ����") end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ����骡�") then run("buy chain") end
		if findstring(l,"����̩˵���������Ѿ������ˣ����Ѿ���","����̩˵������ղŲ����������������","����û�� gao ����ˡ�") then alias.flytonpc("���") end
		if findstring(l,"����̩˵����.*��ȥ���ݴ����̵�����","����̩˵����.*�������ȥ���ҿ�����") then alias.flytonpc("������") end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ����������") then run("ask wang tiejiang about ����");alias.flytonpc("����̩") end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_dao
------------------------------------------------------------------------------------
function dealwith_dao.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"����������е�����ǿ��ѹ�ص��վ��������") then
			if havefj>0 then alias.startworkflow() else run("yun regenerate;hp;set check=neili") end
		end
		if findstring(l,"��ӳ��е�ʬ�������ѳ�һ�ѽ䵶��") then
			have.dao=have.dao+1
			if have.dao<1 then alias.flytonpc("��Ʒ")
			else
				closeclass("dealwith_dao")
				_f=function() alias.checkitems() end
				wait.time(1);_f()
			end
		end
		if findstring(l,"��ӵ�Ʒ��ʦ��ʬ�������ѳ�һ�ѽ䵶��","�����һ�ѽ䵶��","�����ͷ��ʬ�������ѳ�һ���ֵ���","�����һ���ֵ���") then
			have.dao=have.dao+1
			closeclass("dealwith_dao")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"��ӻ������ߵ�ʬ�������ѳ�һ�ѽ䵶��") then
			have.dao=have.dao+1
			if have.dao<1 then alias.flytonpc("����")
			else
				closeclass("dealwith_dao")
				_f=function() alias.checkitems() end
				wait.time(1);_f()
			end
		end
		if findstring(l,"����ŵ�Ʒ��ʦ���ٺٺ١���Ц�˼�����") then run("kill chanshi") end
		if findstring(l,"��˵����������ü��ѽ����") then run("kill luohan") end
		if findstring(l,"����û������ˡ�") then alias.flytonpc("����") end
		if findstring(l,"���е��ڵ��ϣ������˼��¾����ˡ�","��Ʒ��ʦ���ڵ��ϣ������˼��¾����ˡ�","�������ߵ��ڵ��ϣ������˼��¾����ˡ�","��ͷ���ڵ��ϣ������˼��¾����ˡ�") then
			run("get dao from corpse;get dao")
		end
		if findstring(l,"��������һ���䵶��") then
			have.dao=have.dao+1
			if have.dao<1 then run("drop dao;ask chanshi about �䵶;get dao")
			else
				closeclass("dealwith_dao")
				_f=function() alias.checkitems() end
				wait.time(1);_f()
			end
		end
		if findstring(l,"������ʦ˵������Ǹ�������ò���ʱ�������Ѿ������ˡ�","����û�� chanshi ����ˡ�") then alias.flytonpc("����") end
		if findstring(l,"��Ҫ��˭�� hehe ���������") then
			closeclass("dealwith_dao")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"��Ҫ��˭�� ysis ���������") then
			if have.dao>0 then
				_f=function() alias.startworkflow() end
				wait.time(1);_f()
			else
				_f=function() run("ysis luohan") end
				wait.time(5);_f()
			end
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����С�") then run("ysis luohan") end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ��������") then run("ask chanshi about �䵶") end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ����Ʒ��") then run("hehe chanshi") end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����硻") then run("kill zunzhe") end
		if findstring(l,"�������磬���ֵ�ͼ��964�������") then run("kill biao tou") end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_gun
------------------------------------------------------------------------------------
function dealwith_gun.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"��ӳ����ʬ�������ѳ�һ����ü����","��ӳμŵ�ʬ�������ѳ�һ����ü����","�����һ����ü����","��������һ����ü����") then
			have.club=have.club+1
			closeclass("dealwith_gun")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"����ų��顸�ٺٺ١���Ц�˼�����","��˵�����μ���ü��ѽ����") then run("kill luohan") end
		if findstring(l,"�μŵ��ڵ��ϣ������˼��¾����ˡ�","���鵹�ڵ��ϣ������˼��¾����ˡ�") then run("get gun from corpse;get gun") end		
		if findstring(l,"������ʦ˵������Ǹ�������ò���ʱ�������Ѿ������ˡ�","����û�� chanshi ����ˡ�") then alias.flytonpc("�μ�") end
		if findstring(l,"��Ҫ��˭�� hehe ���������") then
			closeclass("dealwith_gun")
			_f=function() alias.startworkflow() end
			wait.time(1);_f()
		end
		if findstring(l,"��Ҫ��˭�� ysis ���������") then alias.flytonpc("����") end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ���μš�") then run("ysis luohan") end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����须") then run("hehe luohan") end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ��������") then run("ask chanshi about ��ü��") end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_xs
------------------------------------------------------------------------------------
function dealwith_xs.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=falun �ı����趨��") then
			alias.resetidle()
			if roomno_now==423 then alias.flytoid(428)
			elseif roomno_now==428 then alias.flytoid(437)
			else alias.flytoid(423) end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=burn �ı����趨��") then
			alias.resetidle()
			if have.faling==nil or have.faling<1 then alias.flytoid(428) else alias.flytoid(431) end
		end
		if findstring(l,"�������磬���ֵ�ͼ��431�������") then
			alias.resetidle()
			run("jump zuo")
			if have.lubo==nil or have.lubo<1 then run("get lubo") end
			if have.kulouguan==nil or have.kulouguan<1 then run("get kulou guan") end
			if have.rentoulian==nil or have.rentoulian<1 then run("get rentou lian") end
			run("go down")
			closeclass("dealwith_xs")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"�������磬���ֵ�ͼ��423�������","�������磬���ֵ�ͼ��428�������","�������磬���ֵ�ͼ��437�������") then
			alias.resetidle()
			if have.faling==nil or have.faling<1 then run("get fa ling") end
			if have.falun==nil or have.falun<me.falun then run("get fa lun") end
			closeclass("dealwith_xs")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_fuling
------------------------------------------------------------------------------------
function dealwith_fuling.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"�����ͨ������������һǮ���ߡ�") then
			run("put fuling in yaodai")
			have.fuling=have.fuling+1
			closeclass("dealwith_fuling")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"Ӵ����Ǹ�����������æ���ء��������Ժ�") then
			_f=function() run("buy fuling") end
			wait.time(1);_f()
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ����ͨ�Ρ�") then run("buy fuling") end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_gold
------------------------------------------------------------------------------------
function dealwith_gold.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"����˵�����ҡ���֪����") then
			alias.resetidle()
			_f=function() run("ask wang about ��") end
			wait.time(1);_f()
		end
		if findstring(l,"�Է���û����ȫ���ԣ��ȵȵȰɡ�") then
			_f=function() run("get wu") end
			wait.time(0.5);_f()
		end
		if findstring(l,"�㽫���ϰ�����������ڱ��ϡ�") then alias.resetidle();alias.flytonpc("���ǹ�") end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=killwang �ı����趨��") then
			alias.resetidle()
			closeclass("dealwith_gold")
			run("get gold from corpse")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=stealwu �ı����趨��") then
			alias.resetidle()
			run("get gold from wu;get wu")
		end
		if findstring(l,"�������ԵĶ��������") then
			_f=function() run("steal gold from wu") end
			wait.time(10);_f()
		end
		if findstring(l,"Ǯׯ���ϲ�������������������") then daytime=false end
		if findstring(l,"���嵹�ڵ��ϣ������˼��¾����ˡ�") then alias.resetidle();alias.checkbusy("killwang") end
		if findstring(l,"�������һ�����ȣ����ڵ��ϻ��˹�ȥ��","����˵�������Ӿ��ǹ����壬��������������ӣ��������ɣ�") then alias.resetidle();run("kill wang") end
		if findstring(l,"���ϰ����һ�����ȣ����ڵ��ϻ��˹�ȥ��") then alias.resetidle();alias.checkbusy("stealwu") end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����ǹ���") then
			alias.resetidle()
			run("feed wu to dog;drop corpse")
			closeclass("dealwith_gold")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����桻") then
			alias.resetidle()
			if daytime then
				--if have.gold>5 then run("cun "..tonumber(have.gold-5).." gold;drop "..tonumber(have.gold-5).." gold") end
				--if have.gold<5 then run("qu "..tonumber(5-have.gold).." gold") end
				if have.gold>=2 then run("cun "..tonumber(have.gold-2).." gold;drop "..tonumber(have.gold-5).." gold") else run("qu 2 gold") end
				if have.silver>50 then run("cun "..tonumber(have.silver-50).." silver") end
				if have.coin<50 then run("cun 1 silver;qu "..tonumber(50-have.coin).." coin") end
				closeclass("dealwith_gold")
				mark.setgold=1
				_f=function() alias.checkitems() end
				wait.time(1);_f()
			else
				if have.gold<1 and have.silver<50 then
					_f=function() alias.flytonpc("����") end
					wait.time(1);_f()
				else
					closeclass("dealwith_gold")
					mark.setgold=1
					_f=function() alias.checkitems() end
					wait.time(1);_f()
				end
			end
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����塻") then
			alias.resetidle()
			if have.gold>1 then
				run("buy ya;drop ya")
				closeclass("dealwith_gold")
				_f=function() alias.checkitems() end
				wait.time(1);_f()
			else run("ask wang about ��") end
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����ϰ塻") then alias.resetidle();run("steal gold from wu") end
		if findstring(l,"����û�� wang ����ˡ�") then alias.flytonpc("���ϰ�") end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_he
------------------------------------------------------------------------------------
function dealwith_he.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"����������������һ��ʳ�С�","�������������������һ��ʳ�С�") then
			alias.resetidle()
			have.he=have.he+1
			if have.fire<1 then
				_f=function() run("buy fire") end
				wait.time(0.5);_f()
			else
				closeclass("dealwith_he")
				_f=function() alias.checkitems() end
				wait.time(1);_f()
			end
		end
		if findstring(l,"�������������������һ֧���ۡ�","����������������һ֧���ۡ�","���С������������һ֧���ۡ�") then
			alias.resetidle()
			closeclass("dealwith_he")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"������Ķ���������û�С�") then
			alias.resetidle()
			_f=function() alias.flytonpc("������") end
			wait.time(10);_f()
		end
		if findstring(l,"���������������йء���û����������Ϣ��") then
			daytime=true
			if have.he<1 then run("buy he") else run("buy fire") end
		end
		if findstring(l,"Ӵ����Ǹ�����������æ���ء��������Ժ�") then
			alias.resetidle()
			_f=function() if have.he<1 then run("buy he") else run("buy fire") end end
			wait.time(0.5);_f()
		end
		if findstring(l,"�������磬���ֵ�ͼ��837�������") then
			alias.resetidle()
			run("buy fire")
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ����骡�") then
			alias.resetidle()
			if have.he<1 then run("buy he") else run("buy fire") end
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ����������") then
			alias.resetidle()
			run("ask Yang yongfu about ��û����")
		end
		if findstring(l,"����û�� Yang yongfu ����ˡ�") then alias.flytonpc("���") end
		if findstring(l,"�ӻ������ϲ�������������������") then daytime=false end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_ji
------------------------------------------------------------------------------------
function dealwith_ji.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"������ϰ�����������.+����������") then
			alias.resetidle()
			for i=1,10,1 do run("put ji in he") end
			closeclass("dealwith_ji")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"�������ϰ�����йء��������ڲ�������Ϣ��") then
			run("buy "..tonumber(10-have.ji).." ji")
		end
		if findstring(l,"Ӵ����Ǹ�����������æ���ء��������Ժ�") then
			_f=function() run("buy "..tonumber(10-have.ji).." ji") end
			wait.time(1);_f()
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����ϰ塻") then
			alias.resetidle()
			run("ask song laoban about �������ڲ�")
		end
		if findstring(l,"����û�� song laoban ����ˡ�") then
			alias.resetidle()
			_f=function() run("ask song laoban about �������ڲ�") end
			wait.time(3);_f()
		end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_jian
------------------------------------------------------------------------------------
function dealwith_jian.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"[��|��|��]+����ʿ���ڵ��ϣ������˼��¾����ˡ�") then
			alias.resetidle()
			--if (have.jian<2 and me.menpai~="sl" and me.menpai~="bt" and me.menpai~="gb") or (have.jian<1 and findstring(skills_lingwu,"sword")) then
			if have.jian<1 then
				_f=function() run("halt;get jian from corpse;get jian") end
				wait.time(2.5);_f()
			end
			--if have.armor<1 then run("get armor from corpse") end
			run("set check=jian")
		end
		--if findstring(l,"���[��|��|��]+����ʿ��ʬ�����ϳ���һ�����ס�") then
		--	have.armor=have.armor+1
		--	run("drop cloth;wear armor")
		--end
		if findstring(l,"���[��|��|��]+����ʿ��ʬ�������ѳ�һ��.+����","�����һ��.+����") then
			have.jian=have.jian+1
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=jian �ı����趨��") then
			alias.resetidle()
			--if (have.jian<2 and (fjweapon=="jian" or mpweapon=="jian" or ftbweapon=="jian")) or have.armor<1 or (have.jian<1 and findstring(skills_lingwu,"sword")) then
			_f=function() if have.jian<1 then run("ask wei shi about �ȼ��ɱ")	else alias.checkitems() end end
			wait.time(1);_f()
		end
		if findstring(l,"����[��|��|��]+����ʿ�����йء��ȼ��ɱ������Ϣ��") then
			alias.resetidle()
			run("kill wei shi")
		end
		if findstring(l,"˫�ɣ����ɣ����һ��ɣ��ȡ�.+ ���� [��|��|��]+����ʿ ���еĵ� .+������","��һ�죬�������ɫ�Ʋ���ӭȢ��������ʿ��") then
			alias.resetidle()
			run("ask wei shi about �ȼ��ɱ")
		end
		if findstring(l,"����û�� wei shi ����ˡ�","�Է���æ���أ���Ȼ�����ʻ��ɡ�") then
			if jiannpc==nil then jiannpc="������ʿ" end
			if jiannpc=="������ʿ" then
				if flytoidx<flytosum then alias.flytonext()
				else
					jiannpc="������ʿ"
					_f=function() alias.flytonpc(jiannpc) end
					wait.time(1);_f()
				end
			elseif jiannpc=="������ʿ" then
				if flytoidx<flytosum then
					_f=function() alias.flytonext() end
					wait.time(1);_f()
				else
					jiannpc="������ʿ"
					_f=function() alias.flytonpc(jiannpc) end
					wait.time(1);_f()
				end
			end
		end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_jiudai
------------------------------------------------------------------------------------
function dealwith_jiudai.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"��ӵ�С������������һ��ţƤ�ƴ���") then alias.flytonpc("С�") end
		if findstring(l,"�ƴ������˴�ľͰ��ʢ������ˮ��") then have.water=1 end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=fill �ı����趨��") then
			closeclass("dealwith_jiudai")
			for i=1,3,1 do run("drink") end
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"�����С�������йء�����¥������Ϣ��","�������ϰ�����йء�����¥��¥������Ϣ��") then run("buy jiudai") end
		if findstring(l,"�������磬���ֵ�ͼ��1805�������","�������磬���ֵ�ͼ��437�������","�������磬���ֵ�ͼ��537�������","�������磬���ֵ�ͼ��1447�������","��һ�죬�������ɫ�Ʋ���ӭȢ��С橡�") then
			run("fill jiudai")
			have.water=1
			alias.checkbusy("fill")
		end
		if findstring(l,"�������磬���ֵ�ͼ��948�������") then
			alias.resetidle()
			run("ask xiao er about ����¥")
		end
		if findstring(l,"����û�� xiao er ����ˡ�") then
			run("u;ask xian laoban about ����¥��¥")
		end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_sellyao
------------------------------------------------------------------------------------
function dealwith_sellyao.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"��Ŀǰ��û���κ�Ϊ sellyao=over �ı����趨��") then
			closeclass("dealwith_sellyao")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ���κ�ҩ��") then
			if hp.neili<(hp.maxneili*160/100) then alias.checkdrugbusy("da xueteng") end
			_f=function()
				for i=1,have.xueteng,1 do run("sell da xueteng") end
				for i=1,have.xueteng,1 do run("drop da xueteng") end
				for i=1,have.danggui,1 do run("sell dang gui") end
				for i=1,have.danggui,1 do run("drop dang gui") end
				for i=1,have.swjing,1 do run("sell shouwu jing") end
				for i=1,have.swjing,1 do run("drop shouwu jing") end
				if have.jcy<1 then run("buy jinchuang yao") end
				run("set sellyao=over")
			end
			wait.time(2);_f()
		end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_shengzi
------------------------------------------------------------------------------------
function dealwith_shengzi.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"���С������������һ�����ӡ�") then
			closeclass("dealwith_shengzi")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"����С�������йء��ϵ����������ۡ�������Ϣ��") then
			run("buy sheng zi")
		end
		if findstring(l,"�������磬���ֵ�ͼ��615�������") then
			run("ask xiao fan about �ϵ����������ۡ�")
		end
		if findstring(l,"�������磬���ֵ�ͼ��837�������") then
			run("ask seller about �ϵ����������ۡ�")
		end
		if findstring(l,"����û�� seller ����ˡ�") then
			alias.flytoid(615)
		end
		if findstring(l,"����û�� xiao fan ����ˡ�") then
			_f=function() alias.flytoid(837) end
			wait.time(5);_f()
		end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_tyl
------------------------------------------------------------------------------------
function dealwith_tyl.dosomething1(n,l,w)
	--local _f
	--wait.make(function()
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ����ǫ��") then
			run("h;ask leng qian about ������")
			if have.tyl==0 then alias.flytonpc("�����") else alias.checkitems() end
		end
		if findstring(l,"������ǫ�����йء����������Ϣ��") then
			have.tyl=1
		end
		if findstring(l,"�㲢�����̵��ӣ������Ͳ���Ҫ������㽫�������ӵ�һ�ߡ�") then
			have.tyl=0
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ������㡻") then
			run("h;ask li tianheng about ��ӥ��")
			alias.checkitems()
		end
	--end)
end
------------------------------------------------------------------------------------
-- dealwith_staff
------------------------------------------------------------------------------------
function dealwith_staff.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"��Ů���ڵ��ϣ������˼��¾����ˡ�") then run("get qin from corpse") end
		if findstring(l,"��Ӹ�Ů��ʬ�������ѳ�һ��.+�١�","���С������������һ���ⵣ��") then
			closeclass("dealwith_staff")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"�����ͷ������ŷ���˽���̬֮���������ɷ������һ������չ�ȥ��������������һ�¡�") then
			run("unset no_accept;ask ke about ����")
		end
		if findstring(l,"�㸽��û������������","���Ҳ��� corpse ����������","����û�� nu ����ˡ�") then
			alias.flytoid(1383)
		end
		if findstring(l,"�����Ů�����йء�����ʮ�����ɣ�������Ϣ��") then
			run("kill nu")
		end
		if findstring(l,"��Ҫ��˭�� kiss4 ���������") then
			_f=function() run("kiss4 ke") end
			wait.time(10);_f()
		end
		if findstring(l,"�������磬���ֵ�ͼ��1383�������") then
			run("buy biandan")
		end
		if findstring(l,"�������磬���ֵ�ͼ��280�������") then
			run("ask nu about ����ʮ�����ɣ�")
		end
		if findstring(l,"�������磬���ֵ�ͼ��926�������") then
			if have.staff>0 and have.guaishe==0 then run("ed;drop staff;drop staff;wu") end
			run("kiss4 ke")
		end
	end)
end
function dealwith_staff.dosomething2(n,l,w)
	local _f
	wait.make(function()
		if findstring(w[0],"���Ǻ���Ȼ�ģ�ŷ�������ڵ�״��û�а취�����κδ𸲡�") then
			_f=function() run("kiss4 ke") end
			wait.time(10);_f()
		end
		if findstring(w[0],"�Է���æ���أ���Ȼ�����ʻ��ɡ�") then
			_f=function() run("ask ke about ����") end
			wait.time(1);_f()
		end
		if findstring(w[0],"ŷ����˵���������ѱ�����ٿ�һ�������Ѿ�ʮ�ֳ��������ܿ��Ƹ���Ĺ����ˡ�") then
			resetidle=0
			openclass("quit")
			stat.quiting=0
		end
		if findstring(w[0],"ŷ���˸���һ�������ȡ�") then
			if setting_resetidle then resetidle=1 end
			run("convert she")
			closeclass("dealwith_staff")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_stick
------------------------------------------------------------------------------------
function dealwith_stick.dosomething1(n,l,w)
	local _f
	wait.make(function()
		if findstring(l,"���Ī���յ�ʬ�������ѳ�һ��ͭ����") then
			have.stick=have.stick+1
			have.stick_tong=have.stick_tong+1
		end
		if findstring(l,"��˵����Ī������ü��ѽ����") then
			run("kill mo bushou")
		end
		if findstring(l,"������һ�����ӣ�����һֻ�����") then
			have.stick=have.stick+1
			have.stick_zhu=have.stick_zhu+1
		end
		if findstring(l,"Ī���յ��ڵ��ϣ������˼��¾����ˡ�") then
			run("get stick from corpse")
			closeclass("dealwith_stick")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"������������Ӷ��ع��ˡ�") then
			alias.flytoid(2048)
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkbang=yes �ı����趨��") then
			closeclass("dealwith_stick")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(l,"��Ҫ��˭�� ysis ���������") then
			alias.resetidle()
			closeclass("dealwith_stick")
			_f=function() alias.checkitems() end
			wait.time(5);_f()
		end
		if findstring(l,"�������磬���ֵ�ͼ��1118�������") then
			run("drop bang;get zhu bang;get zhu bang;set checkbang=yes")
		end
		if findstring(l,"�������磬���ֵ�ͼ��2048�������") then
			run("ysis mo bushou")
		end
	end)
end
function dealwith_stick.dosomething2(n,l,w)
	local _f
	wait.make(function()
		if findstring(w[0],"�㸽��û������������\n�㸽��û������������") then
			alias.resetidle()
			run("zuo zhu bang")
		end
		if findstring(w[0],"�����һ���������\n�㸽��û������������") then
			have.stick=have.stick+1
			have.stick_huangzhu=have.stick_huangzhu+1
		end
		if findstring(w[0],"�����һ���������\n�����һ���������") then
			run("drop bang 2;get bang")
			have.stick=have.stick+2
			have.stick_huangzhu=have.stick_huangzhu+2
		end
		if findstring(w[0],"�����һ���������\n�����һ��ͭ����") then
			run("drop bang 2;get bang")
			have.stick=have.stick+2
			have.stick_tong=have.stick_tong+1
			have.stick_huangzhu=have.stick_huangzhu+1
		end
		if findstring(w[0],"�����һ���������\n�����һ�������") then
			run("drop bang 2;get bang")
			have.stick=have.stick+2
			have.stick_zhu=have.stick_zhu+1
			have.stick_huangzhu=have.stick_huangzhu+1
		end
		if findstring(w[0],"�����һ��ͭ����\n�㸽��û������������") then
			have.stick=have.stick+1
			have.stick_tong=have.stick_tong+1
		end
		if findstring(w[0],"�����һ��ͭ����\n�����һ���������") then
			have.stick=have.stick+2
			have.stick_tong=have.stick_tong+1
			have.stick_huangzhu=have.stick_huangzhu+1
		end
		if findstring(w[0],"�����һ��ͭ����\n�����һ��ͭ����") then
			have.stick=have.stick+2
			have.stick_tong=have.stick_tong+2
		end
		if findstring(w[0],"�����һ��ͭ����\n�����һ�������") then
			run("drop bang 2;get bang")
			have.stick=have.stick+2
			have.stick_tong=have.stick_tong+1
			have.stick_zhu=have.stick_zhu+1
		end
		if findstring(w[0],"�����һ�������\n�㸽��û������������") then
			have.stick=have.stick+1
			have.stick_zhu=have.stick_zhu+1
		end
		if findstring(w[0],"�����һ�������\n�����һ���������") then
			have.stick=have.stick+2
			have.stick_zhu=have.stick_zhu+1
			have.stick_huangzhu=have.stick_huangzhu+1
		end
		if findstring(w[0],"�����һ�������\n�����һ��ͭ����") then
			have.stick=have.stick+2
			have.stick_tong=have.stick_tong+1
			have.stick_zhu=have.stick_zhu+1
		end
		if findstring(w[0],"�����һ�������\n�����һ�������") then
			have.stick=have.stick+2
			have.stick_zhu=have.stick_zhu+2
		end
	end)
end
------------------------------------------------------------------------------------
-- dealwith_yaodai
------------------------------------------------------------------------------------
function dealwith_yaodai.dosomething1(n,l,w)
	if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ�����硻") then
		if have.yaodai==0 then
			run("ask jing feng about Ƥ����")
		elseif have.dao==0 then
			run("ask jing feng about ��Ҷ��")
		elseif have.jian<=2 then
			run("ask jing feng about ��")
		end
	end
end
function dealwith_yaodai.dosomething2(n,l,w)
	local _f
	wait.make(function()
		if findstring(w[0],"���򾲷�����йء���Ҷ��������Ϣ��\n����ʦ̫����һ����Ҷ����") then
			have.dao=have.dao+1
			if have.jian<=2 then run("ask jing feng about ��")
			else
				closeclass("dealwith_yaodai")
				_f=function() alias.checkitems() end
				wait.time(1);_f()
			end
		end
		if findstring(w[0],"����̰�����У�") then
			closeclass("dealwith_yaodai")
			_f=function() alias.checkitems() end
			wait.time(1);_f()
		end
		if findstring(w[0],"���򾲷�����йء�Ƥ����������Ϣ��\n����ʦ̫����һ��Ƥ������") then
			have.yaodai=1
			if have.dao==0 then run("ask jing feng about ��Ҷ��")
			elseif have.jian<=2 then run("ask jing feng about ��")
			else
				closeclass("dealwith_yaodai")
				_f=function() alias.checkitems() end
				wait.time(1);_f()
			end
		end
		if findstring(w[0],"���򾲷�����йء���������Ϣ��\n����ʦ̫����һ������") then
			have.jian=have.jian+1
			if have.jian<=2 then run("ask jing feng about ��")
			else
				closeclass("dealwith_yaodai")
				_f=function() alias.checkitems() end
				wait.time(1);_f()
			end
		end
	end)
end
------------------------------------------------------------------------------------
-- check_exp
------------------------------------------------------------------------------------
function check_exp.dosomething1(n,l,w)
	alias.resetidle()
	if have.gold==nil then have.gold=0 end
	if mark.gold==nil then mark.gold=0 end
	if mark.exp==nil then mark.exp=tonumber(hp.exp) end
	if mark.pot==nil then mark.pot=tonumber(hp.pot) end
	add.gold=tonumber(have.gold)-tonumber(mark.gold)
	add.exp=tonumber(hp.exp-mark.exp)
	add.pot=tonumber(hp.pot-mark.pot)
	mark.gold=tonumber(have.gold)
	mark.setexp=1
	mark.setpot=1
	-- if not in_array("cuff",skillslist) or not in_array("lvl",skillslist["cuff"]) then skillslist["cuff"]["lvl"]=1 end
	if skillslist["cuff"]==nil then skillslist["cuff"]={} end
	if skillslist["cuff"]["lvl"]==nil then skillslist["cuff"]["lvl"]=1 end
	if me.menpai=="hs" and (me.xtbl+math.floor(skillslist["cuff"]["lvl"]/10))==me.bl then stat.leidong=0 end
	if workflow.nowjob=="fj" and add.exp>(fjexp+10) then
		sum.fj=sum.fj+fjexp
		sum.mp=sum.mp+tonumber(add.exp-fjexp)
		mpLimited.mpexp=mpLimited.mpexp+tonumber(add.exp-fjexp)
		if count[workflow.nowjob]==nil then count[workflow.nowjob]=0 end
		count[workflow.nowjob]=count[workflow.nowjob]+1
		print("����exp��"..add.exp.."������fj����"..fjexp.."��mp����"..tonumber(add.exp-fjexp)..",����gold��"..add.gold)
		--###-- #if @explist.keephour {setExplist "fj+mp"}
	else
		if sum[workflow.nowjob]==nil then sum[workflow.nowjob]=0 end
		sum[workflow.nowjob]=sum[workflow.nowjob]+add.exp
		if workflow.nowjob=="mp" then
			alias.setmpReCountTime()
			mpLimited.mpexp=mpLimited.mpexp+add.exp
		end
		if count[workflow.nowjob]==nil then count[workflow.nowjob]=0 end
		count[workflow.nowjob]=count[workflow.nowjob]+1
		print("����exp��"..add.exp..",����gold��"..add.gold)
		--###-- #if @explist.keephour {setExplist}
	end
	addlog(w[3].."����exp��"..add.exp)
	closeclass("check_exp")
	run("hp;set checkexpover="..w[3])
end
------------------------------------------------------------------------------------
-- check_items
------------------------------------------------------------------------------------
function check_items.dosomething1(n,l,w)
	local a,b,c
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkitems=yes �ı����趨��") then
		alias.resetidle()
		if have.nousejy==1 then alias.flyto("����")
		else
			closeclass("check_items")
			alias.dealwithitems()
		end
	end
	if findstring(l,"�������������Ǹ���,Ϻ�׶��ǳ������������������") then
		alias.resetidle()
		if have.nousejy==1 then run("give "..dummy.id.." jing yao") end
	end
	a,b,c=string.find(l, "���(.-)һ[��|��|ҳ]+.+��Ҫ��")
	if c~=nil then
		have.nousejy=0
		have.jingyao=have.jingyao-1
		run("e")
		closeclass("check_items")
		alias.dealwithitems()
	end
	if findstring(l,"��������һ������������С�ߣ���ס���������¡�") then
		have.guaishe=1
	end
end
function check_items.dosomething2(n,l,w)
	local _t,a,b,c,d,e
	a,b,c,_t=string.find(l, "%s*(.-)[��|��]+(.+)��%(.*dao%)")
	if c~=nil and _t~=nil then
		if findstring(_t,"�ϵ���") then run("drop dao") else have.dao=have.dao+ctonum(c) end
	end
	a,b,c,_t=string.find(l, "%s*(.-)[��|��]+(.+)��%(Blade%)")
	if c~=nil and _t~=nil then
		if findstring(_t,"�ϵ���") then run("drop dao") else have.dao=have.dao+ctonum(c) end
	end
	a,b,c,_t=string.find(l, "%s*(.+)��(.+)��%(Bian%)")
	if c~=nil and _t~=nil then
		if findstring(_t,"�ϵ���") then run("drop bian") else have.whip=have.whip+ctonum(c) end
	end
	a,b,c,_t=string.find(l, "%s*(.-)[��|��]+(.+)��%(.*jian%)")
	if c~=nil and _t~=nil then
		if findstring(_t,"�ϵ���") then run("drop jian")
		elseif findstring(_t,"��") then have.zhongjian=have.zhongjian+ctonum(c)
		else have.jian=have.jian+ctonum(c) end
	end
	a,b,_t=string.find(l, "%s*(.+)��������%(Gouzhi zi%)")
	if _t~=nil then have.gouzhizi=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)����������%(Longjing%)")
	if _t~=nil then for i=1,ctonum(_t),1 do run("drop longjing") end end
	a,b,_t=string.find(l, "%s*(.+)���������ڹ��ķ���%(Xuanmen xinfa%)")
	if _t~=nil then have.xinfa=ctonum(_t) end
	a,b,c,d=string.find(l, "%s*(.-)[��|��|ҳ]+(.+)��Ҫ%(.+yao%)")
	if c~=nil and d~=nil then
		have.jingyao=have.jingyao+ctonum(c)
		have.nousejy=1
		for k,v in skillslist do
			if v["name"]==d then have.nousejy=0;break end
		end
	end
	a,b,_t=string.find(l, "%s*(.+)����ͷ��%(Rentou lian%)")
	if _t~=nil then have.rentoulian=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)����ӥ��%(Tianying ling%)")
	if _t~=nil then have.tyl=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)��������%(Tieyan ling%)")
	if _t~=nil then have.tyl=ctonum(_t) end
	if findstring(l,"����ͷ��%(Rentou lian%)") then have.rentoulian=have.rentoulian+1 end
	a,b,_t=string.find(l, "%s*(.+)�����ù�%(Kulou guan%)")
	if _t~=nil then have.kulouguan=ctonum(_t) end
	if findstring(l,"�����ù�%(Kulou guan%)") then have.kulouguan=have.kulouguan+1 end
	a,b,_t=string.find(l, "%s*(.+)������%(Fa ling%)")
	if _t~=nil then have.faling=ctonum(_t) end
	if findstring(l,"������%(Fa ling%)") then have.faling=have.faling+1 end
	a,b,c,_t=string.find(l, "%s*(.+)��(.+)�ƴ�%(Jiudai%)")
	if c~=nil then have.jiudai=ctonum(c) end
	a,b,_t=string.find(l, "%s*(.+)��­��%(Lubo%)")
	if _t~=nil then have.lubo=ctonum(_t) end
	if findstring(l,"��­��%(Lubo%)") then have.lubo=have.lubo+1 end
	a,b,_t=string.find(l, "%s*(.+)��ʳ��%(Shi he%)")
	if _t~=nil then have.he=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)���ⵣ%(Biandan%)")
	if _t~=nil then have.staff=have.staff+ctonum(_t);staffid="biandan" end
	a,b,_t=string.find(l, "%s*(.+)��������%(Guai shezhang%)")
	if _t~=nil then have.staff=ctonum(_t);staffid="staff" end
	a,b,_t=string.find(l, "%s*(.+)�������%(.*bang%)")
	if _t~=nil then have.stick=have.stick+ctonum(_t);have.stick_huangzhu=have.stick_huangzhu+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)����ü��%(Qimei gun%)")
	if _t~=nil then have.club=have.club+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)����ɨ��%(Sao ba%)")
	if _t~=nil then
		have.staff=have.staff+ctonum(_t)
		if staffid=="biandan" or staffid=="staff" or staffid=="qin" or staffid=="" then staffid="ba" end
	end
	a,b,_t=string.find(l, "%s*(.+)��ͭ��%(.*bang%)")
	if _t~=nil then have.stick=have.stick+ctonum(_t);have.stick_tong=have.stick_tong+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)�����%(.*bang%)")
	if _t~=nil then have.stick=have.stick+ctonum(_t);have.stick_zhu=have.stick_zhu+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)�����������%(Armor%)")
	if _t~=nil then run("drop armor") end
	a,b,_t=string.find(l, "%s*(.+)�����������%(Tie jia%)")
	if _t~=nil then run("drop armor") end
	a,b,_t=string.find(l, "%s*(.+)������%(Armor%)")
	if _t~=nil then have.armor=have.armor+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)������%(Tie jia%)")
	if _t~=nil then have.armor=have.armor+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)�ô�Ѫ��%(Da xueteng%)")
	if _t~=nil then have.xueteng=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)�õ���%(Dang gui%)")
	if _t~=nil then have.danggui=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)�����ھ�%(Shouwu jing%)")
	if _t~=nil then have.swjing=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)������%(Sheng zi%)")
	if _t~=nil then have.shengzi=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)�������˵�%(Xuming badan%)")
	if _t~=nil then have.dan=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)����ҩ%(Jinchuang yao%)")
	if _t~=nil then have.jcy=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)������%(Silver%)")
	if _t~=nil then have.silver=ctonum(_t) end
	a,b,c=string.find(l, "%s*(.+)���ƽ�%(Gold%)")
	if c~=nil then
		have.gold=ctonum(c)
		if mark.setgold>0 then
			mark.gold=have.gold
			mark.setgold=0
		end
	end
	a,b,_t=string.find(l, "%s*(.+)ö������%(Tie bagua%)")
	if _t~=nil then have.bagua=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)�����͹�%(Suyou guan%)")
	if _t~=nil then have.syguan=have.syguan+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)����ͭ����%(Ling pai%)")
	if _t~=nil then have.ling=have.ling+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)Ǯ����%(Chuanbei%)")
	if _t~=nil then have.chuanbei=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)Ǯ����%(Huanglian%)")
	if _t~=nil then have.huanglian=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)Ǯ������%(Jinyin hua%)")
	if _t~=nil then have.jinyinhua=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)Ǯ�չ�%(Jugeng%)")
	if _t~=nil then have.jugeng=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)Ǯ����%(Shengdi%)")
	if _t~=nil then have.shengdi=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)Ǯ����%(Fuling%)")
	if _t~=nil then have.fuling=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)��Ƥ����%(Yao dai%)")
	if _t~=nil then have.yaodai=have.yaodai+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)������%(Tie lian%)")
	if _t~=nil then have.chain=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)��ͭǮ%(Coin%)")
	if _t~=nil then have.coin=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)������%(Yao qin%)")
	if _t~=nil then
		have.staff=have.staff+ctonum(_t)
		if staffid=="biandan" or staffid=="staff" or staffid==""or staffid==nil then staffid="qin" end
	end
	a,b,_t=string.find(l, "%s*(.+)ƿ��佬%(Yufeng jiang%)")
	if _t~=nil then have.yufengjiang=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)֧������%(Heshouwu%)")
	if _t~=nil then have.heshouwu=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)֧����%([Fire|Huo zhe]+%)")
	if _t~=nil then have.fire=ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)֧�йٱ�%(Panguan bi%)")
	if _t~=nil then have.bi=have.bi+ctonum(_t) end
	a,b,_t=string.find(l, "%s*(.+)ֻ����%(Fa lun%)")
	if _t~=nil then have.falun=ctonum(_t)
		if have.falun>5 then run("drop 1 fa lun") end 
	end
	if findstring(l,"%s+������%(Qiguo ji%)") then have.ji=have.ji+1 end
	if findstring(l,"%s+����%(Fuling%)") then have.fuling=have.fuling+1 end
	a,b,_t=string.find(l, "��(.+)%(Cloth%)")
	if _t~=nil then run("drop cloth") end
	a,b,_t=string.find(l, "��(.+)��%(Bian%)")
	if _t~=nil then have.whip=have.whip+1;weapon_now="bian" end
	a,b,_t=string.find(l, "��(.+)��%(.*dao%)")
	if _t~=nil then have.dao=have.dao+1;weapon_now="dao" end
	a,b,_t=string.find(l, "��(.+)��%(Blade%)")
	if _t~=nil then have.dao=have.dao+1;weapon_now="dao" end
	a,b,_t=string.find(l, "��(.+)��%(.*jian%)")
	if _t~=nil then
		if string.find(_t,"��") then
			have.zhongjian=have.zhongjian+1
			weapon_now="zhongjian"
		else
			have.jian=have.jian+1
			weapon_now="jian"
		end
	end
	if findstring(l,"���ⵣ%(Biandan%)") then have.staff=have.staff+1;weapon_now="biandan" end
	if findstring(l,"������%(Tie lian%)") then have.chain=have.chain+1;weapon_now="chain" end
	if findstring(l,"��������%(Guai shezhang%)") then have.staff=have.staff+1;weapon_now="staff" end
	if findstring(l,"�������%(.+bang%)") then have.stick=have.stick+1;have.stick_huangzhu=have.stick_huangzhu+1;weapon_now="bang" end
	if findstring(l,"��Ƥ����%(Yao dai%)") then have.yaodai=have.yaodai+1 end
	if findstring(l,"��������%(Armor%)","��������%(Tie jia%)") then run("drop armor") end
	if findstring(l,"����ü��%(Qimei gun%)") then have.club=have.club+1;weapon_now="gun" end
	if findstring(l,"������%(Armor%)","������%(Tie jia%)") then have.armor=have.armor+1 end
	if findstring(l,"��ͭ��%(.+bang%)") then have.stick=have.stick+1;have.stick_tong=have.stick_tong+1;weapon_now="bang" end
	if findstring(l,"������%(Yao qin%)") then have.staff=have.staff+1;weapon_now="qin" end
	if findstring(l,"�����%(.+bang%)") then have.stick=have.stick+1;have.stick_zhu=have.stick_zhu+1;weapon_now="bang" end
	a,b,_t=string.find(l, "��(.+)ֻ����%(Fa lun%)")
	if _t~=nil then have.falun=ctonum(_t);weapon_now="lun" end
end
function check_items.dosomething3(n,l,w)
	have.luboneedfill=0
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function checki.update()
	_tb={
		"��Ŀǰ��û���κ�Ϊ checkitems=yes �ı����趨��",
		"�������������Ǹ���,Ϻ�׶��ǳ������������������",
		"���(.+)һ(��|��|ҳ).+��Ҫ��",
		"��������һ������������С�ߣ���ס���������¡�",
	}
	local  check_items_triggerlist={
	       {name="check_items_dosth1",regexp=linktri(_tb),script=function(n,l,w)    check_items.dosomething1(n,l,w)  end,},
	       {name="check_items_dosth2",regexp="(.+)\\((.+)\\)",script=function(n,l,w)    check_items.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(check_items_triggerlist) do
		addtri(v.name,v.regexp,"check_items",v.script,v.line)
	end
	local  check_items_m_triggerlist={
	       {name="check_items_dosth3",line=2,regexp="^(> > > |> > |> |)һ����­���ƳɵĲ���\\n����װ(����|���ߡ��˷���|���塢������)\\Z",script=function(n,l,w)    check_items.dosomething3(n,l,w)  end,},
	}
	for k,v in pairs(check_items_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"check_items",v.script,v.line)
	end
	closeclass("check_items")
	
	_tb={
		"��Ŀǰ��û���κ�Ϊ checkexp=(.+) �ı����趨��",
	}
	local  check_exp_triggerlist={
	       {name="check_exp_dosth1",regexp=linktri(_tb),script=function(n,l,w)    check_exp.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(check_exp_triggerlist) do
		addtri(v.name,v.regexp,"check_exp",v.script,v.line)
	end
	closeclass("check_exp")
	
	_tb={
		"(��ɽ��|��һ��)���ڵ��ϣ������˼��¾����ˡ�",
		"���(��ɽ��|��һ��)��ʬ�������ѳ�һ֧�йٱʡ�",
		"�����һ֧�йٱʡ�",
		"����һ�ɴ����йء�����ʮ�����ɣ�������Ϣ��",
		"������ɽ������йء�����ʮ�����ɣ�������Ϣ��",
		"�������磬���ֵ�ͼ��1094�������",
		"�������磬���ֵ�ͼ��1101�������",
		"����û�� fan ����ˡ�",
		"����û�� qiu ����ˡ�",
	}
	local  dealwith_bi_triggerlist={
	       {name="dealwith_bi_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_bi.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_bi_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_bi",v.script,v.line)
	end
	closeclass("dealwith_bi")
	
	_tb={
		"(����Ů|������)���ڵ��ϣ������˼��¾����ˡ�",
		"���(����Ů|������)��ʬ�������ѳ�һ����ޡ�",
		"�����һ����ޡ�",
		"��������Ů�����йء�����ʮ�����ɣ�������Ϣ��",
		"����������ˡ��ٺٺ١���Ц�˼�����",
		"�������磬���ֵ�ͼ��312�������",
		"��Ҫ��˭�� hehe ���������",
		"����û�� nu ����ˡ�",
	}
	local  dealwith_bian_triggerlist={
	       {name="dealwith_bian_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_bian.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_bian_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_bian",v.script,v.line)
	end
	closeclass("dealwith_bian")
	
	_tb={
		"����������������һ��������",
		"������Ķ���������û�С�",
		"��һ�죬�������ɫ�Ʋ���ӭȢ����骡�",
		"����û�� gao ����ˡ�",
		"��һ�죬�������ɫ�Ʋ���ӭȢ������̩��",
		"����̩˵����.*(��ȥ���ݴ����̵�����|�������ȥ���ҿ�����)",
		"����̩˵����(��ղŲ����������������|�����Ѿ������ˣ����Ѿ���)",
		"����̩˵��������ȥ���������д�ܶ�Ź�İ������͸����괦�á�",
		"��һ�죬�������ɫ�Ʋ���ӭȢ����������",
	}
	local  dealwith_chain_triggerlist={
	       {name="dealwith_chain_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_chain.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_chain_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_chain",v.script,v.line)
	end
	closeclass("dealwith_chain")
	
	_tb={
		"����������е�����ǿ��ѹ�ص��վ��������",
		"��ӳ��е�ʬ�������ѳ�һ�ѽ䵶��",
		"��ӵ�Ʒ��ʦ��ʬ�������ѳ�һ�ѽ䵶��",
		"��ӻ������ߵ�ʬ�������ѳ�һ�ѽ䵶��",
		"����ŵ�Ʒ��ʦ���ٺٺ١���Ц�˼�����",
		"�����һ�ѽ䵶��",
		"��˵����������ü��ѽ����",
		"����û������ˡ�",
		"(����|��Ʒ��ʦ|��������)���ڵ��ϣ������˼��¾����ˡ�",
		"��������һ���䵶��",
		"������ʦ˵������Ǹ�������ò���ʱ�������Ѿ������ˡ�",
		"��Ҫ��˭�� hehe ���������",
		"��Ҫ��˭�� ysis ���������",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����С�",
		"��һ�죬�������ɫ�Ʋ���ӭȢ��������",
		"��һ�죬�������ɫ�Ʋ���ӭȢ����Ʒ��",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����硻",
		"����û�� chanshi ����ˡ�",
		"�������磬���ֵ�ͼ��964�������",
		"�����ͷ��ʬ�������ѳ�һ���ֵ���",
		"�����һ���ֵ���",
		"��ͷ���ڵ��ϣ������˼��¾����ˡ�",
	}
	local  dealwith_dao_triggerlist={
	       {name="dealwith_dao_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_dao.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_dao_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_dao",v.script,v.line)
	end
	closeclass("dealwith_dao")
	
	_tb={
		"��Ŀǰ��û���κ�Ϊ check=falun �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ check=burn �ı����趨��",
		"�������磬���ֵ�ͼ��(431|423|428|437)�������",
	}
	local  dealwith_xs_triggerlist={
	       {name="dealwith_xs_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_xs.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_xs_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_xs",v.script,v.line)
	end
	closeclass("dealwith_xs")
	
	_tb={
		"�����ͨ������������һǮ���ߡ�",
		"Ӵ����Ǹ�����������æ���ء��������Ժ�",
		"��һ�죬�������ɫ�Ʋ���ӭȢ����ͨ�Ρ�",
	}
	local  dealwith_fuling_triggerlist={
	       {name="dealwith_fuling_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_fuling.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_fuling_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_fuling",v.script,v.line)
	end
	closeclass("dealwith_fuling")
	
	_tb={
		"����˵�����ҡ���֪����",
		"�Է���û����ȫ���ԣ��ȵȵȰɡ�",
		"�㽫���ϰ�����������ڱ��ϡ�",
		"��Ŀǰ��û���κ�Ϊ busyover=killwang �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ busyover=stealwu �ı����趨��",
		"�������ԵĶ��������",
		"Ǯׯ���ϲ�������������������",
		"���嵹�ڵ��ϣ������˼��¾����ˡ�",
		"�������һ�����ȣ����ڵ��ϻ��˹�ȥ��",
		"����˵�������Ӿ��ǹ����壬��������������ӣ��������ɣ�",
		"���ϰ����һ�����ȣ����ڵ��ϻ��˹�ȥ��",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����ǹ���",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����桻",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����塻",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����ϰ塻",
		"����û�� wang ����ˡ�",
	}
	local  dealwith_gold_triggerlist={
	       {name="dealwith_gold_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_gold.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_gold_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_gold",v.script,v.line)
	end
	closeclass("dealwith_gold")
	
	_tb={
		"(�μ�|����)���ڵ��ϣ������˼��¾����ˡ�",
		"��������һ����ü����",
		"���(�μ�|����)��ʬ�������ѳ�һ����ü����",
		"����ų��顸�ٺٺ١���Ц�˼�����",
		"�����һ����ü����",
		"��˵�����μ���ü��ѽ����",
		"������ʦ˵������Ǹ�������ò���ʱ�������Ѿ������ˡ�",
		"��Ҫ��˭�� hehe ���������",
		"��Ҫ��˭�� ysis ���������",
		"��һ�죬�������ɫ�Ʋ���ӭȢ���μš�",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����须",
		"��һ�죬�������ɫ�Ʋ���ӭȢ��������",
		"����û�� chanshi ����ˡ�",
	}
	local  dealwith_gun_triggerlist={
	       {name="dealwith_gun_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_gun.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_gun_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_gun",v.script,v.line)
	end
	closeclass("dealwith_gun")
	
	_tb={
		"���(������|���)����������һ��ʳ�С�",
		"���(������|���)����������һ֧���ۡ�",
		"������Ķ���������û�С�",
		"���������������йء���û����������Ϣ��",
		"Ӵ����Ǹ�����������æ���ء��������Ժ�",
		"��һ�죬�������ɫ�Ʋ���ӭȢ����骡�",
		"��һ�죬�������ɫ�Ʋ���ӭȢ����������",
		"����û�� Yang yongfu ����ˡ�",
		"�ӻ������ϲ�������������������",
	}
	local  dealwith_he_triggerlist={
	       {name="dealwith_he_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_he.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_he_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_he",v.script,v.line)
	end
	closeclass("dealwith_he")
	
	_tb={
		"������ϰ�����������.+����������",
		"�������ϰ�����йء��������ڲ�������Ϣ��",
		"Ӵ����Ǹ�����������æ���ء��������Ժ�",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����ϰ塻",
		"����û�� song laoban ����ˡ�",
	}
	local  dealwith_ji_triggerlist={
	       {name="dealwith_ji_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_ji.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_ji_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_ji",v.script,v.line)
	end
	closeclass("dealwith_ji")
	
	_tb={
		"(��|��|��)����ʿ���ڵ��ϣ������˼��¾����ˡ�",
		"���(��|��|��)����ʿ��ʬ�����ϳ���һ�����ס�",
		"���(��|��|��)����ʿ��ʬ�������ѳ�һ��.+����",
		"�����һ��.+����",
		"��Ŀǰ��û���κ�Ϊ check=jian �ı����趨��",
		"����(��|��|��)����ʿ�����йء��ȼ��ɱ������Ϣ��",
		"˫�ɣ����ɣ����һ��ɣ��ȡ�.+ ���� (��|��|��)����ʿ ���еĵ� .+������",
		"��һ�죬�������ɫ�Ʋ���ӭȢ��������ʿ��",
		"����û�� wei shi ����ˡ�",
	}
	local  dealwith_jian_triggerlist={
	       {name="dealwith_jian_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_jian.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_jian_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_jian",v.script,v.line)
	end
	closeclass("dealwith_jian")
	
	_tb={
		"��ӵ�С������������һ��ţƤ�ƴ���",
		"�㽫.+�ƴ������˴�ľͰ��ʢ������ˮ��",
		"��Ŀǰ��û���κ�Ϊ busyover=fill �ı����趨��",
		"�����С�������йء�����¥������Ϣ��",
		"�������ϰ�����йء�����¥��¥������Ϣ��",
		"�������磬���ֵ�ͼ��1805�������",
		"�������磬���ֵ�ͼ��437�������",
		"�������磬���ֵ�ͼ��948�������",
		"�������磬���ֵ�ͼ��1447�������",
		"�������磬���ֵ�ͼ��537�������",
		"��һ�죬�������ɫ�Ʋ���ӭȢ��С橡�",
		"����û�� xian laoban ����ˡ�",
		"����û�� xiao er ����ˡ�",
	}
	local  dealwith_jiudai_triggerlist={
	       {name="dealwith_jiudai_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_jiudai.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_jiudai_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_jiudai",v.script,v.line)
	end
	closeclass("dealwith_jiudai")
	
	_tb={
		"��Ŀǰ��û���κ�Ϊ sellyao=over �ı����趨��",
		"��һ�죬�������ɫ�Ʋ���ӭȢ���κ�ҩ��",
	}
	local  dealwith_sellyao_triggerlist={
	       {name="dealwith_sellyao_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_sellyao.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_sellyao_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_sellyao",v.script,v.line)
	end
	closeclass("dealwith_sellyao")
	
	_tb={
		"���С������������һ�����ӡ�",
		"����С�������йء��ϵ����������ۡ�������Ϣ��",
		"�������磬���ֵ�ͼ��615�������",
		"�������磬���ֵ�ͼ��837�������",
		"����û�� seller ����ˡ�",
		"����û�� xiao fan ����ˡ�",
	}
	local  dealwith_shengzi_triggerlist={
	       {name="dealwith_shengzi_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_shengzi.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_shengzi_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_shengzi",v.script,v.line)
	end
	closeclass("dealwith_shengzi")
	
	_tb={
		"��һ�죬�������ɫ�Ʋ���ӭȢ������㡻",
		"��һ�죬�������ɫ�Ʋ���ӭȢ����ǫ��",
	}
	local  dealwith_tyl_triggerlist={
	       {name="dealwith_tyl_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_tyl.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_tyl_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_tyl",v.script,v.line)
	end
	closeclass("dealwith_tyl")
	
	_tb={
		"��Ů���ڵ��ϣ������˼��¾����ˡ�",
		"��Ӹ�Ů��ʬ�������ѳ�һ��.+�١�",
		"���С������������һ���ⵣ��",
		"�����ͷ������ŷ���˽���̬֮���������ɷ������һ������չ�ȥ��������������һ�¡�",
		"�㸽��û������������",
		"�����Ů�����йء�����ʮ�����ɣ�������Ϣ��",
		"��Ҫ��˭�� kiss4 ���������",
		"���Ҳ��� corpse ����������",
		"�������磬���ֵ�ͼ��1383�������",
		"�������磬���ֵ�ͼ��280�������",
		"�������磬���ֵ�ͼ��926�������",
		"����û�� nu ����ˡ�",
	}
	local  dealwith_staff_triggerlist={
	       {name="dealwith_staff_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_staff.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_staff_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_staff",v.script,v.line)
	end
	
	_tb={
		"����ŷ���˴����йء����ߡ�����Ϣ��\\n���Ǻ���Ȼ�ģ�ŷ�������ڵ�״��û�а취�����κδ𸲡�\\Z",
		"����ŷ���˴����йء����ߡ�����Ϣ��\\n�Է���æ���أ���Ȼ�����ʻ��ɡ�\\Z",
		"����ŷ���˴����йء����ߡ�����Ϣ��\\nŷ����˵���������ѱ�����ٿ�һ�������Ѿ�ʮ�ֳ��������ܿ��Ƹ���Ĺ����ˡ�\\Z",
		"ŷ���˸���һֻ���ߡ�\\nŷ���˸���һ�������ȡ�\\Z",
	}
	local  dealwith_staff_m_triggerlist={
	       {name="dealwith_staff_dosth2",line=2,regexp=linktri(_tb),script=function(n,l,w)    dealwith_staff.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_staff_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"dealwith_staff",v.script,v.line)
	end
	closeclass("dealwith_staff")
	
	_tb={
		"���Ī���յ�ʬ�������ѳ�һ��ͭ����",
		"��˵����Ī������ü��ѽ����",
		"������һ�����ӣ�����һֻ�����",
		"Ī���յ��ڵ��ϣ������˼��¾����ˡ�",
		"������������Ӷ��ع��ˡ�",
		"��Ŀǰ��û���κ�Ϊ checkbang=yes �ı����趨��",
		"��Ҫ��˭�� ysis ���������",
		"�������磬���ֵ�ͼ��1118�������",
		"�������磬���ֵ�ͼ��2048�������",
	}
	local  dealwith_stick_triggerlist={
	       {name="dealwith_stick_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_stick.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_stick_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_stick",v.script,v.line)
	end
	
	_tb={
		"�㸽��û������������\\n�㸽��û������������\\Z",
		"�����һ���������\\n�㸽��û������������\\Z",
		"�����һ���������\\n�����һ���������\\Z",
		"�����һ���������\\n�����һ��ͭ����\\Z",
		"�����һ���������\\n�����һ�������\\Z",
		"�����һ��ͭ����\\n�㸽��û������������\\Z",
		"�����һ��ͭ����\\n�����һ���������\\Z",
		"�����һ��ͭ����\\n�����һ��ͭ����\\Z",
		"�����һ��ͭ����\\n�����һ�������\\Z",
		"�����һ�������\\n�㸽��û������������\\Z",
		"�����һ�������\\n�����һ���������\\Z",
		"�����һ�������\\n�����һ��ͭ����\\Z",
		"�����һ�������\\n�����һ�������\\Z",
	}
	local  dealwith_stick_m_triggerlist={
	       {name="dealwith_stick_dosth2",line=2,regexp=linktri(_tb),script=function(n,l,w)    dealwith_stick.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_stick_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"dealwith_stick",v.script,v.line)
	end
	closeclass("dealwith_stick")
	
	_tb={
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����硻",
	}
	local  dealwith_yaodai_triggerlist={
	       {name="dealwith_yaodai_dosth1",regexp=linktri(_tb),script=function(n,l,w)    dealwith_yaodai.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_yaodai_triggerlist) do
		addtri(v.name,v.regexp,"dealwith_yaodai",v.script,v.line)
	end

	_tb={
		"���򾲷�����йء���Ҷ��������Ϣ��\\n����ʦ̫����һ����Ҷ����\\Z",
		"���򾲷�����йء���Ҷ��������Ϣ��\\n����˵����.+���������ϲ�������Ҷ������������Ҫ�ˣ� ����̰�����У�\\Z",
		"���򾲷�����йء���Ҷ��������Ϣ��\\n����˵�����Ҳ��Ǹո���������������Ҫ�ˣ�����̰�����У�\\Z",
		"���򾲷�����йء�Ƥ����������Ϣ��\\n����ʦ̫����һ��Ƥ������\\Z",
		"���򾲷�����йء�Ƥ����������Ϣ��\\n����˵����.+���������ϲ�����Ƥ��������������Ҫ�ˣ� ����̰�����У�\\Z",
		"���򾲷�����йء�Ƥ����������Ϣ��\\n����˵�����Ҳ��Ǹո���������������Ҫ�ˣ�����̰�����У�\\Z",
		"���򾲷�����йء���������Ϣ��\\n����ʦ̫����һ������\\Z",
		"���򾲷�����йء���������Ϣ��\\n����˵����.+���������ϲ�����������������Ҫ�ˣ� ����̰�����У�\\Z",
		"���򾲷�����йء���������Ϣ��\\n����˵�����Ҳ��Ǹո���������������Ҫ�ˣ�����̰�����У�\\Z",
		"���򾲷�����йء���������ࡹ����Ϣ��\\n����˵�����Ҳ��Ǹո�����һ���������������������Ҫ�ˣ� ����̰�����У�\\Z",
		"���򾲷�����йء���������ࡹ����Ϣ��\\n����һ����������ࡣ\\Z",
	}
	local  dealwith_yaodai_m_triggerlist={
	       {name="dealwith_yaodai_dosth2",line=2,regexp=linktri(_tb),script=function(n,l,w)    dealwith_yaodai.dosomething2(n,l,w)  end,},
	}
	for k,v in pairs(dealwith_yaodai_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"dealwith_yaodai",v.script,v.line)
	end
	closeclass("dealwith_yaodai")
end
checki.update()