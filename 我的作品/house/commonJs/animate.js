/*mm constructor*/
	function mm(obj){
		if(this == window){
			return new mm(obj);
		}
		
	/*static data*/
	
		this.audio = obj&&document.getElementById(obj.audioId)||document;
		this.type = obj&&obj.type || "";
		this.frames = obj&&obj.frames ||[];
		this.ctrType=obj&&obj.ctrType||"";
		this.playReturnFlag=(obj&&(obj.playReturnFlag===false))?false:true;
		this.noPalyAgain=(obj&&(obj.noPalyAgain===true))?true:false;
		this.playReturnTime=(obj&&obj.playReturnTime)||2000;
		this.framesObj = [];
		function Animate(){
			this.obj = [];
			this.startTime = [];
			this.effect = [];
			this.endTime = 0;
		}
		
	/*dynamic data*/
	
		var that=this;
		this.start=0;
		this.end=1;
		this.secStart= [];
		this.secEnd= [];
		this.curColTimeOut=[];
		this.perColTimeOut=[];
		this.status = "ready";
		this.animateStatus = "ok";
		this.animateTimer = "undefined";
		this.ctrTimer = "undefined";
		this.offsetTime=0;
		this.curPlayTime=0;
		this.perPlayTime=0;
		this.curRowTimeOut=-1;
		this.perRowTimeOut=-1;
		this.runObj="";
	/*play status*/
	
		this.checkEnd = function(){
					if(that.ctrType=="audio"){
						if(that.audio.ended){
							if(that.audio.currentTime!==0){
								that.audio.pause();
								//that.audio.currentTime=0; 		//	bug:is will case play audio again
								that.status="stop";
							}
						}
					}
				};
		this.play=function(){
					if(that.ctrType=="audio"){
					/*can use setInterval beacause you can not stop it */
						if(that.audio.networkState==1&&that.audio.readyState==4||that.audio.ended){	
							that.audio.play();
							that.status="play";
						}
						if(that.status == "play"){
							that.audioHandler();
							return;
						}
						setTimeout(function(){that.play();},200);
					}else{
						that.status="play";
						that.audioHandler();
					}
				};		
		this.pause=function(){
					if(that.ctrType=="audio"){
						if(that.status == "play"){
							that.audio.pause();
							that.status="pause";
						}
					}else{
							that.status="pause";
					}
				};
		this.stop=function(){
					if(that.ctrType=="audio"){
						if(that.audio.readyState === 4){
							that.audio.pause();
							that.audio.currentTime=0;
							that.status="stop";
						}
					}else{
						that.status="stop";
					}
				};
				
	/*data handler*/
	
		this.clrData=function(){

			if((that.end!==1)||(that.offsetTime!==0)||(that.secEnd&&that.secEnd[0]!==1)||(that.curRowTimeOut!==-1)){
				that.offsetTime=0;
				that.start=0;
				that.end=1;
				/*clear one frame start and end */
				for(var idx=0;idx<that.frames.length;idx++){//check frames
					that.secStart[idx]=0;
					that.secEnd[idx]=1;
					that.curColTimeOut[idx]=-1;
					that.perColTimeOut[idx]=-1;
				}
				that.offsetTime=0;
				that.curPlayTime=0;
				that.perPlayTime=0;
				that.curRowTimeOut=-1;
				that.perRowTimeOut=-1;
			}
		};
		this.covPx=function(str){
			if(typeof str ==="string"){
				return parseInt(str.slice(0,str.indexOf("px")),10)||0;
			}
		};		
		this.covNum=function(str){
			return parseInt(str,10)||0;
		};
		
	/*animation efffect*/
	
		this.fade=function(a,speed){
			$(that.type+" "+a).fadeToggle(speed);
		};
		this.moveV=function(a,offset,speed){
			$(that.type+" "+a).animate({top:offset},speed);
		};
		this.moveH=function(a,offset,speed){
			$(obj.type+" "+a).animate({left:offset},speed);
		};					
		this.clipV=function(a,speed,invert){
			var offset=$(obj.type+" "+a).height();
			$(obj.type+" "+a).css("height","0px");
			if(invert){
				that.clip($(obj.type+" "+a)[0],speed,"right","left");
			}else{
				$(obj.type+" "+a).show();
				$(obj.type+" "+a).animate({height:offset},speed);
			}
		};					
		this.clipH=function(a,speed,invert){
			var offset=$(obj.type+" "+a).width();
			if(invert){
				that.clip($(obj.type+" "+a)[0],speed,"left","right");
			}else{
				$(obj.type+" "+a).css("width","0px");
				$(obj.type+" "+a).show();
				$(obj.type+" "+a).animate({width:offset},speed);
			}
		};		
		this.clip=function(obj,speed,start,deriction){
				var mask_num=0,mask_t=0;
				if(obj){
					var w=obj.style.width.match(/\d+/g)||obj.offsetWidth;
					var h=obj.style.height.match(/\d+/g)||obj.offsetHeight;
					var leftFlag=(start==="left")&&(deriction==="right");
					var rightFlag=(start==="right")&&(deriction==="left");
					var upFlag=(start==="top")&&(deriction==="down");
					var downFlag=(start==="bottom")&&(deriction==="up");
					speed=w/speed*17;
					obj.mask_timer=setInterval(function(){
						if(leftFlag){
								mask_num += speed;
								if(mask_num<w){
									obj.style.clip = "rect(" + 0 + "px,"  + w + "px,"  + h + "px,"  + mask_num + "px)" ; 
								}else{
									obj.style.clip = "rect(" + 0 + "px,"  + w + "px,"  + h + "px,"  + w + "px)" ; 
									clearInterval(obj.mask_timer)
									obj.mask_timer = null;
								}
						}else if(rightFlag){
								w -= speed;
								if(w>0){
									obj.style.clip = "rect(" + 0 + "px,"  + w+ "px,"  + h + "px,"  + 0 + "px)" ; 
								}else{
									obj.style.clip = "rect(" + 0 + "px,"  + 0+ "px,"  + h + "px,"  + 0 + "px)" ; 
									clearInterval(obj.mask_timer)
									obj.mask_timer = null;
								}
						}else if(upFlag){
								mask_num += speed;
								if(mask_num<h){
									obj.style.clip = "rect(" + mask_num + "px,"  + w + "px,"  + h + "px,"  + 0 + "px)" ; 
								}else{
									obj.style.clip = "rect(" + h + "px,"  + w + "px,"  + h + "px,"  + 0 + "px)" ; 
									clearInterval(obj.mask_timer)
									obj.mask_timer = null;
								}
						}else if(downFlag){
								h -= speed;
								if(h>0){
									obj.style.clip = "rect(" + 0 + "px,"  + w + "px,"  + h + "px,"  + 0 + "px)" ; 
								}else{
									obj.style.clip = "rect(" + 0 + "px,"  + w + "px,"  + 0 + "px,"  + 0 + "px)" ; 
									clearInterval(obj.mask_timer)
									obj.mask_timer = null;
								}
						}
					},17);
				}

		};
		this.toggle=function(a,speed){
			$(obj.type+" "+a).toggle(speed);
		};	
		this.move_h_up=function(a,offset,speed){
			var l=$(obj.type+" "+a).css("left");
			var t= that.covPx(l);
			$(obj.type+" "+a).animate({left:(offset+t)+"px"},speed);
		};			
		this.clip_h_left=function(a,offset,speed){
			var l=$(obj.type+" "+a).width();
			$(obj.type+" "+a).animate({width:(offset+l)+"px"},speed);
		};	
		this.toggleClass=function(a,class1,class2){
			$(obj.type+" "+a).removeClass(class1);
			$(obj.type+" "+a).addClass(class2);
		};
		this.slantMove=function(a,x,y,speed){
			$(that.type+" "+a).animate({top:y,left:x},speed);
		};		
		this.round=function(a,offset,offsetX,offsetY,speed){
			
			$(obj.type+" "+a).css("transform","rotate("+offset+"deg) scale(1) skew(0deg) translate("+offsetX+"px,"+offsetY+"px)");
			$(obj.type+" "+a).css("-webkit-transform","rotate("+offset+"deg) scale(1) skew(0deg) translate("+offsetX+"px,"+offsetY+"px)");
			$(obj.type+" "+a).css("-ms-transform","rotate("+offset+"deg) scale(1) skew(0deg) translate("+offsetX+"px,"+offsetY+"px)");
			$(obj.type+" "+a).css("-moz-transform","rotate("+offset+"deg) scale(1) skew(0deg) translate("+offsetX+"px,"+offsetY+"px)");
			$(obj.type+" "+a).css("-o-transform","rotate("+offset+"deg) scale(1) skew(0deg) translate("+offsetX+"px,"+offsetY+"px)");
			$(obj.type+" "+a).css("transition","All "+speed+"ms ease");
			$(obj.type+" "+a).css("-webkit-transition","All "+speed+"ms ease");
			$(obj.type+" "+a).css("-moz-transition","All "+speed+"ms ease");
			$(obj.type+" "+a).css("-o-transition","All "+speed+"ms ease");
		};
		
	/*animation run and get*/
	
		this.runAnimate=function(idx,j,effect){
			//switch(effect[0]){//qt webkit don't support this statement
			effect=that.framesObj[idx].effect[j].split(",");
			for(var i=0;i<effect.length;i++){
				effect[i]=$.trim(effect[i]);
			}
			if(effect[0] === "fade"){
				that.fade(that.framesObj[idx].obj[j],that.covNum(effect[1]));
			}else if(effect[0] === "toggle"){
				that.toggle(that.framesObj[idx].obj[j],that.covNum(effect[1]));
			}else if(effect[0] === "move_h"){
				that.moveH(that.framesObj[idx].obj[j],effect[1],that.covNum(effect[2]));
			}else if(effect[0] === "move_v"){									
				that.moveV(that.framesObj[idx].obj[j],effect[1],that.covNum(effect[2]));
			}else if(effect[0] === "clip_h"){
				that.clipH(that.framesObj[idx].obj[j],that.covNum(effect[1]),that.covNum(effect[2]));
			}else if(effect[0] === "clip_v"){
				that.clipV(that.framesObj[idx].obj[j],that.covNum(effect[1]),that.covNum(effect[2]));
			}else if(effect[0] === "round"){
				that.round(that.framesObj[idx].obj[j],effect[1],that.covNum(effect[2]),that.covNum(effect[3]),that.covNum(effect[4]));
			}else if(effect[0] === "move_h_up"){
				that.move_h_up(that.framesObj[idx].obj[j],that.covNum(effect[1]),that.covNum(effect[2]));
			}else if(effect[0] === "clip_h_left"){
				that.clip_h_left(that.framesObj[idx].obj[j],that.covNum(effect[1]),that.covNum(effect[2]));
			}else if(effect[0] === "toggleClass"){
				that.toggleClass(that.framesObj[idx].obj[j],effect[1],effect[2]);
			}else if(effect[0] === "slantMove"){
				that.slantMove(that.framesObj[idx].obj[j],that.covNum(effect[1]),that.covNum(effect[2]),that.covNum(effect[3]));
			}
		};
		this.getAnimate=function(){
			var animateObjStr = "";
			var delayTimeStr = "";
			var effectObjStr = "";
			var delayTimeS = [];
			var curFrame = [];
			var perLength=0;
			var temp;
			var tempLen;
			for(var idx=0;idx<that.frames.length;idx++){//check frames
				that.secStart[idx]=0;
				that.secEnd[idx]=1;
				that.curColTimeOut[idx]=-1;
				that.perColTimeOut[idx]=-1;
				that.framesObj[idx] = new Animate();
				for(var j=0;j<that.frames[idx].repeatTimes;j++){//check times
					animateObjStr +=that.frames[idx].animateObj+",";
					delayTimeStr += that.frames[idx].delayTime+",";
					delayTimeS=delayTimeStr.split(",");
					for(var i=perLength;i<delayTimeS.length-1;i++){//Accumulative time array
						effectObjStr += that.frames[idx].effect+"#";
						that.framesObj[idx].startTime[i]=that.covNum(delayTimeS[i])+that.frames[idx].curFrame+that.frames[idx].repeatIntervalTime*j;/*time=curFrame+delay time+repeat time*/
					}
					perLength=delayTimeS.length-1;
				}
				/*sort one frame*/
			that.framesObj[idx].obj=animateObjStr.split(",");
			that.framesObj[idx].effect=effectObjStr.split("#");
			tempLen=that.framesObj[idx].startTime.length;
				for(j=0;j<tempLen-2;j++){
					for(i=j+1;i<tempLen-1;i++)
						if(that.framesObj[idx].startTime[j]>that.framesObj[idx].startTime[i]){
							/*synchronazition startTime*/
							temp=that.framesObj[idx].startTime[j];
							that.framesObj[idx].startTime[j]=that.framesObj[idx].startTime[i];
							that.framesObj[idx].startTime[i]=temp;
							/*synchronazition obj*/
							temp=that.framesObj[idx].obj[j];
							that.framesObj[idx].obj[j]=that.framesObj[idx].obj[i];
							that.framesObj[idx].obj[i]=temp;
							/*synchronazition effect*/
							temp=that.framesObj[idx].effect[j];
							that.framesObj[idx].effect[j]=that.framesObj[idx].effect[i];
							that.framesObj[idx].effect[i]=temp;
						}
				}
				that.framesObj[idx].endTime = that.framesObj[idx].startTime[tempLen-1];
				/*clear to back*/
				perLength=0;
				effectObjStr = "";
				delayTimeStr ="";
				animateObjStr = "";
				if(that.framesObj[idx].obj.length !== that.framesObj[idx].startTime.length+1){
					throw typeError("time is not syn");
				} 
			}
		}();
		
	/*animate contrl*/
	
		this.stopAnimate=function(){
			that.stop();
			that.clrData();
		};		
		this.startAnimate=function(){
			$(that.type).show();
			that.runObj=that.type;
			that.animation();
			that.play();
		};		
		
		this.pauseAnimate=function(){
			that.pause();
		};
		
		this.updateUi=function(){
			var type=that.type.substring(1);
			$(that.type).hide();
			$(that.type+" "+".ui").empty();
			$(that.type+" "+".ui").append($(that.type+" "+".ui").data(type+"_html"));
		};
		this.stopTimer=function(){
			if(that.ctrTimer!=="undefined"){
				window.clearTimeout(that.ctrTimer);
				that.ctrTimer="undefined";
			}
			if(that.animateTimer!=="undefined"){
				window.clearTimeout(that.animateTimer);
				that.animateTimer="undefined";
			}
		};
		
    /*requestAnimationFrame() and  cancelAnimationFrame()*/
	
		window.requestAFrame = (function () {
			return window.requestAnimationFrame ||
					window.webkitRequestAnimationFrame ||
					window.mozRequestAnimationFrame ||
					window.oRequestAnimationFrame ||
					// if all else fails, use setTimeout
					function (callback) {
						return window.setTimeout(callback, 1000 / 60); // shoot for 60 fps
					};
		})();
		window.cancelAFrame = (function () {
			return window.cancelAnimationFrame ||
					window.webkitCancelAnimationFrame ||
					window.mozCancelAnimationFrame ||
					window.oCancelAnimationFrame ||
					function (id) {
						window.clearTimeout(id);
					};
		})();
		
	/*window focus*/
	
		this.setFocusEvents=function(){
			active_element = document.activeElement;
			if (document.all)	{
				document.onfocusout = function() {	that.focus=false;     };
				document.onfocusin = function()	 {	that.focus=true;       };
			}	else	{
				window.onblur = function()	  {	that.focus=false;            };
				window.onfocus = function()	 {	that.focus=true;       };
			}
		}();
		
	/*alert information*/
	
		this.showAlert=function(msg){
			if($(".alert").length===0){
				$("body").append("<div class='alert'></div>");
				$(".alert").css("border","2px dotted yellow");
				$(".alert").css("backgound-color","#fff");
				$(".alert").css("position","absolute");
				$(".alert").css("max-width",$("body").width()+"px");
				$(".alert").css("left","0px");
				$(".alert").css("top","0px");
			}
			$(".alert").hide();
			$(".alert").html(msg);
			$(".alert").show();
		}
	/*  time1 control status delect  */
	
		this.audioHandler=function(){

			var $bnt=$(that.type+" "+".btn_ctl");
			var playFlag=/play/g.test($bnt.attr("class"));
			var pauseFlag=/pause/g.test($bnt.attr("class"));
			var endFlag=/end/g.test($bnt.attr("class"));
			if(that.status === "play"){
				if(that.ctrType==="button"){
					if(!playFlag){
						$bnt.addClass("play");
						$bnt.removeClass("end");
						$bnt.removeClass("pause");
					}
				}else{
					if(!pauseFlag){
						$bnt.addClass("pause");
						$bnt.removeClass("play");
						$bnt.removeClass("end");
					}
					that.offsetTime++;//逐步展示不需要实时时间
				}
			}else if(that.status === "stop"){
				if(!endFlag){
					$bnt.addClass("end");
					$bnt.removeClass("play");
					$bnt.removeClass("pause");
				}
				that.stopTimer();
				that.clrData();
				/*返回初始页面 逐步展示不需要在stop的时候返回*/
					if(that.playReturnFlag){
						that.updateUi();
						$(that.type).show();
					}
					if(this.noPalyAgain){
						$bnt.hide();
					}
				return;
			}else if(that.status === "pause"){
				if(that.ctrType!=="button"){
					if(!playFlag){
						$bnt.addClass("play");
						$bnt.removeClass("pause");
						$bnt.removeClass("end");
					}
				}
			}
			if((that.runObj === that.type)&&(that.status!=="stop")){
				that.ctrTimer=setTimeout(function(){that.audioHandler();},100);
			}
		};
		
	/*  timer2 animate run delect */
	
		this.animation=function(){
			var effect = [];		
			var st=0,et=0,a=0,backTime;
			that.checkEnd();
			if(that.ctrType=="audio"){
				that.curPlayTime=parseInt(that.audio.currentTime*100,10)*10;	//audio control
			}else{	
				that.curPlayTime=that.offsetTime*100;	//no control
			}				
			if(that.curPlayTime!==that.perPlayTime){
				if((that.curPlayTime-that.perPlayTime>100)){	//time adjusting module
					backTime=parseFloat(that.perPlayTime,10)/1000;
					if(that.ctrType=="audio"){
						if(backTime>0.1){
							backTime -= 0.01;	//adjust 10ms
						}
						that.audio.currentTime=backTime;
						that.curPlayTime=parseInt(that.audio.currentTime*100,10)*10;		
						that.animateStatus="fineTuning";
					}
				}else{
					if(that.animateStatus!="ok"){
						that.animateStatus="ok";
					}
				}
				if(that.ctrType=="audio"){
					if(that.animateStatus!="ok"){	 //	close sound
						that.audio.muted=true;
					}else{
						that.audio.muted=false;
					}
				}
	
				for(var idx=that.start;idx<that.end;idx++){		//	scan row frame
						a=that.curPlayTime-that.frames[idx].curFrame;
					if(a>-99){	//	row frame timeout
						that.curRowTimeOut=idx;
						if((that.curRowTimeOut > that.perRowTimeOut)&&(that.end<that.frames.length)){	//	advance scan row end
							that.end++;
							that.perRowTimeOut=that.curRowTimeOut;		//	record scan row end
						}
						for(var j=that.secStart[idx];j<that.secEnd[idx];j++){	//	scan col frame
							st=that.curPlayTime-that.framesObj[idx].startTime[j];
							if(st>-99){		//	col frame timeout
								that.curColTimeOut[idx]=j;
								if((that.curColTimeOut[idx] > that.perColTimeOut[idx])&&(that.secEnd[idx]<that.framesObj[idx].startTime.length)){	//	advance scan col end
									that.secEnd[idx]++;
									that.perColTimeOut[idx]=that.curColTimeOut[idx];	//	record scan col end
								}

								that.runAnimate(idx,j,effect);
								that.secStart[idx]++;			//run animate and advance scan col start

								if(that.ctrType!=="audio"){	 //控制文件不是声音的动画效果
									if((idx===that.frames.length-1)&&(j===that.framesObj[idx].startTime.length-1)){
									//console.log("that.playReturnTime"+that.playReturnTime)
										setTimeout(function(){that.stopAnimate();},that.playReturnTime);
										return;
									}
								}
							}
						}//end one frame for
						et=that.curPlayTime-that.framesObj[idx].endTime;
						if(et>-99&&(idx===that.start)){		//	check end and timeout advance scan row start//bug skip col start for j===that.secEnd[idx]-1
							that.start++;
						}
					}
				}//end frames for
			}
			that.perPlayTime=that.curPlayTime;		//	record curPerTime

			if(that.runObj === that.type){
				that.animateTimer=setTimeout(function(){that.animation();},50);
			}
		};
		
	/*play control*/
		$(this.type+" "+".btn_ctl").bind("click",changePlay);
		function changePlay(){
		/*返回初始页面*/
			if((that.status==="stop")&&(!that.playReturnFlag)){
				that.updateUi();
				$(that.type).show();
			} 

			if(that.ctrType==="button"){		/*逐步展示*/
				if(that.status!=="stop"){
					that.offsetTime=that.framesObj[that.start].startTime[that.secStart[that.start]]/100;
				}else{
					that.stopAnimate();
					that.startAnimate();
				}
			}else{		/*播放、暂停*/
				if(that.status !=="play"){
					that.startAnimate();
				}else{
					that.pauseAnimate();
				}
			}
		}

		return this;
	}
/*end mm*/
