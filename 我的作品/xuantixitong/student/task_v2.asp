<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/Conn.asp"-->
<!--#include file="CheckAdmin.asp"-->
<%
		number1=session("number1")
		user_no=trim(session("user_no"))
		if number1=0  then
		    set rs5 = server.createobject("adodb.recordset")
		    sql5 = "select * from student_info where St_number='"&user_no&"'"
		    rs5.open sql5,conn,1,3
		    if rs5.bof or rs5.eof then 
	            response.Write("<script language='javascript'>alert('���ݿ�����뷵�ء���');</script>")
           else if rs5("flag0")=true then
	            rs5("flag0")=false
				session("sel_num")=2
					response.Write("<script language='javascript'>alert('�ɹ�ɾ��ѡ�⣬�뷵�ء���');</script>")
                else
                response.write("<script language='javascript'>alert('ѧ��ѡ���ͻ������ϵϵͳ����Ա����');</script>")
                end if 'end if rs5("flag0")=true then
	     	rs5.update
		    end if 'end if rs5.bof or rs5.eof then 
		rs5.close
		set rs5= nothing
   end if'end if number1=0
%>
	<%
	if session("sel_num")=2 then
	tea_name=trim(request.querystring("tea_name"))
	'response.Write(tea_name)
	'	response.Write("jianshu")
	 set rs = server.createobject("adodb.recordset")
	  sql= "select * from teacher_inf where Tea_name='"&tea_name&"'order by ID asc"
	   rs.open sql,conn,1,3
	   if rs.bof or rs.eof then 
	   response.Write("��ʦѧ���������ٳ���")
	   else
	   	 rs("Sel_num")=rs("Sel_num")-1
		 rs.update
		 	 end if
		 rs.close
		 set rs=nothing
		 end if
%>