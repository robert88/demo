<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
</head>


<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("真的要删除该系别及下属专业信息吗？"))
		window.location = "department_edit.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>系院设置：添加，修改系院信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="department_edit.asp?Result=Add" onClick='changeAdminFlag("添加管理员")'>添加系别</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="department_list.asp" onClick='changeAdminFlag("系统管理员")'>查看所有系别</a></td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>系别编号</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>系别名称</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>系院负责人</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>负责人电话</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>修改</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>删除</strong></font></td>
    </tr>
  <%
				set rsobj=server.CreateObject("adodb.recordset")
				rsobj.open "select * from Department order by id asc",conn ,1,1
				page=cint(request.QueryString("txtpage"))
				rsobj.pagesize=15 '分页输出 条/页
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
  <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
    <td><%=rsobj("D_no")%></td>
    <td><%=rsobj("D_name")%></td>
    <td><%=rsobj("D_manager")%></td>
    <td><%=rsobj("D_telphone")%></td>
    <td><a href='department_edit.asp?Result=Modify&ID=<%=rsobj("ID")%>' onClick='changeAdminFlag("修改系别")'><font color='#330099'>修改</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("ID")%>);" onClick='changeAdminFlag("删除系别")'><font color='#330099'>删除</font></a></td>
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
			response.Write"<a href=department_list.asp?txtpage=1>　第一页　</a>"
			response.Write"<a href=department_list.asp?txtpage="& (page-1)&">　上一页　</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=department_list.asp?txtpage="& (page+1)&">　下一页　</a>"
			response.Write"<a href=department_list.asp?txtpage="& rsobj.pagecount&">　最末页　</a>"
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
