skills={}
skills_xue_cls={}
skills_ask={}
skills_lian={}
skills_lingwu_cls={}
skills_jingyao={}

if me==nil then me={} end
if me.master==nil then me.master="" end
if me.masterid==nil then me.masterid="" end
if me.litmaster==nil then me.litmaster="" end
if me.litmasterid==nil then me.litmasterid="" end
------------------------------------------------------------------------------------
-- skills_xue_cls
------------------------------------------------------------------------------------
function skills_xue_cls.dosomething1(n,l,w)
	local _f,_tb,a,b,c,d
	wait.make(function()
		if findstring(l,"����"..me.master.."�����йء��ú�ѧϰ���������ϣ�������Ϣ��","����"..me.litmaster.."�����йء��ú�ѧϰ���������ϣ�������Ϣ��") then
			alias.xuemaster()
		end
		if findstring(l,"����������е�����ǿ��ѹ�ص��վ��������") then
			if havefj>0 then
				alias.close_dz()
				alias.uw()
				run("set startworkflow=yes")
			else
				if me.menpai=="wd" and wx.taiji==0 then
					alias.close_dz()
					alias.wi("jian")
					run("yun taiji")
					alias.checkbusy("taijistart")
				else run("yun regenerate;hp;set check=neili") end
			end
		end
		if findstring(l,"��������Ϣ��Ӳ�����ؽ���Ϣѹ����ȥ������վ��������","�����ھ��񲻼ѣ��޷���������˼����","��ľ�̫����") then
			if havefj>0 then
				alias.uw()
				run("yun regenerate;set startworkflow=yes")
			else
				run("yun regenerate;hp;set check=neili")
			end
		end
		if findstring(l,"���Ǳ�ܲ�����û�а취�ٳɳ��ˡ�","ѧϰ֪ʶ��Ҫ����Ժ���ܾ���ѧϰ��","���Ǳ�ܲ���") then
			alias.ch()
			closeclass("skills_ask")
			run("set xue=over")
		end
		if findstring(l,"������.+�Ľ��⣬�ƺ�������⣬ȴ�ֲ�����ȫ������е����⡣","�������ϰ��죬�ʾ�����֭Ҳ�޷����.+��������.+�ľ�Ҫ��","����ϸ����.+�Ľ��⣬ϸ�����������еİ������ڡ�","�㿪ʼ��.+����йء�.+�������ʡ�") then
			alias.resetidle()
		end
		if findstring(l,"{�������д����й�","�������й�ͬ����","��Ǳ�Ŀ�˼","���ĸ�����","��ֻ������̨һƬ����","����˼����") then
			alias.resetidle()
		end
		if findstring(l,"���ʵս���黹���㣬���ܼ���ѧϰ����ܣ�","�������ĳ̶��Ѿ�������ʦ���ˡ�","���������±����ұ���ѧ�ˡ�","�����ڲ�ͬ���������ײ����������������ڹ���","����ڹ�ˮƽ���޷�����ѧϰ������","��Զ���ȱ��ʵ��Ӧ�ã����Լ�����ߡ�","�����ھ۶����࣬���Լ�����ߡ�","ѧ�����󷨣�Ҫ�ĺ���������������������ò���ѽ��","���ܴ����������书","Ҳ����ȱ��ʵս����") then
			alias.resetidle()
			if skills_num==nil then skills_num=1 end
			skills_num=skills_num+1
			_tb=utils.split(skills_xue,"|")
			if skills_num>table.getn(_tb) or (xuelit>0 and daytime) then
				skillsfull=1
				if xuelit>0 then havegoldxuelit=0;xuelit=0 end
				run("set xue=over")
			else alias.xuemaster() end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=taijiover �ı����趨��") then
			run("yun regenerate;hp;set check=neili")
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=taijistart �ı����趨��") then
			alias.xuemaster()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=masterid �ı����趨��") then
			if me.masterid==nil or string.len(me.masterid)==0 then
				print("δ��ȡ��ʦ����id������Ϊ����ģʽ")
				usepot="lingwu"
				alias.startxue()
			else
				skills_num=1
				alias.xuemaster()
			end
		end
		if findstring(l,".+�̵���ϣ������������򣬻��ĵص��˵�ͷ��","������.+��ָ�����ƺ���Щ�ĵá�") then
			if me.menpai=="th" then run("huan all") end
			if havefj>0 then
				alias.uw()
				run("set startworkflow=yes")
			else
				if me.menpai=="wd" and wx.taiji==0 then
					alias.wi("jian")
					run("yun taiji")
					alias.checkbusy("taijistart")
				else
					if me.menpai=="em" then alias.yunem() end
					if hp.jing<(hp.maxjing/2) then run("yun regenerate") end
					run("hp;set check=neili")
					--run("yun regenerate;hp;set check=neili")
				end
			end
		end
		if findstring(l,".+˵��Ǯ��������֮��Ҳ������") then
			xuelit=0
			alias.ch()
			run("set xue=over")
		end
		if findstring(l,"��Ҫ��˭��̣�") then
			if dummy.laopo~=nil and dummy.laopo~="" then dummy.laopo="" end
			alias.startworkflow()
		end
		--a,b,c,d=string.find(l,mj.master.."%s+=%s+(%w+)%s+(%w+),%s+")
		--if c~=nil and d~=nil then me.masterid=string.lower(c).." "..string.lower(d)	end
		a,b,c=string.find(l,me.master.."%s+=%s+%w+%s+%w+,%s+(%w+)")
		if c~=nil then me.masterid=string.lower(c) end
		if findstring(l,me.master.."ҡ��ҡͷ������������ˡ�",tostring(me.litmaster).."ҡ��ҡͷ������������ˡ�") then
			_f=function() alias.xuemaster() end
			wait.time(0.5);_f()
		end
		if findstring(l,me.master.."������æ���ء�",tostring(me.litmaster).."������æ���ء�") then
			_f=function() alias.xuemaster() end
			wait.time(0.5);_f()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ checkhp=addneili �ı����趨��") then
			if havefj>0 and hp.neili>(hp.maxneili*set_neili_job/100) then alias.tdz() end
		end
		if findstring(l,"����û�� "..tostring(me.masterid).." ����ˡ�","����û�� "..tostring(me.litmasterid).." ����ˡ�") then
			if xuelit>0 and not daytime then
				-- �ߵ���Ժ���
				alias.startworkflow()
			else
				-- ʦ��û�ˣ�������
				alias.resetidle()
				alias.dz("addneili")
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			if dummy.laopo~=nil and dummy.laopo~="" and roomname=="�����Ϣ��" then
				run("w");alias.xuemaster()
			elseif xuelit>0 and daytime then
				run("ask "..me.litmasterid.." about �ú�ѧϰ���������ϣ�")
			else
				run("ask "..me.masterid.." about �ú�ѧϰ���������ϣ�")
			end
			--if xuelit>0 then
			--	if daytime then
			--		run("ask "..me.litmasterid.." about �ú�ѧϰ���������ϣ�")
			--	else
			--		run("ask "..me.masterid.." about �ú�ѧϰ���������ϣ�")
			--	end
			--else run("ask "..me.masterid.." about �ú�ѧϰ���������ϣ�") end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ xue=over �ı����趨��") then
			alias.close_xue()
			if dummy.laopo~=nil and dummy.laopo~="" then run("tell "..dummy.laopo.." over") end
			--if have.jingyao>0 then
			--	openclass("skills_jingyao")
			--	alias.dujingyao()
			--else
			--	mark.setpot=1
			--	alias.uw()
			--	alias.startworkflow()
			--end
			_tb=utils.split(skills_xue,"|")
			if skills_num>table.getn(_tb) then
				usepot="lingwu"
				alias.startxue()
			else
				alias.startworkflow()
			end
		end
		if findstring(l,"��Ժ���ϲ�������������������") then
			daytime=false
		end
		if findstring(l,"һ��.+�������˹���,���㱨ȭ���������·�"..me.fjmasternick.."֮���������ٻ�.+����������") then
			run("halt")
		end
		if findstring(l,"��ҡ��ҡͷ��������������һ�Ž�������Ҫ��Ϣһ�¡�") then
			alias.resetidle()
			if me.menpai=="wd" then alias.checkbusy("taijiover")
			else run("yun regenerate;hp;set check=neili") end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=neili �ı����趨��") then
			alias.resetidle()
			if havefj>0 then
				alias.uw()
				run("set startworkflow=yes")
			else
				if mpJobLimited==0 then
					if me.menpai=="wd" or xuefirst>0 or workflow.mp==0 or (me.menpai=="gb" and gold.num>= gold.setnum and 3600-(os.time()-mpLimited.MarkTime)>30) then
						alias.xuemaster()
					else
						alias.uw()
						run("set startworkflow=yes")
					end
				else alias.xuemaster() end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ startworkflow=yes �ı����趨��") then
			alias.resetidle()
			mark.setpot=1
			alias.close_dz()
			alias.startworkflow()
		end
		if findstring(l,"��.+������֡�") then
			alias.resetidle()
			alias.uw()
			alias.xuemaster()
		end
		if findstring(l,"˫�ɣ����ɣ����һ��ɣ��ȡ�%d+ ���� "..me.master.." ���еĵ� %d+ ������") then
			skills_num=1
			if me.masterid==nil or string.len(me.masterid)==0 then
				run("id here;set check=masterid")
			else run("ask "..me.masterid.." about �ú�ѧϰ���������ϣ�") end
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ��"..tostring(me.master).."��","��һ�죬�������ɫ�Ʋ���ӭȢ��"..tostring(me.master).."��") then
			skills_num=1
			wx.taiji=0
			wx.zhixin=0
			if me.masterid==nil or string.len(me.masterid)==0 then
				run("id here;set check=masterid")
			else
				run("ask "..me.masterid.." about �ú�ѧϰ���������ϣ�")
			end
		end
		if findstring(l,"�������磬���ֵ�ͼ��"..tostring(me.masterroom).."�������") then
			skills_num=1
			wx.taiji=0
			wx.zhixin=0
			if me.masterid==nil or string.len(me.masterid)==0 then
				run("id here;set check=masterid")
			else
				run("ask "..me.masterid.." about �ú�ѧϰ���������ϣ�")
			end
		end
		if findstring(l,"�������������Ǹ���,Ϻ�׶��ǳ��������������Ϣ�ҡ������") then
			alias.xuemaster()
		end
		if findstring(l,"����δ��ᵽ̫��ȭּ��") then
			wx.taiji=-1
		end
		if findstring(l,"������������ϣ����������ڵ�����Ϲ�Ԫ��") then
			wx.taiji=0
		end
		if findstring(l,"��һ�죬�������ɫ�Ʋ���ӭȢ��"..me.litmaster.."��") then
			wx.taiji=0
			wx.zhixin=0
			if me.litmasterid=="zhu" then daytime=true end
			run("ask "..me.litmasterid.." about �ú�ѧϰ���������ϣ�")
		end
		if findstring(l,"��΢΢һЦ�����ӻ�����ת�����ֳֽ��������𣬽�������ǰ������˫��������ԣ��籧Բ��","���Ѿ���̫���ķ��ڻ����书֮�С�") then
			wx.taiji=1
		end
	end)
end
------------------------------------------------------------------------------------
-- skills_ask
------------------------------------------------------------------------------------
function skills_ask.timer()
	run("ask "..me.masterid.." about ".._tb[skills_num])
end
------------------------------------------------------------------------------------
-- skills_lian
------------------------------------------------------------------------------------
function skills_lian.dosomething1(n,l,w)
	local _f,_tb
	wait.make(function()
		if findstring(l,"��.+��.+����") then
			alias.resetidle()
			alias.uw()
			--weapon_id=weapon_id+1
			if me.master=="������" then run("jifa dodge dugu-jiujian") end
			_f=function() alias.lianskills() end
			wait.time(1);_f()
		end
		if findstring(l,"�㲻��ͨ����ϰ�м�����������","�������Ʊ���ͨ������ķ��Ų���������","������û����������������գ�����ô��Ҳû�ã�","������ֻ����ѧ(learn)�������������ȡ�") then
			alias.resetidle()
			skills_num=skills_num+1
			alias.lianskills()
		end
		if findstring(l,"�Ѿ���ϰ�������ˣ������ȴ�û������ܼ������") then
			alias.resetidle()
			if isopen("skills_lingwu") then
				_tb=utils.split(skills_lingwu,"|")
				if _tb[skills_num]=="force" then
					addforce=1
					skills_num=skills_num+1
				end
				alias.ch()
				run("set check=skills")
				if me.menpai=="bt" and roomno_now==me.menpailingwuid then run("hold yuanshi")
				elseif me.menpai=="xx" and roomno_now==me.menpailingwuid then run("kneel hassock")
				elseif me.menpai=="xs" and roomno_now==me.menpailingwuid then run("sit lianzuo")
				else alias.lingwuskills() end
			else
				skills_num=skills_num+1
				alias.lianskills()
			end
		end
		if findstring(l,"�������������","�������̫���ˡ�") then
			alias.resetidle()
			alias.tlw()
		end
		if findstring(l,"��ʹ�õ��������ԡ�") then
			_f=function()
						alias.uw()
						--weapon_id=weapon_id+1
						if me.master=="������" and skillsfull==0 then run("jifa dodge dugu-jiujian") end
						_tb=utils.split(skills_lingwu,"|")
						if _tb[skills_num]=="sword" then
							if me.menpai=="th" then
								if have.xiao>0 then alias.wi("xiao") else skills_num=skills_num+1 end
							else
								if have.jian>0 then alias.wi("jian") else skills_num=skills_num+1 end
							end
						end
						if _tb[skills_num]=="blade" then
							if have.dao>0 then alias.wi("dao") else skills_num=skills_num+1 end
						end
						if _tb[skills_num]=="staff" then
							if have.staff>0 then alias.wi(staffid) else skills_num=skills_num+1 end
						end
						if _tb[skills_num]=="whip" then
							if have.whip>0 then alias.wi("bian") else skills_num=skills_num+1 end
						end
						if _tb[skills_num]=="stroke" then
							if have.bi>0 then alias.wi("bi") else skills_num=skills_num+1 end
						end
						if _tb[skills_num]=="hammer" then
							if have.falun~=nil and have.falun>0 then alias.wi("lun") else skills_num=skills_num+1 end
						end
						if _tb[skills_num]=="stick" then
							if have.stick>0 then alias.wi("bang") else skills_num=skills_num+1 end
						end
						alias.lianskills()
				end
			wait.time(0.5);_f()
		end
		if findstring(l,"�����ڵ�����������") then
			alias.tlw()
		end
		if findstring(l,"����ϰ��ϣ���������һ��������Ŀ��") then
			alias.resetidle()
			if me.menpai=="em" then alias.yunem() end
			alias.yjl()
			_tb=utils.split(skills_lingwu,"|")
			if _tb[skills_num]=="force" then run("yun recover") end
			if isopen("mp_xs_lzjob") or isopen("mp_gb_pre") then run("set lian=over") else run("hp;set lian") end
		end
		if findstring(l,"��ֻ����ϰ�� enable ָ�������⼼��") then
			alias.resetidle()
			if isopen("mp_gb_pre") then
				closeclass("skills_lian")
				alias.uw()
				run("u")
				--lianwunum=0
				roomno_now=1116
				run("set lian=full")
			else run("set lian=over") end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ lian �ı����趨��") then
			alias.resetidle()
			--if isopen("mp_xs_npc1") then run("sd;nu") end
			if hp.neili<(hp.maxneili*set_neili/100) then
				closeclass("skills_lian")
				alias.dz(set_neili)
			else
				if havefj>0 and isopen("skills_lingwu") and not isopen("boat") then
					alias.uw()
					run("set startworkflow=yes")
				else
					if mpJobLimited==0 then
						if me.menpai=="wd" or xuefirst>0 or workflow.mp==0 or isopen("mp_qz_start") or isopen("mp_xs_npc1") or isopen("mp_xs_lzjob") or (me.menpai=="gb" and gold.num>=gold.setnum and 3600-(os.time()-mpLimited.MarkTime)>30) or (me.menpai=="gm") then
							alias.lianskills()
						else
							--if isopen("mp_gb_pre") then
							--	if havefj>0 then
							--		alias.uw()
							--		alias.startworkflow()
							--	else
							--		lianwunum=lianwunum+1
							--		if lianwunum>lianwunum_set then
							--			run("u")
							--			lianwunum=0
							--			roomno_now=1116
							--			alias.tlw()
							--			else alias.lianskills() end
							--	end
							--else
								if not isopen("boat") then
									alias.uw()
									alias.startworkflow()
								else alias.lianskills() end
							--end
						end
					else
						-- mp����
						alias.lianskills()
					end
				end
			end
		end
		if findstring(l,"���ȷ�ֻ����ʵս�����") then
			if skillslist["tianshan-zhang"]["lvl"]~=nil and skillslist["tianshan-zhang"]["lvl"]>0 then
				run("jifa staff tianshan-zhang")
				reEnableSkills=1
			else
				skills_num=skills_num+1
				alias.lianskills()
			end
		end
		if findstring(l,"��Ļ��������δ���������ȴ�û������ܼ�����ߡ�") then
			alias.resetidle()
			if isopen("skills_lingwu") then alias.lingwuskills()
			else
				skills_num=skills_num+1
				alias.lianskills()
			end
		end
		if findstring(l,"��һ�����е�.+����ʼ��ϰ.+��","������.+�����к����һ�С�.+��ʹ������ͬ������ˮ��","�㷴����ϰ��.+�еġ�.+������ȴ���ǲ���Ҫ�졣","���������е�.+, ��������ˮ���������.+�м�����ʽ����ȫ�����͵���","�㽫.+һ��һʽ��������������Ȼ�������⣬���������Ļ���Ӧ������������","��˳��.+��Ϣ����·�ߣ���������������������һ�������졣","�㰵�����˵���۾������������.+��") then
			alias.resetidle()
		end
		if findstring(l,"���������һ�����Ӳ�����.+�޷���") then
			alias.resetidle()
			alias.uw()
			alias.wi("bian")
			_f=function() alias.lianskills() end
			wait.time(1);_f()
		end
		if findstring(l,"���Ӳ��ֱֳ��У�������.+Ҳ������֡�") then
			alias.resetidle()
			alias.uw()
			--weapon_id=weapon_id+1
			_f=function() alias.lianskills() end
			wait.time(1);_f()
		end
	end)
end
------------------------------------------------------------------------------------
-- skills_lingwu_cls
------------------------------------------------------------------------------------
function skills_lingwu_cls.dosomething1(n,l,w)
	local _f,_tb,a,b,c,d,_t
	wait.make(function()
		if findstring(l,"��û����ô��Ǳ��") then
			run("set lingwu=over")
		end
		if findstring(l,"����������е�����ǿ��ѹ�ص��վ��������") then
			if havefj>0 then
				alias.close_dz()
				alias.uw()
				if me.menpai=="bt" then run("release yuanshi") end
				if me.menpai=="qz" then run("return book") end
				if me.menpai=="em" or me.menpai=="xx" or me.menpai=="xs" then run("stand") end
				if me.menpai=="dl" then run("dismiss") end
				run("set startworkflow=yes")
			else run("yun regenerate;hp;set check=neili") end
		end
		if findstring(l,"��üͷ���������������򲻵�Ҫ�죬��������վ��������","��Ӳ�����ջ���ʽ����������ϰ�ˡ�","��������Ϣ��Ӳ�����ؽ���Ϣѹ����ȥ������վ��������","��Ӳ��������Ϣѹ�ص����������ϰ�ˡ�") then
			if havefj>0 then
				alias.uw()
				if me.menpai=="bt" then run("release yuanshi") end
				if me.menpai=="qz" then run("return book") end
				if me.menpai=="em" or me.menpai=="xx" or me.menpai=="xs" then run("stand") end
				if me.menpai=="dl" then run("dismiss") end
				run("set startworkflow=yes")
			else run("yun regenerate;hp;set check=neili") end
		end
		if findstring(l,"��ֻ�ܲ����ɵ��书��") then
			_tb=utils.split(skills_lingwu,"|")
			if _tb[skills_num]=="force" then
				if me.menpai=="bt" then run("release yuanshi") end
				if me.menpai=="qz" then run("return book") end
				if me.menpai=="em" or me.menpai=="xx" or me.menpai=="xs" then run("stand") end
				if me.menpai=="dl" then run("dismiss") end
				alias.lianwu()
			else
				skillsfull=1
				if me.menpai=="hs" and me.master=="������" then
					run("jifa dodge huashan-shenfa;jifa sword huashan-jianfa")
					skills_num=1
					reEnableSkills=1
					alias.lianwu()
				else run("set lingwu=over") end
			end
		end
		a,b,c,d=string.find(l,"%((%S+)%)%s+%-%s+%S+%s+(%d+)/")
		if c~=nil and d~=nil then
			if findstring(skills_lingwu,c) and skillsfull==1 then
				-- ����Ƿ��е������ȼ��ļ���
				if tonumber(d)<tonumber(me.maxlvl) then skillsfull=0 end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ lingwu=over �ı����趨��") then
			if have.jingyao>0 then
				alias.uw()
				alias.close_xue()
				openclass("skills_jingyao")
				alias.dujingyao()
			else
				if me.menpai=="bt" then run("release yuanshi") end
				if me.menpai=="qz" then run("return book") end
				if me.menpai=="em" or me.menpai=="xx" or me.menpai=="xs" then run("stand") end
				if me.menpai=="dl" then run("dismiss") end
				run("set startworkflow=yes")
			end
		end
		if findstring(l,"��ӱ���ڵ��ϣ������˼��¾����ˡ�") then
			if killwenying>0 then
				run("get jingyao from corpse;sit hassock;drop wuxue jingyao")
				killwenying=0
			end
		end
		if findstring(l,"�˵���ʲ�ر�֮������ʲô������ģ�") then
			checkmove.NotGPSMove=1
			if me.menpai=="wd" and lingwuat=="menpai" then
				run("look feng;look feng;look feng")
				alias.lingwuskills()
			--elseif me.menpai=="xs" and lingwuat=="menpai" then
			--	run("sit lianzuo")
			--	alias.lingwuskills()
			else
				_f=function() if havefj>0 then alias.startfj() else alias.startxue() end end
				wait.time(2);_f()
			end
		end
		if findstring(l,"�Ƚ�ɢ%(dismiss%)�㳡�ϵı������뿪�ɡ�") then
			run("dismiss")
		end
		if findstring(l,"վ�������߰ɡ�","�����ߣ�") then
			run("stand")
		end
		if findstring(l,"һ��.+�������˹���,���㱨ȭ���������·�"..me.fjmasternick.."֮���������ٻ�.+����������") then
			run("halt")
		end
		if findstring(l,"�������磬���ֵ�ͼ��192��������") then
			alias.lianwu()
		end
		if findstring(l,"��Ҫ�����²��ܲ���") then
			run("ask wenying about ��ѧ��Ҫ;sit hassock;give wenying wuxue jingyao")
		end
		if findstring(l,"������һ������ѧ��ȫ������������׼������","��������ѧ��Ҫ����һ�Ե�����������������׼����ʼ����","���Ѿ�����һ���������ˡ�") then
			alias.lingwuskills()
		end
		if findstring(l,"����˼����ѧ��.+��Ǳ�������й�.+����ѧ���⡣","������������Ǳ�Ŀ�˼.+�ϵ��ѽ�֮����","��ֻ�������������Ҵܣ�.+�е���ʽ�������һ������ǰ���֣�","��Ĵ�����һƬ�հס���.+��Խ��Խ��Ϳ��","������˵�����ķ����.+ʼ�ղ���һ�⡣","�����ֱȻ��ţ��ƺ���.+�еļ�������������ᡣ","����ڤ˼���룬��.+��������һ����ᣡ") then
			alias.resetidle()
		end
		if findstring(l,"���ʵս���黹���㣬���ܼ������������","��������������Ѿ�¯���࣬���������򲻵�ʲô�ˡ�") then
			alias.resetidle()
			skills_num=skills_num+1
			alias.lingwuskills()
		end
		if findstring(l,"�㲻���������������ڹ���") then
			alias.resetidle()
			skills_num=skills_num+1
			alias.ch()
			run("set check=skills")
			alias.lingwuskills()
		end
		if findstring(l,"�����Ѿ�û��ʣ���Բʯ�ɹ��㵹�������ˡ�","�Ѿ����������ˣ�") then
			alias.resetidle()
			_t=tonumber(math.random(3))
			if _t==1 then run("emote ���������������ܲ��ܿ�㡣mush����") end
			if _t==2 then run("emote �ੲ��ݣ�����ô��������mush����") end
			if _t==3 then run("emote ���µ����̲�ס�ˣ��������˰ɡ�mush����") end
			_f=function() alias.lianwu() end
			wait.time(2);_f()
		end
		if findstring(l,"�Ѿ����������ˣ�") then
			if roomno_now==2112 then alias.flytoid(2113)
			elseif roomno_now==2113 then alias.flytoid(2114)
			elseif roomno_now==2114 then alias.flytoid(2115)
			elseif roomno_now==2115 then alias.flytoid(2112)
			end
		end
		if findstring(l,"�ϳ˹���Ҫ�ߵ�����������վ��ֱֱ����ô���򹦷�") then
			alias.resetidle()
			run("use fire;hold yuanshi")
		end
		if findstring(l,"���Ѿ��������������ˡ�","����ڴ������ϣ��������ɵĻ���������˼��") then
			alias.resetidle()
			run("ketou hassock")
			alias.lingwuskills()
		end
		if findstring(l,"���.+���費�����޷��������һ���.+") then
			alias.resetidle()
			if me.menpai=="bt" then run("release yuanshi") end
			if me.menpai=="qz" then run("return book") end
			if me.menpai=="em" or me.menpai=="xx" or me.menpai=="xs" then run("stand") end
			if me.menpai=="dl" then run("dismiss") end
			alias.lianwu()
		end
		if findstring(l,"�������ָ�ץ�˿�Բʯ�����ִ��ţ������˵�����������","��ľ������ȼ���������������������֪���Ȼ�԰�������������������͡�") then
			alias.resetidle()
			alias.lingwuskills()
		end
		if findstring(l,"������������书����������似��������") then
			alias.resetidle()
			skillsfull=1
			alias.ch()
			run("set check=lingwufull")
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=skills �ı����趨��") then
			alias.resetidle()
			if skillslist["hunyuan-yiqi"]==nil then skillslist["hunyuan-yiqi"]={} end
			if skillslist["hunyuan-yiqi"]["lvl"]==nil then skillslist["hunyuan-yiqi"]["lvl"]=0 end
			if skillslist["hunyuan-yiqi"]["sld"]==nil then skillslist["hunyuan-yiqi"]["sld"]=0 end
			if (skillslist["hunyuan-yiqi"]["lvl"]~=nil and skillslist["hunyuan-yiqi"]["lvl"]<me.maxlvl) and (skillslist["hunyuan-yiqi"]["sld"]~=nil and skillslist["hunyuan-yiqi"]["sld"]>=((skillslist["hunyuan-yiqi"]["lvl"]+1)*(skillslist["hunyuan-yiqi"]["lvl"]+1))) then
				zuochan=1
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=neili �ı����趨��") then
			alias.resetidle()
			if havefj>0 then
				alias.uw()
				if me.menpai=="bt" then run("release yuanshi") end
				if me.menpai=="qz" then run("return book") end
				if me.menpai=="em" or me.menpai=="xx" or me.menpai=="xs" then run("stand") end
				if me.menpai=="dl" then run("dismiss") end
				run("set startworkflow=yes")
			else
				if mpJobLimited==0 then
					if me.menpai=="wd" or xuefirst>0 or workflow.mp==0 or (me.menpai=="gb" and gold.num>=gold.setnum and 3600-(os.time()-mpLimited.MarkTime)>30) then
						alias.lingwuskills()
					else
						alias.uw()
						if me.menpai=="bt" then run("release yuanshi") end
						if me.menpai=="qz" then run("return book") end
						if me.menpai=="em" or me.menpai=="xx" or me.menpai=="xs" then run("stand") end
						if me.menpai=="dl" then run("dismiss") end
						run("set startworkflow=yes")
					end
				else alias.lingwuskills() end
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��") then
			alias.resetidle()
			if havefj>0 then
				alias.uw()
				if me.menpai=="bt" then run("release yuanshi") end
				if me.menpai=="qz" then run("return book") end
				if me.menpai=="em" or me.menpai=="xx" or me.menpai=="xs" then run("stand") end
				if me.menpai=="dl" then run("dismiss") end
				run("set startworkflow=yes")
			else
				if mpJobLimited==0 then
					if me.menpai=="wd" or xuefirst>0 or workflow.mp==0 or (me.menpai=="gb" and gold.num>=gold.setnum and 3600-(os.time()-mpLimited.MarkTime)>30) then
						alias.lingwuskills()
					else
						alias.uw()
						if me.menpai=="bt" then run("release yuanshi") end
						if me.menpai=="qz" then run("return book") end
						if me.menpai=="em" or me.menpai=="xx" or me.menpai=="xs" then run("stand") end
						if me.menpai=="dl" then run("dismiss") end
						run("set startworkflow=yes")
					end
				else alias.lingwuskills() end
			end
		end
		if findstring(l,"�������磬���ֵ�ͼ��"..tostring(me.menpailingwuid).."�������","�������磬���ֵ�ͼ��2113�������","�������磬���ֵ�ͼ��2114�������","�������磬���ֵ�ͼ��2115�������") then
			alias.resetidle()
			if havefj>0 then alias.close_xue()
			else
				skills_num=1
				_f=function()
							alias.ch()
							if me.menpai=="dl" then run("ask duan about ����")
							elseif me.menpai=="xx" then run("kneel hassock")
							else
								if me.master=="������" then run("jifa dodge dugu-jiujian") end
								if me.menpai=="qz" then
									run("take book")
								elseif me.menpai=="xs" then
									run("sit lianzuo")
								else
									if me.menpai=="em" then
										killwenying=0
										run("ask wenying about ��ѧ��Ҫ;sit hassock;give wenying wuxue jingyao")
									else alias.lingwuskills() end
								end
							end
					end
				wait.time(3);_f()
			end
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ check=lingwufull �ı����趨��") then
			alias.resetidle()
			if skillsfull==0 then
				skills_num=1
				alias.lingwuskills()
			else
				if me.menpai=="hs" and me.master=="������" then
					run("jifa dodge huashan-shenfa;jifa sword huashan-jianfa")
					skills_num=1
					reEnableSkills=1
					alias.lianwu()
				else run("set lingwu=over") end
			end
		end
		if findstring(l,"��������ϣ���������վ��������") then
			alias.resetidle()
			if me.menpai=="em" then alias.yunem() end
			run("yun regenerate;hp;set check=neili")
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ startworkflow=yes �ı����趨��") then
			alias.resetidle()
			mark.setpot=1
			alias.close_dz()
			usepot="xue"
			alias.startworkflow()
		end
		if findstring(l,"��Ŀǰ��û���κ�Ϊ lian=over �ı����趨��") then
			alias.resetidle()
			skillsfull=1
			alias.ch()
			run("set check=lingwufull")
		end
		if findstring(l,"�������������Ǹ���,Ϻ�׶��ǳ�����������ĦԺ��¥�������") then
			alias.resetidle()
			skills_num=1
			if cmd.nums<cmd.setnums then
				alias.ch()
				alias.lingwuskills()
			else
				_f=function() alias.ch();alias.lingwuskills() end
				wait.time(1);_f()
			end
		end
		if findstring(l,"�㻹û������ѧ��ȫ���黹%(return%)�������") then
			run("return book;set lingwu=over")
		end
		if findstring(l,"�������磬���ֵ�ͼ��213�������") then
			run("set check=neili")
		end
		if findstring(l,"�㻹û�����أ�") then
			run("take book")
		end
		if findstring(w[0],"�Է���æ���أ���Ȼ�����ʻ��ɡ�\n[> ]*����û����ѧ��Ҫ��������ռλ�ð�����") then
			alias.resetidle()
			killwenying=1
			run("kill wenying")
		end
		if findstring(w[0],"����û�� wenying ����ˡ�\n[> ]*����û����ѧ��Ҫ��������ռλ�ð�����") then
			alias.resetidle()
			run("get wuxue jingyao;sit hassock;drop wuxue jingyao")
		end
		if findstring(w[0],"������ӱ�����йء���ѧ��Ҫ������Ϣ��\n��ӱ˵���������������ˣ��ı�����ѧ��Ҫ�����������ˡ�","�Է���æ���أ���Ȼ�����ʻ��ɡ�") then
			alias.resetidle()
			killwenying=1
			run("kill wenying")
		end
		if findstring(w[0],"�㸽��û������������\n[> ]*����û����ѧ��Ҫ��������ռλ�ð�����") then
			alias.resetidle()
			run("set lingwu=over")
		end
		if findstring(w[0],"�����������������Ҵϻ۵��ӣ�\n����.+�ܰ������ڴ˴��Ա������Ķ�����") then
			run("give wenying wuxue jingyao;drop wuxue jingyao;set lingwu=over")
		end
		if findstring(w[0],"��������������˵�ͷ��\n������˵�����ðɣ�����ô˽������޵��ı����ɡ�") then
			alias.flytoid(213)
		end
		if findstring(w[0],"������������ҡ��ҡͷ��\n������˵��������.+���ģ���������ȥ�����ˡ�") then
			alias.flytoid(192)
		end
	end)
end
------------------------------------------------------------------------------------
-- skills_jingyao
------------------------------------------------------------------------------------
function skills_jingyao.dosomething1(n,l,w)
	if findstring(l,"���ж���ϣ���.+��Ҫ����������") then
		alias.resetidle()
		if me.menpai=="wd" and wx.taiji==0 then alias.checkbusy("taijiover")
		else
			if me.menpai=="em" then alias.yunem()
			else run("yun regenerate;hp;set check=neili") end
		end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ check=neili �ı����趨��") then
		alias.resetidle()
		if havefj>0 then
			alias.uw()
			run("set startworkflow=yes")
		else
			if mpJobLimited==0 then
				if me.menpai=="wd" or xuefirst>0 or workflow.mp==0 or (me.menpai=="gb" and gold.num>=gold.setnum and 3600-(os.time()-mpLimited.MarkTime)>30) then
					alias.dujingyao()
				else
					alias.uw()
					run("set startworkflow=yes")
				end
			else alias.dujingyao() end
		end
	end
	if findstring(l,"������������.+��Ҫ��ȴһ��С�ĳ����ˡ�","����Ҫ������.+��Ҫ��ȴһ��С�ĳ����ˡ�") then
		alias.resetidle()
		have.jingyao=have.jingyao-1
		if have.jingyao>0 then alias.dujingyao() else run("set dujingyao=over") end
	end
	if findstring(l,"���Ǳ�ܲ�����û�а취�ٳɳ��ˡ�") then
		alias.resetidle()
		run("set dujingyao=over")
	end
	if findstring(l,"���ж���.+��Ҫ�������ص����ݣ�һ������ͨ�˺ü����ѵ㡣","����ϸ�ж���.+��Ҫ����ȴ��˼������⡣","��˼����.+��Ҫ����д�����ݣ���Ȼ��.+��������","�㿪ʼר���ж�.+��Ҫ��","�㰺��ͷĬĬ������.+��Ҫ����¼�����ݣ��ƺ���.+��Щ�ĵá�") then
		alias.resetidle()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��","��һ�죬�������ɫ�Ʋ���ӭȢ�����䡻") then
		alias.dujingyao()
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ checkhp=addneili �ı����趨��") then
		if havefj>0 and hp.neili>(hp.maxneili*set_neili_job/100) then alias.tdz() end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ dujingyao=over �ı����趨��") then
		mark.setpot=1
		alias.uw()
		alias.checkbusy("jyover")
	end
	if findstring(l,"��΢΢һЦ�����ӻ�����ת�����ֳֽ��������𣬽�������ǰ������˫��������ԣ��籧Բ��.+δ������Ȼ�������") then
		wx.taiji=1
	end
	if findstring(l,"������������ϣ����������ڵ�����Ϲ�Ԫ��") then
		wx.taiji=0
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=taijistart �ı����趨��") then
		run("du book 10")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=taijiover �ı����趨��") then
		run("yun regenerate;hp;set check=neili")
	end
	if findstring(l,"���������ϵ�.+��Ҫ�����������ˡ�") then
		alias.resetidle()
		if me.menpai=="wd" and wx.taiji==0 then alias.checkbusy("taijiover")
		else run("yun regenerate;hp;set check=neili") end
	end
	if findstring(l,"Ҳ����ȱ��ʵս���飬���.+��Ҫ������˵�Ķ��������޷���ᡣ","���ж���һ��������Ƿ���������˵�Ķ�����Զ�̫") then
		alias.resetidle()
		have.nousejy=1
		run("set dujingyao=over")
	end
	if findstring(l,"ѧϰ֪ʶ��Ҫ����Ժ���ܾ���ѧϰ��") then
		alias.resetidle()
		if daytime then alias.flytonpc("����") else run("set dujingyao=over") end
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ busyover=jyover �ı����趨��") then
		run("set startworkflow=yes")
	end
	if findstring(l,"��Ŀǰ��û���κ�Ϊ startworkflow=yes �ı����趨��") then
		alias.resetidle()
		mark.setpot=1
		alias.close_dz()
		alias.startworkflow()
	end
end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function skills.update()
	_tb={
		"���ж���ϣ���.+��Ҫ����������",
		"��Ŀǰ��û���κ�Ϊ check=neili �ı����趨��",
		"������������.+��Ҫ��ȴһ��С�ĳ����ˡ�",
		"����Ҫ������.+��Ҫ��ȴһ��С�ĳ����ˡ�",
		"���Ǳ�ܲ�����û�а취�ٳɳ��ˡ�",
		"���ж���.+��Ҫ�������ص����ݣ�һ������ͨ�˺ü����ѵ㡣",
		"����ϸ�ж���.+��Ҫ����ȴ��˼������⡣",
		"��˼����.+��Ҫ����д�����ݣ���Ȼ��.+��������",
		"�㿪ʼר���ж�.+��Ҫ��",
		"�㰺��ͷĬĬ������.+��Ҫ����¼�����ݣ��ƺ���.+��Щ�ĵá�",
		"��Ŀǰ��û���κ�Ϊ dazuo=over �ı����趨��",
		"��һ�죬�������ɫ�Ʋ���ӭȢ�����䡻",
		"��Ŀǰ��û���κ�Ϊ checkhp=addneili �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ dujingyao=over �ı����趨��",
		"��΢΢һЦ�����ӻ�����ת�����ֳֽ��������𣬽�������ǰ������˫��������ԣ��籧Բ��.+δ������Ȼ�������",
		"������������ϣ����������ڵ�����Ϲ�Ԫ��",
		"��Ŀǰ��û���κ�Ϊ busyover=taijistart �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ busyover=taijiover �ı����趨��",
		"���������ϵ�.+��Ҫ�����������ˡ�",
		"Ҳ����ȱ��ʵս���飬���.+��Ҫ������˵�Ķ��������޷���ᡣ",
		"���ж���һ��������Ƿ���������˵�Ķ�����Զ�̫(ǳ|��)�ˣ�û��ѧ���κζ�����",
		"ѧϰ֪ʶ��Ҫ����Ժ���ܾ���ѧϰ��",
		"��Ŀǰ��û���κ�Ϊ busyover=jyover �ı����趨��",
		"��Ŀǰ��û���κ�Ϊ startworkflow=yes �ı����趨��",
	}
	local skills_jingyao_triggerlist={
	       {name="skills_jingyao_dosth1",regexp=linktri(_tb),script=function(n,l,w)    skills_jingyao.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(skills_jingyao_triggerlist) do
		addtri(v.name,v.regexp,"skills_jingyao",v.script,v.line)
	end
	closeclass("skills_jingyao")

	local _tb={
		"�Է���æ���أ���Ȼ�����ʻ��ɡ�\\n(> > > |> > |> |)����û����ѧ��Ҫ��������ռλ�ð�����\\Z",
		"����û�� wenying ����ˡ�\\n(> > > |> > |> |)����û����ѧ��Ҫ��������ռλ�ð�����\\Z",
		"������ӱ�����йء���ѧ��Ҫ������Ϣ��\\n��ӱ˵���������������ˣ��ı�����ѧ��Ҫ�����������ˡ�\\Z",
		"�㸽��û������������\\n(> > > |> > |> |)����û����ѧ��Ҫ��������ռλ�ð�����\\Z",
		"�����������������Ҵϻ۵��ӣ�\\n����.+�ܰ������ڴ˴��Ա������Ķ�����\\Z",
		"��������������˵�ͷ��\\n������˵�����ðɣ�����ô˽������޵��ı����ɡ�\\Z",
		"������������ҡ��ҡͷ��\\n������˵��������.+���ģ���������ȥ�����ˡ�\\Z",
	}
	local  skills_lingwu_m_triggerlist={
	       {name="skills_lingwu_m_triggerlist",line=2,regexp=linktri(_tb),script=function(n,l,w)    skills_lingwu_cls.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(skills_lingwu_m_triggerlist) do
		addtri_multiline(v.name,v.regexp,"skills_lingwu",v.script,v.line)
	end

	local skills_lingwu_triggerlist={
	       {name="skills_lingwu_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    skills_lingwu_cls.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(skills_lingwu_triggerlist) do
		addtri(v.name,v.regexp,"skills_lingwu",v.script,v.line)
	end
	closeclass("skills_lingwu")
	
	_tb={
		"��.+��.+����",
		"�㲻��ͨ����ϰ�м�����������",
		"���.+�Ѿ���ϰ�������ˣ������ȴ�û������ܼ������",
		"�������������",
		"�������̫���ˡ�",
		"��ʹ�õ��������ԡ�",
		"�����ڵ�����������",
		"����ϰ��ϣ���������һ��������Ŀ��(��|��)��",
		"��ֻ����ϰ�� enable ָ�������⼼��",
		"��Ŀǰ��û���κ�Ϊ lian �ı����趨��",
		"���ȷ�ֻ����ʵս�����",
		"��Ļ��������δ���������ȴ�û������ܼ�����ߡ�",
		"��һ�����е�.+����ʼ��ϰ.+��",
		"������.+�����к����һ�С�.+��ʹ������ͬ������ˮ��",
		"�㷴����ϰ��.+�еġ�.+������ȴ���ǲ���Ҫ�졣",
		"���������е�.+, ��������ˮ���������.+�м�����ʽ����ȫ�����͵���",
		"�㽫.+һ��һʽ��������������Ȼ�������⣬���������Ļ���Ӧ������������",
		"��˳��.+��Ϣ����·�ߣ���������������������һ�������졣",
		"�㰵�����˵���۾������������.+��",
		"���������һ�����Ӳ�����.+�޷���",
		"���Ӳ��ֱֳ��У�������.+Ҳ������֡�",
		"�������Ʊ���ͨ������ķ��Ų���������",
	}
	local skills_lian_triggerlist={
	       {name="skills_lian_dosth1",regexp=linktri(_tb),script=function(n,l,w)    skills_lian.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(skills_lian_triggerlist) do
		addtri(v.name,v.regexp,"skills_lian",v.script,v.line)
	end
	closeclass("skills_lian")

	local skills_xue_triggerlist={
	       {name="skills_xue_dosth1",regexp="^(> > > |> > |> |)(.+)$",script=function(n,l,w)    skills_xue_cls.dosomething1(n,l,w)  end,},
	}
	for k,v in pairs(skills_xue_triggerlist) do
		addtri(v.name,v.regexp,"skills_xue",v.script,v.line)
	end
	closeclass("skills_xue")
	
	AddTimer("skills_ask_timer", 0, 0, 0.5, "", timer_flag.Enabled + timer_flag.Replace, "skills_ask.timer")
	SetTimerOption("skills_ask_timer", "group", "skills_ask")
	closeclass("skills_ask")
end

skills.update()
