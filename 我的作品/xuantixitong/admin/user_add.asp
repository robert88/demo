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
			alert("���������Ա���!");
			document.editForm.Sp_id.focus();
			return false;
			}
			if (document.editForm.Sp_name.value.length == 0) { 
			alert("���������Ա��!");
			document.editForm.Sp_name.focus();
			return false;
			}
			return true;
		}
</script>
<title>�鿴����Ա</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>����Ա������ӣ��޸Ĺ���Ա��Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="user_add.asp?Result=Add" onClick='changeAdminFlag("��ӹ���Ա")'>��ӹ���Ա</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="user_list.asp" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴���й���Ա</a><a href="user_serch.asp" onclick='changeAdminFlag(&quot;ϵͳ����Ա&quot;)'></a></td>    
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
  <form name="editForm" method="post" action="user_add.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">����Ա��ţ�</td>
        <td><div align="left">
          <input name="user_no" type="text" class="textfield" id="user_no" style="WIDTH: 120;" size="15">
          &nbsp;*&nbsp;���֣������ظ����ύ�����޸�</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����Ա������</td>
        <td><div align="left">
            <input name="user_name" type="text" class="textfield" id="user_name" style="WIDTH: 120;" size="19" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����Ա���룺</td>
        <td><div align="left">
            <input name="user_pass" type="text" class="textfield" id="user_pass" style="WIDTH: 120;" value="admin" size="20" />
          &nbsp;* Ĭ������ admin</div></td>
      </tr>
      <tr>
        <td height="20" align="right">ȷ�����룺</td>
        <td><div align="left">
            <input name="user_pass1" type="text" class="textfield" id="user_pass1" style="WIDTH: 120;" value="admin" size="20" />
          &nbsp;* Ĭ������ admin</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����Ա���ͣ�</td>
        <td><div align="left">
          <select name="u_type" id="u_type">
            <option value="1">����Ա</option>
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
	sql="select * from user_table where ID="&request("ID")&""
	'response.Write(sql)
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="user_add.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">
  <tr>
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">����Ա��ţ�</td>
        <td><div align="left">
          <input name="user_no" type="text" class="textfield" id="user_no" style="WIDTH: 120;" value="<%=rs("user_no")%>" size="15" <%response.write ("readonly")%>>
          &nbsp;*&nbsp;���֣������ظ��������޸�</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����Ա������</td>
        <td><div align="left">
            <input name="user_name" type="text" class="textfield" id="user_name" style="WIDTH: 120;" value="<%=rs("user_name")%>" size="19" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����Ա���룺</td>
        <td><div align="left">
            <input name="user_pass" type="text" class="textfield" id="user_pass" style="WIDTH: 120;" value="admin" size="20" readonly=""/>
          &nbsp;<span class="STYLE1">* �벻Ҫ�޸�����</span> </div></td>
      </tr>
      <tr>
        <td height="20" align="right">ȷ�����룺</td>
        <td><div align="left">
            <input name="user_pass1" type="text" class="textfield" id="user_pass1" style="WIDTH: 120;" value="admin" size="20" />
          &nbsp;* Ĭ������ admin</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����Ա���ͣ�</td>
        <td><div align="left">
          <select name="u_type" id="u_type">  
      <option value="1">����Ա</option>
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
    </table>
	
	</td>
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
		user_no = trim(request.form("user_no"))
		user_pass = request.form("user_pass")
		user_pass1 = request.form("user_pass1")
		if user_pass = user_pass1 then
			
		set rs = server.createobject("adodb.recordset")
		sql1="select * from user_table where user_no='"&user_no&"'"
		rs.open sql1,conn,1,3
			if rs.bof and rs.eof then
				rs.addnew
				rs("user_no")=trim(request.form("user_no"))
				rs("user_name")=trim(request.form("user_name"))
				rs("user_pass")=trim(md5(request.form("user_pass")))
				rs("U_t_id")=request.form("u_type")
				rs.update
				rs.close
				set rs = nothing
				response.Redirect("user_list.asp")
			else
				response.Write("<script>alert('����Ա����Ѵ��ڣ��뷵�ء���');history.back()</script>")
				'response.Redirect("user_list.asp")
			end if
		end if
		response.Write("<script>alert('�����������벻һ�£��뷵�ء���');history.back()</script>")
		end if

'Action=addnew
	if Action = "SaveEdit" then
		user_pass = request.form("user_pass")
		user_pass1 = request.form("user_pass1")
		if user_pass = user_pass1 then
			set rs = server.createobject("adodb.recordset")
			sql="select * from user_table where ID="&request("ID")&""
			'response.Write(sql)
			rs.open sql,conn,1,3
			rs("user_no")=trim(request.form("user_no"))
			rs("user_name")=trim(request.form("user_name"))
			rs("user_pass")=trim(md5(request.form("user_pass")))
			rs("U_t_id")=request.form("u_type")
			rs.update
			rs.close
			set rs = nothing
			response.Write("�޸Ĺ���Ա�ɹ����뷵�ء���")
			response.Redirect("user_list.asp")
		end if
		response.Write("<script>alert('�����������벻һ�£��뷵�ء���');history.back()</script>")
	end if
	
	if Action = "del" then
		sql = "delete from user_table where ID=" & request("ID")
		Conn.Execute(sql)
		'response.Write(sql)
       	conn.close
       	set conn=nothing
		response.Write("ɾ���ɹ����뷵�ء���")
		response.Redirect("user_list.asp")
	end if
	
	
%>
