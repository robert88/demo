	function handleFileSelect(evt) {
		evt.stopPropagation();
		evt.preventDefault();
		var files;
		if(evt.dataTransfer){
			files = evt.dataTransfer.files; 
		}else{
			files=evt.target.files;
		}
		//alert(window.location.search);
		var output = [];
		for (var i = 0, f; f = files[i]; i++) {
			output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
						f.size, ' bytes, last modified: ',f.lastModifiedDate.toLocaleDateString(),
						f.lastModifiedDate.toLocaleTimeString(), '</li>');
			var reader = new FileReader();  
			reader.onload = (function(theFile) {
					return function(e) {
								var span = document.createElement('span');
								g_imgName=theFile.name;
								span.innerHTML = ['<img class="thumb" src="',escape(g_imgPath+g_imgName),
												'" title="', escape(g_imgName), '"/>'].join('');
								$(".showlayout").html("");
								$(".step0").html("")	
								$(".step0").append(span);
								$(".thumb").hide();
								//alert(theFile.width)
								//.css("width","url("+ e.target.result+")");
								console.log(escape(g_imgPath+g_imgName))

								$(".thumb").bind("load",function(){
										$(".showlayout").css("width",$(".thumb").css("width"));
										$(".showlayout").css("height",$(".thumb").css("height"));		
										$(".showlayout").css("background-image","url("+escape(g_imgPath+g_imgName)+")")
										console.log($(".showlayout").css("background-image"));	
										g_cut=true;
								})
					}
			})(f);	 	
			reader.readAsDataURL(f); 
		}
	}  
//window.requestFileSystem   = window.requestFileSystem | | window.webkitRequestFileSystem ;
  function handleDragOver(evt) {
    evt.stopPropagation();
    evt.preventDefault();
    evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
  }
