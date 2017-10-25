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
      <td height=25 class="style2"><div align="left" class="STYLE4"><span class="STYLE5"><%=session("user_name")%></span>您好,欢迎使用毕业论文选题系统！ 管理员操作流程如下：</div>      
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">操作</div></td>
      <td><div align="center">内容</div></td>
      <td><div align="center">备注</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">系院、专业设置</div></td>
      <td>添加系别、专业相关信息，一旦添加请不要改动！</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">数据字典维护</div></td>
      <td>教师职称、教研室信息维护，一般情况不变。</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">添加用户</div></td>
      <td>导入所有教师、学生信息。</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">添加选题</div></td>
      <td>通知指导老师登录系统，添加、管理课题信息。</td>
      <td><div align="center">限时完成</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">选题审核</div></td>
      <td>管理员登录后台审核选题。</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">学生选题</div></td>
      <td>通知学生登录系统进行选题……</td>
      <td><div align="center">限时完成</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">开始制作</div></td>
      <td>学生确定选题后跟指导老师联系，并在老师的指导下开展课题制作工作……</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">论文验收</div></td>
      <td>学生完成论文设计，并上传至服务器，指导老师验收带领学生的论文，开展相关工作。</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">成绩录入</div></td>
      <td>管理员录入学生选题成绩。</td>
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