<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<META NAME="copyright" CONTENT="Copyright ����ʦ��ѧԺ �����������ϢѧԺ" />
<META NAME="Keywords" CONTENT="����ʦ��ѧԺ ��ҵ����ѡ��ϵͳ" />
<META NAME="Description" CONTENT="����ʦ��ѧԺ��ҵ����ѡ��ϵͳ" />
<TITLE>����ʦ��ѧԺ��ҵ����ѡ��ϵͳ</TITLE>
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
      <td height=25 class="style2"><div align="left"><span class="STYLE3 style2"><%=session("user_name")%></span>����,��ӭʹ�ñ�ҵ����ѡ��ϵͳ�� ѧ�������������£�</div>      
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">����</div></td>
      <td><div align="center">����</div></td>
      <td><div align="center">��ע</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��������</div></td>
      <td>�޸ĸ��˻������ϡ��鿴��ѡѡ�⣬һ������벻Ҫ�Ķ���</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��ʼѡ��</div></td>
      <td>ѧ���ڹ涨ʱ��ѡ�⡣</td>
      <td><div align="center">��ʱ���</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��ʦ��ѯ</div></td>
      <td>ѧ�����Բ�ѯ��ʦ����һЩ������Ŀ��</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">�ļ�����</div></td>
      <td>���Խ�����һЩд�õ����Ļ�������һЩ�������ϡ�</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">���Խ���</div></td>
      <td>����Ա��¼��̨���ѡ�⡣</td>
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