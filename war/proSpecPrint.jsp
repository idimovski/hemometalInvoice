<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Text"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>


<!DOCTYPE HTML>

<html>
	<head>
		<title>Hemometal Invoice Management</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
	
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.formatCurrency-1.4.0.min.js"></script>
		<script src="js/jquery.min.js"></script>
		
		
		
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	 <% Entity p = (Entity)request.getSession().getAttribute("pro"); %>
	<body class="homepage" style="font-family: sans-serif;">


<%  ArrayList opisList = (ArrayList) p.getProperty("opisList"); 

for (int i=0;i<opisList.size();i++){
	
String opis = (String) opisList.get(i);
opis = opis.replaceAll("\\n", "<BR>");

%>
<p> <%=opis%> </p>
<%} %>
	</body>
</html>