<%@page import="com.ehi.bfadapter.core.util.Constants"%>
<%
String token = Constants.SAML_PERSONID_TOKEN_KEY;
%>
<html>
<body>
<h2>${message}</h2>
<h2>Person Identifier Token in session : <%=request.getSession().getAttribute(token)%></h2>
<h3>${memberInformation.toString()}</h3>
</body>
</html>
