		/**  
			author:robert  
			date:2014-01-16  
			description:	fill picture
	**/
	function getImageData(name,panel,src,x,y,w,h,idx){
			if(!panel){throw "画图 canvas对象不存在！";}
			var drawPanel=panel.getContext("2d");
				$("body").append("<img class='newImg' src='"+src+"'><div onclick='saveLocalImage("+idx+")' style='background:blue;color:white'>"+name+"</div>");
				$(".newImg").hide();
				$(".newImg").eq(idx).next().css("position","absolute");
				panel.width=w;
				panel.height=h;
				$(".newImg").eq(idx).next().css("left",(w+panel.offsetLeft)+"px");
				$(".newImg").eq(idx).next().css("top",(h/2+panel.offsetTop)+"px");
				$(".newImg").eq(idx).next().hide();
				$(".newImg").data("x",x);
				$(".newImg").data("y",y);
				$(".newImg").data("w",w);
				$(".newImg").data("h",h);
				if(document.domain!=="127.0.0.1"){
					alert("请在服务器上测试！");
					return;
				}
						//alert($(".newImg+div").text()+"fd")
				$(".newImg").on("load",function(e){
					var $target=$(e.target);
					$target.next().show();
					var cutx=$target.data("x");
					var cuty=$target.data("y");
					var cutw=$target.data("w");
					var cuth=$target.data("h");
					//alert(cutx)
				//	drawPanel.beginPath();
					//drawPanel.clearRect(0,0,w,h)
					//drawPanel.fillRect(0,0,w,h); 
					drawPanel.drawImage(e.target,cutx,cuty,cutw,cuth,0,0,cutw,cuth);
			 //var image = panel.toDataURL("image/png").replace("image/png","image/octet-stream");
					
					//setTimeout(function(){var getNewImg=drawPanel.getImageData(10,10,50,50);
					//console.log(typeof getNewImg)},2000)
				})

	}
	function saveLocalImage(idx){
		var t=$("#cvs"+idx)[0].toDataURL("image/png").replace("image/png","image/octet-stream");
		window.location.href=t
	}

$(document).ready(function(){
	var cutImagesName=[];
	var len=g_cutImages.length
	if(len!=g_cutCoor.length){throw "剪切图像坐标数不对"}
	var cutSrc=[];
	for(var i=0;i<len;i++){
		$("body").append("<div><canvas id='cvs"+i+"'></canvas></div>");
		var temp=$("#cvs"+i)[0];
		//if(i<9){
		//	cutImagesName[i]=g_cutImagePrefix+"0"+g_cutImages[i]+g_cutImagesuffix;
	//	}else{
		//	cutImagesName[i]=g_cutImagePrefix+g_cutImages[i]+g_cutImagesuffix;
	//	}
		cutSrc[i]=g_cutImageUrl+g_cutImages[i];
		if(cutSrc[i]){
			getImageData(g_cutImages[i],temp,cutSrc[i],g_cutCoor[i].x,g_cutCoor[i].y,g_cutsize[i].x,g_cutsize[i].y,i);
		}
	}
});