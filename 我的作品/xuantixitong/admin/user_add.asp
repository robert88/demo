<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.Sp_id.value.length == 0) { 
			alert("请输入管理员编号!");
			document.editForm.Sp_id.focus();
			return false;
			}
			if (document.editForm.Sp_name.value.length == 0) { 
			alert("请输入管理员名!");
			document.editForm.Sp_name.focus();
			return false;
			}
			return true;
		}
</script>
<title>查看管理员</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>管理员管理：添加，修改管理员信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="user_add.asp?Result=Add" onClick='changeAdminFlag("添加管理员")'>添加管理员</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="user_list.asp" onClick='changeAdminFlag("系统管理员")'>查看所有管理员</a><a href="user_serch.asp" onclick='changeAdminFlag(&quot;系统管理员&quot;)'></a></td>    
  </tr>
</table>
  <center>
    <br/>
	
	
	<%
		'添加数据------------------------------------------------------------------------------
		Result=request.QueryString("Result")
		if Result = "Add" then
	%>
	<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="user_add.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">管理员编号：</td>
        <td><div align="left">
          <input name="user_no" type="text" class="textfield" id="user_no" style="WIDTH: 120;" size="15">
          &nbsp;*&nbsp;数字，不能重复，提交后不能修改</div></td>
      </tr>
      <tr>
        <td height="20" align="right">管理员姓名：</td>
        <td><div align="left">
            <input name="user_name" type="text" class="textfield" id="user_name" style="WIDTH: 120;" size="19" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">管理员密码：</td>
        <td><div align="left">
            <input name="user_pass" type="text" class="textfield" id="user_pass" style="WIDTH: 120;" value="admin" size="20" />
          &nbsp;* 默认密码 admin</div></td>
      </tr>
      <tr>
        <td height="20" align="right">确认密码：</td>
        <td><div align="left">
            <input name="user_pass1" type="text" class="textfield" id="user_pass1" style="WIDTH: 120;" value="admin" size="20" />
          &nbsp;* 默认密码 admin</div></td>
      </tr>
      <tr>
        <td height="20" align="right">管理员类型：</td>
        <td><div align="left">
          <select name="u_type" id="u_type">
            <option value="1">管理员</option>
          </select>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
          <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value=" 添 加 " style="WIDTH: 60;" >
        　　
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;">
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>

<%
	end if
	'更新数据
	if Result = "Modify" then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from user_table where ID="&request("ID")&""
	'response.Write(sql)
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="user_add.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">
  <tr>
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">管理员编号：</td>
        <td><div align="left">
          <input name="user_no" type="text" class="textfield" id="user_no" style="WIDTH: 120;" value="<%=rs("user_no")%>" size="15" <%response.write ("readonly")%>>
          &nbsp;*&nbsp;数字，不能重复，不能修改</div></td>
      </tr>
      <tr>
        <td height="20" align="right">管理员姓名：</td>
        <td><div align="left">
            <input name="user_name" type="text" class="textfield" id="user_name" style="WIDTH: 120;" value="<%=rs("user_name")%>" size="19" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">管理员密码：</td>
        <td><div align="left">
            <input name="user_pass" type="text" class="textfield" id="user_pass" style="WIDTH: 120;" value="admin" size="20" readonly=""/>
          &nbsp;<span class="STYLE1">* 请不要修改密码</span> </div></td>
      </tr>
      <tr>
        <td height="20" align="right">确认密码：</td>
        <td><div align="left">
            <input name="user_pass1" type="text" class="textfield" id="user_pass1" style="WIDTH: 120;" value="admin" size="20" />
          &nbsp;* 默认密码 admin</div></td>
      </tr>
      <tr>
        <td height="20" align="right">管理员类型：</td>
        <td><div align="left">
          <select name="u_type" id="u_type">  
      <option value="1">管理员</option>
          </select>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
          <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value=" 修 改 " style="WIDTH: 60;" >
        　　
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;">
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table>
	
	</td>
  </tr>
  </form>
</table>

</td>
  </tr>
  </form>
  <%
  	rs1.close
	set rs1 = nothing
	rs.close
	set rs = nothing
	end if
%>
</center>
</body>
</html>


<%
'Action=addnew	添加数据
	Action=request.QueryString("Action")
	if Action = "addnew" then
		user_no = trim(request.form("user_no"))
		user_pass = request.form("user_pass")
		user_pass1 = request.form("user_pass1")
		if user_pass = user_pass1 then
			
		set rs = server.createobject("adodb.recordset")
		sql1="select * from user_table where user_no='"&user_no&"'"
		rs.open sql1,conn,1,3
			if rs.bof and rs.eof then
				rs.addnew
				rs("user_no")=trim(request.form("user_no"))
				rs("user_name")=trim(request.form("user_name"))
				rs("user_pass")=trim(md5(request.form("user_pass")))
				rs("U_t_id")=request.form("u_type")
				rs.update
				rs.close
				set rs = nothing
				response.Redirect("user_list.asp")
			else
				response.Write("<script>alert('管理员编号已存在！请返回……');history.back()</script>")
				'response.Redirect("user_list.asp")
			end if
		end if
		response.Write("<script>alert('两次输入密码不一致！请返回……');history.back()</script>")
		end if

'Action=addnew
	if Action = "SaveEdit" then
		user_pass = request.form("user_pass")
		user_pass1 = request.form("user_pass1")
		if user_pass = user_pass1 then
			set rs = server.createobject("adodb.recordset")
			sql="select * from user_table where ID="&request("ID")&""
			'response.Write(sql)
			rs.open sql,conn,1,3
			rs("user_no")=trim(request.form("user_no"))
			rs("user_name")=trim(request.form("user_name"))
			rs("user_pass")=trim(md5(request.form("user_pass")))
			rs("U_t_id")=request.form("u_type")
			rs.update
			rs.close
			set rs = nothing
			response.Write("修改管理员成功，请返回……")
			response.Redirect("user_list.asp")
		end if
		response.Write("<script>alert('两次输入密码不一致！请返回……');history.back()</script>")
	end if
	
	if Action = "del" then
		sql = "delete from user_table where ID=" & request("ID")
		Conn.Execute(sql)
		'response.Write(sql)
       	conn.close
       	set conn=nothing
		response.Write("删除成功，请返回……")
		response.Redirect("user_list.asp")
	end if
	
	
%>
