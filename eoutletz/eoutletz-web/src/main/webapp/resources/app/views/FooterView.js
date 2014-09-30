define(['text!templates/FooterTemplate.html'], function (tpl) {
	
	var FooterView = Backbone.View.extend({
		
		initialize : function () {
		},
		
		render : function () {
			var compiled = Mustache.to_html(tpl);
			
			$('#footer').append(compiled);
			log('load Footer View');
		},
		
		postRender : function () {}
		
	});
	
	return FooterView;
	
});