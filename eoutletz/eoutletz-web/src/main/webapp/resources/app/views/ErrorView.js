define(['text!templates/ErrorTemplate.html'], function (tpl) {
	
	var View = Backbone.View.extend({
		id : 'error-wrap',
		
		initialize : function () {},
		
		render : function () {
			var compiled = Mustache.to_html(tpl);
			
			$('#' + this.id).append(compiled);
			log('load Error View');
		},
		
		showErrors : function (type, message) {
			try {
				$('#' + this.id).show();
				$('#' + this.id).find('li').hide();
				switch(type) {
					case 'password-match' :
						$('#' + this.id).find('li.password-match').show();
						break;
					case 'invalid-email' :
						$('#' + this.id).find('li.invalid-email').show();
						break;
					case 'invalid-inputs' :
						$('#' + this.id).find('li.invalid-inputs').show();
						break;
					case 'invalid-password' :
						$('#' + this.id).find('li.invalid-password').show();
						break;
					case 'reset-password' :
						$('#' + this.id).find('li.reset-password').html(message).show();
						break;
					default:
						return;
				}
			} catch (e) {
				log('Error cannot show error message ' + e.message);
			}
		},
		
		hideErrors : function () {
			$('#' + this.id).hide();
		},
		
		postRender : function () {}
		
	});
	
	return View;
	
});