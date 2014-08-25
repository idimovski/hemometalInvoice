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
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<script src="js/quickpager.jquery.js"></script>
		<script src="js/jquery.quick.pagination.min.js"></script>
		<script src="js/jquery-ui.js"></script>
		<noscript>
			
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
			
			
		</noscript>
		<link rel="stylesheet" href="css/jquery-ui.css" />
		<link rel="stylesheet" href="css/pagingStyles.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body class="homepage">
	
	
	<script type="text/javascript">
function goToPage(url){
	    
		document.location.href = url;
		
}
  
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			
		<!-- Features -->
			 <div id="features-wrapper">
				<section id="features" class="container">
				<h3 align="left">Клиент:</h3>
				
				<div class="row"></div>
				<div class="row">
				<div class="10u" align="center" style="width: 100%">
				
				
			    <%Entity i = (Entity)request.getAttribute("client"); %>
				<form id="addClientForm" method="post" action="addclient" >
				
					
					
				
					
					<div class="row">
						<div class=3u">
							<input name="clientKey" type="hidden" type="text" value="<%=KeyFactory.keyToString(i.getKey()) %>" />
							<input name="sifra" readonly="readonly" placeholder="Шифра" type="text" value="<%=i.getProperty("sifra") %>" />
						</div>
					</div>
					<div class="row">
						
						<div class="5u">
							<input name="ime" placeholder="Име" type="text" value="<%=i.getProperty("ime") %>" />
						</div>
						<div class="5u">
							<input name="smetka" placeholder="Жиросметка" type="text" value="<%=i.getProperty("smetka") %>" />
						</div>
					</div>
					<div class="row">	
						<div class="5u">
							<select name="tip">
								<option <%if(i.getProperty("tip").equals("Алплер")){ %>selected="selected"<%} %> >Приоритет 1</option>
								<option>Приоритет 2</option>
								<option>Домашен</option>
								<option>ЕУ</option>
								<option>Друг..</option>
								
							</select>
						</div>		
					</div>
					<div class="row">
						
						<div class="5u">
							<textarea name="adresa" placeholder="Адреса" type="text" ><%=( (Text) i.getProperty("adresa")).getValue()%></textarea>
						</div>
						<div class="5u">
							<textarea name="opis" placeholder="Опис" type="text" ><%=( (Text) i.getProperty("opis")).getValue()%></textarea>
						</div>
					</div>
					<div class="row">
					<ul class="actions">
						<li><input class="button icon fa-file" style="cursor: pointer;" id="saveForm1" type="submit" value="Зачувај"/></li>
						<li><input class="button icon fa-file" style="cursor: pointer;" id="saveForm1"  value="Откажи" onclick="goToPage('getclients')"/></li>	
					</ul>
					
					</div>
					
				</form>
				</div>
				</div>
				
			</div>
			
			
		
	

		<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

	</body>
</html>