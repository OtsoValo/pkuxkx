---------------------------------------------------------------------------
-- File name   : michen_stat.lua
-- Description : ���ģ���ز���¼���е�״̬
--
-- Author: Michen (xmichen@gmail.com)
-- Version:	2014.05
---------------------------------------------------------------------------

print("Loading Michen stat mod OK!")

stat={}

function stat.bt_yun1_0() stat.reverse=false end
function stat.bt_yun1_1() stat.reverse=true end
function stat.bt_yun2_0() stat.powerup=false end
function stat.bt_yun2_1() stat.powerup=true end
stat.update=function()
	addtri("bt_yun1_0","^(> > |> |)��ľ�����ת������ϣ������ظ�һ��������","stat","stat.bt_yun1_0")
	addtri("bt_yun1_1","^(> > |> |)ֻ������не�������̺���������������ͷ�½���֮�Σ�˫�ֳŵأ�������ȥ��","stat","stat.bt_yun1_1")
	addtri("bt_yun2_0","^(> > |> |)ֻ����ĸ�󡹦������ϣ��������ջص��","stat","stat.bt_yun2_0")
	addtri("bt_yun2_1","^(> > |> |)ֻ������ڵ��£�˫��������룬����һֻ�����ܰ��������ˣ����з�����ţ˻����Ĺ���֮����ʱЪʱ����","stat","stat.bt_yun2_1")
end
stat.update()
--[[

--]]
