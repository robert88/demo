<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<META NAME="copyright" CONTENT="Copyright 上饶师院物理电子信息学院" />
<META NAME="Keywords" CONTENT="上饶师范学院毕业论文选题系统" />
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
-->
</style>
</head>
<!--
-->
<!--#include file="CheckAdmin.asp"-->
<BODY>
<div align="center">
  <table width="100%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#21d015" class="border">
    <tr align="center">
      <td height=25 class="style2"><div align="left"><span class="STYLE3 style2"><%=session("user_name")%></span>您好,欢迎使用毕业论文选题系统！ 教师操作流程如下：</div>      
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">操作</div></td>
      <td><div align="center">说明</div></td>
      <td><div align="center">备注</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">修改资料</div></td>
      <td>进入个人中心，修改个人资料（<span class="STYLE3">请认真填写</span>）。</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">选题维护</div></td>
      <td>添加、修改自己的选题。</td>
      <td><div align="center">限时完成</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">学生选题情况</div></td>
      <td>查看选择自己课题的学生，与学生取得联系，确定选题学生及选题。</td>
      <td><div align="center">限时完成</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">论文制作</div></td>
      <td>指导学生完成毕业论文的制作工作……</td>
      <td><div align="center">限时完成</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">论文验收</div></td>
      <td>查收学生论文成果。</td>
      <td><div align="center">限时完成</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">答辩</div></td>
      <td>论文答辩相关工作……</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">↓</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">成绩维护</div></td>
      <td>收集选题成绩表，上交系领导录入学生选题成绩。</td>
      <td><div align="center">限时完成</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center"></div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center"></div></td>
      <td><div align="center" class="STYLE4">重要说明：学生最多可选三个候选选题，由老师确定，确定后自动删除其他选题记录……</div>
          <div align="center"></div>
        <div align="center"></div>
        <div align="center"></div></td>
      <td><div align="center"></div></td>
    </tr>
    
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center"></div></td>
      <td><div align="center">咨询电话：18688714537（尹明）</div></td>
      <td><div align="center"></div></td>
    </tr>
  </table>
  <table width="100%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#21d015" class="border">
  <tr align="center">
    <td height=15 class="topbg">  </tr>
</table>
</div>
</BODY>
</HTML>