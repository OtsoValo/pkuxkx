----------hook���--------------------- 
hooks={}
hooks.isbusy="isbusy"
--�Ƿ�busy��hook


_hooklist={}

hook=function(str,callback,...)			--����Ҫ���еĺ���hook����
	_hooklist[str]=callback
end

callhook=function(str,removehook)
	thook=_hooklist[str]
	if removehook==true then
		hook(str,nil)
	end
	call(thook)
end

call=function(func,...)					--ִ�иú���
	if (func~=nil) then
		func(...)
	end
end


----------hook���-----------����---------- 
