
define(['../app/template', 
        'models/LoginModel',
        'views/HeaderView', 
        'views/FooterView',
        'views/ErrorView',
        'views/SystemMessageView',
        'views/PopUpView',
        'views/LoginView',
        'views/WelcomeMessageView',
        'views/SetPasswordView',
        'views/ResetPasswordView',
        'views/PasswordExpiredView',
        //'views/ActivateAccountView',
        'views/ActivateLoginView',
        'views/BannerView',
        'views/EmailActivationView',
        'util/validation',
        'util/validator'], 
  function (LoadTemplate, 
		  	LoginModel,
		  	HeaderView, 
		  	FooterView,
		  	ErrorView,
		  	SystemMessageView,
		  	PopUpView,
		  	LoginView,
		  	WelcomeMessageView,
		  	SetPasswordView,
		  	ResetPasswordView,
		  	PasswordExpiredView,
		  	//ActivateAccountView,
		  	ActivateLoginView,
		  	BannerView,
		  	EmailActivationView,
		  	Validation,
		  	Validator,
		  	Router) {
	var app = (function () {
		
		log('app loading...');
		
		this.router 		= {};
		this.views 			= {};
		this.models 		= {};
		this.collection 	= {};
		this.events 		= _.extend({}, Backbone.Events);
		this.template 		= LoadTemplate;
		this.validation		= Validation;
		this.validator		= Validator;
		this.env			= {};
		
		this.models.Login = new LoginModel();
		
		// load the global views
		this.views.Header = new HeaderView();
		this.views.Footer = new FooterView();
		this.views.Login = new LoginView();
		this.views.WelcomeMessage = new WelcomeMessageView();
		this.views.SetPassword = new SetPasswordView();
		this.views.ResetPassword = new ResetPasswordView();
		this.views.PasswordExpired = new PasswordExpiredView();
		//this.views.ActivateAccount = new ActivateAccountView();
		this.views.ActivateLogin = new ActivateLoginView();
		this.views.Banner = new BannerView();
		this.views.EmailActivation = new EmailActivationView();
		this.views.Error = new ErrorView();
		this.views.SystemMessage = new SystemMessageView();
		this.views.PopUp = new PopUpView();
		
		this.env.urls = {};
		this.env.urls.sendMail = '/auth/do/forgot-password/send-mail?emailAddress=';
		this.env.urls.resetPassword = '/auth/do/forgot-password/reset-password';
	});
	
	return app;
});


