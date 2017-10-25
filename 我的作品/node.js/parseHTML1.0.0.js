if(!RBT){
	var RBT = {};
}
if(window.console){
	var log=function(str,calltask){
		if(calltask){
			console.log(str+" ----------- 来自"+(arguments.callee.caller.name)+"()");
		}else{
			console.log(str);
		}
	}
}

RBT.parseStrByReg = function(str,reg){
	var tags = [], temp = [];
	if(typeof str === "string"){
		
		//html标签比配说明
		//单标签：abbr|br|col|img|input|link|meta|param|hr|area|embed
		//形式：<br> <br /> <br/> <input type="text" class="#d1$@&^*!~">
		//双标签：div...
		//<div>
		//注释<!---->
		//文档类型<!DOCTYPE>;
		//正确的匹配："<br>" "<div></div>" "<div></div><div></div>" "<div></div><br><div></div>";
		//正确的匹配："<br />" "<div class='#d1$@&^*!~'  class='#d1$@&^*!~'></div>" "<div></div><br /><div></div>";
		//	var startTagReg = /<(.+)>/g;//匹配<任何字符>这样的话只能匹配到“<br>”;
		//var startTagReg = /<(\w+)>/g;//匹配<任何字符>这样的话只能匹配到“<div>”,"<div><div>...";
		//var startTagReg = /^[^<]*(<(.|\s)+>)[^>]*$/;//匹配<任何字符>这样的话只能匹配到;
		//var startTagReg = /<(\w+)\s*\/?>/g;//匹配<任何字符>这样的话只能匹配到“<br>”,"<br >","<br />";
		//var startTagReg = /<(\w+)\s*[^>]*\/?>/g;//未能排除"<div<div>"会匹配到<div
		//var startTagReg = /<(\w+)\s*[^<>]*\/?>/g;//匹配正确
		//var startTagReg =/^(abbr|br|col|img|input|link|meta|param|hr|area|embed)$/i;//匹配<任何字符>这样的话只能匹配到“<div>”,"<div><div>..."
		//var endtagReg = /<\/(\w+)\s*[^>]*\/?>/g
		//var docTypetag =  /<!(\w+)\s*[^>]*\/?>/g;
		//	var commentary =  /<!--(\w+)\s*[^>]*\/?>/g;
		//	var totalLen = str.length;
		var  per, curStr, strLines = str.split(/\n|\r/);
		var curtotalLen = 0, len = 0, cursearhIdx = 0;
		var execReg;
		
		log("line = "+strLines.length)
		//debugger;
			for(var i=0;i<strLines.length;i++){
			
				curStr = strLines[i];
				
				while((execReg = reg.exec(curStr)) && per!==curStr ){
				
				//debugger
					//记录当前
					per = curStr;
					
					//提取tag
					temp = [];
					
					//当前捕获在字符串中的位置
					cursearhIdx = execReg.index + curtotalLen
					
					//当前匹配的字符串长度
					len = RegExp["$&"].length;	
					
					//捕获开始位置
					temp.push( cursearhIdx);		
					
					//捕获结束位置
					temp.push( cursearhIdx + len);		
					
					//匹配所有捕获项
					temp.push( execReg.slice(1) );		
					
					//保存tag
					tags.push(temp);
					
					//更新当前指针
					curtotalLen = cursearhIdx + len;
					
					//过滤掉已经搜索的字符串,截取lastIndex之后的字符。
					curStr = RegExp["$'"];
					
					//复位正则表达式搜索起始位置
					reg.lastIndex = 0;
				
				}
				
				//回车占用一个长度
				curtotalLen += curStr.length + 1;
			}
	}		
	return tags;
}

var input = document.getElementById("regtest");
	if(document.all){
		input.attachEvent("change",function(){RBT.parseTag(input.value,/<(\w+)\s*[^>]*\/?>/g);})
	}else{
		input.addEventListener("change",function(){RBT.parseHTML(input.value);},false)
	}
	
RBT.HTMLS = function() {
	this.tag = "";
	this.endIdx = 0;
	this.startIdx = 0;
	this.endFlag = false;
	this.endTagIdx = 0;
	this.attr = {};
}
	
RBT.extend = function() {
	var args = arguments, len = args.length;
	var i = 0, target, src, deep;

	//第一个参数是布尔值的话，表示深度拷贝。
	if(typeof args[0] === "boolean"){
		deep = args[0];
		i++;
	}

	//进行拷贝
		for(; (i < len-1)&&(args[i+1] != null);  i++){	
		
			//参数长度为1的时候，对象合并到RBT上面。
			if(len===1){
				target = this;
				src = args[i];
			}else {
			
				//参数长度大于1的时候，且第一个参数是深度标志的话，第二就是目标否则第一个是目标。
				if(deep){
					target = args[1]||{};
				}else{
					target = args[0]||{};
				}
				src = args[i+1];
			}
			for(var key in src){
				if(deep && (typeof src[key]==="object")){
				
					//这个target[key]如果是数组的话传入回调后，不会添加到目标对象中，必须复制
					target[key] = args.callee(deep, target[key], src[key]);
				}else{
					target[key] = src[key];
				}
			}
		}
	return target;
}

RBT.each =function (src, callback){
	if(src.length){
		for(var i = 0; i<src.length; i++){
			if(typeof callback === "function"){
				if(callback.call(src,src[i],i) === false){
					break;
				}
			}
		}
	}
	return src;
}
RBT.parseHTML = function(parseStr){

	//var attrReg = /(\w+)\s*=\s*"?'?([^"']*)'?"?/
	//var attrsExec = RBT.parseStrByReg(parseStr, attrReg);

	var regStr = "(\\w+)\\s*[^<>]*\\/?>";
	var sigleTag = /^(abbr|br|col|img|input|link|meta|param|hr|area|embed)$/i;
	var startTagExec = RBT.parseStrByReg(parseStr,new RegExp("<"+regStr,"g"));
	var endTagExec =  RBT.parseStrByReg(parseStr,new RegExp("<\\/"+regStr,"g"));
	//log(startTagExec)
	var startTag,endTag;
	
	//
	function getTag(regExec, end){
		var tempArray = [], temp = {};
		var attrReg = /(\w+)\s*=\s*"?'?([^"']*)'?"?/
		var attrsExec;
		var tempStr;
		var key, value
		for(var i=0; i<regExec.length; i++){
			temp = new RBT.HTMLS();
			temp.startIdx = regExec[i][0];
			temp.endIdx = regExec[i][1];
			temp.tag = regExec[i][2][0];
			if(end){
				temp.endFlag = end;
			}else{
				tempStr= parseStr.slice(temp.startIdx, temp.endIdx);
				attrsExec = RBT.parseStrByReg(tempStr,attrReg);
				for(var j=0; j<attrsExec.length; j++){
					key = attrsExec[j][2][0];
					value = attrsExec[j][2][1];
					temp.attr[key] = value; 
				}
			}
			
			tempArray.push(temp);
		}
		return tempArray;
	}
	//debugger;
	//初始化开始标签和结束标签
	startTag = getTag(startTagExec);
	endTag = getTag(endTagExec,true);


	var merge = [];
	var mergeSrc = [];
	
	//克隆对象	,创建一个新的对象从而不会对stargIdx循环搜索产生影响
	RBT.extend(true,merge,startTag);
	RBT.extend(true,mergeSrc,endTag);
	
	//整合标签
	//当前查询对象、下一个查询对象和查询长度
	var cur, cStart, next, nStart;

	
	//要插入的对象	

	var target, tStart, insertIdx = 0, sLen;
	for(var i=0; i<mergeSrc.length; i++){
		target = mergeSrc[i];
		tStart = target.startIdx;	
		sLen = merge.length;
		
		//从插入点位置开始检索
		for(var j=insertIdx; j<sLen; j++){
			cur = merge[j]
			cStart = cur.startIdx;
			
			//匹配到最后一项的时候
			if(j===(sLen-1)){
				if( cStart < tStart ){
					merge.push(target);
					insertIdx = j+1;
				}else{
					insertIdx = j;
					merge.splice(j,0,target)
				}
			}else{
				next = merge[j+1];
				nStart = next.startIdx;
			
				//匹配中间值 立刻返回
				if((cStart < tStart) && (tStart < nStart )){
					insertIdx = j+1;
					merge.splice(insertIdx, 0, target);
				
					break;
				};
			}
		}
	}
	
	//merge得到了标签在parseStr位置。接下来匹配结构。
	for(var i=0;i<merge.length;i++){
		log("parseStr"+parseStr.slice(merge[i].startIdx, merge[i].endIdx));
	}
	//debugger;
	function getEndTag(check, htmlArray){

		var  seek = htmlArray[check];
		//测试对象是否是双标签	
		if(!sigleTag.test(seek.tag)){	
		
			for(var i=check+1; i<htmlArray.length; i++){
			
					//检索对象是否是结束标签
					if(htmlArray[i].endFlag){
						if(seek.tag === htmlArray[i].tag){
						
							//如果找到了结束标签就设置endTag Idx,并返回结束标签的位置 不进行查找。
							seek.endTagIdx = i;
							return i;
						}
						
						//忽略<div></p></div>中的</p>
					
					//不是结束标签就是子类。
					}else{
					
						//忽略<div><p></p>中的<div>
						//得到子类结束标签的位置，并从子类结束标签的位置开始检索。
						i = getEndTag(i, htmlArray);
						
					}
			}
			
		//匹配单标签 返回本身自己的位置
		}else{
			return check;
		}
	}
	//debugger;
	//log(merge)
	for(var i=0;i<merge.length; i++){
		i = getEndTag(0,merge);
	}
	
	log(merge)

}	

RBT.showWithTable = function(HTMLS){
	var trs= [];
	function createTable(idx,val){
		var tab  = document.getElementById("tab");
		var tr = document.createElement("tr");
		var tds = [];
		var td;
		for(i=0;i<arguments.length;i++){
			td = document.createElement("td");
			td.innerHTML= arguments[i];
			tds.push(td);
			tr.insertBefore(td);
		}
		tab.insertBefore(tr);
		trs.push(tr);
		return tds;
	}
	for(var i=0;i<HTMLS.length;i++){
		if(HTMLS[i].endFlag){
			continue;
		}else{
			
		}
	}
}

/*
有些属性必须全局搜索才有用。
			log(tags)
		//log("开始位置到最后匹配位置的字符串"+RegExp["$`"])
		//log("开始位置到最后匹配位置的字符串"+startTagReg.leftContext)
		
		//log("最近一次捕获组"+RegExp["$+"])
		//log("最近一次捕获组"+startTagReg.lastParen)
		
		//log("最后匹配位置到结尾的字符串"+RegExp["$'"])
		//log("最后匹配位置到结尾的字符串"+startTagReg.rightContext)

		
		//log("检测是否多行匹配"+RegExp["$*"])
		//log("检测是否多行匹配"+startTagReg.multiLine)
		
		//log("最近一次匹配项"+RegExp["$&"])
		//log("最近一次匹配项"+startTagReg.lastMatch)
		
		//log("最近一次匹配字符串"+RegExp["$_"])
		//log("最近一次匹配字符串"+startTagReg.input)	

		//log("捕获最后第9个"+RegExp["$1"]);
		//log("捕获最后第8个"+RegExp["$2"]);
		//log("捕获最后第7个"+RegExp["$3"]);
		//log("捕获最后第6个"+RegExp["$4"]);
		//log("捕获最后第5个"+RegExp["$5"]);
		//log("捕获最后第4个"+RegExp["$6"]);
		//log("捕获最后第3个"+RegExp["$7"]);
		//log("捕获最后第2个"+RegExp["$8"]);
		//log("捕获最后第1个"+RegExp["$9"]);	
		//log("首次匹配内容的开始位置"+RegExp.index)
		//log("首次匹配内容中最后一个字符的下一个位置"+RegExp.lastIndex)必须为全局

	
*/