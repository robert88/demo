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
			alert("请输入课题名!");
			document.editForm.Sel_name.focus();
			return false;
			}
			if (document.editForm.Tea_id.value.length == 0) { 
			alert("请选择指导老师!");
			document.editForm.Tea_id.focus();
			return false;
			}
			if (document.editForm.Sel_level.value.length == 0) { 
			alert("请选择课题难度!");
			document.editForm.Sel_level.focus();
			return false;
			}
			if (document.editForm.Sp_id.value.length == 0) { 
			alert("请选择限选专业!");
			document.editForm.Sp_id.focus();
			return false;
			}
			if (document.editForm.Sel_cour.value.length == 0) { 
			alert("请选择课题方向!");
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
			//alert("你确认要改变老师？");
			//alert(option_value);
			//document.editForm.tea_name.innerTHML=option_value;
			var i;
			document.editForm.tea_name.value=option_value;
			i=document.editForm.tea_name.value;
			//alert(i);
		}
</script>
<title>添加修改课题</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>课题管理：添加，修改课题信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="task_add.asp?Result=Add" onClick='changeAdminFlag("添加管理员")'>添加课题</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="task_list.asp" onClick='changeAdminFlag("系统管理员")'>查看所有课题</a><font color="#0000FF">&nbsp;</font></td>    
  </tr>
</table>
  <center>
    <br/>
	
	
	<%
		'添加数据------------------------------------------------------------------------------
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
        <td height="20" align="right">课题名称：</td>
        <td><div align="left">
            <input name="Sel_name" type="text" class="textfield" id="Sel_name" style="WIDTH: 120;" size="60" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">指导老师：</td>
        <td><div align="left">
          <select name="Tea_id" id="Tea_id" onchange="select_change(this.options[this.selectedIndex].text);">
            <option value="">请选择</option>
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
        <td height="20" align="right">课题难度：</td>
        <td><div align="left">
          <select name="Sel_level" id="Sel_level">
            <option value="">请选择</option>
            <option value="容易">容易</option>
            <option value="一般">一般</option>
            <option value="中等">中等</option>
            <option value="较难">较难</option>
            <option value="很难">很难</option>
                  </select>
        *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">课题方向：</td>
        <td><div align="left">
            <select name="Sel_cour" id="Sel_cour">
              <option value="">请选择</option>
              <option value="理论研究">理论研究</option>
              <option value="设计应用">设计应用</option>
              <option value="数据结构">数据结构</option>
              <option value="应用研究">应用研究</option>
            </select>
        *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">限选专业：</td>
        <td><div align="left">
<select name="Sp_id" id="Sp_id">
<option value="">请选择</option>
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
        <td height="20" align="right">限选人数：</td>
        <td><div align="left">
          <input name="Sel_nu" type="text" class="textfield" id="Sel_nu" value="1" size="5"  <%response.write ("readonly")%>/>
         一人一题，大课题可以细分。 </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">课题要求：</td>
        <td><div align="left">
          <textarea name="Sel_con" cols="60" rows="8" class="textfield" id="Sel_con" style="WIDTH: 580;" ></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
          <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value=" 添 加 " style="WIDTH: 60;" >
        　　
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;">
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
	'更新数据
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
        <td height="20" align="right">课题名称：</td>
        <td><div align="left">
            <input name="Sel_name" type="text" class="textfield" id="Sel_name" style="WIDTH: 120;" value="<%=rs("Sel_name")%>" size="60" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">指导老师：</td>
        <td><div align="left">
            <select name="Tea_id" id="Tea_id" onchange="select_change(this.options[this.selectedIndex].text)">
              <option value="">请选择</option>
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
        <td height="20" align="right">课题难度：</td>
        <td><div align="left">
            <select name="Sel_level" id="select2">
              <option>请选择</option>
              <option value="容易"
			  <% if rs("Sel_level")="容易" then response.Write("selected='selected'") end if%>
			  >容易</option>
              <option value="一般"
			  <% if rs("Sel_level")="一般" then response.Write("selected='selected'") end if%>
			  >一般</option>
              <option value="中等"
			  <% if rs("Sel_level")="中等" then response.Write("selected='selected'") end if%>
			  >中等</option>
              <option value="较难"
			  <% if rs("Sel_level")="较难" then response.Write("selected='selected'") end if%>
			  >较难</option>
              <option value="很难"
			  <% if rs("Sel_level")="很难" then response.Write("selected='selected'") end if%>
			  >很难</option>
            </select>
          *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">课题方向：</td>
        <td><div align="left">
            <select name="Sel_cour" id="select3">
              <option>请选择</option>
              <option value="理论研究"
			  <% if rs("Sel_cour")="理论研究" then response.Write("selected='selected'") end if%>
			  >理论研究</option>
              <option value="设计应用"
			  <% if rs("Sel_cour")="设计应用" then response.Write("selected='selected'") end if%>
			  >设计应用</option>
              <option value="数据结构"
			  <% if rs("Sel_cour")="数据结构" then response.Write("selected='selected'") end if%>
			  >数据结构</option>
              <option value="应用研究"
			  <% if rs("Sel_cour")="应用研究" then response.Write("selected='selected'") end if%>
			  >应用研究</option>
            </select>
          *</div></td>
      </tr>
      <tr>
        <td height="20" align="right">限选专业：</td>
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
        <td height="20" align="right">限选人数：</td>
        <td><div align="left">
            <input name="Sel_nu" type="text" class="textfield" id="Sel_nu" value="1" size="5" <%response.write ("readonly")%>/>
            一人一题，大课题可以细分。</div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">课题要求：</td>
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

 <input name="submitSaveEdit3" type="button" class="button"  id="submitSaveEdit3" value=" 返 回 " style="WIDTH: 60;" onclick="javascript:DoEmpty();">
<%else%>

 <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" 修 改 " style="WIDTH: 60;">
 <%end if%>
		  
         <input name="submitSaveEdit22" type="reset" class="button"  id="submitSaveEdit22" value=" 重 置 " style="WIDTH: 60;" />
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
'Action=addnew	添加数据

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

	'Action=SaveEdit	保存修改
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
		response.Write("删除成功，请返回……")
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
