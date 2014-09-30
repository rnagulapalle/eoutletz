<h2>Activate Account</h2>

<div class="user-info">
<strong>Email address:</strong>${email}<br />
<strong>Name:</strong>${firstName} ${lastName}
<form method="post" action="${pageContext.request.contextPath}/user/activate/" id="sign-in-form">
	<input type="hidden" id="email" value="${email}" maxlength="80" size="33" name="userName" class="validate" />
	<div class="row relative">
		<label for="password" id="activate-password-label" class="">Choose a password</label>
		<div class="relative">
			<input type="password" name="password" id="password" class="password" autocomplete="off" />
			<!-- alert start -->
			<div class="point-wrap down" style="display: none;" id="password-error-list">
				<div class="arrow"></div>
				<div class="title">Password must have</div>
				<ul id="password-list">
					<li class="success lengthRange">6 to 20 characters</li>
					<li class="success atLeastOneAlpha">At least 1 letter</li>
					<li class="success atLeastOneDigit">At least 1 number</li>
				</ul>
			</div>
			<!-- alert end -->
		</div>
		<div class="password-strength" style="display: none;">
			Password strength: <span class="orange" id="password-strength-text"></span>
			<div class="percent-wrap">
				<span id="password-strength-meter" class="yellow-percent" style="width: 0%;"></span>
			</div>
		</div>
		<!-- <p class="remind">We'll email you a link to activate your account after you've set your password.</p> -->
	</div>
	<div class="btn-wrap-no-message">
		<a class="activate-account" id="activate-account-btn">Activate Account</a>
	</div>
</form>
</div>