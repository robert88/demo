var radian=Math.PI/180;
var cvs,c;
var x,y;
var r1,r2,r3;
var tangle=0;
var speed=1;
var radiam=Math.PI/180;
var f1,f2,f3;
/*鼠标单击入口*/
function drawOnline(obj,e)
{
	
}
/*初始化*/
window.onload=function()
{
	init();
	drawInit();
}
function init(){
	this.cvs=document.getElementById("cvs");
	this.c=cvs.getContext("2d");
	//setInterval(dragHandler,20);
}
function dragDraw(x0,y0,x1,y1,x2,y2){
	tangle += (speed*1/180)*Math.PI;
	
	var x0=r1*(Math.cos(f1)+Math.sin(tangle+f1))+x-40;
	var y0=r1*(Math.sin(f1)-Math.cos(tangle+f1))+y-20;
			
	var x1=x1 -r2*(Math.cos(f2)-Math.cos(tangle+f2));
	var y1=y1 -r2*(Math.sin(f2)-Math.sin(tangle+f2));
	
	var x2=x2-r3*(Math.cos(f3)-Math.cos(tangle+f3));
	var y2=y2 -r3*(Math.sin(f3)-Math.sin(tangle+f3));
	printk("相对坐标x0:"+x0+" y0："+y0+" x1:"+x1+" y1："+y1+" x2:"+x2+" y2:"+y2);
	redraw(x0,y0,x1,y1,x2,y2);
}
function redraw(x0,y0,x1,y1,x2,y2){
	//cvs.width=cvs.width;
	/*c.beginPath();
	c.moveTo(x0,y0);
	c.lineTo(x1,y1);
	c.lineTo(x2,y2);
	//c.closePath();
	c.strokeStyle="#000";
	c.stroke();
	c.fillStyle = "green";
	c.fill();
	c.save();*/
	c.beginPath();
	c.arc(x0,y0,1,0,2*Math.PI,true);

	c.fillStyle="blue";
	c.fill();
	c.beginPath();

	c.arc(x1,y1,1,0,2*Math.PI,true);

	c.fillStyle="red";
	c.fill();
	c.beginPath();

	c.arc(x2,y2,1,0,2*Math.PI,true);
	c.fillStyle="green";
	c.fill();
	
}
function dragHandler(){
	dragDraw(80,80,80,160,160,160);
}
function drawInit(){
	drawAgent(80,80,80,160,160,160);
		dragHandler();
}
function drawAgent(x0,y0,x1,y1,x2,y2){
	c.beginPath();
	c.moveTo(x0,y0);
	c.lineTo(x1,y1);
	c.lineTo(x2,y2);
	//c.closePath();
	c.strokeStyle="#000";
	c.stroke();
	c.fillStyle = "green";
	c.fill();
	c.save();

/*chushihua*/
	var a0=Math.sqrt(Math.pow(x2-x1,2)+Math.pow(y2-y1,2));
	var a1=Math.sqrt(Math.pow(x0-x2,2)+Math.pow(y0-y2,2));
	var a2=Math.sqrt(Math.pow(x0-x1,2)+Math.pow(y0-y1,2));

	x=(a0*x0+a1*x1+a2*x2)/(a0+a1+a2);
	y=(a0*y0+a1*y1+a2*y2)/(a0+a1+a2);
	r1=Math.sqrt(Math.pow(x-x0,2)+Math.pow(y-y0,2));
	r2=Math.sqrt(Math.pow(x-x1,2)+Math.pow(y-y1,2));
	r3=Math.sqrt(Math.pow(x-x2,2)+Math.pow(y-y2,2));
	f1=Math.atan((x-x0)/(y-y0));
	f2=Math.atan((x-x1)/(y-y1));
	f3=Math.atan((x-x2)/(y-y2));
	printk("内心坐标x："+x+" y:"+y);
	printk("三角边长a0:"+a0+" a1:"+a1+" a2:"+a2);
	printk("顶点到内心的距离r1:"+r1+" r2:"+r2+" r3:"+r3);
	c.beginPath();
	c.arc(x,y,1,0,2*Math.PI,true);
	c.fillStyle="#f0f";
	c.fill();

}

















	var newWindow;
	
	function makeNewWindow(){
		newWindow = window.open("","","status,height=700,width=500,scrollbars=yes");
	}
	
	function checkNewWindow(){
		// 测试调试窗口是否存在
		if((!newWindow)||(newWindow.closed)){
			makeNewWindow();
			var newContent = "<html><head><title>WEB UART</title>";
			newContent +="<style type='text/css'>body{margin:0;padding:0;font-size:12px;background:#ddd}</style></head>";
			newContent += "<body><h1>WEB UART</h1></body></html>";

			newWindow.document.write(newContent);
		}
	}
	
	function printk(info){
		checkNewWindow();
		newWindow.document.write("<br\>"+info);
		//newWindow.focus();
		newWindow.scrollTo(0,99999999);
	}
	function printk_co(param0,info){
		checkNewWindow();
		newWindow.document.write("<p style='color:"+param0+";'>"+info+"</p>");
		newWindow.scrollTo(0,99999999);
	}
	window.onbeforeunload=function (){
		newWindow.document.close();
		newWindow.close();
	}