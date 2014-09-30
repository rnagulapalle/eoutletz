/*
 * debug mode
 */
var debug = true;

var log = function (message) {
	if(!message) { return; }
	if(window.console && debug) { console.log(message); }
};

var env = {
	tmpDir : '../../app/templates/'
};

requirejs.config({
	namespace : 'ehealth',
	paths : {
		models 		: '../../app/models',
		views		: '../../app/views',
		templates	: '../../app/templates',
		util		: '../../app/util',
		text		: '../../app/lib/require/text'
	}
});


define(['../../app/app', '../../app/router'], function (App, Router) {
	var app = new App();
	
	window.app = app;
	app.router = new Router();
	
	app.events.on('model:getLogin', app.models.Login.fetch(), app);
	
	
});