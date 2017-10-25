<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>课题列表</title>
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
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>学生选题情况：查看所有选择我的课题学生</strong></font></td>
  </tr>
  <tr>
    <td align="center" nowrap  bgcolor="#EBF2F9">提示：点击学生姓名查看学生详细信息</td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td width="6%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>学号</strong></font></td>
      <td width="6%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>姓名</strong></font></td>
      <td width="11%" nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">学生电话</font></strong></td>
      <td width="30%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>选题名称</strong></font></td>
      <td width="11%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>指导老师</strong></font></td>
      <td width="8%" nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">选题方向</font></strong></td>
      <td width="8%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>选题难度</strong></font></td>
      <td width="7%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>详情</strong></font></td>
      <td width="13%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>操作</strong></font></td>
    </tr>
  <%
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from select_cursor sel,teacher_inf tea,student_info stu where sel.Tea_id=tea.Tea_id and sel.St_number=stu.St_number and sel.Tea_id='"&session("user_no")&"' order by sel.Tea_id asc"
		'response.Write(sql)
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=30 '分页输出 条/页
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
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <td><%=rsobj("stu.St_number")%></td>
    <td>
	<a href='student_add.asp?ID=<%=rsobj("stu.ID")%>' onClick='changeAdminFlag("查看学生信息")'><font color='#330099'><%=rsobj("St_name")%></font></a>
	</td>
    <td><%=rsobj("St_m_phone")%></td>
    <td><%=rsobj("Sel_name")%></td>
    <td><%=rsobj("Tea_name")%></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td><a href="task_add.asp?Result=Modify&ID=<%=rsobj("sel.ID")%>&txtpage=<%=page%>"
	onClick='changeAdminFlag("修改课题")'><font color='#330099'>查看</font></a></td>
    <td>
	<%if rsobj("sel.check")=false then%>
	<a href="#" onClick="javascript:if(confirm('确选该学生？'))href='task_add.asp?Action=yes&scid=<%=rsobj("sel.St_number")%>&ID=<%=rsobj("sel.ID")%>&txtpage=<%=page%>'"><font color='#330099'>确选该学生</font></a>
	<%else%>

	<a href="#" onClick="javascript:if(confirm('确定取消确选该学生？'))href='task_add.asp?Action=del_check&scid=<%=rsobj("sel.St_number")%>&ID=<%=rsobj("sel.ID")%>&txtpage=<%=page%>'"><font color='#FF0000'>取消确选(已确选)</font></a>
	
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
  <div align="center">每页显示<strong> <%=rsobj.pagesize%> </strong>条　总记录:<strong><%=rsobj.recordcount%></strong> 　			总页数: <strong><%=rsobj.pagecount%></strong> 　目前页数:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
　
  <%
		if page <> 1 then
		response.Write"<a href=?txtpage=1>　第一页　</a>"
		response.Write"<a href=?txtpage="& (page-1)&">　上一页　</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=?txtpage="& (page+1)&">　下一页　</a>"
		response.Write"<a href=?txtpage="& rsobj.pagecount&">　最末页　</a>"
		end if
		'关闭链接
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
