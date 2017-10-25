<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>添加修改课题</title>
</head>
<!--
-->

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty()
	{
		window.location = "SysCome.asp" ;
	}
</script>

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>个人中心：查看我的选题</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">选题流程：①认真填写个人信息--&gt;②浏览选题--&gt;③选择自己感兴趣的选题--&gt;④联系指导老师完成毕业设计</td>    
  </tr>
</table>
  <center>
    <p>
      <%
	set rs1=server.CreateObject("adodb.recordset")
	sql = "select * from select_true where St_number='"&session("user_no")&"'"
	rs1.open sql,conn,1,1
	if rs1.bof and rs1.eof then
%>
</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;    </p>
    <h3>你还没有选题,现在<a href="task_list.asp"><font color='#ff0000'>开始选题</font></a></h3>
    <%
	else
	set rs2=server.CreateObject("adodb.recordset")
	sql2="select * from select_cursor where ID = "&rs1("ID")
	rs2.open sql2,conn,1,1
	set rs3=server.CreateObject("adodb.recordset")
	sql3="select * from teacher_inf where Tea_id = '"&rs1("Tea_id")&"'"
	rs3.open sql3,conn,1,1
	set rs4=server.CreateObject("adodb.recordset")
	sql4="select * from sel_record where St_number='"&session("user_no")&"'"
	rs4.open sql4,conn,1,1
%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr>
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">我的姓名：</td>
        <td><div align="left">
            <input name="textfield2" type="text" class="textfield" value="<%=session("user_name")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">我的学号：</td>
        <td><div align="left">
            <input name="textfield" type="text" class="textfield" value="<%=session("user_no")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">课题名称：</td>
        <td><div align="left">
            <input name="Sel_name" type="text" class="textfield" id="Sel_name" style="WIDTH: 120;" value="<%=rs2("Sel_name")%>" size="60" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">指导老师：</td>
        <td><div align="left">
            <input name="textfield3" type="text" class="textfield" value="<%=rs3("tea_name")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">老师电话：</td>
        <td><div align="left">
            <input name="textfield2" type="text" class="textfield" value="<%=rs3("Tea_m_pone")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">指导老师成绩：</td>
        <td><div align="left">
            <input name="textfield2" type="text" class="textfield" value="<%=rs4("Sum_ach")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">评阅人成绩：</td>
        <td><div align="left">
            <input name="textfield" type="text" class="textfield" value="<%=rs4("Sum_ach1")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">答辩委员会成绩：</td>
        <td><div align="left">
          <input name="textfield4" type="text" class="textfield" value="<%=rs4("Sum_ach2")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">课题要求：</td>
        <td><div align="left">
            <textarea name="Sel_con" cols="60" rows="8" class="textfield" id="Sel_con" style="WIDTH: 580;" <%response.write ("readonly")%>><%=rs2("Sel_con")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left">
  <form name="editForm" method="post" action="">
            <input name="submitSaveEdit3" type="button" class="button"  id="submitSaveEdit3" value=" 返回首页 " style="WIDTH: 60;" onclick="javascript:DoEmpty()">
  </form>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table></td>
  </tr>
</table>

</td>
  </tr>
  <%
	rs2.close
	set rs2 = nothing
	rs3.close
	set rs3 = nothing
	end if
  	rs1.close
	set rs1 = nothing
  	rs4.close
	set rs4 = nothing
%>
</center>
</body>
</html>


<%
	Action=request.QueryString("Action")
	if Action = "del" then
		sql="delete from select_true where ID='"&request("ID")&"'"
		response.Write(sql)
		conn.Execute(sql)
		set rs = server.createobject("adodb.recordset")
		sql1 = "select * from select_cursor where ID="&request("ID")
		response.Write(sql1)
		rs.open sql1,conn,1,3
		rs("sel_flag")=false
		rs.update
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		response.Redirect("task_mysel.asp")
	end if
%>
