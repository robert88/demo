<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>�����б�</title>
<style type="text/css">
<!--
.STYLE2 {color: #666666}
-->
</style>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>ѧ��ѡ��������鿴����ѡ���ҵĿ���ѧ��</strong></font></td>
  </tr>
  <tr>
    <td align="center" nowrap  bgcolor="#EBF2F9">��ʾ�����ѧ�������鿴ѧ����ϸ��Ϣ</td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td width="6%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѧ��</strong></font></td>
      <td width="6%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>����</strong></font></td>
      <td width="11%" nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">ѧ���绰</font></strong></td>
      <td width="30%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ������</strong></font></td>
      <td width="11%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ָ����ʦ</strong></font></td>
      <td width="8%" nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">ѡ�ⷽ��</font></strong></td>
      <td width="8%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ���Ѷ�</strong></font></td>
      <td width="7%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����</strong></font></td>
      <td width="13%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����</strong></font></td>
    </tr>
  <%
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from select_cursor sel,teacher_inf tea,student_info stu where sel.Tea_id=tea.Tea_id and sel.St_number=stu.St_number and sel.Tea_id='"&session("user_no")&"' order by sel.Tea_id asc"
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
    <td><%=rsobj("stu.St_number")%></td>
    <td>
	<a href='student_add.asp?ID=<%=rsobj("stu.ID")%>' onClick='changeAdminFlag("�鿴ѧ����Ϣ")'><font color='#330099'><%=rsobj("St_name")%></font></a>
	</td>
    <td><%=rsobj("St_m_phone")%></td>
    <td><%=rsobj("Sel_name")%></td>
    <td><%=rsobj("Tea_name")%></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td><a href="task_add.asp?Result=Modify&ID=<%=rsobj("sel.ID")%>&txtpage=<%=page%>"
	onClick='changeAdminFlag("�޸Ŀ���")'><font color='#330099'>�鿴</font></a></td>
    <td>
	<%if rsobj("sel.check")=false then%>
	<a href="#" onClick="javascript:if(confirm('ȷѡ��ѧ����'))href='task_add.asp?Action=yes&scid=<%=rsobj("sel.St_number")%>&ID=<%=rsobj("sel.ID")%>&txtpage=<%=page%>'"><font color='#330099'>ȷѡ��ѧ��</font></a>
	<%else%>

	<a href="#" onClick="javascript:if(confirm('ȷ��ȡ��ȷѡ��ѧ����'))href='task_add.asp?Action=del_check&scid=<%=rsobj("sel.St_number")%>&ID=<%=rsobj("sel.ID")%>&txtpage=<%=page%>'"><font color='#FF0000'>ȡ��ȷѡ(��ȷѡ)</font></a>
	
	<%end if%>
	</td>
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
