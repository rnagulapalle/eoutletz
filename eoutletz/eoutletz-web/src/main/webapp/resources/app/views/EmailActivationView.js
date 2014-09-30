define(['text!templates/EmailActivationTemplate.html'], function (tpl) {
	var EmailActivationView = Backbone.View.extend({
		
		classname : 'email-activation-view',
		
		initialize : function () {},
		
		render : function () {
			var self = this, compiled, obj;
			self.undelegateEvents();
			
			compiled = Mustache.to_html(tpl, obj);
			
			$('#wrapper').html(compiled);
			
			this.postRender();
			
			self.delegateEvents();
			
			return this;
		},
		
		events : {
			'click #continue-button' : function () {
				log('clicked');
			}
		},
		
		postRender : function () {
			$('#login').hide();
			$('#banner').removeClass('hidden');
			$('body').removeAttr('id');
			$('#footer').hide();
			$('.footer-bottom').removeClass('hidden');
			
			$('#continue-button').on('click', function () {
				$('#wrapper').find('.redirect-text').html('redirecting to benefit advisor...');
			});
		},
		
		updateText : function () {
			var html = '<span class="activated">Your password has been set up.</span>Now you can shop with your HRA up to $5,600 annually';
			$('#wrapper').find('.alert-info').html(html);
		}
	});
	
	return EmailActivationView;
});