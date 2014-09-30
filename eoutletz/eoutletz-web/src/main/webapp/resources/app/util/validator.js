define(function () {
	var validator = {
		password : {
			min : 6,
			max : 20
		},
		
		results : {
			atLeastOneDigit: true,
			atLeastOneAlpha: true,
			lengthRange: true
//			notSameEmail: 0,
//			noThreeSameChar: 0
		},
		
		regexRules : {
			atLeastOneAlpha : /[A-z]/g,
			atLeastOneDigit : /\d/g
		},
		
		validate : function (text) {
			this.results.atLeastOneAlpha = true;
			this.results.atLeastOneDigit = true;
			this.results.lengthRange = true;
			
			/* validate 6-20 character length */
			if ((text.length < this.password.min) || (text.length > this.password.max)) {
				this.results.lengthRange = false;
	        }
			/* at least 1 number */
			if ((text.match(this.regexRules.atLeastOneDigit)) === null) {
				this.results.atLeastOneDigit = false;
	        }
			/* at least 1 alpha */
			if ((text.match(this.regexRules.atLeastOneAlpha)) === null) {
				this.results.atLeastOneAlpha = false;
	        }
			return this.results;
		},
		
		validateEmail : function (email) {
			var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;;
			return regex.test(email);
		},
		
		/**
		 * validate the password strength
		 * @param String the password
		 */
		passwordStrength : function (password) {
			try {
				var regex = {
						number : /\d/,
						upperCase : /[A-Z]/,
						lowerCase : /[a-z]/,
						special : /[-\/\\^$*+?.()#&|[\]{}]/g
					};
				var meterMult = 1;
				for (var k = 0; k < password.length; k++) {
			        var pchar = password.charAt(k);
			        if(regex.number.test(pchar)){
			            meterMult += 0.75;
			        }
			    
			        if(regex.upperCase.test(pchar)){
			            meterMult += 1;
			        }
			        
			        if(regex.special.test(pchar)){
			            meterMult += 1;
			        }
			        
			        if(regex.lowerCase.test(pchar)){
			            meterMult += 0.25;
			        }
			    }
				
				if(password.length === 0) {
					meterMult = 0;
				}
				
				return meterMult;
			} catch (e) {
				log('Error validating password strength ' + e.message);
			}
			return 0;
		}
	};
	
	return validator;
});
