/*global config*/
	var test=0;//test disenable
//test=1;//test enable
var count=0;//timer
/*-----------------------------------------------------------------------------------------------*/
//�ַ�ת��Ϊunicode��ڳ���
/*-----------------------------------------------------------------------------------------------*/
/*convert string to unicode*/
function strConvert(strobj,tableEnable)
{
	var startTime=setTimeout("timerShow()",10);
														if(test){alert("��ӭ�����ַ�ת��Ϊunicode�������");}
		/*���֮ǰ��*/
			AMP_gobj_hide_all();
			getId("charOutput").style.display="block";
			obj=getId(strobj);//����ַ�
														if(test){alert('��ǰ�����������Ϊ��'+obj);}
	/*����ת���ַ�����1���ַ�*/
	if(obj.value){
	var txtIn=getId("charInput").value;
			}else{
			alert("������Ҫת�����ַ���");
			return 0;
			}			
														if(test){alert('�������Ҫת�����ַ���'+'Ҫת��'+txtIn.length+'���ַ�');}
/*����ת���ַ�������100���ַ�*/
	if(txtIn.length>100){
			alert("������ַ�������100��");
			getId("charInput").value="";
			getId("uincodeOutput").innerHTML="";
			getId("charInput").focus();
			alert("������ַ�������100��");
			return 0;
			}
			
	var txtOut="";//bug:if txtOut is not assignment ,the first string of txtout will show undefined
	var optionIndex=getId("selectScale").selectedIndex;
	var scaleNum=getId("selectScale").options[optionIndex].value;
	var asciiConvert;
	for(i=0;i<txtIn.length;i++)
	{
				asciiConvert=charToUnicode(txtIn,i,scaleNum);//�ַ�ת��Ϊunicode										
				if(asciiConvert==0)
				{
							alert("ACSIIת�����");
				}
														if(test){	alert('��ת���������ַ����룺'+asciiConvert);}	
				txtOut +=asciiConvert+" ";
	}
														if(test){	alert('��ת���������ַ����룺'+txtOut);}	
	showResult(txtOut,scaleNum);//��ʾ��textarea�������													
	if(1==tableEnable){									
		showResultTable(txtIn,scaleNum);//�����ʽ��ʾ
	}
	//clearTimeout(startTime);
}
/*-----------------------------------------------------------------------------------------------*/
//��������֮ǰ������div
/*-----------------------------------------------------------------------------------------------*/
/*acquire id element*/
function AMP_gobj_hide_all(){
	getId("unicodeOutTable").style.display="none";
	getId("charOutput").style.display="none";
	getId("charOut").style.display="none";
	getId("charOutput").style.display="none";
	}
/*-----------------------------------------------------------------------------------------------*/
//���Ԫ�ض����id
/*-----------------------------------------------------------------------------------------------*/
/*acquire id element*/
function getId(obj)
{
	return document.getElementById(obj)||obj;//����ȡidʧ�ܺ�ֱ�ӷ���obj��
}
/*-----------------------------------------------------------------------------------------------*/
//�ַ�ת��unicode�㷨
/*-----------------------------------------------------------------------------------------------*/
/*A char Convert To Unicode*/
function charToUnicode(txtIn,i,scaleNum)
{
		var oneStringEncode;
				oneStringEncode=txtIn.charCodeAt(i).toString(scaleNum);
				if(scaleNum==16){
					if(0<oneStringEncode.length){
							while(oneStringEncode.length<4){
									oneStringEncode ="0"+oneStringEncode;
								}
							return oneStringEncode.toUpperCase();
						}
				return oneStringEncode;
				}
}
/*-----------------------------------------------------------------------------------------------*/
//��ʾ��ת����unicode��һ��
/*-----------------------------------------------------------------------------------------------*/
/*show uinicode in textarea*/
function showResult(txtOut,scaleNum)
{
														if(test){alert('showunicode progress entry');}
	if(!txtOut){
		alert(' txtOut is not exist');
		return 0;
	}
	var outputTitle=scaleNum+'���Ƶ�unicode';
														if(test){alert('������뷽ʽ����Ϊ:'+outputTitle);}
	getId("unicodeOut").style.display="block";
	getId("unicodeOutputTitle").innerHTML=outputTitle;
	getId("unicodeOutput").value=txtOut;
}
/*-----------------------------------------------------------------------------------------------*/
//��ʾ��ת����unicode������
/*-----------------------------------------------------------------------------------------------*/
/*show unicode in table*/
function showResultTable(txtIn,scaleNum)
{
			getId("unicodeOutTable").style.display="block";
			var tableCode="<table><tr><td>���</td><td>Ҫת�����ַ�</td><td>"+scaleNum+"���Ʊ���</td></tr>";
			var oneStringEncode;
			var parseCode;
			for(i=0;i<txtIn.length;i++){
			tableCode +="<tr><td>"+i+"</td><td  class='tableTr'>"+txtIn.charAt(i)+"</td><td><input type='text' style='border:0px;' value='"+	charToUnicode(txtIn,i,scaleNum)+"'></td></tr>";
		}
			tableCode +="</table>";
			getId("unicodeTable").innerHTML=tableCode;
}
/*-----------------------------------------------------------------------------------------------*/
//unicodeת��Ϊ�ַ�����ڳ���
/*-----------------------------------------------------------------------------------------------*/
/*A Unicode Convert To string*/
function unicodeConvert()
{
															if(test){alert("unicode convert progress entry");}
	/*���֮ǰ��*/
			getId("unicodeOut").style.display="none";
			getId("unicodeOutTable").style.display="none";
			getId("charOutput").style.display="none";
			
	/*���������Ƿ�Ϊ��*/
	if(getId("unicodeInput").value){
	var txtIn=getId("unicodeInput").value;
			}else{
			alert("������Ҫת����unicode��");
			return 0;
			}
			var oneUnicodeNum="";
			var unicodeInt="";
			var unicodeNum="";
			var unicodeNumCount=0;
			var unicodeOneNum="";
/*��������*/
			for(i=0;i<txtIn.length+1;i++)
			{
					oneUnicodeNum=txtIn.charCodeAt(i).toString(16).toUpperCase();
					unicodeInt=parseInt(oneUnicodeNum,16);
					if((unicodeInt<=0x39 && unicodeInt>=0x30)||(unicodeInt<=0x46 && unicodeInt>=0x41)){//0~9��unicodeΪ0x0030~0x39 A~F��unicodeΪ0X0041~0X0046
						unicodeNumCount++;
													//alert("i="+i+" is o");//test
						unicodeOneNum +=txtIn.charAt(i);
						}else if(unicodeNumCount==4){//֮ǰ����һ��4λ��unicode������֮ǰΪ
							unicodeNum +=unicodeOneNum;
							unicodeNumCount=0;
							unicodeOneNum="";//bug if not set 0 that will add agin and agin
													//alert("i="+i+" is 4 o");//test
							}else{//֮ǰ������4λunicode
							unicodeOneNum="";
							unicodeNumCount=0;	
													//alert("i="+i+" is not o");//test
								}
			}	
																			if(test){alert('unicode���ֹ���Ϊ'+unicodeNum);}	
/*����ת��unicodeΪ����4Ϊ16���ƶ�������80���������*/
			if((!unicodeNum.length)||(unicodeNum.length>80)){
				if(!unicodeNum.length){
					alert("����4λ��16����unicode");
				}
				if(unicodeNum.length>80){
					alert("������ַ�������20��unicode");
				}
			getId("unicodeInput").value="";
			getId("charOutput").innerHTML="";
			getId("unicodeInput").focus();
			return 0;
				}		
																		//	if(test){alert('�������Ҫת�����ַ���'+'Ҫת��'+unicodeNum.length/4+'��unicode');}
			var	oneStringEncode;
			var convertedChar="";
			var j=0;
			for(i=0;i<unicodeNum.length/4;i++){
				oneStringEncode=unicodeNum.slice(j,j+4);
				j +=4;
					 																		//			if(test){alert('����unicode��ѡ	'+oneStringEncode);}
	 			convertedChar +=unicodeToChar(oneStringEncode);
	 		}

	 	showChar(convertedChar);
}
/*-----------------------------------------------------------------------------------------------*/
//unicodeת��Ϊ�ַ��㷨
/*-----------------------------------------------------------------------------------------------*/
/*A char Unicode Convert To string*/
function unicodeToChar(unicodeNum)
{		
	var oneStringEncode;
			oneStringEncode="%u"+unicodeNum;
			oneStringEncode=unescape(oneStringEncode);
			return oneStringEncode+" ";
}
/*-----------------------------------------------------------------------------------------------*/
//��ʾunicodeת�����ַ�
/*-----------------------------------------------------------------------------------------------*/
/*char show in the charoutput */
function showChar(convertedChar){
	
															if(test){alert('showchar progress entry');}
	if(!convertedChar){
		alert(' û����ʾ���ַ�');
		return 0;
	}
		getId("charOut").style.display="block";
		getId("charOutput").style.display="block";
		getId("charOutput").value=convertedChar;
	
	
	}
/*���ϵͳʱ��*/
function rtc_get_time(){
var rtcTime= new Date();
var rtcYear = date.getFullYear(); 
var rtcMonth = date.getMonth()+1;//ȡ�µ�ʱ��ȡ���ǵ�ǰ��-1�����ȡ��ǰ��+1�Ϳ�����
var rtcDate =date.getDate();
var rtcHours = date.getHours();
var rtcMin = date.getMinutes();
var rtcSec = date.getSeconds();
var rtcMillSec=getMilliseconds();  
//div��html��now����ַ���; //���ù�1000�������1�룬����show����}
	}
function timerShow(){
	var rtcTime= new Date();
	var millSec=rtcTime.getMilliseconds();
	getId("timer").innerHTML=millSec;
	}
/*-----------------------------------------------------------------------------------------------*/
//��ʽ���ı�����
/*-----------------------------------------------------------------------------------------------*/	

/*
ie: /MSIE/i.test(navigator.userAgent),
ie6: /MSIE 6/i.test(navigator.userAgent),
ie7: /MSIE 7/i.test(navigator.userAgent),
ie8: /MSIE 8/i.test(navigator.userAgent),
firefox: /Firefox/i.test(navigator.userAgent),
opera: /Opera/i.test(navigator.userAgent),
webkit: /Webkit/i.test(navigator.userAgent),
*/

/*


*/
	
/*-----------------------------------------------------------------------------------------------*/
//�����޸��ļ�������ڳ���
/*-----------------------------------------------------------------------------------------------*/
/*batch modify file name */
//function batchFileName(){
//	
//															if(test){alert('batchFileName progress entry');}
			/*���֮ǰת����unicode*/
//			getId("unicodeOut").style.display="none";
//			getId("unicodeOutTable").style.display="none";
//			/*���֮ǰת�����ַ�*/
//			getId("charOutput").style.display="none";
//			getId("charOut").style.display="none";
//			var unicodeNameTxt=getId("unicodeName").value;
//			var fileNameVar=getId("objFolder").value;
//			if(!fileNameVar){
//				alert(' û���ļ�');
//				return 0;
//			}
//			if(!unicodeNameTxt){
//				alert("û�������Ӧ����");
//				return 0;
//				}
//										if(test){alert('��ѡĿ¼Ϊ��'+fileNameVar);alert('��������'+unicodeNameTxt.length+"��");}
//			for(i=fileNameVar.length;i>0;i--){//�����ʼ��������
//				if(fileNameVar.charAt(i).toString(16)=='\\')//"\\"����һ��Ҫ������\\
//				break;//�˴�
//				}
//			if(i==0){
//				alert("û�л�ȡ���ļ�·��");
//				return 0;
//			}
//			var folderNameVar=fileNameVar.slice(0,i+1);//��ȡĿ¼
//															if(test){alert('��ѡĿ¼Ϊ��i'+i+folderNameVar);}
//		 var fso=new ActiveXObject("Scripting.FileSystemObject");
//		 var folderObj=fso.GetFolder(folderNameVar);//��ȡĿ¼����
//		 var f= new Enumerator(folderObj.files);//��ȡĿ¼�µ��ļ����󼯺�
//		 var files =[];
//		 var i=0;
//		 var edrv="e:"
//		 var unicodeFolder;
//		 var eobj;
//		 var unicodeFolderCreate;
//		 var unicodeChar="";
//		 var copyFILE;
//		 var expendedName="";
//		 var unicodeName =[];
//		 for(;!f.atEnd();f.moveNext()){
//			 		files[i]= f.item();
//			 												if(test){alert("Դ�ļ��ļ�"+i+"��Ϊ"+files[i]);}
//					if(fso.DriverExists(edrv)){
//						eobj= fso.GetDrive(edrv);
//						unicodeFolder=fso.FolderExists(eobj.RootFolder+"//unicode");
//						if(unicodeFolder){
//								unicodeFolderCreate=fso.CreateFolder(eobj.RootFolder+"//unicode");
//					}
//						expendedName +=fso.GetExtensionName(files[i]);
//						unicodeName[i]=eobj.RootFolder+"//unicode/"+unicodeName[i]+expendedName;
//								 							if(test){alert("����Ϊ�ļ�"+i+"��Ϊ"+unicodeName[i]);}
//						copyFILE=fso.CopyFile(files[i],unicodeName[i],true);
//								//unicodeChar=
//					}else{
//						alert("����ϵͳ��û��e�̡�");
//					}			
//			 		i++;
//		 	}
		//	var fileNameOut="";
		//fileNameOut=getId("objFolder").value;
		//	fileNameVar=fso.GetFileName(fileOriginalName);
		//}