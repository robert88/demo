<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>ѧ���б�</title>
<style type="text/css">
<!--
.STYLE3 {color: #FF0000}
-->
</style>
</head>
<!--
-->

<script language=javascript>
function onlyNum()
{
	if(!((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode>=96&&event.keyCode<=105)||(event.keyCode=8)))
	//����С�����ϵ����ּ�
	alert("�ɼ�ֻ����0~100֮������֡�")
	event.returnvalue=false;
}
function check()
	{ 
		if (document.editForm.Sum_ach.value>100) { 
		alert("�ɼ�ֻ����0~100֮�������!");
		document.editForm.Sum_ach.focus();
		return false;
		}
		if (document.editForm.Sum_ach1.value > 100) { 
		alert("�ɼ�ֻ����0~100֮�������!");
		document.editForm.Sum_ach1.focus();
		return false;
		}
		if (document.editForm.Sum_ach2.value > 100) { 
		alert("�ɼ�ֻ����0~100֮�������!");
		document.editForm.Sum_ach2.focus();
		return false;
		}
		return true;
	}
</script>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<%
	Action=request.QueryString("Action")
	if Action = "update" then
		set rs = server.createobject("adodb.recordset")
		sql="select * from sel_record where st_number='"&request("ID")&"'"
		response.Write(sql)
		rs.open sql,conn,1,3
		rs("Sum_ach")=trim(request.form("Sum_ach"))
		rs("Sum_ach1")=trim(request.form("Sum_ach1"))
		rs("Sum_ach2")=trim(request.form("Sum_ach2"))
		rs("dj")=request.form("dj")
		rs.update
		rs.close
		set rs = nothing
		response.Redirect("task_record.asp")
	end if
%>

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>�ɼ�ά����ѧ����ҵ��������</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	
	<%
		if request.QueryString("ID")<>"" then
		set rsobj=server.CreateObject("adodb.recordset")
		'sql="select * from sel_record where st_number='"&request("ID")&"'"
		sql="Select * from sel_record sr,select_cursor sc,student_info si where sr.st_number=si.st_number and sr.ID=sc.ID and sr.st_number='"&request("ID")&"'"
		rsobj.open sql,conn ,1,3
	%>
	  <form id="editForm" name="editForm" method="post" action="?action=update&ID=<%=rsobj("sr.st_number")%>" onsubmit="return check()">
	  <strong>ѧ�ţ�</strong><%=rsobj("sr.st_number")%>����<strong>����</strong>��<%=rsobj("st_name")%>����<strong>ѡ������</strong>��<%=rsobj("sel_name")%>
	    <br />
	    ָ����ʦ�ɼ���
	    <input name="Sum_ach" type="text" class="textfield" id="Sum_ach" value="<%=rsobj("Sum_ach")%>" size="5" onkeydown="onlyNum();"/>��
	    �����˳ɼ���
	    <input name="Sum_ach1" type="text" class="textfield" id="Sum_ach1" value="<%=rsobj("Sum_ach1")%>" size="5" onkeydown="onlyNum();"/>��
	    ���ίԱ��ɼ���
	    <input name="Sum_ach2" type="text" class="textfield" id="Sum_ach2" value="<%=rsobj("Sum_ach2")%>" size="5" onkeydown="onlyNum();"/>��
	    �ȼ���
	    <select name="dj" id="dj">
	      <option value="�е�" selected="selected">�е�</option>
	      <option value="����">����</option>
	      <option value="����">����</option>
	      <option value="����">����</option>
	      <option value="������">������</option>
        </select>
	    <input type="submit" name="Submit" value=" �� �� "  />
	  </form>
	<%
		rsobj.close
		set rsobj=nothing
		else
	%>
	<form id="form1" name="form1" method="post" action="task_record.asp">
	    <strong>��ѡ��ѧ������ </strong>����ѧ�ţ�
       <input name="xh" type="text" id="xh" size="10"  title="�ɲ�����"/>      
	    �� 
	    <input type="submit" name="Submit2" value=" �� �� " />
	    <a href="record_excel.asp" class="STYLE3">������������</a>
	</form>
	  <%
		end if
	%>
	
    </td>
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>ѧ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>����</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ѡ������</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�꼶</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�༶</strong></font></td>
      <td nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">ָ����ʦ�ɼ�</font></strong></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>�����˳ɼ�</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>���ίԱ��ɼ�</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>�ȼ�</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>����</strong></font></td>
    </tr>
  <%
		set rsobj=server.CreateObject("adodb.recordset")
		dim wh,xh
		wh=""
		xh=request.Form("xh")
		if xh<>"" then
			wh=wh&" and sr.St_number like '%"&xh&"%'"
		end if
		sql="Select * from sel_record sr,select_cursor sc,student_info si where sr.st_number=si.st_number and sr.ID=sc.ID "&wh&" order by sr.st_number asc"
		'response.Write(sql)
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=20 '��ҳ��� ��/ҳ
		if page < 1 then page = 1
		if page > rsobj.pagecount then page = rsobj.pagecount
		if rsobj.eof = false then
		rsobj.absolutepage = page
		else
		response.Write"<strong>û���κμ�¼����</strong>"
		response.End()
		end if
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
    <td><%=rsobj("sr.St_number")%></td>
    <td><%=rsobj("st_name")%></td>
    <td><%=rsobj("sel_name")%></td>
    <td><%=rsobj("si.st_grade")%></td>
    <td><%=rsobj("si.st_class")%></td>
    <td><%=rsobj("Sum_ach")%></td>
    <td><%=rsobj("Sum_ach1")%></td>
    <td><%=rsobj("Sum_ach2")%></td>
    <td><%=rsobj("dj")%></td>
    <td><a href='?ID=<%=rsobj("sr.st_number")%>' onclick='changeAdminFlag(&quot;ѡ������&quot;)'><font color='#330099'>ѡ������</font></a></td>
  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="">
  <div align="center">ÿҳ��ʾ<strong> <%=rsobj.pagesize%> </strong>�����ܼ�¼:<strong><%=rsobj.recordcount%></strong> ��			��ҳ��: <strong><%=rsobj.pagecount%></strong> ��Ŀǰҳ��:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
��
  <%
		if page <> 1 then
		response.Write"<a href=?txtpage=1>����һҳ��</a>"
		response.Write"<a href=?txtpage="& (page-1)&">����һҳ��</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=?txtpage="& (page+1)&">����һҳ��</a>"
		response.Write"<a href=?txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
		end if
		rsobj.close
		set rsobj=nothing
	%>
  </div>
</form>
</center>
</body>
</html>
