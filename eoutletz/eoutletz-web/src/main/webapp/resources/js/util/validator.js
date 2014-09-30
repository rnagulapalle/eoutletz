
	var validator = {
		password : {
			min : 6,
			max : 20
		},
		
		passwordStrengthVars : {
			current : 0,
			full : 15
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
		},
		
		doPasswordStrength : function (val, PasswordStrength, PasswordMeter) {
			try {
				// set password strength
				var strength = this.passwordStrength(val);
				
				this.passwordStrengthVars.current = ((Math.min(this.passwordStrengthVars.full, strength)/this.passwordStrengthVars.full )*100) + "%";
				PasswordMeter.css('width', this.passwordStrengthVars.current);
				
				if(val === '') {
					$(".password-strength").hide();
					PasswordStrength.html('');
				}
				else {
					$(".password-strength").show();
					PasswordStrength.attr('class', '');
					PasswordMeter.attr('class', '');
					if(strength >= 12) {
						PasswordStrength.html('strong').addClass('green');
						PasswordMeter.addClass('green-percent');
				    }
				    else if(strength >= 6 && strength <= 12) {
				    	PasswordStrength.html('moderate').addClass('orange');
				    	PasswordMeter.addClass('yellow-percent');
				    }
				    else {
				    	PasswordStrength.html('weak').addClass('red');
				    	PasswordMeter.addClass('red-percent');
				    }
				}
			} catch(e) {
				log('Error displaying password strength ' + e.message);
			}
			
		}
	};
	
	