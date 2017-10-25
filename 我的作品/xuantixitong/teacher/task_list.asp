<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>课题列表</title></head>
</html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID,tid)
	{
		if (confirm("确定选择该选题吗？"))
		window.location = "task_add.asp?Action=sel&ID="+ID+"&tid="+tid ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>所有选题：查看所有选题、检查是否有重复的选题……</strong></font></td>
  </tr>
  <tr>
    <td align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="">
        方向：
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
			sql="select Tea_name from teacher_inf order by Tea_name asc"    
			rs.open sql,Conn,1,1
		%>
            <%do while not rs.eof%>
            <option value="<%=rs("Tea_name")%>"><%=rs("Tea_name")%></option>
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
      </form>    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td width="3%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ID</strong></font></td>
      <td width="32%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>选题名称</strong></font></td>
      <td width="11%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>选题方向</strong></font></td>
      <td width="10%" nowrap="nowrap"><font color="#FFFFFF"><strong>选题难度</strong></font></td>
      <td width="7%" nowrap="nowrap" bgcolor="#21d015"><strong><font color="#FFFFFF">老师工号</font></strong></td>
      <td width="7%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>指导老师</strong></font></td>
      <td width="7%" nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">限选人数</font></strong></td>
      <td width="7%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>有人选？</strong></font></td>
      <td width="6%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>详情</strong></font></td>
      <td width="10%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>审核</strong></font></td>
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
			wh = wh&" and sel.Tea_name = "&"'"&tea_name&"' "
		end if
		if tea_name2 <> "" then
			wh = wh&" and sel.Tea_name = "&"'"&tea_name2&"' "
		end if
		
		if keyword <> "" then
			wh = wh&" and Sel_name like '%"&keyword&"%'"
		end if
		
		set rsobj=server.CreateObject("adodb.recordset")
		'sql="Select * from select_cursor st,speciality sp where st.Sp_id=sp.Sp_id "&wh&" order by St_number asc"
		'sql="Select * from select_cursor"
		sql = "select * from select_cursor sel,teacher_inf tea where tea.Tea_id=sel.Tea_id "&wh&" order by tea.tea_id asc"
		'sql="Select * from user_table,user_type where user_table.U_t_id=user_type.U_T_id "&wh&"order by user_no asc"
		'response.Write(sql)
'		rsobj.open "select * from speciality",conn ,1,1
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
		for i=0 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
	
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <td><%=rsobj("sel.ID")%></td>
    <td><%=rsobj("Sel_name")%></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td><%=rsobj("tea.Tea_id")%></td>
    <td><%=rsobj("Tea_name")%></td>
    <td><%=rsobj("tea.St_number")%></td>
    <td>
	<% if rsobj("sel_flag")=false then%>
	<%=rsobj("sel_flag")%>
	<%else%>
	<font color="#FF0000"><b><%=rsobj("sel_flag")%></b></font>
	<% end if%>
    <td><a href="task_add.asp?Result=Modify&ID=<%=rsobj("sel.ID")%>&txtpage=<%=page%>"
	onClick='changeAdminFlag("修改课题")'><font color='#330099'>查看详情</font></a></td>
    <td>
	<% if rsobj("check")=false then%>
未审核
        <%else%>
        <font color="#FF0000">通过</font>
        <% end if%>    </td>
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
		conn.close
		set conn=nothing
	%>
  </div>
</form>
</center>
</body>
</html>

