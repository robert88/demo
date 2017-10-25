<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>课题列表</title></head>


<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->


<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("真的要删除该信息吗？"))
		window.location = "task_add.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>选题管理：添加，修改选题信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="task_list.asp">
        <p>方向：
		
		
            <select name="Sel_cour" id="Sel_cour">
			<option value="">请选择</option>
         <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Sel_cour from select_cursor group by Sel_cour"    
			rs.open sql,Conn,1,1
		%>
              <%do while not rs.eof%>
              <option value="<%=rs("Sel_cour")%>"><%=rs("Sel_cour")%></option>
              <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
		  
		  
		  
    　难度：
          <select name="Sel_level" id="sel2">
			<option value="">请选择</option>
         <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Sel_level from select_cursor group by Sel_level"    
			rs.open sql,Conn,1,1
		%>
            <%do while not rs.eof%>
            <option value="<%=rs("Sel_level")%>"><%=rs("Sel_level")%></option>
            <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
		  
	指导老师：
          <select name="tea_name" id="tea_name" >
		  <option value="">请选择</option>
            <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Tea_id,Tea_name from teacher_inf order by Tea_name asc"    
			rs.open sql,Conn,1,1
		%>
            <%do while not rs.eof%>
            <option value="<%=rs("Tea_id")%>"><%=rs("Tea_name")%></option>
            <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
　关键字：
	<input name="keyword" type="text" id="keyword" size="12" />
	　
	<input type="submit" name="Submit" value=" 检 索 " />
	　</p>
          <p>
		  <a href="task_add.asp?Result=Add" onclick='changeAdminFlag(&quot;添加选题&quot;)'>添加选题</a> |
		  <a href="task_list.asp" onclick='changeAdminFlag(&quot;系统课题&quot;)'>查看所有选题</a> |&nbsp;</font><a href="task_excel.asp" onclick='changeAdminFlag(&quot;导出所有课题信息&quot;)'>导出选题信息(Excel表)</a>
	            </p>
	</form>
	
	
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>选题名称</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>选题方向</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>选题难度</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>指导老师</strong></font></td>
      <td nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">限选专业</font></strong></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>有人选？</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>详情（修改）</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>审核</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>删除</strong></font></td>
    </tr>
  <%
  		wh = ""
		Sel_cour=request.QueryString("Sel_cour")
		Sel_cour2=request("Sel_cour")
		Sel_level=request.QueryString("Sel_level")
		Sel_level2=request("Sel_level")
		tea_name=request.QueryString("tea_name")
		tea_name2=request("tea_name")
		keyword=request("keyword")
		if Sel_cour <> "" then
			wh = wh&" and Sel_cour = "&"'"&Sel_cour&"' "
		end if
		if Sel_cour2 <> "" then
			wh = wh&" and Sel_cour = "&"'"&Sel_cour2&"' "
		end if
		
		if Sel_level <> "" then
			wh = wh&" and Sel_level = "&"'"&Sel_level&"' "
		end if
		if Sel_level2 <> "" then
			wh = wh&" and Sel_level = "&"'"&Sel_level2&"' "
		end if
				
		if tea_name <> "" then
			wh = wh&" and sel.Tea_id = "&"'"&tea_name&"' "
		end if
		if tea_name2 <> "" then
			wh = wh&" and sel.Tea_id = "&"'"&tea_name2&"' "
		end if
		
		if keyword <> "" then
			wh = wh&" and Sel_name like '%"&keyword&"%'"
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from select_cursor sel,teacher_inf tea,speciality sp where sp.sp_id=sel.sp_id and sel.Tea_id=tea.Tea_id"&wh&" order by sel.Tea_id asc"
		'调用数据库当中的字段方法：表名.字段。sel所有的选题，sp有限制的选题
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
    <td><%=rsobj("Sel_name")%></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td><%=rsobj("Tea_name")%></td>
    <td><%=rsobj("Sp_name")%></td>
    <td>
	<% if rsobj("sel_flag")=false then%>
	<%=rsobj("sel_flag")%>
	<%else%>
	<font color="#FF0000"><b><%=rsobj("sel_flag")%></b></font>
	<% end if%>	</td>
    <td><a href="task_add.asp?Result=Modify&amp;ID=<%=rsobj("sel.ID")%>&amp;txtpage=<%=page%>"
	onclick='changeAdminFlag(&quot;修改课题&quot;)'><font color='#330099'>查看并修改</font></a></td>
    <td>
	<% if rsobj("check")=false then%>
	<a href="?Result=check&ID=<%=rsobj("sel.ID")%>&txtpage=<%=page%>"
	onClick='changeAdminFlag("审核课题")'><font color='#330099'>审核</font></a>
	<%else%>
	<font color="#FF0000">通过</font>
	<% end if%>	</td>
    <td><a href="javascript:DoEmpty(<%=rsobj("sel.ID")%>);" onclick='changeAdminFlag(&quot;删除课题&quot;)'><font color='#330099'>删除</font></a></td>
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
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage=1>　第一页　</a>"
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page-1)&">　上一页　</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page+1)&">　下一页　</a>"
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& rsobj.pagecount&">　最末页　</a>"
		end if
		'关闭链接
		rsobj.close
		set rsobj=nothing
	%>
	
  </div>
</form>
</center>

<%
Action=request.QueryString("Result")
if Action = "check" then
	set rs = server.createobject("adodb.recordset")
	sql="select * from select_cursor where ID="&request("ID")
	response.Write(sql)
	rs.open sql,conn,1,3
		rs("check")=true
		rs.update
		rs.close
		set rs = nothing
		response.Redirect("task_list.asp?txtpage="&request("txtpage"))
end if
%>
</body>
</html>
