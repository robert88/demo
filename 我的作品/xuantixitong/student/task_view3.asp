<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/Conn.asp"-->
<!--#include file="CheckAdmin.asp"-->
<%
set rs=server.CreateObject("adodb.recordset")
sql=select * from select_cursor where St_number=session("user_no")