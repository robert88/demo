<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<META NAME="copyright" CONTENT="Copyright ����ʦԺ���������ϢѧԺ" />
<META NAME="Keywords" CONTENT="����ʦ��ѧԺ��ҵ����ѡ��ϵͳ" />
<META NAME="Description" CONTENT="����ʦ��ѧԺ��ҵ����ѡ��ϵͳ" />
<TITLE>����ʦ��ѧԺ��ҵ����ѡ��ϵͳ</TITLE>
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>
<script>
function closewin() {
   if (opener!=null && !opener.closed) {
      opener.window.newwin=null;
      opener.openbutton.disabled=false;
      opener.closebutton.disabled=true;
   }
}

var count=0;//��������
var limit=new Array();//���ڼ�¼��ǰ��ʾ���ļ����˵�
var countlimit=1;//ͬʱ�򿪲˵���Ŀ�����Զ���

function expandIt(el) {
   obj = eval("sub" + el);
   if (obj.style.display == "none") {
      obj.style.display = "block";//��ʾ�Ӳ˵�
      if (count<countlimit) {//����2��
         limit[count]=el;//¼������
         count++;
      }
      else {
         eval("sub" + limit[0]).style.display = "none";
         for (i=0;i<limit.length-1;i++) {limit[i]=limit[i+1];}//����ȥ��ͷһλ���������ǰŲһλ
         limit[limit.length-1]=el;
      }
   }
   else {
      obj.style.display = "none";
      var j;
      for (i=0;i<limit.length;i++) {if (limit[i]==el) j=i;}//��ȡ��ǰ����Ĳ˵���limit�����е�λ��
      for (i=j;i<limit.length-1;i++) {limit[i]=limit[i+1];}//j�Ժ������ȫ����ǰŲһλ
      limit[limit.length-1]=null;//ɾ���������һλ
      count--;
   }
}
</script>
</head>
<!--
-->
<!--#include file="CheckAdmin.asp"-->

<BODY background="../Images/SysLeft_bg.gif" onmouseover="self.status='��ҵ����ѡ��ϵͳ���������������ϢѧԺ!';return true">
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/SysLeft_bg_click.gif">
  <tr style="cursor: hand;">
    <td><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("���غ�̨��ҳ")'><img src="../Images/title1.gif" width="167" border="0"></a></td>
  </tr>
</table>
<div id="main9" onclick=expandIt(9)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_4.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td width="143" class="SystemLeft">��������</td>
    </tr>
  </table>
</div>
<div id="sub9" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="20" height="22"></td>
      <td width="140" class="SystemLeft"><a href="student_edit.asp?Result=Modify" target="mainFrame" onClick='changeAdminFlag("�޸�����")'>�޸�����</a></td>
    </tr>
	    <tr>
      <td width="20" height="22"></td>
      <td class="SystemLeft"><a href="task_mysel.asp" target="mainFrame" onClick='changeAdminFlag("�ҵ�ѡ��")'>�ҵ�ѡ��</a></td>
    </tr>
  </table>
</div>
<div id="main8" onclick=expandIt(8)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft" width="143">��ʼѡ��</td>
    </tr>
  </table>
</div>
<div id="sub8" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="20" height="22"></td>
      <td class="SystemLeft"><a href="task_view.asp" target="mainFrame" onClick='changeAdminFlag("ѡ��ά��")'>��ȷѡ��ʦ��¼</a></td>
    </tr>
    <tr>
      <td width="20" height="22"></td>
      <td class="SystemLeft"><a href="task_view1.asp" target="mainFrame" onClick='changeAdminFlag("��ѡѡ����")'>��ѡѡ��</a></td>
    </tr>
  </table>
</div>
<div id="sub2" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="20" height="22"></td>
      <td width="140" class="SystemLeft"><a href="teacher_list.asp" target="mainFrame" onClick='changeAdminFlag("��ʦ�б�")'>�鿴����</a></td>
    </tr>
  </table>
</div>

<div id="main10" onclick=expandIt(10)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_2.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft" width="143">��¼��־</td>
    </tr>
  </table>
</div>
<div id="sub10" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
     <tr>
      <td width="20" height="22"></td>
      <td class="SystemLeft"><a href="log.asp" target="mainFrame" onClick='changeAdminFlag("�鿴��־")'>��¼��־</a></td>
    </tr>
  </table>
</div>

<div id="main12" onclick=expandIt(12)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft" width="143">���Խ���</td>
    </tr>
  </table>
</div>
<div id="sub12" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="20" height="22"></td>
      <td width="140" class="SystemLeft"><a href="msg_add.asp" target="mainFrame" onClick='changeAdminFlag("ǩд����")'>ǩд����</a></td>
    </tr>
    <tr>
      <td width="20" height="22"></td>
      <td class="SystemLeft"><a href="msg_list.asp" target="mainFrame" onClick='changeAdminFlag("�鿴����")'>�鿴����</a></td>
    </tr>
  </table>
</div>

<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_3.gif">
  <tr style="cursor: hand;">
    <td width="26"></td>
    <td class="SystemLeft" width="143"><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("��̨��ҳ")'>������ҳ</a></td>
  </tr>
</table>
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_3.gif">
  <tr style="cursor: hand;">
    <td width="26"></td>
    <td class="SystemLeft" width="143"><a href="javascript:AdminOut()">�˳���¼</a></td>
  </tr>
</table>
<table width="167" border="0" cellpadding="1" cellspacing="2" bgcolor="#21d015">
  <tr align="center" bgcolor="#21d015">
    <td height=25 colspan=2 class="topbg"><font color="ffffff">��ҵ����ѡ��ϵͳ��ѧ����</font>
  <tr bgcolor="#EBF2F9">
      <td colspan="2"  class="tdbg"><div align="center">��ƣ�����ʦԺ���������ϢѧԺ<a href="http://www.peyoyo.cn" target="_blank">����</a></div></td>
  </tr>
  
  <tr bgcolor="#21d015">
    <td height=25 colspan="2" class="tdbg"><div align="center"><font color="ffffff">��ǰ�û���<strong><%=session("user_name")%></strong></font></div></td>
  </tr>
</table>
</BODY>
</HTML>