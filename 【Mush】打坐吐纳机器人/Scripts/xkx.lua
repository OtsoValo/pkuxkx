function waittime(time)
    local time=tonumber(time)
    DoAfterSpecial(time,'wait',10)
end
--- ����˯��
function waitsleep()
    DoAfter(20,'sleep')
    Execute('say ���ҵȵ���˯')
end

--- �����������������ֵ
function dz_tn_var(zm,sd1,sd2)
SetVariable("zhoumu",zm)
SetVariable("jiangdisudu",sd2)
end

---����������Ҫ����
function dz_tn(jingyan,pot,maxneili,nowneili,maxjingli,nowjingli,maxqi,nowqi,maxshen,nowshen)

mmneili=GetVariable("force_level")*12
mmjingli=GetVariable("force_level")*12
forcebase=GetVariable("force_level")/10+1
Note("������ֵ��"..mmneili..",������ֵ��"..mmjingli..",����������"..forcebase)

zhoumu=GetVariable("zhoumu")
jiangdisudu=GetVariable("jiangdisudu")
if zhoumu=="��Ϣ" then
dzsudu=130
elseif zhoumu=="ج��" then
dzsudu=100-jiangdisudu
else
dzsudu=100
end
Note("��ǰЧ����"..dzsudu)

if maxneili<=1000 then
	xuyaoqi=math.ceil((maxneili*2-nowneili)/2*100/dzsudu)
else
	xuyaoqi=math.ceil((maxneili*2-nowneili)*100/dzsudu)
end
Note("���������"..maxneili.."��ǰ������"..nowneili..",��Ҫ��Ѫ��"..xuyaoqi)

if maxneili<mmneili then
	if nowqi<=maxqi/10 then
		Execute("yun recover",10)
	else
		keyongqi=math.floor(nowqi-maxqi/10)
		Note("������Ѫ��"..keyongqi)
		
		if keyongqi<=xuyaoqi then
			local dzqi=math.ceil(math.floor(keyongqi/forcebase)*forcebase)
			Note("������Ѫ��"..dzqi)
			Execute("dazuo "..dzqi,10)
		else
			if xuyaoqi<=10 then
				Execute("dazuo 10",10)
			else
				local dzqi=math.ceil(math.floor(xuyaoqi/forcebase)*forcebase)
				if dzqi<=10 then
				Execute("dazuo 10",10)
				else
				Note("������Ѫ��"..dzqi)
				Execute("dazuo "..dzqi,10)
				end
			end
		end
	end
else
	if maxjingli<=1000 then
		xuyaoshen=math.ceil((maxjingli*2-nowjingli)/2*100/dzsudu)
	else
		xuyaoshen=math.ceil((maxjingli*2-nowjingli)*100/dzsudu)
	end
	Note("�������"..maxjingli.."��ǰ������"..nowjingli..",��Ҫ������"..xuyaoshen)
	
	if maxjingli<mmjingli then
		if nowshen<=maxshen/10 then
			Execute("yun regenerate",10)
		else
			keyongshen=math.ceil(nowshen-maxshen/10)
			Note("���þ�����"..keyongshen)
			if keyongshen<=xuyaoshen then
				local tnshen=math.ceil(math.floor(keyongshen/forcebase)*forcebase)
				Note("���ɾ�����"..tnshen)
				Execute("tuna "..tnshen,10)
			else
				if xuyaoshen<=10 then
					Execute("tuna 10",10)
				else
					local tnshen=math.ceil(math.floor(xuyaoshen/forcebase)*forcebase)
					if tnshen<=10 then
					Execute("tuna 10",10)
					else
					Note("���ɾ�����"..tnshen)
					Execute("tuna "..tnshen,10)
					end
				end
			end
		end
	else
	Execute("tt- ��������")
	DoAfterSpecial(1,"say �������ɽ��������������Ѵ����ޡ�",10)
	end
end
end

