<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ѧ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>����</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>רҵ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�꼶</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�༶</strong></font></td>
      <td nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">�ֻ�����</font></strong></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>���飨�޸ģ�</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ɾ��</strong></font></td>
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
		rsobj.pagesize=25 '��ҳ��� ��/ҳ
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
    <td><%=rsobj("St_number")%></td>
    <td><%=rsobj("St_name")%></td>
    <td><%=rsobj("Sp_name")%></td>
    <td><%=rsobj("St_grade")%></td>
    <td style='cursor:hand' title="����<%=rsobj("St_class")%>��ѧ����Ϣ">
	<a href='student_table.asp?St_class=<%=rsobj("St_class")%>'><font color='#330099'>
	<%=rsobj("St_class")%></font></a>
	</td>
    <td><%=rsobj("St_m_phone")%></td>
    <td><%=rsobj("St_email")%></td>
    <td><a href='student_add.asp?Result=Modify&ID=<%=rsobj("st.ID")%>' onClick='changeAdminFlag("�޸�ѧ��")'><font color='#330099'>�鿴���޸�</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("st.ID")%>);" onClick='changeAdminFlag("ɾ��ѧ��")'><font color='#330099'>ɾ��</font></a></td>
  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
