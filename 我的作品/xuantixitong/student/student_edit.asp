<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.St_pass2.value !=document.editForm.St_pass1.value) { 
			alert("���벻һ��!");
			document.editForm.St_pass1.focus();
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
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="800" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>�������ģ��޸�����</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="task_mysel.asp" onClick='changeAdminFlag("�鿴�ҵ�ѡ��")'>�鿴�ҵ�ѡ��</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="task_record.asp" onClick='changeAdminFlag("�ɼ���ѯ")'>�ɼ���ѯ</a></td>    
  </tr>
</table>
  
    <br/>
	
	
	<%
		'��������------------------------------------------------------------------------------
		Result=request.QueryString("Result")
	dim st_name,st_number
	st_name=trim(session("user_name"))
	st_number=trim(session("user_no"))
	
	if Result = "Modify" then
	set rs=server.CreateObject("adodb.recordset")
	
	sql="select * from student_info where St_name='"&st_name&"' or St_number='"&st_number&"'"
	rs.open sql,conn,3,2

%>
	<table width="800" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
      <form name="editForm" method="post" action="student_edit.asp?Action=SaveEdit&ID=<%=rs("ID")%>" onsubmit="return depart_add()">
        <tr> </tr>
        <tr>
          <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">
              <tr>
                <td width="120" height="20" align="right">&nbsp;</td>
                <td><div align="left"></div></td>
              </tr>
              <tr>
                <td height="20" align="right">������</td>
                <td><div align="left">
                    <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120;" value="<%=rs("St_name")%>" size="15" <%response.write ("readonly")%> />
                  &nbsp;*&nbsp;�����޸�</div></td>
                <td height="20" align="right">�Ա�</td>
                <td><div align="left">
                  <input name="St_sex" type="text" class="textfield" id="St_sex" style="WIDTH: 120;" value="<%=rs("St_sex")%>" size="15" />
                </div></td>
              </tr>
              <tr>
                <td height="20" align="right">ѧ�ţ�</td>
                <td><div align="left">
                    <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120;" value="<%=rs("St_number")%>" size="20" <%response.write ("readonly")%> />
                  &nbsp;*�����޸�</div></td>
                <td height="20" align="right">���֤��</td>
                <td><div align="left">
                  <input name="St_identity" type="text" class="textfield" id="St_identity" style="WIDTH: 120;" value="<%=rs("identity_card")%>" size="20" />
                  &nbsp;*</div></td>
              </tr>
              <tr>
                <td height="20" align="right">����ϵ�����ƣ�</td>
                <td><div align="left">
                  <input name="St_department" type="text" class="textfield" id="St_department" style="WIDTH: 120;" value="<%=rs("St_department")%>" size="20" <%response.write ("readonly")%> />
                  &nbsp;*</div></td>
                <td height="20" align="right">�޸����룺</td>
                <td><div align="left">
                    <input name="St_pass1" type="text" class="textfield" id="St_pass1" style="WIDTH: 120;" value="<%=rs("St_unmd5_pass")%>" size="20" />
                  &nbsp;*  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ȷ�ϣ�
                  <input name="St_pass2" type="password" class="textfield" id="St_pass2" style="WIDTH: 120;" value="<%=rs("St_unmd5_pass")%>" size="20" />&nbsp;
                </div></td>
              </tr>
              <tr>
                <td height="20" align="right">�꼶��</td>
                <td><div align="left">
                    <input name="St_grade" type="text" class="textfield" id="St_grade" style="WIDTH: 120;" value="<%=rs("St_grade")%>" size="20" />
                  &nbsp;*</div></td>
                <td height="20" align="right">��ϵ�绰��</td>
                <td><div align="left">
                    <input name="St_phone" type="text" class="textfield" id="St_phone" style="WIDTH: 120;" value="<%=rs("St_phone")%>" size="20" />
                  &nbsp;*</div></td>
              </tr>
              <tr>
                <td height="20" align="right">�༶��</td>
                <td><div align="left">
                    <input name="St_class" type="text" class="textfield" id="St_class" style="WIDTH: 120;" value="<%=rs("St_class")%>" size="20" />
                  &nbsp;*</div></td>
                <td height="20" align="right">email��</td>
                <td><div align="left">
                    <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120;" value="<%=rs("St_email")%>" size="20" />
                  &nbsp;*</div></td>
              </tr>
              <tr>
                <td height="30" align="right">&nbsp;</td>
                <td valign="bottom"><div align="left">
                    <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value=" �� �� " style="WIDTH: 60;" />
                    <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit2" value=" �� �� " style="WIDTH: 60;" />
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
	end if  'end of if Result="modify"-------------------
%>
</body>
</html>


<%
'Action=SaveEdit	��������------------------
dim Acticn,Action1,Action2
	Action=(request("Action"))	
	ID=trim(request("ID"))
	
	if Action = "SaveEdit" then
		set rs = server.createobject("adodb.recordset")
	sql1="select * from student_info where ID="&ID
		rs.open sql1,conn,1,3
		if rs.bof or rs.eof then 
		response.Write("<script language='javascript'>alert('���ݿ�����뷵�ء���');history.back()</script>")
		else 
		'�޸��Ա�
		if trim(request.form("St_sex"))<>rs("St_sex") then
				rs("St_sex")=trim(request.form("St_sex"))
		end if
		'�޸�Ժϵ
		if trim(request.form("St_department"))<>rs("St_department") then
				rs("St_department")=trim(request.form("St_department"))
		end if
		'�޸İ༶
		if trim(request.form("St_class"))<>rs("St_class") then
				rs("St_class")=trim(request.form("St_class"))
		end if
		'�޸��꼶
		if trim(request.form("St_grade"))<>rs("St_grade") then
				rs("St_grade")=trim(request.form("St_grade"))
		end if
		'�޸�����
		if trim(request.form("St_email"))<>rs("St_email") then
				rs("St_email")=trim(request.form("St_email"))
		end if
		if trim(request.form("St_phone"))<>rs("St_phone") then
				rs("St_phone")=trim(request.form("St_phone"))
		end if
		if trim(request.form("St_identity"))<>rs("St_identity") then
				rs("St_identity")=trim(request.form("St_identity"))
		end if
		if Md5(trim(request.form("St_pass1")))<>rs("St_unmd5_pass") then
				rs("St_pass")=Md5(trim(request.form("St_pass1")))
				rs("St_unmd5_pass")=trim(request.form("St_pass2"))
								response.Write("<script language='javascript'>alert('�޸ĸ������ϳɹ����뷵�ء���');history.back()</script>")
				
		end if
				
		rs.update
		rs.close
		set rs = nothing

		end if 'end of if rs.bof or rs.eof
	end if'end of if action="SaveEdit1"

	
%>
