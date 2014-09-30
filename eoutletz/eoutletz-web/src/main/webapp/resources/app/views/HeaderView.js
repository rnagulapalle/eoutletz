define(['text!templates/HeaderTemplate.html'], function (tpl) {
	
	var HeaderView = Backbone.View.extend({
		
		initialize : function () {
		},
		
		render : function () {
			var compiled = Mustache.to_html(tpl);
			
			$('#header').append(compiled);
			log('load Header View');
		},
		
		postRender : function () {}
		
	});
	
	return HeaderView;
	
});