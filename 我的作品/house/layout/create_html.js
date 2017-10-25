
	function makeNewWindow(w,h){
		newWindow = window.open("page.html","newWindow","height="+h+",width="+w+",scrollbars=yes,toolbar=yes,menubar=yes,titlebar=yes");
	}
	
	function checkNewWindow(w,h,src){
		// 测试调试窗口是否存在
		if((!newWindow)||(newWindow.closed)){
			makeNewWindow(w,h);
			newWindow.onbeforeunload=function (e){ 
					e =e||newWindow.event;
					if(e.clientX>newWindow.document.body.clientWidth && e.clientY < 0 || e.altKey){ 
						return "是否关闭文件";
					}else{ 
						return e.clientX+" "+newWindow.document.body.clientWidth+" "+e.clientY+ " "+e.altKey; 
					} 
			}
			var newContent = [];
			newContent.push("<!DOCTYPE html><html><head><title>",g_pageIdx);
			newContent.push("</title>\n<link href='../../commonCss/common.css' rel='stylesheet' type='text/css' />", "\n<script type='text/javascript' src='../../commonJs/jquery-1.9.1.min.js'></script>");
			newContent.push("\n<style>\n\t*{margin:0px;padding:0px;}\n\t.hide{display:none;}\n\t.bg{background-image:url(",src,");background-repeat:no-repeat;}\n</style>");
			newContent.push("\n<script src='../../commonJs/jquery-ui-1.10.3.custom.min.js'></script>","\n<script type='text/javascript' src='../../commonJs/animate.js'></script><head>");
			newContent.push("\n<body >\n\t<div class='",g_pageIdx,"'>",g_ui,"\n\t</div>\n</body></html>");

			newWindow.document.write(newContent.join(""));
		}else{
			newWindow.document.getElementsByClassName(g_pageIdx)[0].innerHTML="";
			newWindow.document.getElementsByClassName(g_pageIdx)[0].innerHTML="\n\t\t"+g_ui+"\n\t";
		}

	}
