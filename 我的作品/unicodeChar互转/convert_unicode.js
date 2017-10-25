/*global config*/
	var test=0;//test disenable
//test=1;//test enable
var count=0;//timer
/*-----------------------------------------------------------------------------------------------*/
//字符转换为unicode入口程序
/*-----------------------------------------------------------------------------------------------*/
/*convert string to unicode*/
function strConvert(strobj,tableEnable)
{
	var startTime=setTimeout("timerShow()",10);
														if(test){alert("欢迎进入字符转换为unicode程序调试");}
		/*清空之前的*/
			AMP_gobj_hide_all();
			getId("charOutput").style.display="block";
			obj=getId(strobj);//获得字符
														if(test){alert('当前单击的输入框为：'+obj);}
	/*检验转换字符少于1个字符*/
	if(obj.value){
	var txtIn=getId("charInput").value;
			}else{
			alert("请输入要转换的字符。");
			return 0;
			}			
														if(test){alert('输入框中要转换的字符：'+'要转换'+txtIn.length+'个字符');}
/*检验转换字符不超过100个字符*/
	if(txtIn.length>100){
			alert("输入的字符数超过100个");
			getId("charInput").value="";
			getId("uincodeOutput").innerHTML="";
			getId("charInput").focus();
			alert("输入的字符数超过100个");
			return 0;
			}
			
	var txtOut="";//bug:if txtOut is not assignment ,the first string of txtout will show undefined
	var optionIndex=getId("selectScale").selectedIndex;
	var scaleNum=getId("selectScale").options[optionIndex].value;
	var asciiConvert;
	for(i=0;i<txtIn.length;i++)
	{
				asciiConvert=charToUnicode(txtIn,i,scaleNum);//字符转换为unicode										
				if(asciiConvert==0)
				{
							alert("ACSII转码出错");
				}
														if(test){	alert('已转换的所有字符编码：'+asciiConvert);}	
				txtOut +=asciiConvert+" ";
	}
														if(test){	alert('已转换的所有字符编码：'+txtOut);}	
	showResult(txtOut,scaleNum);//显示在textarea输入框中													
	if(1==tableEnable){									
		showResultTable(txtIn,scaleNum);//表格形式显示
	}
	//clearTimeout(startTime);
}
/*-----------------------------------------------------------------------------------------------*/
//隐藏所有之前产生的div
/*-----------------------------------------------------------------------------------------------*/
/*acquire id element*/
function AMP_gobj_hide_all(){
	getId("unicodeOutTable").style.display="none";
	getId("charOutput").style.display="none";
	getId("charOut").style.display="none";
	getId("charOutput").style.display="none";
	}
/*-----------------------------------------------------------------------------------------------*/
//获得元素对象的id
/*-----------------------------------------------------------------------------------------------*/
/*acquire id element*/
function getId(obj)
{
	return document.getElementById(obj)||obj;//当获取id失败后直接返回obj。
}
/*-----------------------------------------------------------------------------------------------*/
//字符转换unicode算法
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
//显示已转化的unicode（一）
/*-----------------------------------------------------------------------------------------------*/
/*show uinicode in textarea*/
function showResult(txtOut,scaleNum)
{
														if(test){alert('showunicode progress entry');}
	if(!txtOut){
		alert(' txtOut is not exist');
		return 0;
	}
	var outputTitle=scaleNum+'进制的unicode';
														if(test){alert('输出编码方式标题为:'+outputTitle);}
	getId("unicodeOut").style.display="block";
	getId("unicodeOutputTitle").innerHTML=outputTitle;
	getId("unicodeOutput").value=txtOut;
}
/*-----------------------------------------------------------------------------------------------*/
//显示已转化的unicode（二）
/*-----------------------------------------------------------------------------------------------*/
/*show unicode in table*/
function showResultTable(txtIn,scaleNum)
{
			getId("unicodeOutTable").style.display="block";
			var tableCode="<table><tr><td>序号</td><td>要转换的字符</td><td>"+scaleNum+"进制编码</td></tr>";
			var oneStringEncode;
			var parseCode;
			for(i=0;i<txtIn.length;i++){
			tableCode +="<tr><td>"+i+"</td><td  class='tableTr'>"+txtIn.charAt(i)+"</td><td><input type='text' style='border:0px;' value='"+	charToUnicode(txtIn,i,scaleNum)+"'></td></tr>";
		}
			tableCode +="</table>";
			getId("unicodeTable").innerHTML=tableCode;
}
/*-----------------------------------------------------------------------------------------------*/
//unicode转换为字符的入口程序
/*-----------------------------------------------------------------------------------------------*/
/*A Unicode Convert To string*/
function unicodeConvert()
{
															if(test){alert("unicode convert progress entry");}
	/*清空之前的*/
			getId("unicodeOut").style.display="none";
			getId("unicodeOutTable").style.display="none";
			getId("charOutput").style.display="none";
			
	/*检验输入是否为空*/
	if(getId("unicodeInput").value){
	var txtIn=getId("unicodeInput").value;
			}else{
			alert("请输入要转换的unicode。");
			return 0;
			}
			var oneUnicodeNum="";
			var unicodeInt="";
			var unicodeNum="";
			var unicodeNumCount=0;
			var unicodeOneNum="";
/*过滤数字*/
			for(i=0;i<txtIn.length+1;i++)
			{
					oneUnicodeNum=txtIn.charCodeAt(i).toString(16).toUpperCase();
					unicodeInt=parseInt(oneUnicodeNum,16);
					if((unicodeInt<=0x39 && unicodeInt>=0x30)||(unicodeInt<=0x46 && unicodeInt>=0x41)){//0~9的unicode为0x0030~0x39 A~F的unicode为0X0041~0X0046
						unicodeNumCount++;
													//alert("i="+i+" is o");//test
						unicodeOneNum +=txtIn.charAt(i);
						}else if(unicodeNumCount==4){//之前不是一个4位的unicode数或者之前为
							unicodeNum +=unicodeOneNum;
							unicodeNumCount=0;
							unicodeOneNum="";//bug if not set 0 that will add agin and agin
													//alert("i="+i+" is 4 o");//test
							}else{//之前产生了4位unicode
							unicodeOneNum="";
							unicodeNumCount=0;	
													//alert("i="+i+" is not o");//test
								}
			}	
																			if(test){alert('unicode数字过滤为'+unicodeNum);}	
/*检验转换unicode为完整4为16进制而不超过80个组合数字*/
			if((!unicodeNum.length)||(unicodeNum.length>80)){
				if(!unicodeNum.length){
					alert("输入4位的16进制unicode");
				}
				if(unicodeNum.length>80){
					alert("输入的字符数超过20个unicode");
				}
			getId("unicodeInput").value="";
			getId("charOutput").innerHTML="";
			getId("unicodeInput").focus();
			return 0;
				}		
																		//	if(test){alert('输入框中要转换的字符：'+'要转换'+unicodeNum.length/4+'个unicode');}
			var	oneStringEncode;
			var convertedChar="";
			var j=0;
			for(i=0;i<unicodeNum.length/4;i++){
				oneStringEncode=unicodeNum.slice(j,j+4);
				j +=4;
					 																		//			if(test){alert('单个unicode拆选	'+oneStringEncode);}
	 			convertedChar +=unicodeToChar(oneStringEncode);
	 		}

	 	showChar(convertedChar);
}
/*-----------------------------------------------------------------------------------------------*/
//unicode转换为字符算法
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
//显示unicode转化的字符
/*-----------------------------------------------------------------------------------------------*/
/*char show in the charoutput */
function showChar(convertedChar){
	
															if(test){alert('showchar progress entry');}
	if(!convertedChar){
		alert(' 没有显示的字符');
		return 0;
	}
		getId("charOut").style.display="block";
		getId("charOutput").style.display="block";
		getId("charOutput").value=convertedChar;
	
	
	}
/*获得系统时间*/
function rtc_get_time(){
var rtcTime= new Date();
var rtcYear = date.getFullYear(); 
var rtcMonth = date.getMonth()+1;//取月的时候取的是当前月-1如果想取当前月+1就可以了
var rtcDate =date.getDate();
var rtcHours = date.getHours();
var rtcMin = date.getMinutes();
var rtcSec = date.getSeconds();
var rtcMillSec=getMilliseconds();  
//div的html是now这个字符串; //设置过1000毫秒就是1秒，调用show方法}
	}
function timerShow(){
	var rtcTime= new Date();
	var millSec=rtcTime.getMilliseconds();
	getId("timer").innerHTML=millSec;
	}
/*-----------------------------------------------------------------------------------------------*/
//格式化文本代码
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
//批量修改文件名称入口程序
/*-----------------------------------------------------------------------------------------------*/
/*batch modify file name */
//function batchFileName(){
//	
//															if(test){alert('batchFileName progress entry');}
			/*清空之前转换的unicode*/
//			getId("unicodeOut").style.display="none";
//			getId("unicodeOutTable").style.display="none";
//			/*清空之前转换的字符*/
//			getId("charOutput").style.display="none";
//			getId("charOut").style.display="none";
//			var unicodeNameTxt=getId("unicodeName").value;
//			var fileNameVar=getId("objFolder").value;
//			if(!fileNameVar){
//				alert(' 没有文件');
//				return 0;
//			}
//			if(!unicodeNameTxt){
//				alert("没有输入对应的字");
//				return 0;
//				}
//										if(test){alert('所选目录为：'+fileNameVar);alert('你输入了'+unicodeNameTxt.length+"字");}
//			for(i=fileNameVar.length;i>0;i--){//从最后开始查起来。
//				if(fileNameVar.charAt(i).toString(16)=='\\')//"\\"这里一定要用两个\\
//				break;//此次
//				}
//			if(i==0){
//				alert("没有获取到文件路径");
//				return 0;
//			}
//			var folderNameVar=fileNameVar.slice(0,i+1);//提取目录
//															if(test){alert('所选目录为：i'+i+folderNameVar);}
//		 var fso=new ActiveXObject("Scripting.FileSystemObject");
//		 var folderObj=fso.GetFolder(folderNameVar);//提取目录对象
//		 var f= new Enumerator(folderObj.files);//提取目录下的文件对象集合
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
//			 												if(test){alert("源文件文件"+i+"名为"+files[i]);}
//					if(fso.DriverExists(edrv)){
//						eobj= fso.GetDrive(edrv);
//						unicodeFolder=fso.FolderExists(eobj.RootFolder+"//unicode");
//						if(unicodeFolder){
//								unicodeFolderCreate=fso.CreateFolder(eobj.RootFolder+"//unicode");
//					}
//						expendedName +=fso.GetExtensionName(files[i]);
//						unicodeName[i]=eobj.RootFolder+"//unicode/"+unicodeName[i]+expendedName;
//								 							if(test){alert("更改为文件"+i+"名为"+unicodeName[i]);}
//						copyFILE=fso.CopyFile(files[i],unicodeName[i],true);
//								//unicodeChar=
//					}else{
//						alert("您的系统中没有e盘。");
//					}			
//			 		i++;
//		 	}
		//	var fileNameOut="";
		//fileNameOut=getId("objFolder").value;
		//	fileNameVar=fso.GetFileName(fileOriginalName);
		//}