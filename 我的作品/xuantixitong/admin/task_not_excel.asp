<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=��ȷѡѧ����Ϣ.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<!--#include file="../inc/conn.asp"-->
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="4"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;����_GB2312&quot;;">δȷѡѧ��ѡ����Ϣ</span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">�� ��</span></td>
    <td><span style="font-weight: bold">��������</span></td>
    <td><span style="font-weight: bold">ָ����ʦ</span></td>
    <td><span style="font-weight: bold">ȷѡѧ��</span></td>
    <td><span style="font-weight: bold">ѧ ��</span></td>
	<td><span style="font-weight: bold">ר ҵ</span></td>
	 <td><span style="font-weight: bold">ѡ�ⷽ��</span></td>
     <td><span style="font-weight: bold">ѡ���Ѷ�</span></td>
  </tr>
<%
	dim all
	all = 1
	set rsobj=server.createobject("adodb.recordset")
	sql = "select * from select_true selt,select_cursor sel,teacher_inf tea,student_info stu,speciality spe where selt.Tea_id=tea.Tea_id and  selt.St_number=stu.St_number and selt.sel_flag=false and selt.ID=sel.ID and spe.Sp_id = stu.Sp_id order by selt.St_number asc"
	rsobj.open sql,conn,1,1
	if not rsobj.eof then
	do while not rsobj.eof
%>
  <tr>
    <td><div align="center"><%=all%></div></td>
    <td><div align="center"><%=rsobj("Sel_name")%></div></td>
    <td><div align="center"><%=rsobj("Tea_name")%></div></td>
    <td><div align="center"><%=rsobj("St_name")%></div></td>
    <td x:str><div align="center"><%=rsobj("selt.St_number")%></div></td>
    <td><div align="center"><%=rsobj("Sp_name")%></div></td>
	<td><div align="center"><%=rsobj("Sel_cour")%></div></td>
    <td><div align="center"><%=rsobj("Sel_level")%></div></td>
  </tr>
<%
	rsobj.movenext
	all = all + 1
	loop
	end if
	rsobj.close
	conn.close
%>
</table>
</body>
</html>