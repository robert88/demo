<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>��ʦ�б�</title></head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("���Ҫɾ������Ϣ��"))
		window.location = "teacher_add.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>��ʦ������ӣ��޸Ľ�ʦ��Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="">
        ���ڽ����ң�
          <select name="res_name" id="res_name">
        <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select * from res_table " 
			rs.open sql,Conn,1,3
		%>
        <%do while not rs.eof%>
        <option value="<%=rs("res_name")%>"><%=rs("res_name")%></option>
        <%
			rs.movenext
			loop
		%>
      </select>
          <input type="submit" name="Submit" value=" �� �� " />
	��<a href="teacher_list.asp" onclick='changeAdminFlag(&quot;�鿴��ʦ�б�&quot;)'>�鿴���н�ʦ</a>
	</form>
	
	
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
    <tr>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>��ʦ����</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>���ڽ�����</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>��ʦ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>ְ��</strong></font></td>
      <td nowrap="nowrap" bgcolor="#21d015"><font color="#FFFFFF"><strong>�޴�����</strong></font></td>
      <td nowrap bgcolor="#21d015"><font color="#FFFFFF"><strong>�绰</strong></font></td>
      <td nowrap bgcolor="#21d015"><strong><font color="#FFFFFF">��ϸ����</font></strong></td>
    </tr>
  <%
  		wh = ""
		res_name=request("res_name")
		if res_name <> "" then
			wh = " and res_name = "&"'"&res_name&"' "
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		'sql="Select * from teacher_inf "&wh
		sql ="select * from teacher_inf t,res_table res,zc_table zc where t.res_id=res.res_id and t.Zc_id=zc.Zc_id "&wh&" order by Tea_id asc"
		'sql="Select * from user_table,user_type where user_table.U_t_id=user_type.U_T_id "&wh&"order by user_no asc"
		'response.Write(sql)
'		rsobj.open "select * from speciality",conn ,1,1
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=25 '��ҳ��� ��/ҳ
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
    <td><%=rsobj("Tea_id")%></td>
    <td><%=rsobj("res_name")%></td>
    <td><%=rsobj("Tea_name")%></td>
    <td><%=rsobj("zc_name")%></td>
    <td><%=rsobj("St_number")%></td>
    <td><%=rsobj("Tea_m_pone")%></td>
    <td><a href='teacher_add.asp?Result=Modify&ID=<%=rsobj("Tea_id")%>' onClick='changeAdminFlag("�޸Ľ�ʦ")'><font color='#330099'>�鿴</font></a></td>
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
			response.Write"<a href=teacher_list.asp?res_name="&res_name&"&txtpage=1>����һҳ��</a>"
			response.Write"<a href=teacher_list.asp?res_name="&res_name&"&txtpage="& (page-1)&">����һҳ��</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=teacher_list.asp?res_name="&res_name&"&txtpage="& (page+1)&">����һҳ��</a>"
			response.Write"<a href=teacher_list.asp?res_name="&res_name&"&txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
			end if
			'�ر�����
			rsobj.close
			set rsobj=nothing
			cnobj.close
			set cnobj=nothing
		%>
  </div>
</form>
</center>
</body>
</html>
