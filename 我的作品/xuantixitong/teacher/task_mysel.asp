<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>�����б�</title></head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("���Ҫɾ������Ϣ��"))
		window.location = "task_tadd.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>ѡ�������ӣ��޸�ѡ����Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="">
		  <a href="task_tadd.asp?Result=Add" onclick='changeAdminFlag(&quot;���ѡ��&quot;)'>���ѡ��</a> |
		  <a href="task_list.asp" onclick='changeAdminFlag(&quot;ϵͳ����&quot;)'>�鿴����ѡ��</a>
	</form>
	
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ID</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ������</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ�ⷽ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ���Ѷ�</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����ѡ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>���</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>���飨�޸ģ�</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ɾ��</strong></font></td>
    </tr>
  <%
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from select_cursor sel,teacher_inf tea where sel.Tea_id=tea.Tea_id and sel.Tea_id='"&session("user_no")&"'"
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
    <td><%=rsobj("sel.ID")%></td>
    <td><%=rsobj("Sel_name")%></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td>
	<% if rsobj("sel_flag")=false then%>
	<%=rsobj("sel_flag")%>
	<%else%>
	<font color="#FF0000"><b><%=rsobj("sel_flag")%></b></font>
	<% end if%>	</td>
    <td><% if rsobj("check")=false then%>
      δ���
      <%else%>
    <font color="#FF0000">ͨ��</font>
    <% end if%>
    </td>
    <td><a href="task_tadd.asp?Result=Modify&amp;ID=<%=rsobj("sel.ID")%>&amp;txtpage=<%=page%>"
	onClick='changeAdminFlag("�޸Ŀ���")'><font color='#330099'>�鿴���޸�</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("sel.ID")%>);" onClick='changeAdminFlag("ɾ������")'><font color='#330099'>ɾ��</font></a></td>
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
		response.Write"<a href=task_list.asp?txtpage=1>����һҳ��</a>"
		response.Write"<a href=task_list.asp?txtpage="& (page-1)&">����һҳ��</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=task_list.asp?txtpage="& (page+1)&">����һҳ��</a>"
		response.Write"<a href=task_list.asp?txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
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
