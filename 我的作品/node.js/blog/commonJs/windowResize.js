/*window resize*/
	if(!RBT){
		var RBT = {};
		RBT.resize = {};
	}
	RBT.resize.getBgContent = function() {
		return[
			{
				id:".bg_1024",
				width:$(".bg_1024").width(),
				height:$(".bg_1024").height(),
				tojQ:$(".bg_1024"),
				multi:1
			},
			{
				id:".bg_1536",
				width:$(".bg_1536").width(),
				height:$(".bg_1536").height(),
				tojQ:$(".bg_1536"),
				multi:1.5
			},
			{
				id:".bg_2048",
				width:$(".bg_2048").width(),
				height:$(".bg_2048").height(),
				tojQ:$(".bg_2048"),
				multi:2
			}
			]
	}
	
	//根据网页大小选择背景
	function selectBg(callbefore , callback) {
		var bodyWidth=$(document.body).width();
		var cur = 0,per = RBT.resize.bgIdx;
		
		if(!RBT.resize.contain){
			 RBT.resize.contain = RBT.resize.getBgContent();
		}
		var contain	 = RBT.resize.contain,
			len = contain.length;
		for(var i=1; i<len; i++){
			if(bodyWidth < contain[i].width){
				cur = i-1;
				break;
			}
			cur = i;
		}

		//RESIZE WINDOW
		if( per !== cur ){	
			var args = arguments,
				argLen = args.length,
				isAni = RBT.resize.isAni,
				aniIdx = RBT.resize.aniIdx;
				
			if(typeof isAni === "undefined"){
				for(var i=0; i<argLen; i++){
					if(args[i].constructor === Array){
						if(args[i][0].constructor === mm){
							isAni = RBT.resize.isAni = true;
							aniIdx = RBT.resize.aniIdx = i;
							break;
						}
					}
				}
				if(i === argLen){
					RBT.resize.isAni = false;
				}
			
			}

			if((isAni)&&(typeof aniIdx !== "undefined")){
				for(var i=0; i<args[aniIdx].length; i++ ){
					args[aniIdx][i].stopAnimate().stopTimer().updateUi();
				}
				args[aniIdx][cur].startAnimate();
			}

			for(i=0; i<len; i++){
				contain[i].tojQ.hide();
			}
			if(typeof callbefore === "function"){
				callbefore( cur, contain);
			}

			contain[cur].tojQ.show();
			
			RBT.resize.bgIdx = cur;
			
			if(typeof callback === "function"){
				callback( cur, contain);
			}

		}
	}
	
//测试网页
function test(){
	$("body").append("<div class='testUi' style='width:100px;height;25px;border:1px solid #666;position:absolute'>toggle body</div>");
	$(".testUi").bind("click",function(){
		$(".bg_1024").children().toggle();
		$(".bg_1536").children().toggle();
		$(".bg_2048").children().toggle();
	})
}
function bg(){
	$("body").append("<div class='testBg' style='width:100px;height;25px;border:1px solid #666;postion:relative'>toggle body</div>");
	var bgposition,str,imgName,bgX,bgY,w,h,getter;
	var temp=[];
	var temp1=[];
	var temp2=[];
	var bgcontent=getBgContent();
	for(var i=0;i<3;i++){
		$getter=$(bgcontent[i].id);
		bgposition=/.*?([-]?\d+)px.*?([-]?\d+)px/g.exec($getter.css("background-position"))
		str=$getter.css("background-image")
		imgName=str.substring(str.lastIndexOf("/")+1,str.lastIndexOf(")"));
		bgX=parseInt(bgposition[1],10);
		bgY=parseInt(bgposition[2],10);
		w=$getter.width();
		h=$getter.height();
		temp.push("'",imgName,"',");
		temp1.push("{x:",bgX,",y:",bgY,"},");
		temp2.push("{x:",w,",y:",h,"},");
	}
	$(".testBg").html("var g_cutImages=["+temp.join('')+"]\n"+"var g_cutCoor=["+temp1.join('')+"]\nvar g_cutsize=["+temp2.join('')+"]")
}
	
	//layout
function initBgContent(position,size,background, x, y){
	if(position){console.log("position参数：%c%s","color:red",position)}
	if(size){console.log("size参数：%c%s","color:red",size)}
	if(background){console.log("background参数：%c%s","color:red",background)};

	if(!RBT.resize.contain){
		 RBT.resize.contain = RBT.resize.getBgContent();
	}
	var contain	 = RBT.resize.contain 
	
	if(arguments.length < 1){
		background = size = position = [""];
	}
	
	var len = contain.length,
		getId = contain[0].id,
		setId,setter,getter;
		
	for(var i=1; i<len; i++){
		setId = contain[i].id;
		for(var j=0; j<position.length; j++) {
			setter = setId + " " + position[j];
			getter = getId + " " + position[j];
			changePosition(setter, getter, contain[i].multi, x, y);
		}
		for(var j=0; j<size.length; j++){
			setter = setId + " " + size[j];
			getter = getId + " " + size[j];
			changeSize(setter, getter, contain[i].multi, x, y);
		}
		for(var j=0; j<background.length; j++){
			setter = setId + " " + background[j];
			getter = getId + " " + background[j];
			changeBackground(setter, getter, contain[i].multi, x, y);
		}
	}
}

function changePosition(setter, getter, multiple, offsetx, offsety){
	if(!offsetx){offsetx=0;}
	if(!offsety){offsety=0;}
	var $setter=$(setter);
	var $getter=$(getter);
	var x=parseInt($getter.css("left"),10);
	var y=parseInt($getter.css("top"),10);
	$setter.css({
		left:Math.round(x*multiple+offsetx)+"px",
		top:Math.round(y*multiple+offsety)+"px"
	});
}
function changeSize(setter,getter,multiple,offsetx,offsety){
	if(!offsetx){offsetx=0;}
	if(!offsety){offsety=0;}
	var $setter=$(setter);
	var $getter=$(getter);
	var w=$getter.width();
	var h=$getter.height();
	$setter.css({
		width:Math.round(w*multiple+offsetx)+"px",
		height:Math.round(h*multiple+offsety)+"px"
	});
}
function changeBackground(setter,getter,multiple,offsetx,offsety){
	if(!offsetx){offsetx=0;}
	if(!offsety){offsety=0;}
	var bgposition=/.*?([-]?\d+)px.*?([-]?\d+)px/g.exec($(getter).css("background-position"))||[];
	var bgX=parseInt(bgposition[1],10);
	var bgY=parseInt(bgposition[2],10);
	$(setter).css("background-position",Math.round(bgX*multiple+offsetx)+"px "+Math.round(bgY*multiple+offsety)+"px");	
}
