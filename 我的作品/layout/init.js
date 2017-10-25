$(document).ready(function(){
	var step0="<div id='drop_zone'>添加背景图(拖动到页面内，或者通过按钮选择)</div><input type='file' id='getBg' onchange='handleFileSelect(event)'>";
	if(window.File && window.FileReader && window.FileList && window.Blob) {  
		$(".showlayout").html("<span style='color:#008000'>Great success! All the File APIs are supported.</span>");  
	} else {  
		$(".showlayout").html('<span style="color:red">The File APIs are not fully supported in this browser.</span>');  
	}
	$("body").append("<div class='step0'></div>");
	$(".step0").html(step0);
	document.addEventListener('dragover', handleDragOver, false);
	document.addEventListener('drop', handleFileSelect, false);
	$(".showlayout,.xian").bind("mousedown",function(e){
			e.stopPropagation();
			e.preventDefault();
			//if(e.target==$(".xian")[0]){return;};
			g_mousedown=true;
			var x=e.pageX;
			var y=e.pageY;

			if(e.target!=$(".xian")[0]){	
				$(".xian").css("top",y+"px");
				$(".xian").css("left",x+"px");
				afterSlecte();
			}
			var oldL=parseInt($(".xian").css("left"),10)||0;
			var oldT=parseInt($(".xian").css("top"),10)||0;
			g_DownX=x;
			g_DownY=y;
			$(".xian").data("evt",e.target)
			$(".xian").data("oldleft",oldL)
			$(".xian").data("oldtop",oldT)

	});
	$(document).bind("mousemove",function(e){
			var x=e.pageX;
			var y=e.pageY;

			if(g_mousedown&&g_cut){	
				if($(".xian").data("evt")===$(".xian")[0]){

					$(".xian").css("left",(x-g_DownX+$(".xian").data("oldleft"))+"px");
					$(".xian").css("top",(y-g_DownY+$(".xian").data("oldtop"))+"px");
				}else{
					$(".xian").css("width",(x-g_DownX)+"px");
					$(".xian").css("height",(y-g_DownY)+"px");	
				}
			}
	});
	$(document).bind("mouseup",function(e){
			var x=e.pageX;
			var y=e.pageY;
			if(g_mousedown){
				g_mousedown=false;	
				if(($(".xian").css("height")!="0px")){
					$(".queding").css("left",x+"px");	
					$(".queding").css("top",y+"px");				
					$(".queding").show();				
					$(".quxiao").css("left",(x+40)+"px");					
					$(".quxiao").css("top",y+"px");
					$(".quxiao").show();
				}				
			}
	});
	$(".queding").bind("click",function(e){
			var w,h,x,y,len;
			var str = [];
			var liStr = [];
			var temp_css =[];
			var src =escape(g_imgPath+g_imgName);
			w=$(".xian").width();
			h=$(".xian").height();
			x=$(".xian").offset().left;
			y=$(".xian").offset().top;		
			var reg=/PAGE_(\d{4}).jpg/.exec(g_imgName);
			g_pageIdx="page"+((reg&&reg[1])||"0000");
			var ui="<div class='bg_1024'>\n\t\t\t<div class='ui'></div>\n\t\t\t<div class='btn_ctl play'></div>\n\t\t";
			if($(".outHtml").html()==""){
				$(".outHtml").html(ui);
			}
			if(($(".bg_1024.bg").length>0)&&(newWindow)&&(!newWindow.closed)){

				len=$(".bg_1024 .ui div").length/2;	
				alert(len+1)
				temp_css.push("\n\t.bg_1024 .p",len,"{position:absolute;left:",(x-g_offsetx),"px;top:",(y-g_offsety),"px;width:",w,"px;height:",h,"px;}")
				g_css[0]=(temp_css.join(""))
				console.log(g_css)
				str.push("\n\t\t\t\t<div class='p",len," cover'></div>\n\t\t\t");
				str.push("\n\t\t\t\t<div class='hide bg p",len," panel",len,"' style='background-position:-",x,"px -",y,"px;'></div>\n\t\t\t");
				$(".bg_1024 .ui").append(str.join(""));
				liStr.push("zoom:0.5;background-image:url(",src,");background-position:-",x,"px -",y,"px;background-repeat:no-repeat;width:",w,"px;height:",h,"px'")
				$(".showinfo").append("<li style='"+liStr.join("")+"'> class='panel"+len+"</li>");
			}else{
				$(".bg_1024").css("width",w+"px");
				$(".bg_1024").css("height",h+"px");
				$(".bg_1024").addClass("bg");
				$(".bg_1024").css("overflow","hidden");
				$(".bg_1024").css("background-position","-"+x+"px -"+y+"px");
				g_offsetx=x
				g_offsety=y;
				$(".showinfo li").css("background-image","url("+src+")");
				$(".showinfo li").css("background-position","-"+x+"px -"+y+"px");
				$(".showinfo li").css("width",w+"px");
				$(".showinfo li").css("height",h+"px");
				$(".showinfo li").css("zoom","0.5");
				$(".showinfo li").html("class=bg_1024");
			}
			g_ui=$(".outHtml").html();
			afterSlecte();
			checkNewWindow(w,h,src);
	});	
	
	$(".quxiao").bind("click",function(e){
			afterSlecte();
	});
});
		function afterSlecte(){
					$(".queding").hide();
					$(".quxiao").hide();
					$(".xian").css("width","0px")
					$(".xian").css("height","0px")
		}