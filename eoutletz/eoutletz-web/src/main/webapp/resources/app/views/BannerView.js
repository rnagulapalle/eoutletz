define(['text!templates/BannerTemplate.html'], function (tpl) {
	var BannerView = Backbone.View.extend({
		
		classname : 'banner-view',
		
		initialize : function () {},
		
		render : function () {
			var self = this, compiled, obj;
			self.undelegateEvents();
			
			compiled = Mustache.to_html(tpl, obj);
			
			$('#banner').html(compiled);
			
			this.postRender();
			
			self.delegateEvents();
			
			return this;
		},
		
		postRender : function () {
			$('#login').find('.welcome').find('.username').hide();
			$('#login').find('.welcome').find('.description').hide();
		}
	});
	
	return BannerView;
});