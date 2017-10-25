<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.D_no.value.length == 0) { 
			alert("请输入系别编号!");
			document.editForm.D_no.focus();
			return false;
			}
			if (document.editForm.D_name.value.length == 0) { 
			alert("请输入系名!");
			document.editForm.D_name.focus();
			return false;
			}
			return true;
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
  <center>
    <br/>
	
	
	<%
		'添加数据------------------------------------------------------------------------------
		Result=request.QueryString("Result")
		if Result = "Add" then
	%>
	<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="department_edit.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">系别编号：</td>
        <td><div align="left">
          <input name="D_no" type="text" class="textfield" id="D_no" style="WIDTH: 120;" size="15">
          &nbsp;*&nbsp;四位数字，不能重复</div></td>
      </tr>
      <tr>
        <td height="20" align="right">系别名称：</td>
        <td><div align="left">
            <input name="D_name" type="text" class="textfield" id="D_name" style="WIDTH: 120;" size="20" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">负 责 人：</td>
        <td><div align="left">
            <input name="D_manager" type="text" class="textfield" id="D_manager" style="WIDTH: 120;" size="20" />
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">负责人电话：</td>
        <td><div align="left">
            <input name="D_telphone" type="text" class="textfield" id="D_telphone" style="WIDTH: 120;" size="20" />
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
	sql="select * from Department where ID="&request("ID")&""
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="department_edit.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">系别编号：</td>
        <td><div align="left">
          <input name="D_no" type="text" class="textfield" id="D_no" style="WIDTH: 120;" value="<%=rs("D_no")%>" size="15" <%response.write ("readonly")%>>
          &nbsp;*&nbsp;四位数字，不能修改</div></td>
      </tr>
      <tr>
        <td height="20" align="right">系别名称：</td>
        <td><div align="left">
            <input name="D_name" type="text" class="textfield" id="D_name" style="WIDTH: 120;" value="<%=rs("D_name")%>" size="20" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">负 责 人：</td>
        <td><div align="left">
            <input name="D_manager" type="text" class="textfield" id="D_manager" style="WIDTH: 120;" value="<%=rs("D_manager")%>" size="20" />
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">负责人电话：</td>
        <td><div align="left">
            <input name="D_telphone" type="text" class="textfield" id="D_telphone" style="WIDTH: 120;" value="<%=rs("D_telphone")%>" size="20" />
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
    </table></td>
  </tr>
  </form>
</table>


<%
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
		fD_no = trim(request.form("D_no"))
		set rs = server.createobject("adodb.recordset")
		sql1="select * from Department where D_no='"&fD_no&"'"
		rs.open sql1,conn,1,3
			if rs.bof and rs.eof then
				rs.addnew
				rs("D_no")=trim(request.form("D_no"))
				rs("D_name")=trim(request.form("D_name"))
				rs("D_manager")=trim(request.form("D_manager"))
				rs("D_telphone")=trim(request.form("D_telphone"))
				rs.update
				rs.close
				set rs = nothing
				response.Write("添加系别成功，请返回……")
				response.Redirect("department_list.asp")
			else
				response.Write("<script>alert('系别编号重复！请返回……');history.back()</script>")
			end if
		end if

'Action=addnew
	if Action = "SaveEdit" then
		set rs = server.createobject("adodb.recordset")
		sql="select * from Department where ID="&request("ID")&""
		'response.Write(sql)
		rs.open sql,conn,1,3
		rs("D_no")=trim(request.form("D_no"))
		rs("D_name")=trim(request.form("D_name"))
		rs("D_manager")=trim(request.form("D_manager"))
		rs("D_telphone")=trim(request.form("D_telphone"))
		rs.update
		rs.close
		set rs = nothing
		response.Write("修改系别成功，请返回……")
		response.Redirect("department_list.asp")
	end if
	
	if Action = "del" then
		set rs = server.createobject("adodb.recordset")
		sql="select D_no from Department where ID=" & request("ID")
		rs.open sql,conn,1,1
		Conn.Execute("delete from speciality where D_no=" &"'"& rs("D_no")&"'" )
		Conn.Execute("delete from Department where ID=" & request("ID") )
		'response.Write("delete from speciality where D_no=" & rs("D_no"))
		rs.close
		set rs = nothing
       	conn.close
       	set conn=nothing
		response.Write("删除成功，请返回……")
		response.Redirect("department_list.asp")
	end if
	
	
%>




