<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
</head>


<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("���Ҫɾ����ϵ������רҵ��Ϣ��"))
		window.location = "department_edit.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>ϵԺ���ã���ӣ��޸�ϵԺ��Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="department_edit.asp?Result=Add" onClick='changeAdminFlag("��ӹ���Ա")'>���ϵ��</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="department_list.asp" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴����ϵ��</a></td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ϵ����</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ϵ������</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ϵԺ������</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>�����˵绰</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>�޸�</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ɾ��</strong></font></td>
    </tr>
  <%
				set rsobj=server.CreateObject("adodb.recordset")
				rsobj.open "select * from Department order by id asc",conn ,1,1
				page=cint(request.QueryString("txtpage"))
				rsobj.pagesize=15 '��ҳ��� ��/ҳ
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
  <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
    <td><%=rsobj("D_no")%></td>
    <td><%=rsobj("D_name")%></td>
    <td><%=rsobj("D_manager")%></td>
    <td><%=rsobj("D_telphone")%></td>
    <td><a href='department_edit.asp?Result=Modify&ID=<%=rsobj("ID")%>' onClick='changeAdminFlag("�޸�ϵ��")'><font color='#330099'>�޸�</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("ID")%>);" onClick='changeAdminFlag("ɾ��ϵ��")'><font color='#330099'>ɾ��</font></a></td>
  </tr>
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
			response.Write"<a href=department_list.asp?txtpage=1>����һҳ��</a>"
			response.Write"<a href=department_list.asp?txtpage="& (page-1)&">����һҳ��</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=department_list.asp?txtpage="& (page+1)&">����һҳ��</a>"
			response.Write"<a href=department_list.asp?txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
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
