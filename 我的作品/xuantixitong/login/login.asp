<!--#include file="../inc/Conn.asp" -->
<!--#include file="../inc/Md5.asp" -->
<%
	login_user_no=trim(request.form("user_no"))
	login_user_pass=Md5(request.form("user_pass"))
	login_u_type=request.form("u_type")
	%>

	<%
	'超级管理员
	if login_u_type=1 then
		set rs = server.createobject("adodb.recordset")
		sql="select * from user_table where user_name='"&login_user_no&"' or user_no='"&login_user_no&"'"
		'response.Write(sql)
		rs.open sql,conn,1,1
		if rs.bof and rs.eof then
		   response.Write("<script>alert('用户不存在或用户类型有误！请返回……');history.back()</script>")
		   response.end
		else
		   user_no=trim(rs("user_no"))
		   user_pass=rs("user_pass")
		   u_type=1
		   user_name=rs("user_name")
		end if
		if login_user_pass<>user_pass then
		   response.Write("<script>alert('密码错误！请返回……');history.back()</script>")
		end if
	end if
	%>
	<%
	'教师登录
	if login_u_type=2 then
		set rs = server.createobject("adodb.recordset")
		sql="select * from teacher_inf where Tea_id='"&login_user_no&"' or Tea_name='"&login_user_no&"'"
		rs.open sql,conn,1,1
		if rs.bof and rs.eof then
		   response.Write("<script>alert('用户不存在或用户类型有误！请返回……');history.back()</script>")
		   response.end
		else
		   user_no=trim(rs("Tea_id"))
		   user_pass=rs("Tea_pass")
		   u_type=2
		   user_name=rs("Tea_name")
		end if
		if login_user_pass<>user_pass then
		   response.Write("<script>alert('密码错误！请返回……');history.back()</script>")
		   response.end
		end if
	end if
	
	'学生登录
	if login_u_type=3 then
		set rs = server.createobject("adodb.recordset")
		sql="select * from student_info where St_number='"&login_user_no&"' or st_name='"&login_user_no&"'"
		rs.open sql,conn,1,1
		if rs.bof and rs.eof then
		   response.Write("<script>alert('用户不存在或用户类型有误！请返回……');history.back()</script>")
		   response.end
		else
		   user_no=trim(rs("St_number"))
		   user_pass=rs("st_pass")
		   u_type=3
		   user_name=rs("St_name")
		   session("sp_id")=rs("sp_id")
		   if rs("flag0")=true then
		   session("number1")=2
		   else
		   session("number1")=0
		   end if
		end if
		if login_user_pass<>user_pass then
		   response.Write("<script>alert('密码错误！请返回……');history.back()</script>")
		   response.end
		end if
	end if
	
	'登录成功，记录日志
	'if login_user_no=user_no and login_user_pass=user_pass then
	   session("u_type")=u_type
	   session("user_name")=user_name
	   session("user_no")=user_no
	   '日志编码的生成  20061123 00000001
		a=year(date)
		b=month(date)
		d=day(date)
		if b>=1 and b<=9 then
		   b="0"&b
		end if
		if d>=1 and d<=9 then
		   d="0"&d
		end if
		c=cstr(a&b&d)
		dim rs2,sql2
		set rs2=server.CreateObject("adodb.recordset")
		sql2="select count(*) as num from rz_table where note_id like '"&c&"%'"
		rs2.open sql2,conn,1,1
		if rs2("num")=0 then
		   note_id=c&"0001"
		   rs2.close
		else
		   rs2.close
		   sql2="select top 1 * from rz_table where note_id like '"&c&"%' order by note_id desc"
		   rs2.open sql2,conn,1,1
		   note_id=rs2("note_id")+1
		   rs2.close
		end if

	   '记录日志
	   set rso = server.createobject("adodb.recordset")
		sql3="select * from rz_table"
		rso.open sql3,conn,1,3
		rso.addnew
		rso("note_id")=note_id
		rso("user_id")=user_no
		rso("option0")="用户登录"
		rso("op_time")=now()
		rso("login_ip")= Request.ServerVariables("Remote_Addr")
		rso("user_name")=user_name
		rso.update
		rs.close
		set rs = nothing
		rso.close
		set rso=nothing
	
	   session("MemLogin")="Succeed"
	   if u_type=1 then
	   		response.redirect "../admin/index.asp"
				
		end if
		if u_type=2 then
	   		response.redirect "../teacher/index.asp"
		
		end if
		if u_type=3 then
	   		response.redirect "../student/index.asp"
		end if
	   response.end
	'end if
%>