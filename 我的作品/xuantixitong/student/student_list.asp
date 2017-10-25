<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>学号</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>姓名</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>专业名</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>年级</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>班级</strong></font></td>
      <td nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">手机号码</font></strong></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>邮箱</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>详情（修改）</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>删除</strong></font></td>
    </tr>
  <%
  		dim wh,Sp_id,St_class,St_name
  		wh = ""
		Sp_id=request("Sp_id")
		St_class=request("St_class")
		St_name=request("St_name")
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
		sql="Select * from Student_info st,speciality sp where st.Sp_id=sp.Sp_id "&wh&" order by St_number asc"
		'sql="Select * from user_table,user_type where user_table.U_t_id=user_type.U_T_id "&wh&"order by user_no asc"
		'response.Write(sql)
'		rsobj.open "select * from speciality",conn ,1,1
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=25 '分页输出 条/页
		if page < 1 then page = 1
		if page > rsobj.pagecount then page = rsobj.pagecount
		if rsobj.eof = false then
		rsobj.absolutepage = page
		else
		response.Write"<strong>没有任何记录！！</strong>"
		response.End()
		end if
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
    <td><%=rsobj("St_number")%></td>
    <td><%=rsobj("St_name")%></td>
    <td><%=rsobj("Sp_name")%></td>
    <td><%=rsobj("St_grade")%></td>
    <td style='cursor:hand' title="导出<%=rsobj("St_class")%>班学生信息">
	<a href='student_table.asp?St_class=<%=rsobj("St_class")%>'><font color='#330099'>
	<%=rsobj("St_class")%></font></a>
	</td>
    <td><%=rsobj("St_m_phone")%></td>
    <td><%=rsobj("St_email")%></td>
    <td><a href='student_add.asp?Result=Modify&ID=<%=rsobj("st.ID")%>' onClick='changeAdminFlag("修改学生")'><font color='#330099'>查看并修改</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("st.ID")%>);" onClick='changeAdminFlag("删除学生")'><font color='#330099'>删除</font></a></td>
  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
