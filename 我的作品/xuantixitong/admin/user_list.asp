<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>רҵ�б�</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("���Ҫɾ������Ϣ��"))
		window.location = "user_add.asp?Action=del&ID="+ID ;
	}
//	function refresh() {//v1.0
//		window.open('') ;
//	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>����Ա������ӣ��޸Ĺ���Ա��Ϣ</strong></font></td>
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����Ա����</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����Ա����</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����Ա��</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>�޸�</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ɾ��</strong></font></td>
    </tr>
  <%
  		wh = ""
		u_type=trim(request.form("u_type"))
		user_no=trim(request.form("user_no"))
		user_name=trim(request.form("user_name"))
	
		set rsobj=server.CreateObject("adodb.recordset")
		sql="Select * from user_table uta,user_type uty where uta.U_t_id=uty.U_T_id order by user_no asc"
		rsobj.open sql,conn ,1,1
		
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
<tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
    <td><%=rsobj("user_no")%></td>
    <td><%=rsobj("u_type")%></td>
    <td><%=rsobj("user_name")%></td>
    <td><a href='user_add.asp?Result=Modify&ID=<%=rsobj("ID")%>' onClick='changeAdminFlag("�޸Ĺ���Ա")'><font color='#330099'>�޸�</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("ID")%>);"><font color='#330099'>ɾ��</font></a></td>
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
			response.Write"<a href=user_list.asp?txtpage=1>����һҳ��</a>"
			response.Write"<a href=user_list.asp?txtpage="& (page-1)&">����һҳ��</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=user_list.asp?txtpage="& (page+1)&">����һҳ��</a>"
			response.Write"<a href=user_list.asp?txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
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