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
			alert("请输入教师职称编号!");
			document.editForm.Sp_id.focus();
			return false;
			}
			if (document.editForm.Sp_name.value.length == 0) { 
			alert("请输入教师职称名!");
			document.editForm.Sp_name.focus();
			return false;
			}
			return true;
		}
</script>
<title>查看系别</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>教师职称设置：添加，修改教师职称信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="zc_add.asp?Result=Add" onClick='changeAdminFlag("添加管理员")'>添加教师职称</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="zc_table.asp" onClick='changeAdminFlag("系统管理员")'>查看所有教师职称</a></td>    
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
  <form name="editForm" method="post" action="zc_add.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">教师职称编号：</td>
        <td><div align="left">
          <input name="zc_id" type="text" class="textfield" id="zc_id" style="WIDTH: 120;" size="15">
        * 提交后不可修改</div></td>
      </tr>
      <tr>
        <td height="20" align="right">教师职称名称：</td>
        <td><div align="left">
            <input name="zc_name" type="text" class="textfield" id="zc_name" style="WIDTH: 120;" size="20" />
          &nbsp;*</div></td>
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
	sql="select * from zc_table where ID="&request("ID")&""
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="zc_add.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">
  <tr>
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">教师职称编号：</td>
        <td><div align="left">
            <input name="zc_id" type="text" class="textfield" id="zc_id" style="WIDTH: 120;" value="<%=rs("zc_id")%>" size="15" <%response.write ("readonly")%>/>
          * 不能修改</div></td>
      </tr>
      <tr>
        <td height="20" align="right">教师职称名称：</td>
        <td><div align="left">
            <input name="zc_name" type="text" class="textfield" id="zc_name" style="WIDTH: 120;" value="<%=rs("zc_name")%>" size="20" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
            <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" 修 改 " style="WIDTH: 60;">
          
          <input name="submitSaveEdit22" type="reset" class="button"  id="submitSaveEdit22" value=" 重 置 " style="WIDTH: 60;" />
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
		res_id = trim(request.form("zc_id"))
		set rs = server.createobject("adodb.recordset")
		sql1="select * from zc_table where zc_id='"&zc_id&"'"
		rs.open sql1,conn,1,3
			if rs.bof and rs.eof then
				rs.addnew
				rs("zc_id")=trim(request.form("zc_id"))
				rs("zc_name")=trim(request.form("zc_name"))
				rs.update
				rs.close
				set rs = nothing
				response.Write("添加成功，正在返回……")
				response.Redirect("zc_table.asp")
			else
				response.Write("<script>alert('编号重复！请返回……');history.back()</script>")
				response.Redirect("zc_table.asp")
			end if
		end if

'Action=addnew
	if Action = "SaveEdit" then
		set rs = server.createobject("adodb.recordset")
		sql="select * from zc_table where ID="&request("ID")&""
		'response.Write(sql)
		rs.open sql,conn,1,3
		rs("zc_id")=trim(request.form("zc_id"))
		rs("zc_name")=trim(request.form("zc_name"))
		rs.update
		rs.close
		set rs = nothing
		response.Write("修改教师职称成功，请返回……")
		response.Redirect("zc_table.asp")
	end if
	
	if Action = "del" then
		sql = "delete from zc_table where ID=" & request("ID")
		'response.Write(sql)
		Conn.Execute(sql)
		'response.Write(sql)
       	conn.close
       	set conn=nothing
		response.Write("删除成功，请返回……")
		response.Redirect("zc_table.asp")
	end if
	
	
%>
