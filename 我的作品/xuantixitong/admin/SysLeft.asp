<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<META NAME="copyright" CONTENT="Copyright ����ʦ��ѧԺ �����������ϢѧԺ" />
<META NAME="Keywords" CONTENT="����ʦ��ѧԺ ��ҵ����ѡ��ϵͳ" />
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
	  obj.style.background.color="#993388";
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

<!--#include file="CheckAdmin.asp"-->

<BODY background="../Images/SysLeft_bg.gif" onmouseover="self.status='��ҵ����ѡ��ϵͳ��������ʦ��ѧԺ�����������ϢѧԺ!';return true">
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/SysLeft_bg_click.gif">
  <tr style="cursor: hand;">
    <td><a href="syscome.asp" target="mainFrame" onClick='changeAdminFlag("���غ�̨��ҳ")'><img border="0" src="../Images/title1.gif"></a></td>
  </tr>
</table>
<div id="main9" onclick=expandIt(9)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_4.gif">
    <tr style="cursor: hand;">
      <td width="54"></td>
      <td class="SystemLeft1"><a href="#">ϵԺ����</a></td>
    </tr>
  </table>
</div>
<div id="sub9" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="department_list.asp" target="mainFrame" onClick='changeAdminFlag("�鿴ϵ��")'>ϵ���б�</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="department_edit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("���ϵ��")'>���ϵ��</a></td>
    </tr>
  </table>
</div>
<div id="main8" onclick=expandIt(8)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_4.gif">
    <tr style="cursor: hand;">
      <td width="54"></td>
      <td class="SystemLeft1"><a href="#">רҵ����</a></td>
    </tr>
  </table>
</div>
<div id="sub8" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="speciality_List.asp" target="mainFrame" onClick='changeAdminFlag("רҵ�б�")'>רҵ�б�</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="speciality_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("���רҵ")'>���רҵ</a></td>
    </tr>
  </table>
</div>
<div id="main1" onclick=expandIt(1)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_2.gif">
    <tr style="cursor: hand;">
      <td width="54"></td>
      <td class="SystemLeft1"><a href="#">����Ա����</a></td>
    </tr>
  </table>
</div>
<div id="sub1" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="user_list.asp" target="mainFrame" onClick='changeAdminFlag("�û��б�")'>����Ա�б�</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="user_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("����û�")'>��ӹ���Ա</a></td>
    </tr>
  </table>
</div>

<div id="main2" onclick=expandIt(2)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_2.gif">
    <tr style="cursor: hand;">
      <td width="54"></td>
      <td class="SystemLeft1"><a href="#">��ʦ����</a></td>
    </tr>
  </table>
</div>
<div id="sub2" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="teacher_list.asp" target="mainFrame" onClick='changeAdminFlag("��ʦ�б�")'>�鿴����</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="teacher_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("��ӽ�ʦ")'>��ӽ�ʦ</a></td>
    </tr>
  </table>
</div>

<div id="main3" onclick=expandIt(3)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_2.gif">
    <tr style="cursor: hand;">
      <td width="54"></td>
      <td class="SystemLeft1"><a href="#">ѧ������</a></td>
    </tr>
  </table>
</div>
<div id="sub3" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_list.asp" target="mainFrame" onClick='changeAdminFlag("ѧ���б�")'>�鿴����</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("���ѧ��")'>���ѧ��</a></td>
    </tr>
  </table>
</div>

<div id="main4" onclick=expandIt(4)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_2.gif">
    <tr style="cursor: hand;">
      <td width="54"></td>
      <td class="SystemLeft1"><a href="#">ѡ�����</a></td>
    </tr>
  </table>
</div>
  <div id="sub4" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_list.asp" target="mainFrame" onClick='changeAdminFlag("�����б�")'>ѡ���ѯ</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("���ѡ��")'>���ѡ��</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_yes.asp" target="mainFrame" onClick='changeAdminFlag("��ȷѡѧ��")'>��ȷѡѧ��</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_notsel.asp" target="mainFrame" onClick='changeAdminFlag("δѡ��ѧ��")'>δѡ��ѧ��</a></td>
    </tr>
  </table>
</div>

<div id="main6" onclick=expandIt(6)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="54"></td>
      <td class="SystemLeft1"><a href="#">�����ֵ�ά��</a></td>
    </tr>
  </table>
</div>

<div id="sub6" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
      <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="config.asp" target="mainFrame" onClick='changeAdminFlag("��վ��Ϣ")'>��վ��Ϣ</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="zc_table.asp" target="mainFrame" onClick='changeAdminFlag("������Ϣ�б�")'>��ʦְ��</a></td>
    </tr>
  </table>
</div>

<div id="main11" onclick=expandIt(11)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="54"></td>
      <td class="SystemLeft1"><a href="#">ϵͳ��ȫ</a></td>
    </tr>
  </table>
</div>
<div id="sub11" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
  <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="log.asp" target="mainFrame" onClick='changeAdminFlag("�鿴��־")'>�鿴��־</a></td>
    </tr>
  </table>
</div>


<div id="main12" onclick=expandIt(12)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="54"></td>
      <td class="SystemLeft1"><a href="#">���Խ���</a></td>
    </tr>
  </table>
</div>
<div id="sub12" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="msg_add.asp" target="mainFrame" onClick='changeAdminFlag("ǩд����")'>ǩд����</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="msg_list.asp" target="mainFrame" onClick='changeAdminFlag("�鿴����")'>�鿴����</a></td>
    </tr>
  </table>
</div>

<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_3.gif">
  <tr style="cursor: hand;">
    <td width="54"></td>
    <td class="SystemLeft1"><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("��̨��ҳ")'>��̨��ҳ</a></td>
  </tr>
</table>
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_3.gif">
  <tr style="cursor: hand;">
    <td width="54"></td>
    <td class="SystemLeft1"><a href="javascript:AdminOut()">�˳���¼</a></td>
  </tr>
</table>
<table width="167" border="0" cellpadding="1" cellspacing="2" bgcolor="#21d015">
  <tr align="center" bgcolor="#21d015">
    <td height=25 colspan=2 bgcolor="#21d015" class="topbg"><span class="Glow"><font color="ffffff">��ҵ����ѡ��ϵͳ������Ա��</font></span>
  <tr bgcolor="#21d015">
      <td colspan="2" bgcolor="#21d015"  class="tdbg"><p class="Glow"><font color="ffffff">��ƣ������������ϢѧԺ</font><font color="ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</font></p>
      </td>
  </tr>
  
  <tr bgcolor="#21d015">
    <td height=25 colspan="2" bgcolor="#21d015" class="tdbg"><div align="center"><font color="ffffff">��ǰ�û���<strong><%=session("user_name")%></strong></font></div></td>
  </tr>
</table>
</BODY>
</HTML>