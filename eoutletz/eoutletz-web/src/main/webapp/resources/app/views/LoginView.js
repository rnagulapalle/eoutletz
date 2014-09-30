define(['text!templates/ActivationAccountTemplate.html'], function (tpl) {
	
	var LoginView = Backbone.View.extend({
		
		classname : 'login-view',
		id : 'sign-in-page',
		
		initialize : function () {},
		
		render : function () {
			var self = this, compiled;
			
			self.undelegateEvents();
			
			compiled = Mustache.to_html(tpl);
			
			$('#main-wrapper').html(compiled);
			log('load Login View');
			
			this.postRender();
			
			self.delegateEvents();
			
			return this;
		},
		
		postRender : function () {
			var validation = window.app.validator, self = window.app, emailLabel = $('#emailText'), valid = true;
			
			$('#email').on('blur', function (e) {
				valid = validation.validateEmail($(this).val().replace(/(^\s*)|(\s*$)/g,""));
				if(!valid) {
					$(this).addClass('error');
					emailLabel.addClass('label-error');
				}
				else {
					$(this).removeClass('error');
					emailLabel.removeClass('label-error');
				}
            });
			
			$('#password').on('blur', function () {
				if($(this).val() === '') {
					$(this).addClass('error');
					$('#passwordText').addClass('label-error');
				}
				else {
					$(this).removeClass('error');
					$('#passwordText').removeClass('label-error');
				}
			});

			
			$('#' + this.id).find('.forgot-password').on('click', function () {
				self.views.PopUp.showPopUp('forget-email');
			});
			
			// submit Login
			$('#' + this.id).find('.sign-in-r').on('click', function () {
				valid = validation.validateEmail($('#email').val().replace(/(^\s*)|(\s*$)/g,""));
				$('input.validate').removeClass('error');
				$('label.validate').removeClass('label-error');
				self.views.Error.hideErrors();
				
				if($('input.validate').val() === '') {
					$('input.validate').addClass('error');
					$('label.validate').addClass('label-error');
					self.views.Error.showErrors('invalid-inputs');
					return;
				}
				else {
					if(valid) {
						emailLabel.removeClass('label-error');
						$('#email').removeClass('error');
						$('#LoginForm').submit();
					}
					else {
						self.views.Error.showErrors('invalid-email');
						$('#email').addClass('error');
						emailLabel.addClass('label-error');
						self.views.Error.showErrors('invalid-email');
					}
				}
			});
		}
		
	});
	
	return LoginView;
	
});