<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.Sel_name.value.length == 0) { 
			alert("�����������!");
			document.editForm.Sel_name.focus();
			return false;
			}
			if (document.editForm.Tea_id.value.length == 0) { 
			alert("��ѡ��ָ����ʦ!");
			document.editForm.Tea_id.focus();
			return false;
			}
			if (document.editForm.Sel_level.value.length == 0) { 
			alert("��ѡ������Ѷ�!");
			document.editForm.Sel_level.focus();
			return false;
			}
			if (document.editForm.Sp_id.value.length == 0) { 
			alert("��ѡ����ѡרҵ!");
			document.editForm.Sp_id.focus();
			return false;
			}
			if (document.editForm.Sel_cour.value.length == 0) { 
			alert("��ѡ����ⷽ��!");
			document.editForm.Sel_cour.focus();
			return false;
			}
			return true;
		}
	function DoEmpty()
	{
		window.location = "task_view.asp" ;
	}
		function select_change(option_value){
			//alert("��ȷ��Ҫ�ı���ʦ��");
			//alert(option_value);
			//document.editForm.tea_name.innerTHML=option_value;
			var i;
			document.editForm.tea_name.value=option_value;
			i=document.editForm.tea_name.value;
			//alert(i);
		}
</script>
<title>����޸Ŀ���</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>���������ӣ��޸Ŀ�����Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="task_add.asp?Result=Add" onClick='changeAdminFlag("��ӹ���Ա")'>��ӿ���</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="task_list.asp" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴���п���</a><font color="#0000FF">&nbsp;</font></td>    
  </tr>
</table>
  <center>
    <br/>
	
	
	<%
		'�������------------------------------------------------------------------------------
		Result=request.QueryString("Result")
		if Result = "Add" then
	%>
	<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#21d015">
  <form name="editForm" method="post" action="?Action=addnew&tea_name=<%=Tea_name%>" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">�������ƣ�</td>
        <td><div align="left">
            <input name="Sel_name" type="text" class="textfield" id="Sel_name" style="WIDTH: 120;" size="60" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">ָ����ʦ��</td>
        <td><div align="left">
          <select name="Tea_id" id="Tea_id" onchange="select_change(this.options[this.selectedIndex].text);">
            <option value="">��ѡ��</option>
            <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Tea_id,Tea_name from teacher_inf order by Tea_name asc"    
			rs.open sql,Conn,1,1
			tea_name=rs("Tea_name")
		%>
            <%do while not rs.eof%>
            <option value="<%=rs("Tea_id")%>"><%=rs("Tea_name")%></option>
            <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
		  <input type="text" size="10" id="tea_name" name="tea_name" style="display:none" value="<%=tea_name%>" />
        *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">�����Ѷȣ�</td>
        <td><div align="left">
          <select name="Sel_level" id="Sel_level">
            <option value="">��ѡ��</option>
            <option value="����">����</option>
            <option value="һ��">һ��</option>
            <option value="�е�">�е�</option>
            <option value="����">����</option>
            <option value="����">����</option>
                  </select>
        *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">���ⷽ��</td>
        <td><div align="left">
            <select name="Sel_cour" id="Sel_cour">
              <option value="">��ѡ��</option>
              <option value="�����о�">�����о�</option>
              <option value="���Ӧ��">���Ӧ��</option>
              <option value="���ݽṹ">���ݽṹ</option>
              <option value="Ӧ���о�">Ӧ���о�</option>
            </select>
        *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ѡרҵ��</td>
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
*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ѡ������</td>
        <td><div align="left">
          <input name="Sel_nu" type="text" class="textfield" id="Sel_nu" value="1" size="5"  <%response.write ("readonly")%>/>
         һ��һ�⣬��������ϸ�֡� </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">����Ҫ��</td>
        <td><div align="left">
          <textarea name="Sel_con" cols="60" rows="8" class="textfield" id="Sel_con" style="WIDTH: 580;" ></textarea>
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
	sql="select * from select_cursor as sel where ID="&request("ID")
	'response.Write(sql)
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <form name="editForm" method="post" action="task_add.asp?Action=SaveEdit&ID=<%=request("ID")%>&txtpage=<%=request("txtpage")%>" 
  onsubmit="return depart_add()">
  <tr>
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">�������ƣ�</td>
        <td><div align="left">
            <input name="Sel_name" type="text" class="textfield" id="Sel_name" style="WIDTH: 120;" value="<%=rs("Sel_name")%>" size="60" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">ָ����ʦ��</td>
        <td><div align="left">
            <select name="Tea_id" id="Tea_id" onchange="select_change(this.options[this.selectedIndex].text)">
              <option value="">��ѡ��</option>
              <%    
			set rs1=server.createobject("adodb.recordset")    
			sql="select Tea_id,Tea_name from teacher_inf order by Tea_name asc"    
			rs1.open sql,Conn,1,1
		%>
              <%do while not rs1.eof%>
              <option value="<%=rs1("Tea_id")%>" 
			<% if rs1("Tea_id")=rs("Tea_id") then response.Write("selected='selected'") end if
			dim tea_name
			if rs1("Tea_id")=rs("Tea_id") then tea_name=rs1("Tea_name") end if
			%>
			  ><%=rs1("Tea_name")%></option>
              <%
				rs1.movenext
				loop
				rs1.close
				set rs1 = nothing
			%>
            </select>
	 <input type="text" size="10" id="tea_name" name="tea_name" style="display:none" value="<%=tea_name%>" />

			<script language="javascript" type="text/javascript"> 
	function change_tea(tea_id)
		{ 
			var i,j;
			i=tea_id.text;
			j=tea_id.value;
			alert(i);
			alert(j);
			return true;
		}

</script>
          *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">�����Ѷȣ�</td>
        <td><div align="left">
            <select name="Sel_level" id="select2">
              <option>��ѡ��</option>
              <option value="����"
			  <% if rs("Sel_level")="����" then response.Write("selected='selected'") end if%>
			  >����</option>
              <option value="һ��"
			  <% if rs("Sel_level")="һ��" then response.Write("selected='selected'") end if%>
			  >һ��</option>
              <option value="�е�"
			  <% if rs("Sel_level")="�е�" then response.Write("selected='selected'") end if%>
			  >�е�</option>
              <option value="����"
			  <% if rs("Sel_level")="����" then response.Write("selected='selected'") end if%>
			  >����</option>
              <option value="����"
			  <% if rs("Sel_level")="����" then response.Write("selected='selected'") end if%>
			  >����</option>
            </select>
          *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">���ⷽ��</td>
        <td><div align="left">
            <select name="Sel_cour" id="select3">
              <option>��ѡ��</option>
              <option value="�����о�"
			  <% if rs("Sel_cour")="�����о�" then response.Write("selected='selected'") end if%>
			  >�����о�</option>
              <option value="���Ӧ��"
			  <% if rs("Sel_cour")="���Ӧ��" then response.Write("selected='selected'") end if%>
			  >���Ӧ��</option>
              <option value="���ݽṹ"
			  <% if rs("Sel_cour")="���ݽṹ" then response.Write("selected='selected'") end if%>
			  >���ݽṹ</option>
              <option value="Ӧ���о�"
			  <% if rs("Sel_cour")="Ӧ���о�" then response.Write("selected='selected'") end if%>
			  >Ӧ���о�</option>
            </select>
          *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ѡרҵ��</td>
        <td><div align="left">
<select name="sp_id" id="sp_id">
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
			%>
</select>          
*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ѡ������</td>
        <td><div align="left">
            <input name="Sel_nu" type="text" class="textfield" id="Sel_nu" value="1" size="5" <%response.write ("readonly")%>/>
            һ��һ�⣬��������ϸ�֡�</div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">����Ҫ��</td>
        <td><div align="left">
          <textarea name="Sel_con" cols="60" rows="8" class="textfield" id="Sel_con" style="WIDTH: 580;" ><%=rs("Sel_con")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
		
<%
	Result=request.QueryString("show")
	if Result = "yes" then
%>

 <input name="submitSaveEdit3" type="button" class="button"  id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;" onclick="javascript:DoEmpty();">
<%else%>

 <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;">
 <%end if%>
		  
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
		set rs = server.createobject("adodb.recordset")
		sql="select * from select_cursor"
		rs.open sql,conn,1,3
			rs.addnew
			rs("Sel_name")=trim(request.form("Sel_name"))
			rs("Tea_id")=trim(request.form("Tea_id"))
			rs("Sel_Tea")=trim(request.Form("tea_name"))
			rs("Sel_level")=trim(request.form("Sel_level"))
			rs("Sel_cour")=request.form("Sel_cour")
			rs("Sel_nu")=request.form("Sel_nu")
			rs("sp_id")=request.form("sp_id")
			rs("Sel_con")=request.form("Sel_con")
			rs("sel_flag")=false
			rs.update
			rs.close
			set rs = nothing
			response.Redirect("task_list.asp")
	end if

	'Action=SaveEdit	�����޸�
	Action=request.QueryString("Action")
	if Action = "SaveEdit" then
		set rs = server.createobject("adodb.recordset")
		response.Write(request("ID"))
		sql="select * from select_cursor where ID="&request("ID")
		rs.open sql,conn,1,3
		if rs.bof or rs.eof then response.Write("rs error")
			rs("Sel_name")=trim(request.form("Sel_name"))
			rs("Sel_Tea")=trim(request.Form("tea_name"))
			rs("Tea_id")=trim(request.form("Tea_id"))
		response.Write(trim(request.Form("tea_name")))
			rs("Sel_level")=trim(request.form("Sel_level"))
			rs("Sel_cour")=request.form("Sel_cour")
			rs("Sel_nu")=request.form("Sel_nu")
			rs("sp_id")=request.form("sp_id")
			rs("Sel_con")=request.form("Sel_con")
			rs.update
			rs.close
			set rs = nothing
			'response.Redirect("task_list.asp?txtpage="&request("txtpage"))
	end if
		
	if Action = "del" then
		sql = "delete from select_cursor where ID="&request("ID")
		'response.Write(sql)
		Conn.Execute(sql)
		response.Write("ɾ���ɹ����뷵�ء���")
		response.Redirect("task_list.asp")
	end if
	
if Action = "check" then
	set rs = server.createobject("adodb.recordset")
	sql="select * from select_cursor where ID="&request("ID")
	rs.open sql,conn,1,3
		rs("check")=true
		rs.update
		rs.close
		set rs = nothing
		response.Redirect("task_list.asp?txtpage="&request("txtpage"))
end if
       	conn.close
       	set conn=nothing
%>
