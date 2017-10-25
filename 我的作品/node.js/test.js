var  http = require("http"); 
   
http.createServer( function (req, res) { 
  res.writeHead( 200 , {"Content-Type": "text/html"}); 
  res.write("<h1>Node.js</h1>"); 
  res.write("<p>Hello World</p>");
  res.end("<p>beyondweb.cn</p>");
}).listen(3000,"127.0.0.1"); 
console.log("HTTP server is listening at port 3000.");
/*
var net = require('net')
var chatServer = net.createServer()
chatServer.on('connection', function(client) {
client.write('Hi!\n');
client.write('Bye!\n');
client.end()
})
chatServer.listen(9000)
*/
/*
var net = require('net')
var chatServer = net.createServer()
chatServer.on('connection', function(client) {
client.write('Hi!\n');
client.write('<form action="http://127.0.0.1/" method="post"><input type="text" ><input type="submit" value="tijiao"></form>');

client.on('data', function(data) {
console.log(data)
})
})
chatServer.listen(9000)*/
/*
var fs = require('fs');
var data = fs.readFileSync('../显示桌面.txt', 'utf-8');
console.log(typeof data);
console.log('end.');
*/
/*
function readFileCallBack(err, data) {
if (err) {
console.error(err);
} else {
console.log(data);
}
}
var fs = require('fs');
fs.readFile('../显示桌面.txt', 'utf-8', readFileCallBack);
console.log('end.');*/
/*
var EventEmitter = require('events').EventEmitter;
var event = new EventEmitter();
event.on('some_event', function() {
console.log('some_event occured.');
});
setTimeout(function() {
event.emit('some_event');
}, 1000);*/
//getmodule.js
/*
var myModule = require('./mode');
myModule.setName('BYVoid');
myModule.sayHello();*/
/*
var Hello = require('./mode');
hello = new Hello();
hello.setName('BYVoid');
hello.sayHello();*/
/*
{
"name": "mypackage",
"description": "Sample package for CommonJS. This package demonstrates the required
elements of a CommonJS package.",
"version": "0.7.0",
"keywords": [
"package",
"example"
],
"maintainers": [
{
"name": "Bill Smith",
"email": "bills@example.com",
}
],
"contributors": [
{
"name": "BYVoid",
"web": "http://www.byvoid.com/"
}
],
"bugs": {
"mail": "dev@example.com",
"web": "http://www.example.com/bugs"
},
"licenses": [
{
"type": "GPLv2",
"url": "http://www.example.org/licenses/gpl.html"
}
],
"repositories": [
{
"type": "git",
"url": "http://github.com/BYVoid/mypackage.git"
}
],
"dependencies": {
"webkit": "1.2",
"ssl": {
"gnutls": ["1.0", "2.0"],
"openssl": "0.9.8"
}
}
}
*/
/*
process.on('exit', function(code) {
  // do *NOT* do this
  setTimeout(function() {
    console.log('This will not run');
  }, 100);
  console.log('About to exit with code:', code);
});*/
/*
process.on('uncaughtException', function(err) {
  console.log('Caught exception: ' + err);
});

setTimeout(function() {
  console.log('This will still run.');
}, 500);

// Intentionally cause an exception, but don't catch it.
nonexistentFunc();
console.log('This will not run.');*/
// Start reading from stdin so we don't exit.
/*process.stdin.resume();

process.on('SIGINT', function() {
  console.log('Got SIGINT.  Press Control-D to exit.');
});*/
/*
console.show = function(d) {
  process.stdout.write(d + '\n');
};
console.show("sdfsdfsdfskdjfkdsjfkdsjfkjds")*/
/*
process.stdout.on('resize', function() {
  console.log('screen size has changed!');
  console.log(process.stdout.columns + 'x' + process.stdout.rows);
});*/

/*
process.stdin.on('readable', function(chunk) {
console.log("readable")
  var chunk = process.stdin.read();
  if (chunk !== null) {
    process.stdout.write('data: ' + chunk);
  }
});

process.stdin.on('end', function() {
  process.stdout.write('end');
});*/
/*
process.argv.forEach(function(val, index, array) {
  console.log(index + ': ' + val);
});*/
/*
console.log('Starting directory: ' + process.cwd());
try {
  process.chdir('../printk');
  console.log('New directory: ' + process.cwd());

  console.log('Current gid: %o' , process.config);

}
catch (err) {
  console.log('chdir: ' + err);
}*/
/*
process.on('SIGHUP', function() {
  console.log('Got SIGHUP signal.');
});
console.log('This process is pid ' +process.platform);
setTimeout(function() {
  console.log('Exiting.');
  process.exit(0);
}, 100);

process.kill(process.pid, 'SIGHUP');*/
/*
var util = require('util');

console.log(util.inspect(process.memoryUsage()));*/
/*
process.nextTick(function() {
  console.log('nextTick callback');
});*/
/*
function MyThing(options) {
  this.setupOptions(options);

  process.nextTick(function() {
    this.startDoingStuff();
  }.bind(this));
}

var thing = new MyThing();
thing.getReadyForStuff();*/
/*
function maybeSync(arg, cb) {
  if (arg) {
    cb();
    return;
  }

  fs.stat('file', cb);
}*//*
var oldmask, newmask = 0644;

oldmask = process.umask(newmask);
console.log('Changed umask from: ' + oldmask.toString(10) +
            ' to ' + newmask.toString(10));*/
			//var time = process.hrtime();
// [ 1800216, 25 ]
/*
setTimeout(function() {
  var diff = process.hrtime(time);
  // [ 1, 552 ]
console.log(diff[0])
console.log(diff[1])
  console.log('benchmark took %d nanoseconds', diff[0] * 1e9 + diff[1]);
  // benchmark took 1000000527 nanoseconds
}, 1000);*/
/*
console.trace()
/*
console.trace();
var util = require('util');
console.trace();
*/
/*
var util = require('util');
util.log("sdfsd")
function Person() {
	this.name = 'byvoid';
	this.options = {
		name : "robert",
		say : {
			hello:function(){
				console.log(this.name+" hello")
			},
			tt:{
				name:"ss"
			}
		}
	}
	this.toString = function() {
		return this.name;
	};
}
var obj = new Person();
console.log(util.inspect(obj));
console.log("-------------------");
util.inspect.style={number:"red", boolean:"yellow",string:"green"}// date (magenta) regexp (red) null (bold) undefined (grey) special - only function at this time (cyan) * name (intentionally no styling)"
console.log(util.inspect(obj, true,3,"red"));
*/
var events = require('events');
var emitter = new events.EventEmitter();
emitter.addListener('someEvent', function(arg1, arg2) {
console.log('listener1', arg1, arg2);
});
emitter.on('someEvent', function(arg1, arg2) {
console.log('listener2', arg1, arg2);
});
emitter.on('someEvent1', function(arg1, arg2) {
console.log('listener2', arg1, arg2);
});
emitter.once('someEvent', function (stream) {
  console.log('Ah, we have our first user!');
});
console.log(emitter.listeners("someEvent"))
//emitter.removeAllListeners()
emitter.emit('someEvent', 'byvoid', 1991);
emitter.emit('someEvent1', 'robert', 1991);
var callback = function(stream) {
  console.log('someone connected!');
};
emitter.on('connection', callback);
// ...
emitter.emit('connection', 'yinyin', 1991);
emitter.removeListener('connection', callback);
