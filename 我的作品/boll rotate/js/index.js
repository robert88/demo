
var cvs,c;
var x,y;
var r1,r2,r3;
var tangle=0;
var tangleDown=0;
var speed=1;
var f1,f2,f3;
var curX, curY, xold, yold, xdiff, ydiff;
var mouseAgent=0,debounce=0,count=1;

var allow=0;
var dir = Array();
dir[0] = "n-resize";//up
dir[1]="ne-resize";//right up
dir[2]="e-resize";//right
dir[3]="se-resize";//right down
dir[4] = "s-resize";//down
dir[5]="sw-resize";//left down
dir[6]="w-resize";//left
dir[7]="nw-resize";//left up
var dragging=0;
var mouseX,mouseY;
var domDown=0;
window.onload=function(){
	init();
	makeNewWindow();
}
	/**  
		author:robert  
		date:2013-08-13  
		description:	init global var   
**/ 
	function init(){
		this.cvs=document.getElementById("cvs");
		this.c=cvs.getContext("2d");
		initAgent(40,80,80,160,160,160);
		dragHandler();
		//setInterval(dragHandler,20);
	}
	/**  
		author:robert  
		date:2013-08-13  
		description: init shape
**/ 
	function initAgent(x0,y0,x1,y1,x2,y2){

	/*traigle side*/
		var a0=Math.sqrt(Math.pow(x2-x1,2)+Math.pow(y2-y1,2));
		var a1=Math.sqrt(Math.pow(x0-x2,2)+Math.pow(y0-y2,2));
		var a2=Math.sqrt(Math.pow(x0-x1,2)+Math.pow(y0-y1,2));
	/*rotate circle*/
		x=(a0*x0+a1*x1+a2*x2)/(a0+a1+a2);
		y=(a0*y0+a1*y1+a2*y2)/(a0+a1+a2);
	/*Turning radius */
		r1=Math.sqrt(Math.pow(x-x0,2)+Math.pow(y-y0,2));
		r2=Math.sqrt(Math.pow(x-x1,2)+Math.pow(y-y1,2));
		r3=Math.sqrt(Math.pow(x-x2,2)+Math.pow(y-y2,2));
	/*angle of rotation*/
		f1=Math.atan((x-x0)/(y-y0));
		f2=Math.atan((x-x1)/(y-y1));
		f3=Math.atan((x-x2)/(y-y2));
	/*init trigger event*/
		for(var i=0;i<4;i++){
			newOnmouseDown($d("ag"+i))
			newOnmouseMove($d("ag"+i))
			newOnmouseUp($d("ag"+i))
		}
	}
	/**  
		author:robert  
		date:2013-08-13  
		description: handler rotation
**/ 
	function dragHandler(){
		roundDraw(40,80,80,160,160,160);
	}
	/**  
		author:robert  
		date:2013-08-13  
		description: rotation 
**/
	function roundDraw(x0,y0,x1,y1,x2,y2){
	/*change angle*/
		if(mouseAgent!=1){
			if((mouseAgent==6||mouseAgent==4||mouseAgent==2) ){
				tangle += (speed*1/180)*Math.PI;
			}
			/*change angle three pointer*/
				x0=x-r1*Math.cos(tangle+f1+Math.PI);
				y0=y-r1*Math.sin(tangle+f1+Math.PI);	
				x1=x -r2*Math.cos(tangle+f2);
				y1=y -r2*Math.sin(tangle+f2);
				x2=x-r3*Math.cos(tangle+f3);
				y2=y -r3*Math.sin(tangle+f3);
			/*follow angle*/
				followAgl(x0,y0,x1,y1,x2,y2,x,y);
			/*start rotate*/
				rotating(x0,y0,x1,y1,x2,y2);
		}
		mouseAgent=1;
	}
	/**  
		author:robert  
		date:2013-08-13  
		description: DOM object rilative to coordirate
**/
	function followAgl(){
	var len=followAgl.arguments.length;
	var width,heigth;
		if(len&&(!(len&0x1))){
			for(var i=0;i<len;i+=2){
				width=trimPX($d("ag"+i/2).style.width)/2;
				heigth=trimPX($d("ag"+i/2).style.height)/2;
				$d("ag"+i/2).style.left=(arguments[i]+cvs.offsetLeft*1-width)+"px";
				$d("ag"+i/2).style.top=(arguments[i+1]+cvs.offsetTop*1-heigth)+"px";
			}
		}
	}
	
	/**  
		author:robert  
		date:2013-08-13  
		description: rotation draw
**/
	function rotating(x0,y0,x1,y1,x2,y2){
		cvs.width=cvs.width;
		c.beginPath();
		c.moveTo(x0,y0);
		c.lineTo(x1,y1);
		c.lineTo(x2,y2);
		c.closePath();
		c.lineWidth=2;
		c.strokeStyle = "#9e1";
		c.stroke();
		c.fillStyle = "#f77";
		c.fill();
		c.save();
	/*rotate circle pointer*/
		c.beginPath();
		c.arc(x,y,2,0,2*Math.PI,true);
		c.fillStyle="#f0f";
		c.fill();

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
	/**  
		author:robert  
		date:2013-08-13  
		description: mouse move
**/
	function FindXY(e) {
		curX = (document.layers) ? e.pageX : e.clientX;
		curY = (document.layers) ? e.pageY : e.clientY;
		xdiff = curX - xold;
		ydiff = curY - yold
		if ((xdiff <  2) && (ydiff < -2)) mouseAgent=9;//up
		if ((xdiff <  2) && (ydiff >  2)) mouseAgent=2;//down
		if ((xdiff >  2) && (ydiff <  2)) mouseAgent=3;//right
		if ((xdiff < -2) && (ydiff <  2)) mouseAgent=4;//left
		if ((xdiff >  2) && (ydiff >  2)) mouseAgent=5;//right down
		if ((xdiff < -2) && (ydiff >  2)) mouseAgent=6;//left down
		if ((xdiff >  2) && (ydiff < -2)) mouseAgent=7;//right up
		if ((xdiff < -2) && (ydiff < -2)) mouseAgent=8;//left up
		xold = curX;
		yold = curY;
	}
	/**  
		author:robert  
		date:2013-08-13  
		description: change cursor   
**/
	function display(obj,direction) {
		obj.style.cursor = dir[direction];
	}
	/**  
		author:robert  
		date:2013-08-13  
		description: get DOM object
**/	
	 function $d(id) {  
        return document.getElementById(id);  
    }
	/**  
		author:robert  
		date:2013-08-13  
		description: object mouse down
**/	
	 function newOnmouseDown(obj) {  
         obj.addEventListener("mousedown", // start moving image  
            function (event) {  
				mouseX=event.pageX||event.clientX;		
				mouseY=event.pageY||event.clientY;
				if (hitInRect(mouseX, mouseY,obj)) {  
					if(dragging== 0){
						dragging=1;
					}  else if(dragging==1){
						dragging=2;
					}else{
						dragging=0;
					}
					event.preventDefault(); // disable default behavior of browser  
				}  
            },  
            false  
          ); 
    }
		/**  
		author:robert  
		date:2013-08-13  
		description: all object mouse down
**/	

         document.addEventListener("mousedown", // start moving image  
            function (event) {  
					if(dragging){
						domDown=1;
					}
					printk("down"+domDown)
					event.preventDefault(); // disable default behavior of browser  
            },  
            false  
          ); 

	/**  
		author:robert  
		date:2013-08-13  
		description:all mouse move
**/	

	 function newOnmouseMove(obj) {      
		document.addEventListener("mousemove", // moving image  
			function (event) {  
				if(dragging==1){ 
					printk("move "+domDown+"turn:"+debounce+"s"+(4*count)+"dragging"+dragging)
					if((debounce==4*count)&&domDown){
						FindXY(event);  
						count++;
						dragHandler();
					}
					debounce++;
					if(debounce>4*count){
						debounce=4*(count-1);
					}
					
				}else if(dragging==2){
					x=(event.pageX||event.clientX)-cvs.offsetLeft;		
					y=(event.pageY||event.clientY) -cvs.offsetTop;
					dragHandler();
					mouseAgent=0;
				}else{
					mouseAgent=0;
					debounce=0;
					count=1;
				}
				event.preventDefault();  
			},  
			false  
		);  
    }
	/**  
		author:robert  
		date:2013-08-13  
		description: mouse up
**/	
	 function newOnmouseUp(obj) {  
		document.addEventListener("mouseup", // stop moving image  
		function (event) {  
			//dragging = false; 
			domDown=0;
			printk("up"+domDown)
			obj.style.cursor="default";            
			event.preventDefault();  
			
		},  
		false  
		); 
    }
	/**  
		author:robert  
		date:2013-08-13  
		description: clear Px string
**/
	function trimPX (_px) {  
		if(_px==null || _px=="")  
			return 0;  
		return parseInt(_px.substr(0, _px.lastIndexOf("px")));  
	}
	/**  
		author:robert  
		date:2013-08-13  
		description: check touch
**/
	function hitInRect (hitX, hitY, obj) { 
		var rcTop = trimPX(obj.style.top);  
		var rcLeft = trimPX(obj.style.left);  
		var rcWidth = trimPX(obj.style.width);  
		var rcHeight = trimPX(obj.style.height);
		return (hitX>=rcLeft && hitX<rcLeft+rcWidth && hitY>=rcTop && hitY<rcTop+rcHeight);  
	}  

	/**  
		author:robert  
		date:2013-08-13  
		description: check touch
**/
	function ag3over(){
		var i=new Image();
		i.src="../images/rotation.png";
		printk("over"+i.src);
		$d("ag3").style.backgroundImage="url("+i.src+")";
	}

	function ag3out(){
		var i=new Image();
		i.src="../images/rotation.png";
		printk("over"+i.src);
		if(dragging&1){
			$d("ag3").style.backgroundImage="";
		}
	}

	function setSpeed(){
		var val=parseInt($d("textId").value);
		if(val){
			speed=val;
		}else{
			alert("請輸入數字");
		}
	}


	var newWindow;
	
	function makeNewWindow(){
		newWindow = window.open("","","status,height=700,width=500,scrollbars=yes,left=0,top=0");
	}
	
	function checkNewWindow(){
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
	
