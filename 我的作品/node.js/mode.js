/*//module.js
var name;
exports.setName = function(thyName) {
name = thyName;
};
exports.sayHello = function() {
console.log('Hello ' + name);
};
*/
function Hello() {
var name;
this.setName = function(thyName) {
name = thyName;
};
this.sayHello = function() {
console.log('Hello ' + name);
};
};
module.exports = Hello;