define( function () {
	// dev location
	var _template_dir = env.tmpDir,
		promises = {},
 
  	// Cache the returned deferred/promise by the id of the template
  	// so that we can prevent multiple requests for the same template
  	// from making the ajax call.
  	//
  	// This code is only safe to run synchronously. There exists a
  	// race condition in this function, when run asynchronously,
  	// which would nullify the benefit under certain circumstances.

	_loadTemplateAsync = function(tmpId){
		var promise = '';
		
	    promise = promises[tmpId] || $.get(_template_dir + tmpId + '.html').error(function () {
	    	if(debug) {
	    		log('Cannot load the ' + tmpId + ' HTML.');
	    	}
	    });
	    promises[tmpId] = promise;
	    return promise;
	};
	
	return {
		// Use jQuery to asynchronously load the template. 
		loadTemplate : function(templateId, callback){
			var tmpId = templateId.replace("#", "");
		    var promise = _loadTemplateAsync(tmpId);
		    //var app = this;

		    promise.done(function(template){
		    	callback.call(this, template);
		    	// localized content
		    	//app.localizedContent();
		    });
		}
	};
});