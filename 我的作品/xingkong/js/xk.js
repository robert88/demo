var canvas,context,stars,numStars,vx,counter,currentStar,moveX,moveY,currentStar,num,r,sin,cos;

   window.onload = function () {
   	makeNewWindow();
	initStar();

	(function drawFrame () {
		window.requestAnimationFrame(drawFrame, canvas);
		canvas.width=canvas.width;
		stars[currentStar].color = "rgb("+(255*Math.random())+","+(255*Math.random())+","+(255*Math.random())+")";
		currentStar = Math.round(Math.random()*(numStars-1));
		stars.forEach(drawStars);
	}());
	
	setInterval(redrawStar,10);
}
function tace(str){
	$d("msg").innerHTML+="<span style='color:green'>"+str+"</span>";
}
 function initStar(){
 	canvas = document.getElementById('cvs'),
	context = canvas.getContext('2d'),  
	stars = [],
	numStars = 100,
	vx = 0.1,
	counter = 0,
	currentStar = 0,
	moveX = 0, 
	moveY = 0;
	num=0;
	currentStar = Math.round(Math.random()*numStars);
	canvas.width=window.innerWidth;
	canvas.height=window.innerHeight;
	moveX = (canvas.width/2);
	moveY = (canvas.height/2);
 	stars.length=0;
	for(i=0; i < numStars; i++){
		var star = new Star(0xffffff);
		star.scaleX = star.scaleY = 0.02;
		star.x = Math.random() * canvas.width / 1.1;
		star.y = Math.random() * canvas.height / 1.1;		
		star.num=0;
		star.coorationX=moveX-star.x;
		star.coorationY=moveY-star.y;
		star.r=Math.sqrt(Math.pow(moveX-star.x,2)+Math.pow(moveY-star.y,2));
		if(star.r>0){
			if(star.coorationX>0&&star.coorationY>=0){
				star.agent=-Math.PI-Math.asin((star.y-moveY)/star.r);
			}else if(star.coorationX>0&&star.coorationY<=0){
				star.agent=Math.PI-Math.asin((star.y-moveY)/star.r);
			}
		}else{
			star.agent=0;
		}
		if(star.agent<0){
			star.agent+=Math.PI*2;
		}
		stars.push(star);
	}
}     

function drawStars(star){
	var weird = Math.random();
	var sin;
	var cos;
	var age;
	age=(star.num*1/180)*Math.PI+star.agent;
	star.num+=0.01;
	star.rotation += 0.025;
	star.scaleX =star.scaleY+=0.000001;
	sin=Math.sin(age);
	cos=Math.cos(age);
		star.x =(moveX-star.r*cos)*star.num;
		star.y =(moveY-star.r*sin)*star.num;
	if(star.x<=0&&star.y<=0){
		star.x=moveX;
		star.y=moveY;
	}
	star.draw(context); 
}

function creatDOMObject(tag,obj){
	var domElement=document.creatElement(tag);
	$d(obj).appendChild(domElement);
}
function $d(obj){
	return document.getElementById(obj);
}
function redrawStar(){
	if(canvas.width!==window.innerWidth){
		canvas.width=window.innerWidth;
		canvas.height=window.innerHeight;
		 initStar();
	}
}
function Star (color) {
  if (color === undefined) { color = "#ffffff"; }
  this.x = 0;
  this.y = 0;
  this.rotation = 0;
  this.r=0;
  this.agent=0;
  this.num=0;
  this.type=0;
  this.cooration=0;
//  this.scaleX = scale;
//  this.scaleY = scale;
  this.color = utils.parseColor(color);
  this.lineWidth = 0;
  
}

Star.prototype.draw = function (context) {
	if( this.type==0){
		context.save();
		context.translate(this.x, this.y);
		context.rotate(this.rotation);
		context.scale(this.scaleX, this.scaleY);
		var p=context.createRadialGradient(0, 0, 0, 0, 0, 100);
		p.addColorStop(0, "#fff");
		p.addColorStop(1,"#000");
		context.lineWidth = this.lineWidth;
		context.fillStyle =p;
		context.beginPath();
		//x, y, radius, start_angle, end_angle, anti-clockwise
		context.arc(0, 0, 80, 0, (Math.PI * 2), true);

		context.strokeStyle= this.color;
		context.closePath();
		context.fill();
		if (this.lineWidth > 0) {
		context.stroke();
		}
		context.restore();
	}
};






















		var newWindow;
		var newnum=0;
	
	function makeNewWindow(){
		newWindow = window.open("","","status,height=700,width=500,scrollbars=yes");
		newnum++
	}
	
	function checkNewWindow(){
		// 测试调试窗口是否存在
		if((!newWindow)||(newWindow.closed)){
			if(newnum<=2){
				makeNewWindow();
				var newContent = "<html><head><title>WEB UART</title>";
				newContent +="<style type='text/css'>body{margin:0;padding:0;font-size:12px;background:#ddd}</style></head>";
				newContent += "<body><h1>WEB UART</h1></body></html>";

				newWindow.document.write(newContent);
			}
		}
	}
	
	function printk(info){
		//checkNewWindow();
		newWindow.document.write("<br\>"+info);
		//newWindow.focus();
		newWindow.scrollTo(0,99999999);
	}
	function printk_co(param0,info){
		checkNewWindow();
		newWindow.document.write("<p style='color:"+param0+";'>"+info+"</p>");
		newWindow.scrollTo(0,99999999);
	}

