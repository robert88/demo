<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" > 
</head>
<!--
-->
<%
Dim Conn,ConnStr
On error resume next
Set Conn=Server.CreateObject("Adodb.Connection")
ConnStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("../accessDB/#srdb.mdb")
conn.ConnectionTimeout = 10           '�������ӳ�ʱ   �����趨���ӳ�ʱΪ10��
Conn.open ConnStr
if error then
   error.clear
   Set Conn = Nothing
   Response.Write "ϵͳ�������ݿ����ӳ���!"
   Response.End
end if

sub CloseConn()
	conn.close
	set conn=Nothing
	end sub
	
	Const SysRootDir = "/xuanti/"                       'ϵͳ���е�Ŀ¼,�������/
	Const SiteDataPath = "../accessDB/#srdb.mdb"            '��վ�����·��,��ע������Ŀ¼
	Const SiteDataBakPath = "../accessDB/#Bak_srdb.mdb"     '��վ���ݿ�·��,��ע������Ŀ¼
%>