
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition","attachment;filename=班级学生信息表.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<html>
<!--#include file="../inc/conn.asp"-->
<body>
<table width="120%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="5"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;楷体_GB2312&quot;;"><%=request("St_class")%>班 学 生 信 息 表</span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">学号</span></td>
    <td><span style="font-weight: bold">专业ID</span></td>
    <td><span style="font-weight: bold">姓名</span></td>
    <td><span style="font-weight: bold">身份证号码</span></td>
    <td><span style="font-weight: bold">性别</span></td>
	<td><span style="font-weight: bold">年级</span></td>
	 <td><span style="font-weight: bold">班级</span></td>
     <td><span style="font-weight: bold">成绩排名</span></td>
     <td><span style="font-weight: bold">家庭住址</span></td>
     <td><span style="font-weight: bold">出生日期</span></td>
     <td><span style="font-weight: bold">来源</span></td>
     <td><span style="font-weight: bold">手机号码</span></td>
	 <td><span style="font-weight: bold">电话号码</span></td>
     <td><span style="font-weight: bold">QQ号码</span></td>
     <td><span style="font-weight: bold">Email</span></td>
     <td><span style="font-weight: bold">是否选题</span></td>
  </tr>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from student_info where St_class='"&request("St_class")&"'"
	rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof
%>
  <tr>
    <td>'<%=rs(1)%></td>
    <td>'<%=rs(2)%></td>
    <td><%=rs(3)%></td>
    <td>'<%=rs(4)%></td>
    <td><%=rs(5)%></td>
    <td>'<%=rs(6)%></td>
	<td>'<%=rs(7)%></td>
    <td>'<%=rs(8)%></td>
    <td><%=rs(9)%></td>
    <td><%=rs(10)%></td>
    <td><%=rs(11)%></td>
    <td>'<%=rs(12)%></td>
	<td>'<%=rs(13)%></td>
    <td>'<%=rs(14)%></td>
    <td><%=rs(15)%></td>
    <td><%=rs(17)%></td>
  </tr>
<%
	rs.movenext
	loop
	end if
	rs.close
	conn.close
%>
</table>
</body>
</html>