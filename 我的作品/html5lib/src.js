	/**  
		author:robert  
		date:2013-08-13  
		description:	draw line with variable point param0 is context2D laster param is stroke style
**/ 
function draw2Line(){
		var argLen=draw2Line.arguments.length;
		var c=draw2Line.arguments[0];

		if((argLen>=6)&&(argLen/2)){
			c.beginPath();
			c.moveTo(arguments[1],arguments[2]);
			for(var i=3;i<argLen-2;i+=2){
				c.lineTo(arguments[i],arguments[i+1]);
			}
			c.strokeStyle=arguments[argLen-1];
			c.stroke();
		}else{
			alert("Please take at least two points");
		}
}
	/**  
		author:robert  
		date:2013-08-15  
		description:	where can draw  with x,y ,matrix range,space range,row number,column
**/ 
function allowDraw(x,y,StartX,StartY,width,height,spaceX,spaceY,row,col){
	var x0,x1,y0,y1;
	for(var i=0;i<row;i++){
		x0=parseInt(StartX+width*i+spaceX*i);
		x1=parseInt(StartX+width*(1+i)+spaceX*i)
		if(x>x0&&x<x1)break;
		
	}
	for(var j=0;j<col;j++){
		y0=parseInt(StartY+height*j+spaceY*j);
		y1=parseInt(StartY+height*(1+j)+spaceY*j)
		if(y>y0&&y<y1)break;
	}
	if((i==row)||(j==col)){
		return 0;
	}
	return ((i+1)+j*row);
}

	/**  
		author:robert  
		date:2013-08-19 
		description:	get DOM element relative coordinates 
		Iteration offsetParent
**/ 
function getPostion(element) {
            var temp = element,
                top = temp.offsetTop,
                height = temp.offsetHeight,
                left = temp.offsetLeft;
            while (temp = temp.offsetParent) {
                if (temp.style.position === 'absolute' || temp.style.position === 'relative' || (temp.style.overflow != 'visible' && temp.style.overflow != '')) break;
                left += temp.offsetLeft;
                top += temp.offsetTop;
            }
            return [top, left, height];
}
	/**  
		author:robert  
		date:2013-08-23  
		description:	draw star with agent,length,x,y ,context
		Pentagram side length len, x1, h2 is pentagram of the bottom point coordinates deviation and x2, h2 is  pentagram of the upper point deviation value ,c is context2D
**/ 
function drawPentagram(c,x,y,agent,len,color){
	c.beginPath();
	var x1 = len*Math.sin(agent);
	var h1 = len*Math.cos(agent);
	var x2 = len/2;
	var h2 = len/2*Math.tan(agent*2);
	c.lineTo(x+x1,y+h1);
	c.lineTo(x-x2,y+h2);
	c.lineTo(x+x2,y+h2);
	c.lineTo(x-x1,y+h1);
	c.lineTo(x-x1,y+h1);
	c.lineTo(x,y);
	c.closePath();
	c.fillStyle=color;
	c.fill();
}
	/**  
		author:robert  
		date:2013-09-04  
		description:	Mask effect,
		Masking effects, two objects stacked together, 
		the obj param is mask layer.
		speed <1 is slower speed>1 is faster
		flag can control mask play and stop.when no param it will stop.
		deriction contain top bottom left right.
		times if play times .if times is not set it will play always
**/ 

function toAllClip(obj,speed,flag,deriction,times){
	var mask_num=0,mask_t=0;
	var mask_timer;
	clearInterval(mask_timer);
	if(flag){
		var w=obj.style.width.match(/\d+/g)||obj.offsetWidth;
		var h=obj.style.height.match(/\d+/g)||obj.offsetHeight;
		mask_timer=setInterval(function(){
			switch(deriction){
				case "left":
					mask_num-=speed;
					if(mask_num>0){
						if(times&&(mask_t>times)){
							clearInterval(mask_timer2);
							mask_num=0;mask_t=0;
						}
						obj.style.clip = "rect(" + 0 + "px,"  + w + "px,"  + h + "px,"  + mask_num + "px)" ; 
					}else{
						mask_t++;
						mask_num=w
					}
					break;
				case "right":
					mask_num+=speed;
					if(mask_num<=w){
						if(times&&(mask_t>=times)){
							clearInterval(mask_timer);
							mask_num=0;mask_t=0;
						}
						obj.style.clip = "rect(" + 0 + "px,"  + mask_num + "px,"  + h + "px,"  + 0 + "px)" ; 
					}else{
						mask_t++;
						mask_num=0;
					}
					break;
				case "top":
					mask_num-=speed;
					if(mask_num>0){
						if(times&&(mask_t>times)){
							clearInterval(mask_timer);
							mask_num=0;mask_t=0;
						}
						obj.style.clip = "rect(" + mask_num + "px,"  + w + "px,"  + h+ "px,"  + 0 + "px)" ; 
					}else{
						mask_t++;
						mask_num=h;
					}
				break;
				case "bottom":
					mask_num+=speed;
					if(mask_num<=h){
						if(times&&(mask_t>=times)){
							clearInterval(mask_timer);
							mask_num=0;mask_t=0;
						}
						obj.style.clip = "rect(" + 0 + "px,"  + w + "px,"  + mask_num + "px,"  + 0 + "px)" ; 
					}else{
						mask_t++;
						mask_num=0
					}
					break;
			}
		},17);
	}
}
	/**  
		author:robert  
		date:2013-09-05 
		description:	To show more object of the specified  id
**/ 
function show(){
	var argLen=show.arguments.length;
	for(var i=0;i<argLen;i++){
		document.getElementById(arguments[i]).style.visibility="visible";
	}
}
	/**  
		author:robert  
		date:2013-09-05 
		description:	To hidden more object of the specified  id
**/ 
function hidden(){
var argLen=show.arguments.length;
	for(var i=0;i<argLen;i++){
		document.getElementById(arguments[i]).style.visibility="hidden";
	}
}
	/**  
		author:robert  
		date:2013-09-09 
		description:	get mouse deriction.
**/ 
var curX, curY, xold, yold, xdiff, ydiff,mouseAgent=0;
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
		date:2013-09-09 
		description:	plix convert to number;
**/ 
function trimPX (_px) {  
	if(_px==null || _px=="")  
		return 0;  
	return parseInt(_px.substr(0, _px.lastIndexOf("px")));  
}