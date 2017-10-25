<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.user_id.value.length == 0) { 
			alert("请输入编号!");
			document.editForm.user_id.focus();
			return false;
			}
			if (document.editForm.user_name.value.length == 0) { 
			alert("请输入姓名!");
			document.editForm.user_name.focus();
			return false;
			}
			if (document.editForm.content.value.length == 0) { 
			alert("请输入留言内容!");
			document.editForm.content.focus();
			return false;
			}
			return true;
		}
</script>
<title>查看教师</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>建议留言：签写留言（请提出宝贵建议）</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="msg_add.asp" onClick='changeAdminFlag("添加管理员")'>添加留言</a><font color="#0000FF">&nbsp;</font></td>    
  </tr>
</table>
    <br/>
	
	<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#21d015">
  <form name="editForm" method="post" action="?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">
      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">用户编号：</td>
        <td><div align="left">
            <input name="user_id" type="text" class="textfield" id="user_id" style="WIDTH: 120;" value="<%=session("user_no")%>" size="19" />
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">用户姓名：</td>
        <td><div align="left">
            <input name="user_name" type="text" class="textfield" id="user_name" style="WIDTH: 120;" value="<%=session("user_name")%>" size="19" />
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">针对用户：</td>
        <td><div align="left">
            <select name="visible" id="visible">
              <option value="0" selected="selected">所有用户</option>
              <option value="1">超级管理员</option>
              <option value="2">教师</option>
              <option value="3">学生</option>
            </select>
        （对该类型用户可见）</div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">留言内容：</td>
        <td><div align="left">
            <textarea name="content" cols="60" rows="8" class="textfield" id="content" style="WIDTH: 580;" ></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
            <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit3" value=" 提 交 " style="WIDTH: 60;" />
        　　
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit22" value=" 重 置 " style="WIDTH: 60;" />
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
</body>
</html>

<%
	Action=request.QueryString("Action")
	if Action = "addnew" then
	memo=server.HTMLEncode(request("content"))
	memo=replace(memo,vbcrlf,"<br>")
	memo=replace(memo," ","&nbsp;&nbsp;")
	memo=replace(memo,"'","''")
	set rs = server.createobject("adodb.recordset")
	sql="select * from message"
	rs.open sql,conn,1,3
		rs.addnew
		rs("user_id")=trim(request.form("user_id"))
		rs("user_name")=trim(request.form("user_name"))
		rs("visible")=trim(request.form("visible"))
		rs("content")=memo
		rs.update
		rs.close
		set rs = nothing
		conn.close
		set conn=nothing
		response.Redirect("msg_list.asp")
	end if
%>