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
      <td height=25 class="style2"><div align="left" class="STYLE4"><span class="STYLE5"><%=session("user_name")%></span>����,��ӭʹ�ñ�ҵ����ѡ��ϵͳ�� ����Ա�����������£�</div>      
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">����</div></td>
      <td><div align="center">����</div></td>
      <td><div align="center">��ע</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">ϵԺ��רҵ����</div></td>
      <td>���ϵ��רҵ�����Ϣ��һ������벻Ҫ�Ķ���</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">�����ֵ�ά��</div></td>
      <td>��ʦְ�ơ���������Ϣά����һ��������䡣</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">����û�</div></td>
      <td>�������н�ʦ��ѧ����Ϣ��</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">���ѡ��</div></td>
      <td>ָ֪ͨ����ʦ��¼ϵͳ����ӡ����������Ϣ��</td>
      <td><div align="center">��ʱ���</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">ѡ�����</div></td>
      <td>����Ա��¼��̨���ѡ�⡣</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">ѧ��ѡ��</div></td>
      <td>֪ͨѧ����¼ϵͳ����ѡ�⡭��</td>
      <td><div align="center">��ʱ���</div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��ʼ����</div></td>
      <td>ѧ��ȷ��ѡ����ָ����ʦ��ϵ��������ʦ��ָ���¿�չ����������������</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��������</div></td>
      <td>ѧ�����������ƣ����ϴ�����������ָ����ʦ���մ���ѧ�������ģ���չ��ع�����</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">��</div></td>
      <td>&nbsp;</td>
      <td><div align="center"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" onMouseOver="this.bgColor='f1f1f1'" onMouseOut="this.bgColor='FFFFFF'">
      <td><div align="center">�ɼ�¼��</div></td>
      <td>����Ա¼��ѧ��ѡ��ɼ���</td>
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