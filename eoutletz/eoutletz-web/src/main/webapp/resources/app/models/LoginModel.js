define(function () {
	var Model = Backbone.Model.extend({
		urlRoot : '../../resources/app/data/jetsolutionsData.json',
		initialize : function () {
			log('load Login Model');
		},
		
		parse : function (response) {
			this.set({welcome: response.Welcome});
			this.set({sideinfo : response.SideBar});
			
			app.events.trigger('model:getLogin:finished');
			
			log('finished parsing Login Model');
		}
	});
	
	return Model;
	
});