<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.St_number.value.length == 0) { 
			alert("������ѧ��!");
			document.editForm.St_number.focus();
			return false;
			}
			if (document.editForm.St_name.value.length == 0) { 
			alert("������ѧ����!");
			document.editForm.St_name.focus();
			return false;
			}
			if (document.editForm.Sp_id.value.length == 0) { 
			alert("��ѡ��רҵ����!");
			document.editForm.Sp_id.focus();
			return false;
			}
			if (document.editForm.St_m_phone.value.length == 0) { 
			alert("�������д��Ч��ϵ��ʽ!");
			document.editForm.St_m_phone.focus();
			return false;
			}
			if (document.editForm.D_name.value.length == 0) { 
			alert("��ѡ��ϵ������!");
			document.editForm.D_name.focus();
			return false;
			}
			if (document.editForm.st_pass.value !=document.editForm.st_pass1.value) { 
			alert("���벻һ��!");
			document.editForm.st_pass.focus();
			return false;
			}
			return true;
		}
</script>
<title>�鿴ѧ��</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>ѧ��������ӣ��޸�ѧ����Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="student_add.asp?Result=Add" onClick='changeAdminFlag("���ѧ��")'>���ѧ��</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="student_list.asp" onClick='changeAdminFlag("�鿴����ѧ��")'>�鿴����ѧ��</a></td>    
  </tr>
</table>
  <center>
    <br/>
	
	
	<abbr><%
		'�������------------------------------------------------------------------------------
		Result=request.QueryString("Result")
		if Result = "Add" then
	%>
	<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#21d015">
  <form name="editForm" method="post" action="student_add.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">ѧ�ţ�</td>
        <td><div align="left">
          <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120;" size="15">
          &nbsp;*&nbsp;�����ظ�</div></td>
      </tr>
      <tr>
        <td height="20" align="right">ѧ��������</td>
        <td><div align="left">
            <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120;" size="19" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">��¼���룺</td>
        <td><div align="left">
            <input name="st_pass" type="text" class="textfield" id="st_pass" style="WIDTH: 120;" value="123456" size="19" />
          &nbsp;Ĭ������ 123456 </div></td>
      </tr>   <tr>
        <td height="20" align="right">����ȷ�ϣ�</td>
        <td><div align="left">
            <input name="st_pass1" type="text" class="textfield" id="st_pass1" style="WIDTH: 120;" value="123456" size="19" />
          &nbsp;Ĭ������ 123456 </div></td>
      </tr>
      <tr>
        <td height="20" align="right">ϵ��</td>
        <td><div align="left">
            <select name="D_name" id="D_name">
			<option value="">��ѡ��</option>
              <%    
				set rs2=server.createobject("adodb.recordset")    
				sql="select D_name from department "    
				rs2.open sql,Conn,1,3
			%>
              <%do while not rs2.eof%>
              <option value="<%=rs2("D_name")%>"><%=rs2("D_name")%></option>
              <%
				rs2.movenext
				loop
			%>
            </select>
        </div></td>
      </tr>
	        <tr>
        <td height="20" align="right">רҵ��</td>
        <td><div align="left">
            <select name="Sp_id" id="Sp_id">
			<option value="">��ѡ��</option>
              <%    
				set rs=server.createobject("adodb.recordset")    
				sql="select * from speciality "    
				rs.open sql,Conn,1,3
			%>
              <%do while not rs.eof%>
              <option value="<%=rs("sp_id")%>"><%=rs("sp_name")%></option>
              <%
				rs.movenext
				loop
			%>
            </select>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">��Դ��</td>
        <td><div align="left">
            <input name="St_origin" type="text" class="textfield" id=" " style="WIDTH: 120;" size="19" />
          &nbsp;��ҵѧУ</div></td>
      </tr>
      <tr>
        <td height="20" align="right">�꼶��</td>
        <td><div align="left">
            <input name="St_grade" type="text" class="textfield" id="St_grade" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right">�༶��</td>
        <td><div align="left">
            <input name="St_class" type="text" class="textfield" id="St_class" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right">�������£�</td>
        <td><div align="left">
		
            <!--<input name="St_date" type="text" class="textfield" id="St_date" style="WIDTH: 120;" size="19" />-->
			
		<script language=javascript> 
          var myDate=new dateSelector(); 
          myDate.year = myDate.year-23; 
		  myDate.date; 
          myDate.inputName='St_date'; //���������
          myDate.display(); 
         </script>
			
			
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">���֤�ţ�</td>
        <td><div align="left">
            <input name="identity_card" type="text" class="textfield" id="identity_card" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right">�����ص㣺</td>
        <td><div align="left">
            <input name="St_adress" type="text" class="textfield" id="St_adress" style="WIDTH: 120;" size="32" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right">�Ա�</td>
        <td><div align="left">&nbsp;
          <label>
          <input type="radio" name="St_sex" value="��" />
          ��</label>
          <label>
          <input type="radio" name="St_sex" value="Ů" />
          Ů</label>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">�绰���룺</td>
        <td><div align="left">
            <input name="St_phone" type="text" class="textfield" id="St_phone" style="WIDTH: 120;" size="19" />
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">�ֻ����룺</td>
        <td><div align="left">
            <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" style="WIDTH: 120;" size="19" />
          &nbsp;* �������д��Ч��ϵ��ʽ </div></td>
      </tr>
      <tr>
        <td height="20" align="right">QQ��</td>
        <td><div align="left">
            <input name="St_qq" type="text" class="textfield" id="St_qq" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right">�������䣺</td>
        <td><div align="left">
            <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
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
</table></abbr>

<%
	end if
	'��������
	if Result = "Modify" then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from student_info where Id="&request("ID")&""
	'response.Write(sql)
	rs.open sql,conn,3,2
	'response.Write(request("ID"))
%>



<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#21d015">
<form name="editForm" method="post" action="student_add.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">    <tr>
      <td height="24" nowrap="nowrap" bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
        <tr>
          <td width="120" height="20" align="right">&nbsp;</td>
          <td><div align="left"></div></td>
        </tr>
        <tr>
          <td height="20" align="right">ѧ�ţ�</td>
          <td><div align="left">
            <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120;" value="<%=rs("St_number")%>" size="15"/>
            &nbsp;*&nbsp;�����ظ��������޸�</div></td>
        </tr>
        <tr>
          <td height="20" align="right">ѧ��������</td>
          <td><div align="left">
            <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120;" value="<%=rs("St_name")%>" size="19" />
            &nbsp;*</div></td>
        </tr>
        <tr>
          <td height="20" align="right">��¼���룺</td>
          <td><div align="left">
            <input name="st_pass" type="text" class="textfield" id="st_pass" style="WIDTH: 120;" size="19" value="<%=rs("St_unmd5_pass")%>"/>
            &nbsp;Ĭ������ admin Ϊ�����޸�</div></td>
        </tr>
		<tr>
          <td height="20" align="right">����ȷ�ϣ�</td>
          <td><div align="left">
            <input name="st_pass1" type="text" class="textfield" id="st_pass1" style="WIDTH: 120;" size="19" value="<%=rs("St_unmd5_pass")%>" />
            &nbsp;Ĭ������ admin Ϊ�����޸�</div></td>
        </tr>
		  <tr>
        <td height="20" align="right">ϵ��</td>
        <td><div align="left">
            <select name="D_name" id="D_name">
			<option value="">��ѡ��</option>
              <%    
				set rs2=server.createobject("adodb.recordset")    
				sql="select D_name from department "    
				rs2.open sql,Conn,1,3
			%>
              <%do while not rs2.eof%>
              <option value="<%=rs2("D_name")%>"><%=rs2("D_name")%></option>
              <%
				rs2.movenext
				loop
			%>
            </select>
        </div></td>
      </tr>
        <tr>
          <td height="20" align="right">רҵ��</td>
          <td><div align="left">
            <select name="Sp_id" id="Sp_id">
              <%    
				set rs1=server.createobject("adodb.recordset")    
				sql="select * from speciality "    
				rs1.open sql,Conn,1,3
			%>
              <%do while not rs1.eof%>
              <option value="<%=rs1("sp_id")%>"
			  <% if rs1("sp_id")=rs("sp_id") then response.Write("selected='selected'") end if%>
			  ><%=rs1("sp_name")%></option>
              <%
				rs1.movenext
				loop
				rs1.close
				rs1=nothing
			%>
            </select>
          </div></td>
        </tr>
        <tr>
          <td height="20" align="right">��Դ��</td>
          <td><div align="left">
            <input name="St_origin" type="text" class="textfield" id="St_origin" style="WIDTH: 120;" value="<%=rs("St_origin")%>" size="19" />
            &nbsp;��ҵѧУ</div></td>
        </tr>
        <tr>
          <td height="20" align="right">�꼶��</td>
          <td><div align="left">
            <input name="St_grade" type="text" class="textfield" id="St_grade" style="WIDTH: 120;" value="<%=rs("St_grade")%>" size="19" />
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">�༶��</td>
          <td><div align="left">
            <input name="St_class" type="text" class="textfield" id="St_class" style="WIDTH: 120;" value="<%=rs("St_class")%>" size="19" />
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">���֤�ţ�</td>
          <td><div align="left">
            <input name="identity_card" type="text" class="textfield" id="identity_card" style="WIDTH: 120;" value="<%=rs("identity_card")%>" size="19" />
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">�����ص㣺</td>
          <td><div align="left">
            <input name="St_adress" type="text" class="textfield" id="St_adress" style="WIDTH: 120;" value="<%=rs("St_adress")%>" size="32" />
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">�Ա�</td>
          <td><div align="left">&nbsp;
                    <label>
					<%
						if rs("St_sex")="Ů" then
					%>
                    <input name="St_sex" type="radio" value="��"  />
                      ��</label>
                    <label>
                    <input type="radio" name="St_sex" value="Ů" checked="checked"/>
                      Ů
					  <% else  %>
					   <input name="St_sex" type="radio" value="��" checked="checked"/>
                      ��</label>
                    <label>
                    <input type="radio" name="St_sex" value="Ů"    />
                      Ů
					  <% end if %>
					  </label>
          </div></td>
        </tr>
        <tr>
          <td height="20" align="right">�绰���룺</td>
          <td><div align="left">
            <input name="St_phone" type="text" class="textfield" id="St_phone" style="WIDTH: 120;" value="<%=rs("St_phone")%>" size="19" />
          </div></td>
        </tr>
        <tr>
          <td height="20" align="right">�ֻ����룺</td>
          <td><div align="left">
            <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" style="WIDTH: 120;" value="<%=rs("St_m_phone")%>" size="19" />
            &nbsp;* �������д��Ч��ϵ��ʽ </div></td>
        </tr>
        <tr>
          <td height="20" align="right">QQ��</td>
          <td><div align="left">
            <input name="St_qq" type="text" class="textfield" id="St_qq" style="WIDTH: 120;" value="<%=rs("St_qq")%>" size="19" />
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">�������䣺</td>
          <td><div align="left">
            <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120;" value="<%=rs("St_email")%>" size="19" />
            &nbsp;</div></td>
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

  <%
	rs.close
	set rs = nothing
	end if
%>
</center>
</body>
</html>


<%
st_pass=Md5(trim(request.form("st_pass")))
st_pass1=trim(request.form("st_pass1"))
st_pass2=trim(request.form("st_pass"))
'response.Write(st_pass1)
'response.Write(st_pass2)
'Action=addnew	�������
	Action=request.QueryString("Action")
	if Action = "addnew" then
	if st_pass1=st_pass2 then
		St_number = trim(request.form("St_number"))
		set rs = server.createobject("adodb.recordset")
		sql1="select * from student_info where St_number='"&St_number&"'"
		rs.open sql1,conn,1,3
			if rs.bof and rs.eof then
				rs.addnew
				rs("St_number")=trim(request.form("St_number"))
				rs("St_name")=trim(request.form("St_name"))
				'response.Write(trim(request.form("st_pass1")))
				rs("st_pass")=st_pass
				rs("St_unmd5_pass")=st_pass1
				rs("Sp_id")=trim(request.form("Sp_id"))
				'response.Write(trim(request.form("D_name")))
				rs("St_department")=trim(request.form("D_name"))
				rs("St_origin")=trim(request.form("St_origin"))
				rs("St_grade")=trim(request.form("St_grade"))
				rs("St_class")=trim(request.form("St_class"))
				rs("St_date")=trim(request.form("St_date"))
				rs("identity_card")=trim(request.form("identity_card"))
				rs("St_adress")=trim(request.form("St_adress"))
				rs("St_sex")=trim(request.form("St_sex"))
				rs("St_phone")=trim(request.form("St_phone"))
				rs("St_m_phone")=trim(request.form("St_m_phone"))
				rs("St_qq")=trim(request.form("St_qq"))
				rs("St_email")=trim(request.form("St_email"))
				rs.update
				rs.close
				set rs = nothing
				response.Redirect("student_list.asp")
			else
				response.Write("<script>alert('ѧ���Ѵ��ڣ��뷵�ء���');history.back()</script>")
			end if
			else 
			response.write("<script>alert('���벻һ�£��뷵�ء���');history.back()</script>")
		end if
		end if

'Action=addnew	�޸�����
	Action=request.QueryString("Action")
	if Action = "SaveEdit" then
		if st_pass1=st_pass2 then
		'response.Write(request("ID"))
		St_number = trim(request.form("St_number"))
		set rs = server.createobject("adodb.recordset")
		sql1="select * from student_info where ID="&request("ID")
		rs.open sql1,conn,1,3
			rs("St_number")=trim(request.form("St_number"))
			rs("St_name")=trim(request.form("St_name"))
			'response.Write(trim(request.form("st_pass")))
			rs("st_pass")=st_pass
			rs("St_unmd5_pass")=st_pass1
			rs("Sp_id")=trim(request.form("Sp_id"))
			rs("St_origin")=trim(request.form("St_origin"))
			rs("St_department")=trim(request.form("D_name"))
			rs("St_grade")=trim(request.form("St_grade"))
			rs("St_class")=trim(request.form("St_class"))
			rs("identity_card")=trim(request.form("identity_card"))
			rs("St_adress")=trim(request.form("St_adress"))
			rs("St_sex")=trim(request.form("St_sex"))
			rs("St_phone")=trim(request.form("St_phone"))
			rs("St_m_phone")=trim(request.form("St_m_phone"))
			rs("St_qq")=trim(request.form("St_qq"))
			rs("St_email")=trim(request.form("St_email"))
			rs.update
			rs.close
			set rs = nothing
			response.Redirect("student_list.asp")
			response.Write(trim(request.form("st_pass1")))
				else 
			response.write("<script>alert('���벻һ�£��뷵�ء���');history.back()</script>")
		end if
	end if


		
	if Action = "del" then
		sql = "delete from student_info where id="&request("ID")
		'response.Write(sql)
		Conn.Execute(sql)
       	conn.close
       	set conn=nothing
		response.Write("ɾ���ɹ����뷵�ء���")
		response.Redirect("student_list.asp")
	end if
	
%>
