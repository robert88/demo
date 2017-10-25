/**
 * Ara's JavaScript Library
 */

var ARA = window.ARA || {};
ARA.constants = ARA.constants || {
	messages : {
		noID : "no id",
		noPattern : "no pattern"
	}
};

ARA.utils = ARA.utils || {};
ARA.utils.random = function(lower, upper){
	return Math.floor(Math.random() * (upper-lower) + lower);
};