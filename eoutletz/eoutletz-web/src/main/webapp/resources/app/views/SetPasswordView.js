define(['text!templates/SetPasswordTemplate.html'], function (tpl) {
	var SetPasswordView = Backbone.View.extend({
		
		classname : 'set-password-view',
		
		initialize : function () {},
		
		render : function () {
			var self = this, compiled, obj;
			self.undelegateEvents();
			
			compiled = Mustache.to_html(tpl, obj);
			
			$('#main-wrapper').html(compiled);
			
			this.postRender();
			
			self.delegateEvents();
			
			return this;
		},
		
		postRender : function () {
			var self = this;
			$('.activate-account').on('click', function () {
				$('#password').addClass('error');
				$('.point-wrap').show();
				$('.password-strength').show();
			});
		},
		
		updateElements : function () {
			$('.remind').hide();
		}
	});
	
	return SetPasswordView;
});