define(['text!templates/PasswordExpiredTemplate.html'], function (tpl) {
	var PasswordExpiredView = Backbone.View.extend({
		
		classname : 'password-expire-view',
		
		initialize : function () {},
		
		render : function () {
			var self = this, compiled;
			self.undelegateEvents();
			
			compiled = Mustache.to_html(tpl);
			
			$('#main-wrapper').html(compiled);
			
			this.postRender();
			
			self.delegateEvents();
			
			return this;
		},
		
		postRender : function () {}
	});
	
	return PasswordExpiredView;
});