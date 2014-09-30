define(['text!templates/SystemMessageTemplate.html'], function (tpl) {
	var View = Backbone.View.extend({
		container_id : 'system-message',
		
		initialize : function () {},
		
		render : function (status) {
			var code = {};
			switch(status) {
				case 'default' :
					code.defaultstatus = true;
					break;
				case 'e500' :
					code.e500 = true;
					break;
				default:
					return false;
			}
			
			var compiled = Mustache.to_html(tpl, code);
			
			$('#wrapper').remove();
			$('#banner').remove();
			
			$('#' + this.container_id).append(compiled);
			
			this.postRender();
		},
		
		postRender : function () {
			
		}
		
	});
	
	return View;
});