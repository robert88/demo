<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/Conn.asp"-->
<!--#include file="CheckAdmin.asp"-->
<%
'Action=SaveEdit	��������------------------
dim Acticn,number1,tea_name
	Action=trim(request.querystring("Action"))
	id=trim(request("id"))
	tea_name=trim(request.querystring("tea_name"))
	'response.Write("wo de xuante tea_names")
	St_number=session("user_no")
if Action="Save" then
		    session("number1")=session("number1")+1	
			number1=session("number1")
		if number1<2  then
		    set rs4 = server.createobject("adodb.recordset")
		    sql4 = "select * from select_cursor where ID="&id&" order by ID asc"
		    rs4.open sql4,conn,1,3
		   if rs4.bof or rs4.eof then 
	           response.Write("<script language='javascript'>alert('���ݿ�����뷵�ء���');history.back()</script>")  
			   set rs4= nothing
			   rs4.close			   
           else if rs4("Total")=0 then
	               rs4("Total")=1
                   rs4("Sel_flag")=true
                   rs4("St_number")=St_number
				   rs4.update
		           rs4.close
		           set rs4= nothing
				   response.redirect("task_v1.asp?tea_name="&tea_name)
               end if 'end else if rs4("Total")=0 then
		   end if	'end if	rs4.bof or rs4.eo
else 
if Action<>"del" then 
		response.write("<script language='javascript'>alert('ÿ��ֻ��ѡһ��ѡ�⣬�뷵�ء���');history.back()</script>")
	end if'end if Action<>"del"
end if'end if number1<2
end if'end if Action="Save"

%>
<%
	if Action="del" then
	   number1=session("number1")
	   if number1 <> 0 then 
		  session("number1")=0
	   end if 'end if number1<0 or nuber>0
	   set rs4 = server.createobject("adodb.recordset")
	   sql4 = "select * from select_cursor where ID="&id&" order by ID asc"
	   rs4.open sql4,conn,1,3
	   if rs4.bof or rs4.eof then 
	      response.Write("<script language='javascript'>alert('���ݿ�����뷵�ء���');history.back()</script>")
		rs4.close
		set rs4= nothing
	  else 
	      rs4("Total")=0
          rs4("Sel_flag")=false
          rs4("St_number")=""
		  
		  rs4.update
		rs4.close
		set rs4= nothing
		response.Redirect("task_v2.asp?tea_name="&tea_name)	
		response.Write("<script language='javascript'>alert('ɾ��ѡ��ɹ����뷵�ء���');</script>")
	    end if 'end if rs4.bof or rs4.eof
   end if 'end if Action="del"
%>
