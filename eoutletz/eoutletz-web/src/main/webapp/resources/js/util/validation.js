	var InitializeValidation = function (rules) {
		var results = {
				password: {
		            atLeastOneDigit: 0,
		            atLeastOneAlpha: 0,
		            lengthRange: 0,
		            notSameEmail: 0,
		            noThreeSameChar: 0
		            
		        },
		        email: 0
		 }

		    var strings = {
		        atLeastOneAlpha: "Have at least 1 letter",
		        atLeastOneDigit: "Have at least 1 number",
		        lengthRange: "Have 6 to 20 characters",
		        notSameEmail: "Cannot be the same as email address",
		        noThreeSameChar: "Cannot have 3 of the same characters in a row"
		    }

		    var rules = rules;

		    var status = {
		        emailErrors: 0,
		        passwordErrors: 0
		    }

		    var showTop = 0;

		    var firstPasswordBlurHappened = 0;

		    var firstEmailBlurHappened = 0;

		    this.setShowTop = function (val) {
		        showTop = val;
		    }

		    this.getShowTop = function () {
		        return showTop;
		    }

		    this.setFirstEmailBlurHappened = function (val) {
		        firstEmailBlurHappened = val;
		    }

		    this.getFirstEmailBlurHappened = function () {
		        return firstEmailBlurHappened;
		    }

		    this.setFirstPasswordBlurHappened = function (val) {
		        firstPasswordBlurHappened = val;
		    }

		    this.getFirstPasswordBlurHappened = function () {
		        return firstPasswordBlurHappened;
		    }

		    this.validate = function (fieldType, text) {

		        if (fieldType == "password") {

		            status.passwordErrors = 0;

		            if (rules.password.atLeastOneDigit) {

		                if ((text.match(/\d/g)) == null) {

		                    status.passwordErrors++;
		                    results.password.atLeastOneDigit = 0;

		                } else {
		                    results.password.atLeastOneDigit = 1;
		                }

		            } //atLeastOneDigit

		            if (rules.password.atLeastOneAlpha) {

		                if ((text.match(/\D/g)) == null) {

		                    status.passwordErrors++;
		                    results.password.atLeastOneAlpha = 0;

		                } else {
		                    results.password.atLeastOneAlpha = 1;
		                }
		            } //atLeastOneAlpha

		            if (rules.password.lengthRange) {
		            
		                if ((text.length < rules.password.min) || (text.length > rules.password.max)) {

		                    status.passwordErrors++;
		                    results.password.lengthRange = 0;
		                } else {
		                    results.password.lengthRange = 1;
		                }

		            } //lengthRange
		            
		            // same as email?
		            if(rules.password.notSameEmail) {
		            	if(text === $('#email').val()) {
		            		status.passwordErrors++;
		            		results.password.notSameEmail = 0;
		            	}
		            	else {
		            		results.password.notSameEmail = 1;
		            	}
		            }
		            
		            // first 3 char same?
		            if(rules.password.noThreeSameChar) {
		            	if(!/^(?!.*(.)\1\1)/.test(text)) {
		            		status.passwordErrors++;
		            		results.password.noThreeSameChar = 0;
		            	}
		            	else {
		            		results.password.noThreeSameChar = 1;
		            	}
		            }

		        } 
		        else if(fieldType == "email") {

		            var re = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;

		            text = text.trim();

		            var result = re.test(text);

		            if(rules.email.email) {

		            if (!result) {
		                status.emailErrors = 1;
		                results.email = 0;
		            } else {
		                status.emailErrors = 0;
		                results.email = 1;
		            }

		            }

		        }
		    }; // validate

		    this.handleResults = function(fieldType, value, target) {

		        var areErrors = 0;

		        if (fieldType == "password") {
		            areErrors = status.passwordErrors;
		        } 
		        else if (fieldType == "email") {
		            areErrors = status.emailErrors;
		        }

		        if (!areErrors) {
		            $('#' + fieldType + 'Error').css("display", "none");

		            $("#" + fieldType + "Text").removeClass("label-error").addClass("label-success");
		            
		            $(this).removeClass("error");
		        } else {
		            $("#" + fieldType + "Text").addClass("label-error").removeClass("label-success");
		            
		            target.addClass("error");

		            $('#' + fieldType + 'Error').css("display", "block");

		            if (fieldType == "password") {

		                var errorContainer = $(".passwordErrors");
		                //errorContainer.empty();

		                for (key in results.password) {

		                    var errClass = "";
		                    var passed = results.password[key];
		                    //alert(passed);

		                    var isRequired = rules.password[key];

		                    if (isRequired) {
		                        
		                        if (!passed) {
		                            errClass = "error";
		                        } else {
		                            errClass = "success";
		                        }

		                        //var resultLi = $("<li class='" + errClass + "'>" + strings[key] + "</li>");
		                        //errorContainer.append(resultLi);
		                        $("#" + key).attr('class', errClass);
		                    }
		                
		                }

		            } //if fieldType == "password"
		        }; //else !areErrors

		       // console.log("password: " + status.passwordErrors + " email: " + status.emailErrors);

		        var totalErrors = status.passwordErrors + status.emailErrors;
		        $('#numErrors').html(totalErrors);

		        if (showTop) {

		            if ((status.passwordErrors == 0) && (status.emailErrors == 0)) {

		                $('#ErrorWrapContainer').hide();

		            } else {

		                $('#ErrorWrapContainer').show();

		                if($('#password2').val() == '') {
		                	$('#ErrorWrapContainer').find('.error-lists').find('.text').hide();
		                	$('#ErrorWrapContainer').find('.error-lists').find('.passwordText').hide();
		                	$('#ErrorWrapContainer').find('.error-lists').find('.emailText').hide();
		                	$('#ErrorWrapContainer').find('.errors').show();
		                }
		                else {
		                	$('#ErrorWrapContainer').find('.errors').hide();
		                	$('#ErrorWrapContainer').find('.error-lists').find('.text').show();
		                	if (status.passwordErrors > 0) {
			                	$('#ErrorWrapContainer').find('.error-lists').find('.passwordText').show();
			                
			                } else {
			                
			                	$('#ErrorWrapContainer').find('.error-lists').find('.passwordText').hide();
			                }
		                }
		                
		                if (status.emailErrors > 0) {
		                	$('#ErrorWrapContainer').find('.error-lists').find('.emailText').show();
		                } else {
		                	$('#ErrorWrapContainer').find('.error-lists').find('.emailText').hide();
		                }
		            }
		        }

		    }
	};
	
