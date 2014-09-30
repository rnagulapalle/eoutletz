define(['text!templates/PopUpTemplate.html'], function (tpl) {
	
	var View = Backbone.View.extend({
		id: 'pop-up-main',
		initialize : function () {},
		
		render : function () {
			var compiled = Mustache.to_html(tpl);
			$('body').append(compiled);
			this.postRender();
		},
		
		closePopUp : function () {
			$('.overlay-mask').hide();
			$('#' + this.id).hide();
			$('#' + this.id).find('.bd').hide();
		},
		
		clearErrors : function () {
			$('#' + this.id).find('label').removeClass('label-error');
			$('#' + this.id).find('input').removeClass('error');
		},
		
		showPopUp : function (type) {
			var self = this;
			try {
				$('.overlay-mask').show();
				$('#' + self.id).show();
				$('#' + self.id).find('.bd').hide();
				self.clearErrors();
				switch(type) {
					case 'forget-email' :
						$('#' + self.id).find('.ask-email-pop-up').show();
						break;
					case 'email-sent' :
						$('#' + self.id).find('.email-sent-pop-up').show();
						break;
					case 'email-error' :
						$('#' + self.id).find('.email-pop-up-error').show();
						break;
					case 'password-updated' :
						$('#' + self.id).find('.password-updated-pop-up').show();
						break;
					default:
						return;
				}
			} catch(e) {
				log('Error loading pop-up window ' + e.message);
			}
		},
		
		postRender : function () {
			var self = this, validator = window.app.validator;
			
			$('#' + self.id).find('.close-btn').on('click', function () {
				self.closePopUp();
			});
			$('#' + self.id).find('.close-button').on('click', function () {
				self.closePopUp();
			});
			$('#' + self.id).find('.cancel').on('click', function () {
				self.closePopUp();
			});
			
			// password confirm, go to login
			$('#password-updated-pop-up').find('.ok').on('click', function () {
				self.closePopUp();
				window.app.router.navigate('Login', {trigger: true});
			});
			
			// send email
			$('#ask-email-pop-up').find('.submit').on('click', function () {
				var emailObj = $('#email-address'), email = emailObj.val().replace(/(^\s*)|(\s*$)/g,"");
					self.clearErrors();
				if(validator.validateEmail(email)) {
					// post to send the email
					$.ajax({
						url : window.app.env.urls.sendMail + email,
						type : 'post',
						dataType : 'json',
						success : function (data) {
							if(!data.hasErrors) {
								$('#email-sent-pop-up').find('.email').html(email);
								self.showPopUp('email-sent');
								emailObj.removeClass('error');
								$('#email-address-label').removeClass('label-error');
							}
							else {
								$('#ask-email-pop-up').find('.error').html(data.errorMessage[0]);
							}
						},
						error : function (data) {
							
						}
					});
				}
				else {
					$('#email-address').addClass('error');
					$('#email-address-label').addClass('label-error');
				}
			});
		}
		
	});
	
	return View;
	
});