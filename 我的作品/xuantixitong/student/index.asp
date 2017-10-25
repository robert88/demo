<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<% Option Explicit %>
<!--在模块级别中使用，强制显示声明模块中的所有变量-->

<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<META NAME="copyright" CONTENT="Copyright 上饶师范学院物理与电子信息学院" />
<META NAME="Keywords" CONTENT="上饶师范学院物理与电子信息学院毕业论文选题系统" />
<META NAME="Description" CONTENT="上饶师范学院物理与电子信息学院毕业论文选题系统" />
<TITLE><%=session("sysname")%></TITLE>

<link rel="stylesheet" href="../js/CssAdmin.css">
<!--实现样式-->

<SCRIPT language=JavaScript>
<!--指向中间隐藏左导航按钮-->
function switchSysBar()
{
   if (switchPoint.innerText==3)

<!--指向span-->
   {
      switchPoint.innerText=4
      document.all("frameTitle").style.display="none"
<!--指向左导航-->
   }
   else
   {
      switchPoint.innerText=3
      document.all("frameTitle").style.display=""
   }
}
</SCRIPT>
</head>
<!--#include file="CheckAdmin.asp"-->
<BODY scroll="no" topmargin="0" bottom="0" leftmargin="0" rightmargin="0">
<TABLE height="100%" cellSpacing="0" cellPadding="0" border="0" width="100%">
  <TR>
    <TD colSpan="3">

<!--标题框-->
	<IFRAME 
      style="Z-INDEX:1; VISIBILITY:inherit; WIDTH:100%; HEIGHT:128" 
      name="topFrame" id="topFrame" marginWidth="0" marginHeight="0"
      src="SysTop.asp" frameBorder="0" noResize scrolling="no">	</IFRAME></TD>
  </TR>

  <TR>


    <TD width="190" height="100%" rowspan="2" align="middle" bgcolor="#21d015" id="frameTitle" >
     <!--左边导航-->
     <IFRAME 
      style="Z-INDEX:2; VISIBILITY:inherit; WIDTH:190; HEIGHT:100%" 
      name="leftFrame" id="leftFrame"  marginWidth="0" marginHeight="0"
      src="SysLeft.asp" frameBorder="0" noResize scrolling="yes">
	</IFRAME>
	</TD>

    <!--中间隐藏左导航按钮-->
    <TD width="10" height="100%" rowspan="2" align="center" bgcolor="#21d015" onClick="switchSysBar()">
	<FONT style="FONT-SIZE: 10px; CURSOR: hand; COLOR: #ffffff; FONT-FAMILY: Webdings">
	  
      <SPAN id="switchPoint">3</SPAN>	</FONT>	</TD>

    <TD height="100%">
    <!--右边显示内容框-->
	<iframe 
      style="Z-INDEX:4; VISIBILITY:inherit; WIDTH:100%; HEIGHT:100%"
	  name="mainFrame" id="mainFrame" marginwidth="16" marginheight="16"
	  src="SysCome.asp" frameborder="0" noresize scrolling="yes">
	</iframe>
	</TD>
  </TR>
  <TR>
    <TD height="30">
	
         <!--底部方框-->
      <iframe 
      style="Z-INDEX:3; VISIBILITY:inherit; WIDTH:100%; HEIGHT:30"
	  name="headFrame" id="mainFrame" marginwidth="16" marginheight="3"
	  src="SysHead.asp" frameborder="0"  scrolling="no">
	</iframe>
	</TD>
  </TR>
</TABLE>
</BODY>
</HTML>