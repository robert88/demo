<%
'�ж��Ƿ��¼���¼��ʱ===============================================================
dim AdminAction
AdminAction=request.QueryString("AdminAction")
select case AdminAction
  case "Out"
    call OutLogin()
  case else
    call Login()
end select
'========
sub Login()
  if session("u_type")<>3 or session("user_name")="" or session("user_no")="" or session("MemLogin")<>"Succeed" then
 Response.Addheader "Content-Type","text/html; charset=gb2312" 
     response.write "����û�е�¼���¼�ѳ�ʱ����<a href='../login/index.asp' target='_parent'><font color='red'>���ص�¼</font></a>!"
     response.end
  end if
end sub
'========
sub OutLogin()
  session.contents.remove "u_type"
  session.contents.remove "user_name"
  session.contents.remove "MemLogin"
  response.write "<script language=javascript>top.location.replace('../login/index.asp');</script>"
end sub
%>