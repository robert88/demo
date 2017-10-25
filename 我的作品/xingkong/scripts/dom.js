/**
 * Ara's JavaScript Library: DOM
 */

var ARA = window.ARA || {};
ARA.dom = ARA.dom || {};


/**
 * spanify receives a DOM node reference (or an ID to one), iterates over all of
 * it's child nodes and wraps each character of the text nodes that it 
 * encounters with a span. By default only first level text nodes are 
 * processed. It can deep scan however and process all child text nodes.
 * It returns nothing as it directly modifies the DOM.
 *
 * @param  {String/Object}  el    An element ID or element reference in the DOM
 * @param  {Bool}           deep  (Optional), default is false. 
 *                                If true, all child nodes will be spanified.
 *                                If false, then only first level text nodes
 *                                will be spanified.
 */
ARA.dom.spanify = function(el, deep){
	el = ARA.dom.getElement(el);
	deep = !!deep;
	/*
	// spanify all child text nodes of el
	for(var i=0; i<el.childNodes.length; i++){
		if(el.childNodes[i].nodeType != 3) return false;
		var str = el.childNodes[i];
		for
	}
	*/
}

/**
 * getElement receives an element of unknown type and determines whether it's 
 * an element ID or a reference to an element in the DOM. If it's an ID it 
 * fetches and returns a reference to the element in the DOM with that ID.
 * If it's a reference to an element in the DOM it just returns it without
 * doing anything.
 *
 * @param    {String/Object}  el  An element ID or element reference in the DOM
 * @returns  {Object}
 */
ARA.dom.getElement = function(el){
	switch(typeof el){
		case "string":
			return document.getElementById(el);
		break;

		case "object":
		default:
			return el;
		break;
	}
}