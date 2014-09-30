var main = (function () {
	var error_counts = 0,
	_passwordCheck = function() {
		var Password = $('#password'), Error_list = $('#password-error-list'), 
		PasswordLabel = $('#activate-password-label');             
    
		// validate password rules
		Password.on('keyup', function (e) {
    		var p = $(this).val().replace(/(^\s*)|(\s*$)/g,""),
    		errors = validator.validate(p),
			error_counts = 0;
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
				Password.removeClass('error');
				PasswordLabel.removeClass('label-error');
				Error_list.hide();
			}
			else {
				if(error_counts > 0) {
					Error_list.show();
					Password.addClass('error');
					PasswordLabel.addClass('label-error');
				}
				else {
					Error_list.hide();
					Password.removeClass('error');
					PasswordLabel.removeClass('label-error');
				}
			}
			// set password strength
			validator.doPasswordStrength(p, $("#password-strength-text"), $('#password-strength-meter'));
		});
    },
	_activateAccount = function(){
		// submit to activate account
		var Password = $('#password'), Error_list = $('#password-error-list'),
		PasswordLabel = $('#activate-password-label');  
		$('#activate-account-btn').on('click', function () {
			
			// validate email
			var validEmail = true;
			var emailLogin = $('#emailLogin').val();
			
			if(emailLogin) {
				validEmail = validator.validateEmail(emailLogin.replace(/(^\s*)|(\s*$)/g,""));
			}
			
			if(!validEmail) {
				$('#emailLogin').addClass('error');
				$('#activate-email-label').addClass('error');
			}
			else {
				$('#emailLogin').removeClass('error');
				$('#activate-email-label').removeClass('error');
				//console.log("error_counts: "+error_counts);
				if ($('#password').val()===''){
					Error_list.find('.success').removeClass('success').addClass('error'); 
					Error_list.show();
	 
					Password.addClass('error');
					PasswordLabel.addClass('label-error');
				}
				else if(error_counts === 0) {
					$('#sign-in-form').submit();
				}

			}
			
		});   
	}
	return {
        init : function () {
             _passwordCheck();
			_activateAccount();      
		}     
	}
})();
main.init();