<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<META NAME="copyright" CONTENT="Copyright 上饶师范学院 物理与电子信息学院" />
<META NAME="Keywords" CONTENT="上饶师范学院 毕业论文选题系统" />
<META NAME="Description" CONTENT="上饶师范学院毕业论文选题系统" />
<TITLE>上饶师范学院毕业论文选题系统</TITLE>
<link rel="stylesheet" href="../js/CssAdmin.css">

<style type="text/css">
<!--
.style2 {color: #FFFFFF}
.STYLE3 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE4 {color: #000000}
.STYLE5 {color: #FFFFFF; font-weight: bold; }
-->
</style>
</head>

<!--#include file="CheckAdmin.asp"-->
<BODY>
<div align="center">
  <table width="100%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#21d015" class="border">
    <tr align="center">
      <td height=25 class="style2"><div align="left"><span class="STYLE3 style2"><%=session("user_name")%></span>您好,欢迎使用毕业论文选题系统！ 学生操作流程如下：</div>      
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">操作</div></td>
      <td><div align="center">内容</div></td>
      <td><div align="center">备注</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">个人中心</div></td>
      <td>修改个人基本资料、查看已选选题，一旦添加请不要改动！</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">开始选题</div></td>
      <td>学生在规定时间选题。</td>
      <td><div align="center">限时完成</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">教师查询</div></td>
      <td>学生可以查询教师带的一些论文题目。</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">文件管理</div></td>
      <td>可以将上载一些写好的论文或者下载一些论文资料。</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">留言建议</div></td>
      <td>管理员登录后台审核选题。</td>
      <td><div align="center"></div></td>
    </tr>
  </table>
  <table width="100%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#21d015" class="border">
  <tr align="center">
    <td height=5 class="topbg">  </tr>
</table>
</div>
</BODY>
</HTML>