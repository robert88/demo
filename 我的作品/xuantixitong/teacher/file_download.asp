<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Response.CodePage=65001%>
<% Response.Charset="UTF-8" %>


<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
<META NAME="Keywords" CONTENT="" />
<META NAME="Description" CONTENT="" />
<TITLE>文件管理</TITLE>
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>
</head>
<!--
-->
<!--#include file="CheckAdmin.asp"-->
<BODY>
<%
Const FsoString="Scripting.FileSystemObject"	'FSO字符串
PageSize=15  '每页显示数
Function ShowPage(ByRef PageCount,RecordCount,CurrentPage,PageSize,LinkFile)
	Dim Retval,J,StartPage,EndPage
	If (RecordCount Mod PageSize)=0 Then
	    PageCount=RecordCount \ PageSize
	Else 
	    PageCount=RecordCount \ PageSize+1
	End If
	If PageCount=0 Then PageCount=1
	If CurrentPage="" Then CurrentPage=1 else CurrentPage=CInt(CurrentPage)
	Retval=Retval & "<table Width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#D7E4F7'>"
    Retval=Retval & "<tr>"
    Retval=Retval & "<td>"
	If CurrentPage=1 Then              
		Retval=Retval & "&nbsp;<font style='color:#000000'>首页</font> | <font style='color:#000000'>前页</font> | " 
	Else
		Retval=Retval & "<a href='" & LinkFile & "Page=1'>首页</a> | <a href='" & LinkFile & "Page=" & CurrentPage - 1 & "'>前页</a> | "
	End If
	If  CurrentPage=PageCount Then             
		Retval=Retval & "<font style='color:#000000'>后页</font> | <font style='color:#000000'>末页</font>"
	Else
		Retval=Retval & "<a href='" & LinkFile & "Page=" & CurrentPage + 1 & "'>后页</a> | <a href='" & LinkFile & "Page=" & PageCount & "'>末页</a>"
	End if
	If RecordCount>0 Then
	    Retval=Retval & " | <b>"&CurrentPage&"</b>页/<b>"&CInt(PageCount)&"</b>页 | 共<b>"&RecordCount&"</b>条记录"
	End If
	Retval=Retval & "<td align='right'>"
	StartPage = Page-3
	EndPage = Page+3
	If StartPage<=0 Then
	    StartPage=1
	ElseIf StartPage>1 Then 
	    Retval=Retval & " <a href='" & LinkFile & "Page=1' style='font-family:webdings' title='首页'>9</a>"
	    Retval=Retval & " ... "
	End If	    
	If EndPage>PageCount Then EndPage=PageCount
	For J = StartPage to EndPage
		If J = Page Then
		    Retval = Retval & " <font color=#999999>" & J & "</font>"
		Else
		    Retval = Retval & " <a href='" & LinkFile & "Page=" & J & "'>" & J & "</a>"
		End If
	Next
	If EndPage < PageCount Then Retval= Retval & " ... <a href='" & LinkFile & "Page=" & PageCount & "' style='font-family:webdings' title='末页'>:</a>"
	Retval=Retval & "</td>"
	Retval=Retval & "</tr>"
    Retval=Retval & "</table>"
	ShowPage=Retval
End Function

Dim Action,Sfor(30,2)
Call Main()
Sub Main()
    Dim objFSO,Uploadpath,FileName
    Dim Folder
    Dim Num,FileCount
    UploadPath="../fileload/file"

    sFor(0,0)="txt":sFor(0,1)="txt"
    sFor(1,0)="chm":sFor(1,1)="chm"
    sFor(2,0)="hlp":sFor(2,1)="chm"
    sFor(3,0)="doc":sFor(3,1)="doc"
    sFor(4,0)="pdf":sFor(4,1)="pdf"
    sFor(5,0)="gif":sFor(5,1)="gif"
    sFor(6,0)="jpg":sFor(6,1)="jpg"
    sFor(7,0)="png":sFor(7,1)="png"
    sFor(8,0)="bmp":sFor(8,1)="bmp"
    sFor(9,0)="asp":sFor(9,1)="asp"
    sFor(10,0)="jsp":sFor(10,1)="asp"
    sFor(11,0)="js" :sFor(11,1)="asp"
    sFor(12,0)="htm":sFor(12,1)="html"
    sFor(13,0)="html":sFor(13,1)="html"
    sFor(14,0)="shtml":sFor(14,1)="html"
    sFor(15,0)="zip":sFor(15,1)="zip"
    sFor(16,0)="rar":sFor(16,1)="rar"
    sFor(17,0)="exe":sFor(17,1)="exe"
    sFor(18,0)="avi":sFor(18,1)="avi"
    sFor(19,0)="mpg":sFor(19,1)="mpg"
    sFor(20,0)="ra" :sFor(20,1)="ra"
    sFor(21,0)="ram":sFor(21,1)="ra"
    sFor(22,0)="mid":sFor(22,1)="mid"
    sFor(23,0)="wav":sFor(23,1)="wav"
    sFor(24,0)="mp3":sFor(24,1)="mp3"
    sFor(25,0)="asf":sFor(25,1)="asf"
    sFor(26,0)="php":sFor(26,1)="aspx"
    sFor(27,0)="php3":sFor(27,1)="aspx"
    sFor(28,0)="aspx":sFor(28,1)="aspx"
    sFor(29,0)="xls":sFor(29,1)="xls"
    sFor(30,0)="mdb":sFor(30,1)="mdb"
%>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#21d015">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>文件管理</strong></font></td>
  </tr>
<tr><td>
<table Width="100%" border=0 align="center" cellpadding=0 cellspacing=0 bgcolor="#EBF2F9" class=border-all>
  <tr>
    <td height="3" nowrap></td>
  </tr>
  <form name="form1" method="get" action="?path=">
    <tr> 
      <td height="20" sytle="line-height:150%">&nbsp;当前服务器目录　<font style="color:#666666;font-weight:bold"><%=server.mappath(uploadpath)%></font>　目录下所有文件列表如下</td>
    </tr>
  </form>
</table>
</td></tr></table>
<br>
<table Width="100%" border="0" align=center cellpadding="3" cellspacing="1" bgcolor="#21d015">
  <tr bgcolor="#21d015"> 
    <td Width="6%" height=23 align="center"><font color="#FFFFFF"><strong>类型</strong></font></td>
    <td Width="51%" align="center"><font color="#FFFFFF"><strong>文件名</strong></font></td>
    <td Width="13%" align="center"><font color="#FFFFFF"><strong>文件大小</strong></font></td>
    <td Width="23%" align="center"><font color="#FFFFFF"><strong>上传日期</strong></font></td>
    <td Width="7%" align="center"><font color="#FFFFFF"><strong>操作</strong></font></td>
  </tr>
<%
	On Error Resume Next
    Set objFSO=Server.CreateObject(FsoString)
	If Err.Number=-2147221005 Then 
	    Response.Write "<Tr><Td Colspan=5 Class=Tablebody1 align='center'>非常遗憾,您的主机不支持FSO("&FsoString&"),不能使用该功能</Td></Tr>"
	    Err.Clear
	    Response.End
	End If
    If Request("FileName")<>"" Then
        If objFSO.Fileexists(Server.Mappath(""&Uploadpath&"\"&Request("FileName"))) Then
            objFSO.Deletefile(Server.Mappath(""&Uploadpath&"\"&Request("FileName")))
        Else
            Response.Write "未找到：<U><Font Color=Red>"&Uploadpath&"/"&Request("FileName")&"</Font></U>"
        End If
    End If
    Set Folder=objFSO.Getfolder(Server.Mappath(Uploadpath))
    If Err.Number<>0 Then
    Response.Write "<Tr><Td Colspan=5 Class=Tablebody1>"&Err.Description&"</Td></Tr>"
    Response.End
    End If
    Set Num=Folder.Files

    FileCount=num.count
    pagecount=int(FileCount/PageSize)

    Page=Request.QueryString("Page")
    If Page="" Or Page<1 Then 
       Page=1
    Else
       Page=Cint(Page)
    End If 

	If FileCount Mod PageSize=0 Then
	    PageCount= FileCount \ Cint(PageSize)
	Else
	    PageCount= FileCount \ Cint(PageSize)+1
  	End If

  	i=0
  	Dim CSS
  	For Each FileName In folder.files
  	  	i=i+1
  	  	If i>(Page-1)*PageSize And i<=Page*PageSize Then 
		    If i Mod 2=0 then 
  	  	  	  	Css="table_row_1"
  	  	  	Else
  	  	  	  	Css="table_row_2"
  	  	  	End If
%>
  <tr bgcolor='#EBF2F9' class="<%=css%>"> 
    <td height=25 align=center><%=procGetFormat(FileName.name)%></td>
    <td height=25><%="<a href="&uploadpath&"/"&FileName.name&" target=_blank>"&FileName.name&"</a>"%></td>
    <td height=25 align=center><%=FormatNumber(FileName.size/1024,2)%> K</td>
    <td height=25 align=center><%=FileName.datecreated%></td>
    <td height=25 align=center><%="<a href="&uploadpath&"/"&FileName.name&" target=_blank>"&"下载"&"</a>"%></td>
  </tr>
<%
  	  	ElseIf i>Page*PageSize Then Exit For
  	  	End If
  	Next
%>
  <tr bgcolor='#EBF2F9'> 
    <td height=25 colspan="5" class="table_row_1"> 
<%Response.Write "共计：<b><font color=#FF0000>"&FormatNumber(folder.size/1024/1024,2)&"</font></b> M"%></td>
  </tr>
  <tr bgcolor='#D7E4F7'> 
    <td height=25 colspan="5"> 
<%Response.Write ShowPage(PageCount,FileCount,Page,PageSize,"?Path="&uploadpath&"&")%></td>
  </tr>
</table>
<%
    Set objFSO=Nothing
    Set Folder=Nothing
End Sub

Function Procgetformat(Sname)
    Dim I,Str
    Procgetformat=0
    If Instrrev(Sname,".")=0 Then Exit Function
    Str=Lcase(Mid(Sname,Instrrev(Sname,".")+1))
    For I=0 To Ubound(Sfor,1)
        If Str=Sfor(I,0) Then 
            Procgetformat=Sfor(I,1)
            Exit For
        End If
    Next
End Function
%>
</BODY>
</HTML>
