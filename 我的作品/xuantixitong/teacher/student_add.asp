<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>

<title>查看学生</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>学生管理：添加，修改学生信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><font color="#0000FF">&nbsp;</font><a href="student_list.asp" onClick='changeAdminFlag("查看所有学生")'>查看所有学生</a>
	|&nbsp;</font><a href="student_excel.asp" onclick='changeAdminFlag(&quot;导出所有学生信息&quot;)'>导出学生信息</a>	</td>    
  </tr>
</table>
  <center>
	<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from student_info where Id="&request("ID")&""
	'response.Write(sql)
	rs.open sql,conn,1,1
%>

<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#21d015">
<form name="editForm" method="post" action="student_add.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">    <tr>
      <td height="24" nowrap="nowrap" bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
        <tr>
          <td width="120" height="20" align="right">&nbsp;</td>
          <td><div align="left"></div></td>
        </tr>
        <tr>
          <td height="20" align="right">学号：</td>
          <td><div align="left">
            <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120;" value="<%=rs("St_number")%>" size="19" <%response.write ("readonly")%>/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">学生姓名：</td>
          <td><div align="left">
            <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120;" value="<%=rs("St_name")%>" size="19" <%response.write ("readonly")%>/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">专业：</td>
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
			%>
            </select>
          </div></td>
        </tr>
        <tr>
          <td height="20" align="right">来源：</td>
          <td><div align="left">
            <input name="St_origin" type="text" class="textfield" id="St_origin" style="WIDTH: 120;" value="<%=rs("St_origin")%>" size="19" <%response.write ("readonly")%>/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">年级：</td>
          <td><div align="left">
            <input name="St_grade" type="text" class="textfield" id="St_grade" style="WIDTH: 120;" value="<%=rs("St_grade")%>" size="19" <%response.write ("readonly")%>/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">班级：</td>
          <td><div align="left">
            <input name="St_class" type="text" class="textfield" id="St_class" style="WIDTH: 120;" value="<%=rs("St_class")%>" size="19" <%response.write ("readonly")%>/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">出生年月：</td>
          <td><div align="left">
            <input name="St_date" type="text" class="textfield" id="St_date" value="<%=rs("St_date")%>" size="19" <%response.write ("readonly")%>/>
          </div></td>
        </tr>
        <tr>
          <td height="20" align="right">身份证号：</td>
          <td><div align="left">
            <input name="identity_card" type="text" class="textfield" id="identity_card" style="WIDTH: 120;" value="<%=rs("identity_card")%>" size="19" <%response.write ("readonly")%>/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">出生地点：</td>
          <td><div align="left">
            <input name="St_adress" type="text" class="textfield" id="St_adress" style="WIDTH: 120;" value="<%=rs("St_adress")%>" size="32" <%response.write ("readonly")%>/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">性别：</td>
          <td><div align="left">&nbsp;
                    <label>
					<%
						if rs("St_sex")="女" then
					%>
                    <input name="St_sex" type="radio" value="男"  />
                      男</label>
                    <label>
                    <input type="radio" name="St_sex" value="女" checked="checked"/>
                      女
					  <% else  %>
					   <input name="St_sex" type="radio" value="男" checked="checked"/>
                      男</label>
                    <label>
                    <input type="radio" name="St_sex" value="女"    />
                      女
					  <% end if %>
					  </label>
          </div></td>
        </tr>
        <tr>
          <td height="20" align="right">电话号码：</td>
          <td><div align="left">
            <input name="St_phone" type="text" class="textfield" id="St_phone" style="WIDTH: 120;" value="<%=rs("St_phone")%>" size="19" <%response.write ("readonly")%>/>
          </div></td>
        </tr>
        <tr>
          <td height="20" align="right">手机号码：</td>
          <td><div align="left">
            <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" style="WIDTH: 120;" value="<%=rs("St_m_phone")%>" size="19" <%response.write ("readonly")%>/>
            &nbsp;* 请务必填写有效联系方式 </div></td>
        </tr>
        <tr>
          <td height="20" align="right">QQ：</td>
          <td><div align="left">
            <input name="St_qq" type="text" class="textfield" id="St_qq" style="WIDTH: 120;" value="<%=rs("St_qq")%>" size="19" <%response.write ("readonly")%>/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">电子邮箱：</td>
          <td><div align="left">
            <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120;" value="<%=rs("St_email")%>" size="19" <%response.write ("readonly")%>/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="30" align="right">&nbsp;</td>
          <td valign="bottom"><div align="left">
		  			<%		address = request.ServerVariables("HTTP_REFERER")%>
			<input type="button" name="submitSaveEdit3" value="返回上一页" class="button" onclick="javascript:window.location.href='<%=address%>';" style="WIDTH: 60;">            
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

  <%
  	rs1.close
	set rs1 = nothing
	rs.close
	set rs = nothing
%>
</center>
</body>
</html>