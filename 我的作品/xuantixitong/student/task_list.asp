<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>�����б�</title></head>
</html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID,tid)
	{
		if (confirm("ȷ��ѡ���ѡ����"))
		window.location = "task_add.asp?Action=sel&ID="+ID+"&tid="+tid ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>����ѡ�⣺�鿴����ѡ�⡢ÿ��ѧ��ֻ��ѡһ��ѡ�⡭��</strong></font></td>
  </tr>
  <tr>
    <td align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="">
        ����
            <select name="Sel_cour" id="Sel_cour">
			<option value="">��ѡ��</option>
         <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Sel_cour from select_cursor group by Sel_cour"    
			rs.open sql,Conn,1,1
		%>
              <%do while not rs.eof%>
              <option value="<%=rs("Sel_cour")%>"><%=rs("Sel_cour")%></option>
              <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
    ���Ѷȣ�
          <select name="Sel_level" id="sel2">
			<option value="">��ѡ��</option>
         <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Sel_level from select_cursor group by Sel_level"    
			rs.open sql,Conn,1,1
		%>
            <%do while not rs.eof%>
            <option value="<%=rs("Sel_level")%>"><%=rs("Sel_level")%></option>
            <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
		  
	ָ����ʦ��
          <select name="tea_name" id="tea_name" >
		  <option value="">��ѡ��</option>
            <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Tea_id,Tea_name from teacher_inf order by Tea_name asc"    
			rs.open sql,Conn,1,1
		%>
            <%do while not rs.eof%>
            <option value="<%=rs("Tea_id")%>"><%=rs("Tea_name")%></option>
            <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
���ؼ��֣�
	<input name="keyword" type="text" id="keyword" size="12" />
	��
	<input type="submit" name="Submit" value=" �� �� " />
      </form>    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td width="4%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ID</strong></font></td>
      <td width="41%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ������</strong></font></td>
      <td width="9%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ�ⷽ��</strong></font></td>
      <td width="8%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ���Ѷ�</strong></font></td>
      <td width="8%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ָ����ʦ</strong></font></td>
      <td width="6%" nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">��ѡ����</font></strong></td>
      <td width="8%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����ѡ��</strong></font></td>
    </tr>
  <%
  		wh = ""
		Sel_cour=request.QueryString("Sel_cour")
		Sel_cour2=request("Sel_cour")
		Sel_level=request.QueryString("Sel_level")
		Sel_level2=request("Sel_level")
		tea_name=request.QueryString("tea_name")
		tea_name2=request("tea_name")
		keyword=request("keyword")
		if Sel_cour <> "" then
			wh = wh&" and Sel_cour = "&"'"&Sel_cour&"' "
		end if
		if Sel_cour2 <> "" then
			wh = wh&" and Sel_cour = "&"'"&Sel_cour2&"' "
		end if
		
		if Sel_level <> "" then
			wh = wh&" and Sel_level = "&"'"&Sel_level&"' "
		end if
		if Sel_level2 <> "" then
			wh = wh&" and Sel_level = "&"'"&Sel_level2&"' "
		end if
				
		if tea_name <> "" then
			wh = wh&" and sel.Tea_id = "&"'"&tea_name&"' "
		end if
		if tea_name2 <> "" then
			wh = wh&" and sel.Tea_id = "&"'"&tea_name2&"' "
		end if
		
		if keyword <> "" then
			wh = wh&" and Sel_name like '%"&keyword&"%'"
		end if
		set rsobj=server.CreateObject("adodb.recordset")		'sql="Select * from select_cursor st,speciality sp where st.Sp_id=sp.Sp_id "&wh&" order by St_number asc"
		sql = "select * from select_cursor sel,teacher_inf tea where sel.Tea_id=tea.Tea_id"&wh&" order by ID asc"
		'response.Write(sql)
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=30 '��ҳ��� ��/ҳ
		if page < 1 then page = 1
		if page > rsobj.pagecount then page = rsobj.pagecount
		if rsobj.eof = false then
		rsobj.absolutepage = page
		else
		response.Write"<strong>û���κμ�¼����</strong>"
		response.End()
		end if
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <td><%=rsobj("ID")%></td>
    <td><%=rsobj("Sel_name")%></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td><%=rsobj("Tea_name")%></td>
    <td><%=rsobj("Sel_nu")%></td>
    <td>
	<% if rsobj("sel_flag")=false then%>
	<%=rsobj("sel_flag")%>
	<%else%>
	<font color="#FF0000"><b><%=rsobj("sel_flag")%></b></font>
	<% end if%>    </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="">
  <div align="center">ÿҳ��ʾ<strong> <%=rsobj.pagesize%> </strong>�����ܼ�¼:<strong><%=rsobj.recordcount%></strong> ��			��ҳ��: <strong><%=rsobj.pagecount%></strong> ��Ŀǰҳ��:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
��
  <%
		if page <> 1 then
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage=1>����һҳ��</a>"
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page-1)&">����һҳ��</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page+1)&">����һҳ��</a>"
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
		end if
		'�ر�����
		rsobj.close
		set rsobj=nothing
		conn.close
		set conn=nothing
	%>
  </div>
</form>
</center>
</body>
</html>

