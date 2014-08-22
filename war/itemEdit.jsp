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
				<h3 align="left">Производ:</h3>
				
				<div class="row"></div>
				<div class="row">
				<div class="10u" align="center" style="width: 100%">
				
				
			    <%Entity i = (Entity)request.getAttribute("item"); %>
				<form id="addItemForm" method="post" action="addItem" >
				
					
					<div class="row">
						<div class=3u">
							<input name="itemKey" type="hidden" type="text" value="<%=KeyFactory.keyToString(i.getKey()) %>" />
							<input name="sifra" readonly="readonly" placeholder="Шифра" type="text" value="<%=i.getProperty("sifra") %>" />
						</div>
					</div>
					<div class="row">
						
						<div class="5u">
							<input name="ime" placeholder="Име" type="text" value="<%=i.getProperty("ime") %>" />
						</div>
						<div class="5u">
							<input name="cena" placeholder="Цена во Денари" type="text" value="<%=i.getProperty("cena") %>" />
						</div>
					</div>
					<div class="row">
						
						<div class="5u">
							<select name="proizvoditel">
								<option <%if(i.getProperty("proizvoditel").equals("Алплер")){ %>selected="selected"<%} %> >Алплер</option>
								<option <%if(i.getProperty("proizvoditel").equals("Зетор")){ %>selected="selected"<%} %> >Зетор</option>
								
							</select>
						</div>
						<div class="5u">
							<select name="zemjapotelko">
								<option <%if(i.getProperty("zemjapotelko").equals("Турција")){ %>selected="selected"<%} %> >Турција</option>
								<option <%if(i.getProperty("zemjapotelko").equals("Чешка")){ %>selected="selected"<%} %> >Чешка</option>
							</select>
						</div>
							
					</div>
					<div class="row">
						
						<div class="5u">
							<select name="ddv">
								<option value="5" <%if(i.getProperty("ddv").equals("5")){ %>selected="selected"<%} %>>ДДВ 5%</option>
								<option value="18" <%if(i.getProperty("ddv").equals("18")){ %>selected="selected"<%} %>>ДДВ 18%</option>
							</select>
						</div>
						<div class="5u">
							<textarea name="opis" placeholder="Опис" type="text" ><%=( (Text) i.getProperty("opis")).getValue()%></textarea>
						</div>
					</div>
					<div class="row">
					<ul class="actions">
						<li><input class="button icon fa-file" style="cursor: pointer;" id="saveForm1" type="submit" value="Зачувај"/></li>
						<li><input class="button icon fa-file" style="cursor: pointer;" id="saveForm1"  value="Откажи" onclick="goToPage('addItem')"/></li>	
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