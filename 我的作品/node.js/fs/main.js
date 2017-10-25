	var FS = require("fs");
	var PATH = require("path");
	var color = require("colors");
	var CMS_ROOT =PATH.join(PATH.dirname(process.argv[1]),"..");
	require("..//Node.js source//hour01//example01//server.js")
	var log = function(str){
		console.log(str+"......来自".red+log.caller.name.red);
	}
	//src,dst必须是绝对路径，且所有的路径必须是斜杠。
	//src是被复制的对象,dst是写入的对象
	function copy(src, dst, callback){
		//FS.writeFileSync(dst,FS.readFileSync(src));bug :with big file
		var read, write;
		if(typeof src === "string"){
			src = src.replace(/\\/g,"/");
			read = FS.createReadStream(src);
		}else if(typeof src === "object"){
			read = src;
		}
		if(typeof dst === "string"){
			dst = dst.replace(/\\/g,"/");
			write = FS.createWriteStream(dst);
		}else{
			write = dst;
		}
		//if write not exsit
		if(read&&write){
			read.pipe(write);
			read.on("data",function(chunk){
				log(chunk)
				read.pause();
				log(chunk);
				read.resume();
			})
		}
	}
	
	function searchFile(path,file){
		var dir = FS.readdirSync(path);
		var isHave = false;
		dir.forEach(function (val,i){
			if(FS.statSync(val).isDirectory()){
				searchFile(val);
			}
			if(FS.exists()){
				isHave=true;
				return false;
			}
		})
		return isHave;
	}
	
	//FS.exists(path,callback)用法
	//这个函数是异步的。
	//path路径必须是绝对路径，
	//可以检验文件夹和文件是否存在 回调函数参数是个boolean值。
	function isExist(path){
		var ishave = false;
		FS.exists(path, function(exists){
			isHave = exists;//无效代码
			log("check "+path+" is exists ? "+exists)
		})
		log("外面会先执行"+ishave)
		return ishave;
	}
	
	//FS.existsSync(path)用法
	//这个函数是同步的。
	//path路径必须是绝对路径，
	//返回值表示是否存在指定文件或者文件夹。
	function isExistSync(path){
		var ishave = false;
		ishave = FS.existsSync(path)
		log("同步执行"+ishave)
		return ishave;
	}
	
	//FS.readdirSync(path)用法
	//path路径必须是绝对路径，返回值是包含文件名和文件夹名的数组。
	//FS.statSync(pathname)返回值是一个stats对象。请参考stats对象。
	function dirPath(path,callback){
		var dir = FS.readdirSync(path)
		dir.forEach(
			function(file){
				var pathname =	PATH.join(path,file);
				if(FS.statSync(pathname).isDirectory()){
					dirPath(pathname,callback);
				}else{
					callback(pathname);
				}
			}
		);
	}

	function dirname(path){
		path = path.replace(/\\/g,"/");
		var lastIndex = path.lastIndexOf("/");
		if(lastIndex>=0){
			return path.slice(0,lastIndex);
		}
		return "";
	}

	function main(){
		var subPath = "blog";
		var name = "index.html";
		var src = PATH.join(CMS_ROOT,subPath,name);
		var dst = PATH.join(CMS_ROOT,"fs/copy","robert.html");
		if(typeof src === "string"){
			if(isExistSync(src)){
				copy(src,dst);
			}
		}
	}

main();
