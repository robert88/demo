var ARA = window.ARA || {};
ARA.canvas = ARA.canvas || {};

ARA.canvas.Starfield = function(el, params){
	this.canvas = ARA.dom.getElement(el);
	if(this.canvas && this.canvas.getContext){
		this.ctx = this.canvas.getContext('2d');
	}else{
		return null;
	}
	
	params = params || {};
	this.fullScreen = !!params.fullScreen;
	this.xLimit = this.canvas.offsetWidth/2;
	this.yLimit = this.canvas.offsetHeight/2;
	this.zLimit = params.depth || 255;
	this.wave = {degree:0, dir:.1, ampl:25, freq:100};
	this.animSpeed = params.animSpeed || 50;
	this.starCount = params.starCount || 100;
	this.zoomLimit = params.zoomLimit || 2;
	this.zoomFactor = params.zoomFactor || .035;
	this.starShape = params.starShape || "star";
	this.waveX = params.waveX || false;
	this.waveY = params.waveY || false;
	this.waveRotation = params.waveRotation||false;
	this.stars = [];
	this.started = false;
	this.init();
};

ARA.canvas.Starfield.prototype.toString = function(){
	return "Starfield#" + this.canvas.id;
};

ARA.canvas.Starfield.prototype.init = function(){
	this.ctx.translate(this.xLimit, this.yLimit);
	this.stars = [];
	for(var i=0; i<this.starCount; i++){
		this.stars.push({
			x:this.newX(),
			y:this.newY(),
			z:this.newZ(),
			acc:this.newAcc(),
			color:this.newColor()
		});
		this.ctx.fillStyle = "rgb(" + this.stars[i].color + "," + this.stars[i].color + "," + this.stars[i].color + ")";
	}
};

ARA.canvas.Starfield.prototype.start = function(){
	this.started = true;
	this.intervalId = window.setInterval(function(objRef){
		return function(){
			objRef.oneStepForward.call(objRef)
		}
	}(this), this.animSpeed);
};

ARA.canvas.Starfield.prototype.stop = function(){
	this.started = false;
	window.clearInterval(this.intervalId);
};

ARA.canvas.Starfield.prototype.oneStepForward = function(){
	this.ctx.clearRect(-this.xLimit, -this.yLimit, this.xLimit*2, this.yLimit*2);
	for(var i=0; i<this.starCount; i++){
		var star = this.stars[i];
		
		if(Math.abs(star.x) > this.xLimit){
			this.recycleStar(star);
		}else{
			star.x += (star.x * star.acc) / 200;
			if(this.waveX) star.x += this.wave.ampl * Math.sin(this.wave.degree);
			if(this.waveRotation){
				this.ctx.transform(this.xLimit,this.yLimit);
				this.ctx.rotate(this.wave.degree);
			}
		}

		if(Math.abs(star.y) > this.yLimit){
			this.recycleStar(star);
		}else{
			star.y += (star.y * star.acc) / 200;
			if(this.waveY) star.y += this.wave.ampl * Math.sin(this.wave.degree);
			if(this.waveRotation){
				this.ctx.transform(this.xLimit,this.yLimit);
				this.ctx.rotate(this.wave.degree);
			}
		}
		
		star.z = (star.z < this.zoomLimit) ? star.z + this.zoomFactor : star.z;
		star.color += (star.color < 255) ? star.acc : 0;

		this.drawStar(star);
	}
	if(this.waveX || this.waveY){
		if(this.wave.degree > 90 || this.wave.degree < 0) this.wave.dir *= -.1;
		this.wave.degree += this.wave.dir;
	}
}

ARA.canvas.Starfield.prototype.drawStar = function(star){
	
	this.ctx.fillStyle = "rgb(" + star.color + "," + star.color + "," + star.color + ")";
	switch(this.starShape){
		case "square":
			this.ctx.fillRect(star.x, star.y, star.z, star.z);
		break;
		
		case "circle":
			this.ctx.beginPath();
			this.ctx.arc(star.x, star.y, star.z, 0, Math.PI*2, true);
			this.ctx.fill();
		break;
		
		case "star":
			var starCoords = ARA.canvas.Starfield.shapes.star;		
			this.ctx.beginPath();
			this.ctx.moveTo(star.x, star.y);
			for(var i=0; i<starCoords.length; i++){
				var coord = starCoords[i];
				this.ctx.lineTo(star.x - coord.x * star.z, star.y - coord.y * star.z);
			}
			this.ctx.fill();
		break;
	}
}

ARA.canvas.Starfield.prototype.recycleStar = function(star){
	star.x = this.newX();
	star.y = this.newY();
	star.z = this.newZ();
	star.acc = this.newAcc();
	star.color = this.newColor();
}

ARA.canvas.Starfield.prototype.newX = function(){
	return ARA.utils.random(-this.xLimit, this.xLimit);
}

ARA.canvas.Starfield.prototype.newY = function(){
	return ARA.utils.random(-this.yLimit, this.yLimit);
}

ARA.canvas.Starfield.prototype.newZ = function(){
	return .1;
}

ARA.canvas.Starfield.prototype.newAcc = function(){
	return ARA.utils.random(5, 25);
}

ARA.canvas.Starfield.prototype.newColor = function(){
	return 0;
}

ARA.canvas.Starfield.shapes = {};
ARA.canvas.Starfield.shapes.star = [
	{x:0,y:0},
	{x:1.27595,y:-2.58545},
	{x:4.12915,y:-3},
	{x:2.06455,y:-5.0125},
	{x:2.55195,y:-7.85415},
	{x:0,y:-6.5125},
	{x:-2.552,y:-7.85415},
	{x:-2.0646,y:-5.0125},
	{x:-4.1292,y:-3},
	{x:-1.276,y:-2.58545}
];