<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>ѧ���б�</title></head>


<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("���Ҫɾ������Ϣ��"))
		window.location = "student_add.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>ѡ������鿴����δѡ��ѧ��</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="">
        ��רҵ��
          <select name="Sp_id" id="Sp_id">
		  <option value="">��ѡ��</option>
        <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select * from speciality "    
			rs.open sql,Conn,1,3
		%>
        <%do while not rs.eof%>
        <option value="<%=rs("Sp_id")%>"><%=rs("Sp_name")%></option>
        <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
      </select>
    ���༶��
    <select name="St_class" id="St_class">
      <option value="">��ѡ��</option>
      <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select St_class from student_info group by St_class"    
			rs.open sql,Conn,1,3
		%>
      <%do while not rs.eof%>
      <option value="<%=rs("St_class")%>"><%=rs("St_class")%></option>
      <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
    </select>
	��������
	<input name="St_name" type="text" id="St_name" size="12" />
	��
	<input type="submit" name="Submit" value=" �� �� " />
	��<a href="student_list.asp" onclick='changeAdminFlag(&quot;ϵͳѧ��&quot;)'>�鿴����ѧ��</a>
	|&nbsp;</font><a href="student_excel.asp" onclick='changeAdminFlag(&quot;��������ѧ����Ϣ&quot;)'>��������ѧ��</a>
	</form>
	
	
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ѧ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>����</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>רҵ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�꼶</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�༶</strong></font></td>
      <td nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">�ֻ�����</font></strong></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>���飨�޸ģ�</strong></font></td>
    </tr>
  <%
  		wh = ""
		Sp_id=trim(request.form("Sp_id"))
		St_class=trim(request.form("St_class"))
		St_name=trim(request.form("St_name"))
		if Sp_id <> "" then
			wh = " and st.Sp_id = "&"'"&Sp_id&"' "
		end if
		if St_class <> "" then
			wh = wh&" and St_class = "&"'"&St_class&"' "
		end if
		if St_name <> "" then
			wh = wh&" and St_name = "&"'"&St_name&"' "
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		sql="Select * from student_info st,speciality sp where st.Sp_id=sp.Sp_id "&wh&" and st.flag0=false order by st.St_number asc"
		'sql="Select * from user_table,user_type where user_table.U_t_id=user_type.U_T_id "&wh&"order by user_no asc"
		'response.Write(sql)
'		rsobj.open "select * from speciality",conn ,1,1
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=25 '��ҳ��� ��/ҳ
		if page < 1 then page = 1
		if page > rsobj.pagecount then page = rsobj.pagecount
		if rsobj.eof = false then
		rsobj.absolutepage = page
		else
		response.Write"<strong>û���κμ�¼����</strong>"
		response.End()
		end if
		if rsobj.eof or rsobj.eof then response.write("û������")
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
    <td><%=rsobj("St_number")%></td>
    <td><%=rsobj("St_name")%></td>
    <td><%=rsobj("Sp_name")%></td>
    <td><%=rsobj("St_grade")%></td>
    <td style='cursor:hand' title="����<%=rsobj("St_class")%>��ѧ����Ϣ">
	<a href='student_table.asp?St_class=<%=rsobj("St_class")%>'><font color='#330099'>
	<%=rsobj("St_class")%></font></a>	</td>
    <td><%=rsobj("St_m_phone")%></td>
    <td><%=rsobj("St_email")%></td>
    <td><a href='student_add.asp?Result=Modify&ID=<%=rsobj("st.ID")%>' onClick='changeAdminFlag("�޸�ѧ��")'><font color='#330099'>�鿴���޸�</font></a></td>
    </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="">
  <div align="center"><a href="task_notsel_excel.asp">��������</a>����ÿҳ��ʾ<strong> <%=rsobj.pagesize%> </strong>�����ܼ�¼:<strong><%=rsobj.recordcount%></strong> ��			��ҳ��: <strong><%=rsobj.pagecount%></strong> ��Ŀǰҳ��:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
��
  <%
		if page <> 1 then
		response.Write"<a href=?txtpage=1>����һҳ��</a>"
		response.Write"<a href=?txtpage="& (page-1)&">����һҳ��</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=?txtpage="& (page+1)&">����һҳ��</a>"
		response.Write"<a href=?txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
		end if
		'�ر�����
		rsobj.close
		set rsobj=nothing
		cnobj.close
		set cnobj=nothing
	%>
  </div>
</form>
</center>
</body>
</html>
