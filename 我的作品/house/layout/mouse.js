
  $(".xian").draggable();
  $(".showlayout").bind("mousedown",function(e){
  	e.stopPropagation();
	e.preventDefault();
	g_mousedown=true;
	var x=e.pageX;
	var y=e.pageY;
	$(".xian").css("top",y+"px");
	$(".xian").css("left",x+"px");
			$(".xian").css("width","0px");
			$(".xian").css("height","0px");
	g_DownX=x;
	g_DownY=y;
  });
    $(document).bind("mousemove",function(e){
		var x=e.pageX;
		var y=e.pageY;	
		
		if(g_mousedown==true){
			$(".xian").css("width",(x-g_DownX)+"px");
			$(".xian").css("height",(y-g_DownY)+"px");	
		}
  });
      $(document).bind("mouseup",function(e){
			g_mousedown=false;	
  });