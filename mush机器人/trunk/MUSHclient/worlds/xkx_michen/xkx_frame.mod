---------------------------------------------------------------------------
-- File name   : xkx_frame.lua
-- Description : ���ļ�Ϊ��һ���ű���ܡ��ļ����ܿ�ܵ����ļ���
--
-- Author: ��С��littleknife (applehoo@126.com)
-- Version:	2012.01.05.1221
---------------------------------------------------------------------------
print("----**********************************************************----")
print("::>>���ģ������Start<<::")

loadlist={

	"system.mod",
	"hook.mod",
	----------------------------
	"status.mod",
	"rest.mod",

	"quest.mod",
	
	"michen_stat.mod",
	"michen_blocker.mod",
	"michen_walker.mod",
	"michen_fight.mod",
	
	"michen_info.mod",
	
	"endfunction.mod",

  }
  for i=1,#loadlist do
      loadmod(loadlist[i])
  end

print("::>>���ģ������Over<<::")
print("----**********************************************************----")

