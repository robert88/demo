/**********************************************************************************
*********              author��YINMING                               **************
*********              qq��1141101846                               **************
*********        corporation��������巵�������޹�˾                 **************
***********************************************************************************/
var test=0;
//test=1;
/*-----------------------------------------------------------------------------------------------*/
//���Ԫ�ض����id
/*-----------------------------------------------------------------------------------------------*/
/*acquire id element*/

function getId(obj)
{
	return document.getElementById(obj)||obj;//����ȡidʧ�ܺ�ֱ�ӷ���obj��
}



/*-----------------------------------------------------------------------------------------------*/
//��ʾ����ֹԪ�ض���
/*-----------------------------------------------------------------------------------------------*/
/*show element*/


function showSet(){
getId("videoResDefault").style.display="block";
getId("photoSizeDefault").style.display="block";
getId("aeDefault").style.display="block";
getId("timeDefault").style.display="block";
//getId("systemTime").style.display="block";
//getId("submit").style.display="block";
}


/*-----------------------------------------------------------------------------------------------*/
//���ϵͳʱ��
/*-----------------------------------------------------------------------------------------------*/
/*get system time*/


function userGetTime(on)
{
	var today = new Date();
	var sysTime = getId("systemTime").value;
	var year = today.getFullYear();
  var month = today.getMonth()+1;
  var mDay = today.getDate();
  var mHours = today.getHours();
  var mMins = today.getMinutes();
  year = year.toString(10);
    if(0<=month&&month<=9){
    	month = month.toString(10);
  	month ="0"+month;
  	}
  if(0<=mDay&&mDay<=9){
  	  mDay = mDay.toString(10);
  	mDay ="0"+mDay;
  	}
  if(0<=mHours&&mHours<=9){
  	  mHours = mHours.toString(10);
  	mHours = "0"+mHours;
  	}
  if(0<=mMins&&mMins<=9){
 mMins = mMins.toString(10);
  	mMins ="0"+mMins;
  	}
  	if(on==2){
  alert("����ϵͳʱ��Ϊ:"+year+"��"+month+"��"+mDay+"��"+mHours+"ʱ"+mMins+"��");
	}
  sysTime = year+month+mDay+mHours+mMins; 
  getId("systemTime").value  = sysTime;
  return sysTime;
}

/*-----------------------------------------------------------------------------------------------*/
//���������ļ���default.txt
/*-----------------------------------------------------------------------------------------------*/
/*generate default.ini*/
function config()
{
	var video_res=getId("videoRes").options.value;
	var photo_size=getId("photoSize").options.value;
	var ae_bias=getId("ae").options.value;
	var systemTime=userGetTime(1);
	var yearMonth=systemTime.slice(0,6);
	var dayTime=systemTime.slice(6,12);
	var dayTimeHead=dayTime.slice(0,1);
	if("0"==dayTimeHead){
		dayTime=systemTime.slice(7,12);
		}
																			if(test){alert("video_res:"+video_res+"photo_size:"+photo_size+"ae_bias:"+ae_bias);
																				alert(+"systemTime:"+systemTime+"yearMonth:"+yearMonth+"dayTime:"+dayTime);}
	var fso= new ActiveXObject("Scripting.FileSystemObject");
	var disc="e:";
	if(!fso.DriveExists(disc)){
				comform("����ϵͳ��û��e�̣����������ļ�������c�̲�����");
				disc="c:";
	}
	 var discDrv = fso.GetDrive(disc);
	 var fname= fso.CreateTextFile(discDrv.RootFolder+"//default.txt",true);
				fname.writeline("#");
				fname.writeline("video_res "+video_res);
				fname.writeline("ae_bias "+ae_bias);
				fname.writeline("photo_size "+photo_size);
				fname.writeline("yearMonth "+yearMonth);
				fname.writeline("dayTime "+dayTime);
				fname.writeline("#");
				fname.close();
				var gdrv="g:";
				var hdrv="h:";		
				  if (fso.DriveExists(gdrv)&&fso.DriveExists(hdrv)){  //H��g�̶�����
					       var g = fso.GetDrive(gdrv);
					       var h = fso.GetDrive(hdrv);
					       var FolderDCIMg = fso.FolderExists(g.RootFolder+"//DCIM");
					       var FolderDCIMh = fso.FolderExists(h.RootFolder+"//DCIM");
							       if(FolderDCIMg){
							       		 disc=gdrv;
							       }else if(FolderDCIMh){
							       	 		disc=hdrv;
							       }
					}else if(fso.DriveExists(gdrv)){
						     var g = fso.GetDrive(gdrv);
						     var FolderDCIMg = fso.FolderExists(g.RootFolder+"//DCIM");		
						         if(FolderDCIMg){
							       		disc=gdrv;
					       			}       
					}else if(fso.DriveExists(hdrv)){
						      var h = fso.GetDrive(hdrv);
						     	var FolderDCIMh = fso.FolderExists(h.RootFolder+"//DCIM");		
						       		if(FolderDCIMh){
							       		disc=hdrv;
					       			} 
					}
				discDrv = fso.GetDrive(disc);
				var folderSYS = fso.FolderExists(discDrv.RootFolder+"//sys");
				if(!folderSYS){//����Ƿ���sys�ļ�Ŀ¼
				var dir = fso.CreateFolder(discDrv.RootFolder+"//sys");//û�е�����´���sysĿ¼
				}
				var txtCopy=fso.CopyFile("E://default.txt",discDrv.RootFolder+"//sys/default.txt",true);//���������ļ����ƶ�Ӳ��sysĿ¼��
				if(txtCopy){
				alert("�����ļ�ʧ�ܣ��밴��ʾ������");
				}else{
				alert("����TF�����Ƿ�����sys/default.txt�����ļ�");
				}
				fso.DeleteFile("e://default.txt",true);//ɾ�����ɵ�txt�ļ� 
				
}