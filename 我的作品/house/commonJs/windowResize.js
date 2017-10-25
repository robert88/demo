/*window resize*/
	var g_perBodyWidth;	
	function stopAll(){
		$(".bg_1024").hide();
		$(".bg_1536").hide();
		$(".bg_2048").hide();
	}
	function getWH(slector){
		return {width:$(slector).width(),height:$(slector).height()}
	}
	function selectBg(){
		var bodyWidth=document.body;
		var bg_1024=getWH(".bg_1024");
		var bg_1536=getWH(".bg_1536");
		var bg_2048=getWH(".bg_2048");
		var curBodyWidth;
		if($(bodyWidth).width()<=((bg_1024.width+bg_1536.width)/2)){
			curBodyWidth = 1;
		}else if($(bodyWidth).width()<=((bg_2048.width+bg_1536.width)/2)){
			curBodyWidth = 2;
		}else{
			curBodyWidth = 3;
		}
		if((g_perBodyWidth !== curBodyWidth)){
			g_hasChange=true;
			stopAll();
			if(curBodyWidth===1){
				$(".bg_1024").show();
			}else if(curBodyWidth===2){
				$(".bg_1536").show();
			}else{
				$(".bg_2048").show();
			}
		}
		g_perBodyWidth = curBodyWidth;
	}
