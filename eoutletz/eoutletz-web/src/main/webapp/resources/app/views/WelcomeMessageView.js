define(['text!templates/WelcomeMessageTemplate.html'], function (tpl) {
	var View = Backbone.View.extend({
		
		initialize : function () {},
		
		render : function () {
//			var obj = {
//				PartnerName : window.app.models.Login.attributes.welcome.Sitename,
//				UserName : window.app.models.Login.attributes.welcome.Username
//			};
		
			var compiled = Mustache.to_html(tpl);
			if($('#logo-wrapper').html() === '') {
				$('#logo-wrapper').html(compiled);
			}
			log('load Welcome Message View');
		},
		
		postRender : function () {}
		
	});
	
	return View;
	
});