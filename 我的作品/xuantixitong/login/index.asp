<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META NAME="copyright" CONTENT="Copyright 上饶师范学院 物理与电子信息学院" />
<META NAME="Keywords" CONTENT="上饶师范学院 毕业论文选题系统" />
<META NAME="Description" CONTENT="上饶师范学院毕业论文选题系统" />
<title>上饶师范学院毕业论文选题系统</title>
<link href="../js/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-image: url(../Images/3.png);
	text-align:center;
}
.STYLE3 {	font-size: 12px;
	color: #FFFFFF;
	text-decoration: none;
}
.style_sysname {
    text-align:center;
	font-size:12px;
}
.FontWit {
	font-family: "宋体", "System";
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}

-->
</style>

<script language="javascript" type="text/javascript">
function CheckForm()
{ 
	if (document.login.user_no.value.length == 0) { 
	alert("请输入用户编号，学生为8位数的学号!");
	document.login.user_no.focus();
	return false;
	}
	return true;
}
</script>
<!--#include file="../inc/Conn.asp" -->
<%
	set rs1 = server.createobject("adodb.recordset")
	sql="select * from config"
	rs1.open sql,conn,1,3
	session("sysname")=rs1("sysname")
%>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table id="__01" width="1024" height="621" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="2"><img src="../Images/logo.gif" width="361" height="210" alt="" /></td>
		<td>
			<img src="../Images/title.gif" width="663" height="162" alt=""></td>
	</tr>
	<tr>
		<td background="../Images/mid1.gif" width="663" height="48" ><span class="style_sysname"><%=rs1("sysname")%></span></td>
	</tr>
	<tr>
		<td>
		
			<img src="../Images/mid_left.gif" width="361" height="346" alt=""></td>
		<td background="../Images/form_content.gif" width="663" height="346"">
		<form id="login" name="login" method="post" action="login.asp" onSubmit="return CheckForm();">
		<table width="50%" border="0" align="left" cellspacing="3">
          <tr>
            <td class="FontWit"><div align="right">姓名/编号：</div></td>
            <td><div align="left">
                <input name="user_no" type="text" id="user_no" size="18"  title="用户名或编号，学生为学号！"/>
                <span class="STYLE3" title="姓名或编号（学生为学号）">提示</span></div></td>
          </tr>
          <tr>
            <td class="FontWit"><div align="right">密　　码：</div></td>
            <td><div align="left">
                <input name="user_pass" type="password" id="user_pass" size="19"  title="初始密码123456，登录后请自行修改！"/>
                <span class="STYLE3" title="初始密码123456，登录后请自行修改！">提示</span></div>
                </div></td>
          </tr>
          <tr>
            <td class="FontWit"><div align="right">用户类型：</div></td>
            <td><div align="left">
                <select name="u_type" id="u_type">
                  <%
				set rs=server.createobject("adodb.recordset")    
				sql="select * from user_type order by id desc"    
				rs.open sql,Conn,1,3
		   	%>
                  <%do while not rs.eof%>
                  <option value="<%=rs("U_T_id")%>"><%=rs("u_type")%></option>
                  <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
				conn.close
				set conn = nothing
			%>
                </select>
            </div></td>
          </tr>
          <tr>
            <td class="FontWit"><div align="right"></div></td>
            <td><div align="left">
                <input type="submit" name="Submit" value=" 登 录 "/>
                <input type="reset" name="Submit2" value=" 重 置 " />
            </div></td>
          </tr>
        </table>
		</form></td>
	</tr>
	<tr>
		<td colspan="2" background="../Images/bottom.gif" width="1024" height="65"><div  style="margin-left:200px;font-size:12px"><div id="DateTime">  &nbsp; 
		 <script language="javascript"> 
         setInterval("DateTime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
      </script></div><div>学生登陆初始密码为123456</div><div>版权所有&copy;上饶师范学院物理与电子信息学院</div></div></td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>