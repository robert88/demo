<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>����޸Ŀ���</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>���������ӣ��޸Ŀ�����Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="task_list.asp" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴���п���</a><font color="#0000FF">&nbsp;</font></td>    
  </tr>
</table>
  <center>
    <br/>

<%
	'��������
	Result=request.QueryString("Result")
	if Result = "Modify" then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from select_cursor sel,teacher_inf tea,zc_table zc where sel.Tea_id=tea.Tea_id and zc.Zc_id=tea.Zc_id and sel.ID="&request("ID")
	'response.Write(sql)
	rs.open sql,conn,1,1

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
            <input name="Sel_name" type="text" class="textfield" id="Sel_name" style="WIDTH: 120;" value="<%=rs("Sel_name")%>" size="60" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">ָ����ʦ��</td>
        <td><div align="left">
            <input name="textfield3" type="text" value="<%=rs("tea_name")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ʦ�绰��</td>
        <td><div align="left">
            <input name="textfield2" type="text" value="<%=rs("Tea_m_pone")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ʦEmail��</td>
        <td><div align="left">
            <input name="textfield" type="text" value="<%=rs("Tea_email")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ʦְ�ƣ�</td>
        <td><div align="left">
            <input name="textfield3" type="text" value="<%=rs("zc_name")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">�����Ѷȣ�</td>
        <td><div align="left">
            <input name="textfield2" type="text" value="<%=rs("Sel_level")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">���ⷽ��</td>
        <td><div align="left">
            <input name="textfield" type="text" value="<%=rs("Sel_cour")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ѡ������</td>
        <td><div align="left">
            <input name="Sel_nu" type="text" class="textfield" id="Sel_nu" value="1" size="5" />
          * ���ݿ����Ѷ��ʵ����� </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">����Ҫ��</td>
        <td><div align="left">
            <textarea name="Sel_con" cols="60" rows="8" class="textfield" id="Sel_con" style="WIDTH: 580;" <%response.write ("readonly")%>><%=rs("Sel_con")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
            		  			<%		address = request.ServerVariables("HTTP_REFERER")%>
			<input type="button" name="submitSaveEdit3" value="������һҳ" class="button" onclick="javascript:window.location.href='<%=address%>';" style="WIDTH: 60;">            

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
	Action=request.QueryString("Action")
	if Action = "SaveEdit" then
		response.Redirect("task_list.asp?txtpage="&request("txtpage"))
	end if
		
	'�ж���ʦ�޴�������ȷ��ѡ�⡢ɾ������ѡ��ѧ��
	if Action = "yes" then
		'�ж���ʦ���������Ƿ񳬹�
		set rsp = server.createobject("adodb.recordset")
		sql="select * from select_cursor where Sel_flag=true and Tea_id='"&session("user_no")&"'"
		rsp.open sql,conn,1,1
		
		set rsq = server.createobject("adodb.recordset")
		sql="select St_number from teacher_inf where Tea_id='"&session("user_no")&"'"
		rsq.open sql,conn,1,1
		'response.Write(rsq("St_number"))
		if rsp.recordcount < rsq("St_number") then
				'����ѡ���ʶ
				set rs = server.createobject("adodb.recordset")
				sql = "select * from select_cursor where St_number='"&request("scid")&"' and ID="&request("ID")
				rs.open sql,conn,1,3
				rs("check")=true
				rs.update
				
				'����ѧ����ʶ
				set rsa = server.createobject("adodb.recordset")
				sql = "select * from student_info where St_number='"&request("scid")&"'"
				rsa.open sql,conn,1,3
				rsa("flag0")=true
				rsa.update
				rsa.close
				set rsa=nothing

				rs.close
				set rs = nothing
			response.Redirect("task_view.asp?txtpage="&request("txtpage"))
			response.End()
		else
			response.Write("<script>alert('��������ѧ���������뷵�ء���');history.back()</script>")
			response.End()
		end if
			rsq.close
			set rsq=nothing
			rsp.close
			set rsp=nothing
			conn.close
			set conn = nothing
	end if
	
	'ɾ��ѧ��ѡ��
	if Action = "del" then
	'
	set rs_xuanti=server.createobject("adodb.recordset")
		sql = "delete from select_cursor where Sel_flag=True and ID="&request("ID")
		rs_xuanti.open sql,conn,1,3
		dim scid
		scid=rs_xuanti(St_number)
		Conn.Execute(sql)	
		rs_xuanti.close
		set rs_xuanti=nothing
		'student update flag
	set rsa = server.createobject("adodb.recordset")
				sql1 = "select * from student_info where St_number='"&scid&"'"
				rsa.open sql1,conn,1,3
				rsa("flag0")=false
				rsa.update
				rsa.close
				set rsa=nothing
		response.Redirect("task_view.asp?txtpage="&request("txtpage"))
		response.End()
	end if
	'cancel teacher check student's cursor
	if Action="del_check" then
			set rs = server.createobject("adodb.recordset")
				sql = "select * from select_cursor where St_number='"&request("scid")&"' and ID="&request("ID")
				rs.open sql,conn,1,3
				rs("check")=false
				rs.update
	end if
%>
