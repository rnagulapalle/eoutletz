define(function () {
	var Router = Backbone.Router.extend({
		routes : {
			'SignOut' : 'signOut',
			'Login' : 'showLogin',
			'':'default',
			'PasswordExpired' :'passwordExpired',
			'SetPassword' : 'setPassword',
			'SetPassword-v3' : 'setPasswordAgain',
			//'ActivateAccount' : 'activateAccount',
			'ActivateLogin' : 'activateLogin',
			'EmailActivation' : 'emailActivation',
			'EmailActivation-v3' : 'emailActivationAgain',
			'ResetPassword/:params' : 'resetPassword',
			'SystemError/:status' : 'systemError',
			'SystemError' : 'systemError'
		},
		
		initialize : function () {
			var app = window.app;

			app.events.trigger('model:getLogin');
			
			app.views.Header.render();
			app.views.Error.render();
			app.views.PopUp.render();
			app.views.Footer.render();
			
			Backbone.history.start();
			
			log('load Router');
		},
		
		'systemError' : function (status) {
			if(!status) {
				status = 'default';
			}
			app.views.SystemMessage.render(status);
		},
		
		'passwordExpired' : function () {
			app.views.WelcomeMessage.render();
			app.views.PasswordExpired.render();
		},
		
		'showLogin' : function () {
			app.views.WelcomeMessage.render();
			app.views.Login.render();
		},
		
		'default' : function () {
			app.events.on('model:getLogin:finished', app.views.WelcomeMessage.render, app.views.WelcomeMessage);
			app.events.on('model:getLogin:finished', app.views.Login.render, app.views.Login);
			log('this is the main page');
		},
		
		'signOut' : function () {
			log('signed out');
		},
		
		'resetPassword' : function (query, params) {
			try {
				app.events.on('model:getLogin:finished', app.views.WelcomeMessage.render, app.views.WelcomeMessage);
				app.views.ResetPassword.render(params.ticket, params.emailAddress, params.firstName, params.lastName);
			} catch(e) {
				log('Error loading the Reset Password view ' + e.message);
			}
			
		},
		
		'setPassword' : function () {
			app.events.on('model:getLogin:finished', app.views.WelcomeMessage.render, app.views.WelcomeMessage);
			app.views.SetPassword.render();
			log('load set password view');
		},
		'setPasswordAgain' : function () {
			app.views.SetPassword.render();
			app.views.SetPassword.updateElements();
			log('load set password view');
		},
		/*'activateAccount' : function () {
			app.views.ActivateAccount.render();
			log('load activate account view');
		},*/
		'activateLogin' : function () {
			app.views.ActivateLogin.render();
			log('load activate login view');
		},
		'emailActivation' : function () {
			app.views.Banner.render();
			app.views.EmailActivation.render();
			log('load the email activation page');
		},
		'emailActivationAgain' : function () {
			app.views.Banner.render();
			app.views.EmailActivation.render();
			app.views.EmailActivation.updateText();
			log('load the email activation page');
		}
		
	});
	return Router;
	
});