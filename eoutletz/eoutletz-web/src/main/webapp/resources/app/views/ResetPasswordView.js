define(['text!templates/ResetPasswordTemplate.html'], function (tpl) {
	var ResetPasswordView = Backbone.View.extend({
		
		classname : 'reset-password-view',
		obj : {
			firstname : '',
			lastname : '',
			email : '',
			ticket : ''
		},
		
		initialize : function () {},
		
		render : function (ticket, email, firstname, lastname) {
			var self = this, compiled;
			self.undelegateEvents();
			
			self.obj.email = email;
			self.obj.firstname = firstname;
			self.obj.lastname = lastname;
			self.obj.ticket = ticket;
			
			compiled = Mustache.to_html(tpl, self.obj);
			
			$('#main-wrapper').html(compiled);
			
			this.postRender();
			
			self.delegateEvents();
			
			return this;
		},
		
		showErrors : function () {
			var PasswordOne = $('#password-one'), PasswordTwo = $('#password-confirm');
			PasswordOne.addClass('error');
			$('#password-one-label').addClass('label-error');
			PasswordTwo.addClass('error');
			$('#password-confirm-label').addClass('label-error');
		},
		
		hideErrors : function () {
			var PasswordOne = $('#password-one'), PasswordTwo = $('#password-confirm');
			PasswordOne.removeClass('error');
			$('#password-one-label').removeClass('label-error');
			PasswordTwo.removeClass('error');
			$('#password-confirm-label').removeClass('label-error');
			window.app.views.Error.hideErrors();
		},
		
		postRender : function () {
			var validator = window.app.validator, 
				errors = {atLeastOneAlpha : false, atLeastOneDigit : false, lengthRange: false}, error_counts,fullStrength = 15, currentStrength = 0,
				Error_list = $('#password-error-list'), PasswordOne = $('#password-one'), PasswordTwo = $('#password-confirm'),
				app = window.app.views, self = this;
			
			// validate password rules
			PasswordOne.on('keyup', function (e) {
				var p = $(this).val().replace(/(^\s*)|(\s*$)/g,"");
				errors = validator.validate(p);
				error_counts = 0,
				strength = validator.passwordStrength(p);
				
				for(o in errors) {
					if(!errors[o]) {
						Error_list.find('.' + o).removeClass('success').addClass('error');
						error_counts++;
					}
					else {
						Error_list.find('.' + o).removeClass('error').addClass('success');
					}
				}
				
				if(p === '') {
					PasswordOne.removeClass('error');
					$('#password-one-label').removeClass('label-error');
					Error_list.hide();
				}
				else {
					if(error_counts > 0) {
						Error_list.show();
						PasswordOne.addClass('error');
						$('#password-one-label').addClass('label-error');
					}
					else {
						Error_list.hide();
						PasswordOne.removeClass('error');
						$('#password-one-label').removeClass('label-error');
					}
				}
				
				// set password strength
				currentStrength = ((Math.min(fullStrength, strength)/fullStrength )*100) + "%";
				$('#password-strength-meter').css('width', currentStrength);
				
				if(p === '') {
					$(".password-strength").hide();
					$("#password-strength-text").html('');
				}
				else {
					$(".password-strength").show();
					$('#password-strength-text').attr('class', '');
					$('#password-strength-meter').attr('class', '');
					if(strength >= 12) {
				        $("#password-strength-text").html('strong').addClass('green');
				        $('#password-strength-meter').addClass('green-percent');
				    }
				    else if(strength >= 6 && strength <= 12) {
				    	$("#password-strength-text").html('moderate').addClass('orange');
				    	$('#password-strength-meter').addClass('yellow-percent');
				    }
				    else {
				    	$("#password-strength-text").html('weak').addClass('red');
				    	$('#password-strength-meter').addClass('red-percent');
				    }
				}
 				
			}); 
			$('#password-submit').on('click', function () {
				app.Error.hideErrors();
				if(PasswordOne.val().replace(/(^\s*)|(\s*$)/g,"") !== PasswordTwo.val().replace(/(^\s*)|(\s*$)/g,"")) {
					self.showErrors();
					// show the error message
					window.app.views.Error.showErrors('password-match');
				}
				else if(PasswordOne.val() == '' || PasswordTwo.val() == '') {
					self.showErrors();
					// show the error message
					window.app.views.Error.showErrors('invalid-password');
				}
				else {
					for(o in errors) {
						if(!errors[o]) {
							self.showErrors();
							return;
						}
					}
					self.hideErrors();
					//app.PopUp.showPopUp('password-updated');
					// submit to reset the password
					$.ajax({
						url : window.app.env.urls.resetPassword + 
							'?emailAddress=' + self.obj.email + '&newPassword=' + PasswordOne.val().replace(/(^\s*)|(\s*$)/g,"") + 
							'&newPassword2=' + PasswordTwo.val().replace(/(^\s*)|(\s*$)/g,"") + '&ticket=' + self.obj.ticket + 
							'&firstName=' + $('#reset-firstname').html() + '&lastName=' + $('#reset-lastname').html(),
						dataType : 'json',
						contentType : 'application/json',
						type : 'post',
						success : function (data) {
							if(!data.hasErrors) {
								// post to login
								$('#password').val(PasswordOne.val().replace(/(^\s*)|(\s*$)/g,""));
								$('#sign-in-form').submit();
							}
							// errors, so let's display it
							else {
								app.Error.showErrors('reset-password', data.errorMessage[0]);
							}
						},
						error : function (data) {
							// TODO: need to handle fail
						}
					});
					
				}
			});
		}
	});
	
	return ResetPasswordView;
});