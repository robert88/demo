<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/Conn.asp"-->
<!--#include file="CheckAdmin.asp"-->
<%
		number1=session("number1")
		user_no=trim(session("user_no"))
		session("sel_num")=0
		if number1<2  then
		    set rs5 = server.createobject("adodb.recordset")
		    sql5 = "select * from student_info where St_number='"&user_no&"'"
		    rs5.open sql5,conn,1,3
		    if rs5.bof or rs5.eof then 
	            response.Write("<script language='javascript'>alert('数据库出错，请返回……');</script>")
           else if rs5("flag0")<>true then
	            rs5("flag0")=true
				session("sel_num")=1
					response.Write("<script language='javascript'>alert('选题成功，请返回……');</script>")
                else
                response.write("<script language='javascript'>alert('学生选题冲突，请返回……');</script>")
                end if 'end if rs5("flag0")<>true then
	 
	     	rs5.update
		    end if 'end if rs5.bof or rs5.eof then 
		rs5.close
		set rs5= nothing
	
		else 
		response.write("<script language='javascript'>alert('每人只能选一个选题，请返回……');history.bam</script>")
   end if'end if number1<2
%>
	<%
	if session("sel_num")=1 then
	tea_name=trim(request.querystring("tea_name"))
	'response.Write(tea_name)
	'response.Write("jiashu")

	 set rs = server.createobject("adodb.recordset")
	  sql= "select * from teacher_inf where Tea_name='"&tea_name&"'order by ID asc"
	   rs.open sql,conn,1,3
	   	   if rs.bof or rs.eof then 
	   response.Write("老师学生数量减少出错")
	   else
	   	 rs("Sel_num")=rs("Sel_num")+1
		 rs.update
		 end if
		 rs.close
		 set rs=nothing
		 
		 end if
%>