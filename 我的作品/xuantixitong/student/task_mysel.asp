<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/Conn.asp"-->
<!--#include file="CheckAdmin.asp"-->
<style type="text/css">
<!--
.stye_input {	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
	border: 0;
}
-->
</style>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap="nowrap"><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle" />&nbsp;<strong>��ѡѡ�⡭��</strong></font></td>
  </tr>
 
</table><br />

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td width="35%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ������</strong></font></td>
    <td width="13%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ָ����ʦ</strong></font></td>
    <td width="18%" nowrap="nowrap" bgcolor="#21d015"><strong><font color="#FFFFFF">ѡ�ⷽ��</font></strong></td>
    <td width="12%" nowrap="nowrap"><font color="#FFFFFF"><strong>ѡ���Ѷ�</strong></font></td>
    <td width="9%" nowrap="nowrap" bgcolor="#21d015"><strong><font color="#FFFFFF">��ϸ˵��</font></strong></td>
    <td width="8%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�޸�</strong></font></td>
  </tr>
  <%
		St_number=trim(session("user_no"))
	'	response.write(St_number)
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from select_cursor where St_number='"&St_number&"'order by ID asc"
		rsobj.open sql,conn ,1,3
		'if rsobj.eof or rsobj.bof then response.write("���ݴ���")
		'response.write(rsobj("ID"))
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=30 '��ҳ��� ��/ҳ
		if page < 1 then page = 1 
		if page > rsobj.pagecount then page = rsobj.pagecount
		if rsobj.eof = flase then
		rsobj.absolutepage = page
		else
		response.Write"<strong>�㻹ûѡ�⣡��</strong>"
		response.End()
		end if
		'response.write(rsobj.recordcount)
		for i=0 to rsobj.recordcount
		if rsobj.eof or rsobj.bof then exit for
	%>
	<%if St_number=rsobj("St_number") then%>
  <form action="task_v.asp" name="sel_form" id="sel_form" >
    <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
      <td><span style="font-size:12px;"><%=rsobj("Sel_name")%></span></td>
      <td><span style="font-size:12px;"><%=rsobj("Sel_Tea")%></span></td>
      <td><span style="font-size:12px;"><%=rsobj("Sel_cour")%></span></td>
      <td><span style="font-size:12px;"><%=rsobj("Sel_level")%></span></td>
      <td><span style="font-size:12px;"><a href="task_view2.asp?ID=<%=rsobj("ID")%>">��ϸ˵��</a></span></td>
      <td><span style="font-size:12px;"><a href="task_v.asp?Action=del&id=<%=rsobj("ID")%>&tea_name=<%=rsobj("Sel_Tea")%>">ɾ��</a></span></td>
    </tr>
  </form>
  <%
  end if
	rsobj.movenext
	next
  %>
</table>
<p>&nbsp;</p>
