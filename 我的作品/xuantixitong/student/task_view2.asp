<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/Conn.asp"-->
<!--#include file="CheckAdmin.asp"-->
<%
dim Sel_name,ID
ID=request.querystring("ID")
set rs=server.CreateObject("adodb.recordset")
sql="select * from select_cursor where ID="&ID&" order by ID asc"
rs.open sql,Conn,1,1
%>
<html>
<head><title>选题说明</title>
<style>
.style1 {
margin-left:10px;
left-padding:10px;
background-color:#21d015;
font-size:16px;
text-align:center;
line-height:20px;
font-weight:bold;
height:22px;

}
</style>
</head>
<BODY bottommargin=0 leftmargin=0><br />
<div align="center">
<table width="603" height="309" border="1" bordercolor="#21d015">
<tr>
<td width="577" height="363" valign="top" bgcolor="#ccffff" bordercolor="#21d015">
	<div class="style1"><strong><%=rs("Sel_name")%></strong></div>
</center>
<br />
<div style="margin-left:10px;font-size:14px;">&nbsp;&nbsp;<%=rs("Sel_con")%></div>
</td>
</tr>
</table>
</div>
</BODY>
</html>
<%
set rs=nothing
conn.close

%>