<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.Sp_id.value.length == 0) { 
			alert("����������ұ��!");
			document.editForm.Sp_id.focus();
			return false;
			}
			if (document.editForm.Sp_name.value.length == 0) { 
			alert("�������������!");
			document.editForm.Sp_name.focus();
			return false;
			}
			return true;
		}
</script>
<title>�鿴ϵ��</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>���������ã���ӣ��޸Ľ�������Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="res_add.asp?Result=Add" onClick='changeAdminFlag("��ӹ���Ա")'>��ӽ�����</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="res_table.asp" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴���н�����</a></td>    
  </tr>
</table>
  <center>
    <br/>
	
	
	<%
		'�������------------------------------------------------------------------------------
		Result=request.QueryString("Result")
		if Result = "Add" then
	%>
	<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="res_add.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">�����ұ�ţ�</td>
        <td><div align="left">
          <input name="res_id" type="text" class="textfield" id="res_id" style="WIDTH: 120;" size="15">
        * �ύ�󲻿��޸�</div></td>
      </tr>
      <tr>
        <td height="20" align="right">���������ƣ�</td>
        <td><div align="left">
            <input name="res_name" type="text" class="textfield" id="res_name" style="WIDTH: 120;" size="20" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����ϵ��</td>
        <td><div align="left">
            <select name="D_no" id="D_no">
			<%    
				set rs=server.createobject("adodb.recordset")    
				sql="select * from department "    
				rs.open sql,Conn,1,3
			%>
			<%do while not rs.eof%>
				<option value="<%=rs("D_no")%>"><%=rs("D_name")%></option>
			<%
				rs.movenext
				loop
			%>
		</select>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
          <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value=" �� �� " style="WIDTH: 60;" >
        ����
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit2" value=" �� �� " style="WIDTH: 60;">
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>

<%
	end if
	'��������
	if Result = "Modify" then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from res_table where ID="&request("ID")&""
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="res_add.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">
  <tr>
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">�����ұ�ţ�</td>
        <td><div align="left">
            <input name="res_id" type="text" class="textfield" id="res_id" style="WIDTH: 120;" value="<%=rs("res_id")%>" size="15" <%response.write ("readonly")%>/>
          * �����޸�</div></td>
      </tr>
      <tr>
        <td height="20" align="right">���������ƣ�</td>
        <td><div align="left">
            <input name="res_name" type="text" class="textfield" id="res_name" style="WIDTH: 120;" value="<%=rs("res_name")%>" size="20" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����ϵ��</td>
        <td><div align="left">
            <select name="D_no" id="D_no">
              <%    
				set rs=server.createobject("adodb.recordset")    
				sql="select * from department "    
				rs.open sql,Conn,1,3
			%>
              <%do while not rs.eof%>
              <option value="<%=rs("D_no")%>"><%=rs("D_name")%></option>
              <%
				rs.movenext
				loop
			%>
            </select>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
            <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;">
          
          <input name="submitSaveEdit22" type="reset" class="button"  id="submitSaveEdit22" value=" �� �� " style="WIDTH: 60;" />
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>

</td>
  </tr>
  </form>
  <%
  	rs1.close
	set rs1 = nothing
	rs.close
	set rs = nothing
	end if
%>
</center>
</body>
</html>


<%
'Action=addnew	�������
	Action=request.QueryString("Action")
	if Action = "addnew" then
		res_id = trim(request.form("res_id"))
		set rs = server.createobject("adodb.recordset")
		sql1="select * from res_table where res_id='"&res_id&"'"
		rs.open sql1,conn,1,3
			if rs.bof and rs.eof then
				rs.addnew
				rs("res_id")=trim(request.form("res_id"))
				rs("res_name")=trim(request.form("res_name"))
				rs("D_no")=trim(request.form("D_no"))
				rs.update
				rs.close
				set rs = nothing
				response.Write("��ӳɹ������ڷ��ء���")
				response.Redirect("res_table.asp")
			else
				response.Write("<script>alert('����ظ����뷵�ء���');history.back()</script>")
				response.Redirect("res_table.asp")
			end if
		end if

'Action=addnew
	if Action = "SaveEdit" then
		set rs = server.createobject("adodb.recordset")
		sql="select * from res_table where ID="&request("ID")&""
		'response.Write(sql)
		rs.open sql,conn,1,3
		rs("res_id")=trim(request.form("res_id"))
		rs("res_name")=trim(request.form("res_name"))
		rs("D_no")=trim(request.form("D_no"))
		rs.update
		rs.close
		set rs = nothing
		response.Write("�޸Ľ����ҳɹ����뷵�ء���")
		response.Redirect("res_table.asp")
	end if
	
	if Action = "del" then
		sql = "delete from res_table where ID=" & request("ID")
		'response.Write(sql)
		Conn.Execute(sql)
		'response.Write(sql)
       	conn.close
       	set conn=nothing
		response.Write("ɾ���ɹ����뷵�ء���")
		response.Redirect("res_table.asp")
	end if
	
	
%>
