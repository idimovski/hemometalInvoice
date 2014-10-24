<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.hemometal.invoice.mgmt.model.*"%>
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

	<table border="0" width='800px' style="font-family: sans-serif;font-size:medium;">
	<TR>
	<td><img src="images/PrintHeader.jpg" width="800px" />
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="font-family: sans-serif;font-size:large;"> Спецификација за Профактура Број <b><%=p.getProperty("dispID")%></b> од Датум <B>	 <%=p.getProperty("dateOnly")%></B></td>
	</tr>
	



<%  ArrayList opisList = (ArrayList) request.getAttribute("proList"); 

for (int i=0;i<opisList.size();i++){
Item item = (Item)	opisList.get(i);
String opis = item.getOpis();
opis = opis.replaceAll("\\n", "<BR>");

%>	
	<tr><td>&nbsp;</td></tr>
	<tr><td><p><b><%=(i+1) %>.&nbsp;<%=item.getName()%> </b> </p></td></tr>
	<tr><td><p> <%=opis%> </p></td></tr>

<%} %>
	</body>
	
	<script type="text/javascript">
	window.print();
	</script>
</html>