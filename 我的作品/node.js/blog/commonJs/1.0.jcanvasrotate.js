<!DOCTYPE html>
<html><head><title>page0040</title>
<meta http-equiv="content-Type" content="text/html;charset=utf-8">
<link href="../../commonCss/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../commonJs/jquery-1.9.1.min.js"></script>
<script src="../../commonJs/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="../../commonJs/animate.js"></script>
<script type="text/javascript" src="../../commonJs/communicateEbook.js"></script>
<script src="../../commonJs/windowResize.js"></script>
<script src="../../commonJs/jcanvas.js"></script>
<style>
	.btn_ctl,.p0{position:absolute;}
	.bg_1024.bg,.bg_1024 .bg{background-image:url(../../PAGE_0040.jpg);background-repeat:no-repeat;}
	.bg_1024 .p0{left:88px;top:92px;}
	.bg_1536.bg,.bg_1536 .bg{background-image:url(../../PAGE_0040_150.jpg);background-repeat:no-repeat;}
	.bg_2048.bg,.bg_2048 .bg{background-image:url(../../PAGE_0040_200.jpg);background-repeat:no-repeat;}
	</style>
</head><body>
	<div class="page0040">
		<div class="bg_1024 bg" style="width: 359px; height: 258px; overflow: hidden; background-position: -101px -611px;">
			<div class=" hide uidata">width: 35.05859375 height: 16.796875 x: 9.86328125 y: 39.778645833333336 </div>
			<div class="ui">
				<canvas class="p0" width="162" height="161"></canvas>
			</div>
			<div class="btn_ctl btn_reset" style="left:240px;top:30px;"></div>
			<div class="hide btn_ctl btn_rotate" style="left:22px;top:122px;"></div>
		</div>
	<!--1536-->
		<div class="bg_1536 bg" style="overflow: hidden;">
			<div class="ui">
				<canvas class="p0" width="243" height="242"></canvas>
			</div>
			<div class="btn_ctl btn_reset"></div>
			<div class="hide btn_ctl btn_rotate"></div>
		</div>
	<!--2048-->
		<div class="bg_2048 bg" style="overflow: hidden;">
			<div class="ui">
				<canvas class="p0" width="324" height="322"></canvas>
			</div>
			<div class="btn_ctl btn_reset"></div>
			<div class="hide btn_ctl btn_rotate"></div>
		</div>
	</div>
</body>
<script>
var g_obj_contain;
var globalDrag = [];
var globalCanvasdraggable = false;
$(document).ready(function(){
/*storge page*/
	$(document).disableSelection();
	var positonObj=["",".p0",".btn_reset",".btn_rotate"]
	var sizeObj=[""]
	var backgroundObj=[""]
	initBgContent(positonObj,sizeObj,backgroundObj);
function convertCoorByAngle(x0,y0,oldx,oldy,angle){
	var tempx,tempy,oldAngle,newAngle,newx,newy,len;
	tempx = oldx - x0;
	tempy = oldy - y0;
	oldAngle = Math.atan2(tempy, tempx);
	newAngle = oldAngle + angle;
	len = Math.sqrt(tempx * tempx + tempy * tempy );
	newx=len * Math.cos( newAngle ) + x0;
	newy=len * Math.sin( newAngle ) + y0;
	return {x:newx,y:newy};
} 
	function initCanvas(type,canvas,scale){
		var $canvas = $(type).find(canvas);
		var tu01 = {
					strokeStyle: '#23b165',
					strokeWidth: 2,
					groups: ['tu'],
					name: 'tu01',
					x1: 26, y1: 27+36,
					x2: 26+36, y2: 27+36*2,
					x3: 26+36, y3: 27,
					bringToFront: false,
					closed: true,
					rounded:true,
					draggable:true,
					controlBtn:type+" .btn_rotate",
					scale:scale,
					length:3
				}
		var tu02 = {
					strokeStyle: '#23b165',
					strokeWidth: 2,
					x1: 26+36*2, y1: 27+36*2,
					x2: 26+36, y2: 27+36*3,
					x3: 26+36*3, y3: 27+36*3,
					bringToFront: false,
					closed: true,
					rounded:true,
					draggable:true,
					groups: ['tu'],
					name: 'tu02',
					controlBtn:type+" .btn_rotate",
					scale:scale,
					length:3
				}
		var tu01base = {
					x1: 26, y1: 27+36,
					x2: 26+36, y2: 27+36*2,
					x3: 26+36, y3: 27
				}
		var tu02base = {
					x1: 26+36*2, y1: 27+36*2,
					x2: 26+36, y2: 27+36*3,
					x3: 26+36*3, y3: 27+36*3
				}
		var dian = {
					layer: true,
					groups: ['tu'],
					fillStyle: '#000',
					x:0,y:0,
					radius: 4,
					scale:scale
				}
		var peroffx = {}, peroffy = {};
		//reset
		$(type).find(".btn_reset").bind("click",function(){
			$canvas.clearCanvas().removeLayers();
			$.extend(tu01, tu01base);
			$.extend(tu02, tu02base);
			globalOffx = 0;
			globalOffy = 0;
			$canvas.drawLine(tu01).drawLine(tu02).drawLayer();
			drawDot();
		});		
		
		//hua shanjiao 
		$canvas.drawLine(tu01).drawLine(tu02).drawLayer();
		
		$(type).find(".btn_rotate").bind("click",function(){
			var tu, x0 = 0, y0 = 0 ;
			if( globalDrag.name ==="tu01"){
				tu = tu01;

			}else if( globalDrag.name ==="tu02"){
				tu = tu02;
			}else{
				tu = null;
			}
			if( tu ){
				var angle = 9*Math.PI/180,
					len = tu.length,
					temp, offx = {}, offy = {},
					g_temp = {};
					
				if(globalCanvasdraggable){
					g_temp = globalDrag["tu01"];
					offx["tu01"] = (g_temp&&g_temp.x||0)/scale;
					offy["tu01"] = (g_temp&&g_temp.y||0)/scale;

					g_temp = globalDrag["tu02"];
					offx["tu02"] = (g_temp&&g_temp.x||0)/scale;
					offy["tu02"] = (g_temp&&g_temp.y||0)/scale;

					if((offx["tu01"]!=peroffx["tu01"])||(offy["tu01"]!=peroffy["tu01"])){
						for(var i=1; i<=tu01.length; i++){
							tu01["x"+i] += offx["tu01"];
							tu01["y"+i] += offy["tu01"];
						}
						peroffx["tu01"] = offx["tu01"];
						peroffy["tu01"] = offy["tu01"];
					}
					if((offx["tu02"]!=peroffx["tu02"])||(offy["tu02"]!=peroffy["tu02"])){
						for(var i=1; i<=tu02.length; i++){	
							tu02["x"+i] += offx["tu02"];
							tu02["y"+i] += offy["tu02"];
						}	
						peroffx["tu02"] = offx["tu02"];
						peroffy["tu02"] = offy["tu02"];
					}
					globalCanvasdraggable = false;
				}
				
				for(i=1; i<=len; i++){
					x0 += tu["x"+i];
					y0 += tu["y"+i];
				}
				x0 = x0/len;
				y0 = y0/len;
				
				for(i=1; i<=len; i++){
					temp = convertCoorByAngle( x0, y0, tu["x"+i], tu["y"+i], angle );
					tu["x"+i] = temp.x;
					tu["y"+i] = temp.y;	
				}
				$canvas.clearCanvas().removeLayers();
				$canvas.drawLine(tu01).drawLine(tu02).drawLayer();
				drawDot();
				clearTimeout($.timeout);
				$.timeout = setTimeout(function(){$(tu.controlBtn).hide();},10000)
			}
		})
		
		//hua dian
		function drawDot(){
			for(var i=0; i<4; i++){
				for(var j=0; j<4; j++){
					$.extend(dian,{	x: 26*scale+j*36*scale, y: 27*scale+36*i*scale,})
					$canvas.drawArc(dian)
				}
			}
		}
		
		drawDot();
		// Draw a closed path (making a triangle)
	}
	initCanvas(".bg_1024",".p0",1)
	initCanvas(".bg_1536",".p0",1.5)
	initCanvas(".bg_2048",".p0",2)
	selectBg();
	window.onresize=function(){
		selectBg();
	};

});
</script>
</html>