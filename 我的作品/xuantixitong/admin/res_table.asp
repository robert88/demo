<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>������</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("���Ҫɾ���ý�������"))
		window.location = "res_add.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>�����ֵ�ά������ӣ��޸Ľ�������Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="res_add.asp?Result=Add">��ӽ�����</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="res_table.asp" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴���н�����</a></td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ID</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>�����ұ��</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����ϵ��</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����������</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>�޸�</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ɾ��</strong></font></td>
    </tr>
  <%
				set rsobj=server.CreateObject("adodb.recordset")
				rsobj.open "select * from res_table res,department dep where res.d_no=dep.d_no order by res.id asc",conn ,1,1
				page=cint(request.QueryString("txtpage"))
				rsobj.pagesize=10 '��ҳ��� ��/ҳ
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
    <td><%=rsobj("res.ID")%></td>
    <td><%=rsobj("res_id")%></td>
    <td><%=rsobj("D_name")%></td>
    <td><%=rsobj("res_name")%></td>
    <td><a href='res_add.asp?Result=Modify&amp;ID=<%=rsobj("res.ID")%>' onClick='changeAdminFlag("�޸Ľ�����")'><font color='#330099'>�޸�</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("res.ID")%>);" onClick='changeAdminFlag("ɾ��������")'><font color='#330099'>ɾ��</font></a></td>
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
			response.Write"<a href=res_table.asp?txtpage=1>����һҳ��</a>"
			response.Write"<a href=res_table.asp?txtpage="& (page-1)&">����һҳ��</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=res_table.asp?txtpage="& (page+1)&">����һҳ��</a>"
			response.Write"<a href=res_table.asp?txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
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
