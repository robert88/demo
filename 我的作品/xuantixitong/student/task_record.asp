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
    <td height="24" nowrap="nowrap"><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle" />&nbsp;<strong>已选选题……</strong></font></td>
  </tr>
 
</table><br />

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td width="35%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>选题名称</strong></font></td>
    <td width="13%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>指导老师</strong></font></td>
    <td width="18%" nowrap="nowrap" bgcolor="#21d015"><strong><font color="#FFFFFF">选题方向</font></strong></td>
    <td width="12%" nowrap="nowrap"><font color="#FFFFFF"><strong>选题难度</strong></font></td>
    <td width="9%" nowrap="nowrap" bgcolor="#21d015"><strong><font color="#FFFFFF">课题成绩</font></strong></td>
  </tr>
  <%
		St_number=trim(session("user_no"))
		set rsobj1=server.CreateObject("adodb.recordset")
		'sql = "select * from select_cursor sel,student_info stu where sel.sel_flag=ture and stu.St_number=sel.St_number order by sel.ID asc"
			sql = "select * from select_cursor sel,teacher_inf tea where sel.Tea_id=tea.Tea_id order by ID asc"	
		rsobj1.open sql,conn ,1,1
		
		if rsobj1.eof or rsobj1.bof then response.write("数据出错")
			response.write(rsobj1("sel.ID"))
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=30 '分页输出 条/页
		if page < 1 then page = 1
		if page > rsobj1.pagecount then page = rsobj1.pagecount
		if rsobj1.eof = false then
		rsobj1.absolutepage = page
		else
		response.Write"<strong>你还没选题！！</strong>"
		response.End()
		end if
		dim p
		p=rsobj1.pagesize
	response.write(rsobj1.recordcount)
		for i=0 to rsobj1.recordcount
		if rsobj1.eof or rsobj1.bof then 
			 response.write("sel.ID")
			exit for
			 else
	%>
	<%if St_number=rsobj1("sel.St_number") then%>
  <form action="" name="sel_form" id="sel_form" >
    <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj1("Sel_con")%>">
      <td><span style="font-size:12px;"><%=rsobj1("Sel_name")%></span></td>
      <td><span style="font-size:12px;"><%=rsobj1("Sel_Tea")%></span></td>
      <td><span style="font-size:12px;"><%=rsobj1("Sel_cour")%></span></td>
      <td><span style="font-size:12px;"><%=rsobj1("Sel_level")%></span></td>
      <td><span style="font-size:12px;"><%=rsobj1("Sel_recorder")%></span></td>
    </tr>
  </form>
  <%		
  end if
end if
  response.write(rsobj1("sel.ID"))
	rsobj1.movenext
	rsobj1.movenext
	next
	rsobj1.close
	set rsobj1=nothing
  %>
</table>
<p>&nbsp;</p>
