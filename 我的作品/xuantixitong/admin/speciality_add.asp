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
			alert("������רҵ���!");
			document.editForm.Sp_id.focus();
			return false;
			}
			if (document.editForm.Sp_name.value.length == 0) { 
			alert("������רҵ��!");
			document.editForm.Sp_name.focus();
			return false;
			}
			return true;
		}
</script>
<title>�鿴ϵ��</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap>
	<font color="#FFFFFF">
	<img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;
	<strong>רҵ���ã���ӣ��޸�רҵ��Ϣ</strong>
	</font>
	</td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	<a href="speciality_add.asp?Result=Add" onClick='changeAdminFlag("��ӹ���Ա")'>���רҵ</a>
	<font color="#0000FF">&nbsp;|&nbsp;</font>
	<a href="speciality_list.asp" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴����רҵ</a>
	</td>    
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
  <form name="editForm" method="post" action="speciality_add.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">רҵ��ţ�</td>
        <td><div align="left">
          <input name="Sp_id" type="text" class="textfield" id="Sp_id" style="WIDTH: 120;" size="15">
          &nbsp;*&nbsp;��λ���֣������ظ�</div></td>
      </tr>
      <tr>
        <td height="20" align="right">רҵ���ƣ�</td>
        <td><div align="left">
            <input name="Sp_name" type="text" class="textfield" id="Sp_name" style="WIDTH: 120;" size="20" />
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
	sql="select * from speciality where ID="&request("ID")&""
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="speciality_add.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">
  <tr>
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">רҵ��ţ�</td>
        <td><div align="left">
          <input name="Sp_id" type="text" class="textfield" id="Sp_id" style="WIDTH: 120;" value="<%=rs("Sp_id")%>" size="15" <%response.write ("readonly")%>>
          &nbsp;*&nbsp;��λ���֣������ظ��������޸�</div></td>
      </tr>
      <tr>
        <td height="20" align="right">ϵ�����ƣ�</td>
        <td><div align="left">
            <input name="Sp_name" type="text" class="textfield" id="Sp_name" style="WIDTH: 120;" value="<%=rs("Sp_name")%>" size="20" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����ϵ��</td>
        <td><div align="left">
            <select name="D_no" id="D_no">
			<%    
				set rs1=server.createobject("adodb.recordset")    
				sql="select * from department "    
				rs1.open sql,Conn,1,3
			%>
			<%do while not rs1.eof%>
				<option value="<%=rs1("D_no")%>"
				<% if rs1("D_no")=rs("D_no") then response.Write("selected='selected'") end if%>
				><%=rs1("D_name")%></option>
			<%
				rs1.movenext
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
		Sp_id = trim(request.form("Sp_id"))
		set rs = server.createobject("adodb.recordset")
		sql1="select * from speciality where Sp_id='"&Sp_id&"'"
		rs.open sql1,conn,1,3
			if rs.bof and rs.eof then
				rs.addnew
				rs("Sp_id")=trim(request.form("Sp_id"))
				rs("Sp_name")=trim(request.form("Sp_name"))
				rs("D_no")=trim(request.form("D_no"))
				rs.update
				rs.close
				set rs = nothing
				response.Write("<script>alert('���רҵ�ɹ����뷵�ء���');history.back()</script>")
				response.redirect("speciality_list.asp")
			else
				response.Write("<script>alert('רҵ����ظ����뷵�ء���');history.back()</script>")
			end if
		end if

'Action=addnew
	if Action = "SaveEdit" then
		set rs = server.createobject("adodb.recordset")
		sql="select * from speciality where ID="&request("ID")&""
		'response.Write(sql)
		rs.open sql,conn,1,3
		rs("Sp_id")=trim(request.form("Sp_id"))
		rs("Sp_name")=trim(request.form("Sp_name"))
		rs("D_no")=trim(request.form("D_no"))
		rs.update
		rs.close
		set rs = nothing
		response.Write("<script>alert('�޸�רҵ�ɹ����뷵�ء���');history.back()</script>")
	end if
	
	if Action = "del" then
		sql = "delete from speciality where ID=" & request("ID")
		Conn.Execute(sql)
		'response.Write(sql)
       	conn.close
       	set conn=nothing
		response.Write("<script>alert('ɾ���ɹ����뷵�ء���');</script>")
		response.redirect("speciality_list.asp")
	end if
	
	
%>
