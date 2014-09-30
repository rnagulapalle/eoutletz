define(['text!templates/ActivateAccountTemplate.html'], function (tpl) {
	var ActivateAccountView = Backbone.View.extend({
		
		classname : 'activate-account-view',
		
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
		
		postRender : function () {
			$('#login').hide();
			$('body').removeClass('v2');
		}
	});
	
	return ActivateAccountView;
});