<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>课题列表</title>
<style type="text/css">
<!--
.stye_input{
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
	border: 0;
}
-->
</style>
<script language="javascript">
var number1;
 number1=0;
function check_radio(radio1)
{ 
	   if(radio1.checked)
	   {
			 number1=number1+1;
			 if(number1>1)
			 {
			 number1=number1-1;
				alert("不能同时选择两个课题");
				radio1.checked=false;
			 }
		}
		else{
		number1=number1-1;
		radio1.checked=false;
		}
	   
}
function check_form(sel_form)
{
	if(sel_form.radio1.checked==false)
	{
		alert("请选择选题！");
		return false;
	}
}
</script>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>学生选题：查看所有选题、每个学生只能选一个选题……</strong></font></td>
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
      </form>
	
	
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td width="5%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>选择</strong></font></td>
      <td width="35%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>选题名称</strong></font></td>
      <td width="13%" nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>指导老师</strong></font></td>
      <td width="18%" nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">选题方向</font></strong></td>
      <td width="12%" nowrap="nowrap"><font color="#FFFFFF"><strong>选题难度</strong></font></td>
      <td width="9%" nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">详细说明</font></strong></td>
      <td width="8%" nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>状态</strong></font></td>
    </tr>
  <%
  		wh = ""
		Sel_cour=request.QueryString("Sel_cour")
		Sel_cour2=trim(request.form("Sel_cour"))
		Sel_level=request.QueryString("Sel_level")
		Sel_level2=trim(request.form("Sel_level"))
		tea_name=request.QueryString("tea_name")
		tea_name2=trim(request.form("tea_name"))
		keyword=trim(request.form("keyword"))
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
		'sql = "select * from select_cursor sel,teacher_inf tea where sel.Tea_id=tea.Tea_id and sel_flag=True "&wh&" order by ID asc"
		sql = "select * from select_cursor where Sel_flag=false "&wh&" order by ID asc"
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
		dim p
		p=rsobj.pagesize
		for i=0 to p
		if rsobj.eof or rsobj.bof then exit for
	%>
	<form name="sel_form" method="post" action="task_v.asp?Action=Save&id=<%=rsobj("ID")%>&tea_name=<%=rsobj("Sel_Tea")%>" onsubmit="return check_form(this)">
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <td><input name="radio1" type="checkbox" id="radio1" value="" onclick="check_radio(this)"/></td>
    <td><%=rsobj("Sel_name")%></td>
    <td><%=rsobj("Sel_Tea")%></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td><a href="task_view2.asp?ID=<%=rsobj("ID")%>">详细说明</a></td>
    <td><input type="submit" value="提交" /></td>
  </tr>
    </form>
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
	%>
  </div>
</form>
</center>
</body>
</html>
