<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->


<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap="nowrap"><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle" />&nbsp;<strong>ϵͳ��ȫ --&gt; ��־ --&gt; �б�</strong></font></td>
  </tr>
</table>
<br />
<center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>��־���</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�û����</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>����ʱ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>����IP</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�û���</strong></font></td>
    </tr>
			<%
				set rsobj=server.CreateObject("adodb.recordset")
				rsobj.open "select * from rz_table where user_id='"&session("user_no")&"' order by note_id desc",conn ,1,1
				page=cint(request.QueryString("txtpage"))
				rsobj.pagesize=30 '��ҳ��� ��/ҳ
				if page < 1 then page = 1
				if page > rsobj.pagecount then page = rsobj.pagecount
				if rsobj.eof = false then
				rsobj.absolutepage = page
				else
				response.Write"<h2>û���κ���־��¼����</h2>"
				response.End()
				end if
				for i=1 to rsobj.pagesize
				if rsobj.eof then exit for
			%>
    <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
      <td><%=rsobj("note_id")%></td>
      <td><%=rsobj("user_id")%></td>
      <td><%=rsobj("op_time")%></td>
      <td><%=rsobj("login_ip")%></td>
      <td><%=rsobj("user_name")%></td>
    </tr>
    <%
	rsobj.movenext
	next
  %>
  </table>
            <form method="get" action="">
			ÿҳ��ʾ<strong> <%=rsobj.pagesize%> </strong>�����ܼ�¼:<strong><%=rsobj.recordcount%></strong>
��			��ҳ��: ��ҳ��: <strong><%=rsobj.pagecount%></strong>
			��Ŀǰҳ��:
			<input name="txtpage" type="text" class="textfield" value="<% =page %>" size="2">��
		    <%
			if page <> 1 then
			response.Write"<a href=log.asp?txtpage=1>����һҳ��</a>"
			response.Write"<a href=log.asp?txtpage="& (page-1)&">����һҳ��</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=log.asp?txtpage="& (page+1)&">����һҳ��</a>"
			response.Write"<a href=log.asp?txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
			end if
			'�ر�����
			rsobj.close
			set rsobj=nothing
			cnobj.close
			set cnobj=nothing
		%>
			</form>
</center>
</body>
</html>