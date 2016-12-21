---------------------------------------------------------------------------
-- File name   : pkukxk_playerid.lua
-- Description : ���ļ�Ϊ��һ���ű���ܡ��ļ����ܵ��á������ļ���
-- Author: ��С��littleknife (applehoo@126.com)
-- Version:	2012.02.10.0752
-- Useage:��mcl�У����ô��ļ������ɼ���ȫ��ģ�顣
-- Michen �޸���2014.05��ȥ�����������߰���Ķ�����ֻ�����˼�������RBT�Ĳ���
-- ͬʱ�����е���Ϸ�ڲ����÷ŵ�����ļ��У��Ժ���Ϸ��һ����ֻҪ����߾ͺ�
-- ���н�ɫ������ı���������MCL�ı�����������ʺ�֧�ֵĸ���Щ
---------------------------------------------------------------------------

conf={}

-- �������е�ʦ����Ϣ
conf.master={
	["��ѧ��ͨ"]			={"none",				0,},		-- ��һ����ʦ����ID���ڶ�����ʦ�����ڷ����ID
	["����"]				={"juexin",				0,},
	["һ�ƴ�ʦ"]			={"yideng",				0,},
	["��ҩʦ"]				={"huang",				0,},
	["������"]				={"zhang",				0,},
	["����"]				={"ma",					0,},
	["ŷ����"]				={"ouyang",			0,},
	["������"]				={"feng",					0,},
	["������"]				={"tianlang",			1435,},
	["����"]				={"azi",					0,},
	["������"]				={"chuchen",			0,},
	["ʨ����"]				={"shihou",				0,},
	["������"]				={"ding",					1442,},
	["³�н�"]				={"youjiao",			1116,},
	["�����"]				={"ma",					925,},
	["ŷ����"]				={"ke",					926,},
}

region_names={
	"�������ɽ","����","���ⳤ��ɽ","����","���ݽ���","���ϴ���","�Ĵ�����","�㶫��ɽ",
	"ؤ�����ڵ�","����","�ƺӱ�","���ջ�ɽ","��ɽ","����","����","����ɽ","�����置",
	"����ɽ","����Ȫ��","��ɽ����","�ɶ�������","̫����","ɽ��̩ɽ","�����һ���","��ɽ��",
	"�����䵱ɽ","����","����","�رߴ�ѩɽ","����ɽ","�������ߵ�","����ɽ","����",
}

_force_data={}
_force_data["hunyuan-yiqi"]={}
_force_data["hunyuan-yiqi"]["family"]={"������"}
_force_data["hunyuan-yiqi"]["factor"]=8
_force_data["hunyuan-yiqi"]["zheng_xie"]=1
_force_data["hunyuan-yiqi"]["gang_rou"]=1
_force_data["linji-zhuang"]={}
_force_data["linji-zhuang"]["family"]={"������"}
_force_data["linji-zhuang"]["factor"]=8
_force_data["linji-zhuang"]["zheng_xie"]=1
_force_data["linji-zhuang"]["gang_rou"]=-1
_force_data["taiji-shengong"]={}
_force_data["taiji-shengong"]["family"]={"�䵱��"}
_force_data["taiji-shengong"]["factor"]=8
_force_data["taiji-shengong"]["zheng_xie"]=1
_force_data["taiji-shengong"]["gang_rou"]=-1
_force_data["huntian-qigong"]={}
_force_data["huntian-qigong"]["family"]={"ؤ��"}
_force_data["huntian-qigong"]["factor"]=7
_force_data["huntian-qigong"]["zheng_xie"]=1
_force_data["huntian-qigong"]["gang_rou"]=1
_force_data["huagong-dafa"]={}
_force_data["huagong-dafa"]["family"]={"������"}
_force_data["huagong-dafa"]["factor"]=8
_force_data["huagong-dafa"]["zheng_xie"]=-1
_force_data["huagong-dafa"]["gang_rou"]=-1
_force_data["bitao-xuangong"]={}
_force_data["bitao-xuangong"]["family"]={"�һ���"}
_force_data["bitao-xuangong"]["factor"]=7
_force_data["bitao-xuangong"]["zheng_xie"]=0
_force_data["bitao-xuangong"]["gang_rou"]=0
_force_data["hamagong"]={}
_force_data["hamagong"]["family"]={"����ɽ"}
_force_data["hamagong"]["factor"]=7
_force_data["hamagong"]["zheng_xie"]=-1
_force_data["hamagong"]["gang_rou"]=1
_force_data["longxiang-banruo"]={}
_force_data["longxiang-banruo"]["family"]={"Ѫ����","ѩɽ��"}
_force_data["longxiang-banruo"]["factor"]=6
_force_data["longxiang-banruo"]["zheng_xie"]=-1
_force_data["longxiang-banruo"]["gang_rou"]=1
_force_data["zixia-gong"]={}
_force_data["zixia-gong"]["family"]={"��ɽ��"}
_force_data["zixia-gong"]["factor"]=7
_force_data["zixia-gong"]["zheng_xie"]=1
_force_data["zixia-gong"]["gang_rou"]=0
_force_data["dulong-dafa"]={}
_force_data["dulong-dafa"]["family"]={"������"}
_force_data["dulong-dafa"]["factor"]=5
_force_data["dulong-dafa"]["zheng_xie"]=-1
_force_data["dulong-dafa"]["gang_rou"]=-1
_force_data["kurong-changong"]={}
_force_data["kurong-changong"]["family"]={"����μ�"}
_force_data["kurong-changong"]["factor"]=7
_force_data["kurong-changong"]["zheng_xie"]=1
_force_data["kurong-changong"]["gang_rou"]=1
_force_data["xiantian-gong"]={}
_force_data["xiantian-gong"]["family"]={"ȫ���"}
_force_data["xiantian-gong"]["factor"]=8
_force_data["xiantian-gong"]["zheng_xie"]=1
_force_data["xiantian-gong"]["gang_rou"]=1
_force_data["guangming-shenghuo"]={}
_force_data["guangming-shenghuo"]["family"]={"����"}
_force_data["guangming-shenghuo"]["factor"]=7
_force_data["guangming-shenghuo"]["zheng_xie"]=1
_force_data["guangming-shenghuo"]["gang_rou"]=1
_force_data["diandao-gong"]={}
_force_data["diandao-gong"]["family"]={"����"}
_force_data["diandao-gong"]["factor"]=5
_force_data["diandao-gong"]["zheng_xie"]=0
_force_data["diandao-gong"]["gang_rou"]=1
_force_data["mile-gong"]={}
_force_data["mile-gong"]["family"]={"����"}
_force_data["mile-gong"]["factor"]=5
_force_data["mile-gong"]["zheng_xie"]=1
_force_data["mile-gong"]["gang_rou"]=0
_force_data["motian-yunqi"]={}
_force_data["motian-yunqi"]["family"]={"����"}
_force_data["motian-yunqi"]["factor"]=6
_force_data["motian-yunqi"]["zheng_xie"]=1
_force_data["motian-yunqi"]["gang_rou"]=1
_force_data["hunyuan-gong"]={}
_force_data["hunyuan-gong"]["family"]={"����"}
_force_data["hunyuan-gong"]["factor"]=6
_force_data["hunyuan-gong"]["zheng_xie"]=1
_force_data["hunyuan-gong"]["gang_rou"]=1
_force_data["xiuling-yaozhi"]={}
_force_data["xiuling-yaozhi"]["family"]={"����"}
_force_data["xiuling-yaozhi"]["factor"]=5
_force_data["xiuling-yaozhi"]["zheng_xie"]=0
_force_data["xiuling-yaozhi"]["gang_rou"]=0
_force_data["xuanmen-daoyin"]={}
_force_data["xuanmen-daoyin"]["factor"]=5
_force_data["xuanmen-daoyin"]["zheng_xie"]=1
_force_data["xuanmen-daoyin"]["gang_rou"]=-1
_force_data["xuanyin-zhenqi"]={}
_force_data["xuanyin-zhenqi"]["family"]={"����"}
_force_data["xuanyin-zhenqi"]["factor"]=6
_force_data["xuanyin-zhenqi"]["zheng_xie"]=1
_force_data["xuanyin-zhenqi"]["gang_rou"]=-1
_force_data["yunu-xinjing"]={}
_force_data["yunu-xinjing"]["family"]={"��Ĺ��"}
_force_data["yunu-xinjing"]["factor"]=8
_force_data["yunu-xinjing"]["zheng_xie"]=0
_force_data["yunu-xinjing"]["gang_rou"]=0
_force_data["jiuyang-shengong"]={}
_force_data["jiuyang-shengong"]["family"]=0
_force_data["jiuyang-shengong"]["factor"]=10
_force_data["jiuyang-shengong"]["zheng_xie"]=1
_force_data["jiuyang-shengong"]["gang_rou"]=1
_force_data["taixuan-gong"]={}
_force_data["taixuan-gong"]["family"]=0
_force_data["taixuan-gong"]["factor"]=7
_force_data["taixuan-gong"]["zheng_xie"]=1
_force_data["taixuan-gong"]["gang_rou"]=0

luapath=string.match(GetInfo(35),"^.*\\")
mclpath=GetInfo(67)
include=function(str)
	dofile(luapath..str)
end
loadmod=function(str)
	include("mods\\"..str)
end

loadmclfile=function(str)
		local f=(loadfile(mclpath..str))
		if f~=nil then f() end
end
include("xkx_frame.mod")














