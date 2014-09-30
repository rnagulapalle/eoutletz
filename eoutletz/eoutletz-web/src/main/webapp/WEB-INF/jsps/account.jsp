<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Activate Account</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
   <!-- <script data-main="${pageContext.request.contextPath}/resources/assets/js/main" src="${pageContext.request.contextPath}/resources/app/lib/require/require.js"></script>-->
</head>

<body id="sign-in" class="">
	<div class="overlay-mask" style="display:none;"></div>
	<div id="header">
	<!-- header start -->
	 <div class="nav-top">
		<div class="in-wrap">
			<a href="#" class="elogo"><img src="${pageContext.request.contextPath}/images/elogo.png" alt="Ehealth Logo" width="108" height="25" /></a>
	        <ul>
				<li><a href="#" class="headphones">Agent Support ${tollFreeNumber}</a></li><li><a href="#">Live Chat <strong>24/7</strong></a></li>
			</ul>
		</div>
	</div>
	<!-- header end -->
	</div>
    <div id="wrapper" class="container-fluid">
    	<div class="sign-in" id="sign-in-page">
    	<div class="welcome">
				<div class="logo-wrap">
					<a href="${marketPlaceLogoRedirectUrl}" target="_blank"><img class="image1" src="${marketPlaceLogoUrl}" alt="${partnerMarketPlace}"> <span class="divider"></span></a>
					<a href="${partnerLogoRedirectUrl}" target="_blank"><img class="image2" src="${partnerLogoUrl}" alt="${partnerName }"></a>
				</div>
			</div>
			<c:if test="${userAlreadyExistError}">
	    		<div id="error-wrap" class="error-wrap" style="display:;">
		    		<p>Please correct the <strong>error</strong> listed below.</p>
		            	<ul>
		                	<%-- <li><span>Login Id</span> ${userAlreadyExistEmail} <span>already exists, please select another one.</span></li> --%>
		                	<li><span>We can't activate your account because the email address you entered is associated with another account.</span></li>
		               </ul>
	    		</div>
    		</c:if>
    		<div id="main-wrapper" class="sign-in-wrap clear">
    			<!-- left start -->
                <div class="left-wrap">
                
                    <c:choose>
      					<c:when test="${realEmail}">
      						<jsp:include page="activate_user_form.jsp" />
     					</c:when>
      					<c:otherwise>
      						<jsp:include page="update_user_form.jsp" />
      					</c:otherwise>
					</c:choose>
					
				</div>
                <!-- left end -->
                <!-- right start -->
                <div class="right-wrap"> 
                	<img class="norton-img" src="${pageContext.request.contextPath}/images/norton.png" width="131" height="113"> 
                	<img width="132" height="47" class="truste-img" src="${pageContext.request.contextPath}/images/truste.png"> 
                </div>
                <!-- right end -->
    			
    		</div>
    	</div>
    </div>
    <div id="system-message"></div>
    <div id="footer">
    <!-- footer start -->
 	<div class="footer">
    	<ul>
            <li><a href="${aboutUs}">About Us</a></li>
            <li><a href="${legalAndLicense}">Licensing and Legal</a></li>
            <li><a href="${privacyPolicy}">Privacy Policy</a></li>
        </ul>
        <p class="copyright">Copyright &copy; 2014 eHealthInsurance Services, Inc.</p>
        <div class="disclaimer">The information found on this site is for general information purposes only. Please note that your employer neither endorses nor recommends any of the coverages presented to you, and such coverage is not (and should not be considered) an employee benefit plan sponsored or maintained by your employer. The coverages found on this site are voluntary individual insurance products underwritten by individual insurance carriers. Your decision to purchase coverage is a voluntary decision between you and the independent insurance carrier. If you are eligible for group coverage through your employer, this shopping experience is not for you. These plans are available only for employees who are not eligible for employer-sponsored group health insurance coverage.</div>
	</div>
	<!-- footer end -->
    </div>
    <!-- Google hosted jQuery CDN -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript">
		// provide a fallback in case CDN is not available
		if (!window.jQuery) {
    		document.write(unescape("%3Cscript src='${pageContext.request.contextPath}/js/lib/jquery/jquery-1.11.1.min.js' type='text/javascript'%3E%3C/script%3E"));
		}
	</script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/util/validation.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/util/validator.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
   
</body>
</html>