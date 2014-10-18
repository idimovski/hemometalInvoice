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
		
			
		<link rel="stylesheet" href="css/skel.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/style-desktop.css" />
			
			
		
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
			<%Entity i = (Entity)request.getAttribute("client"); %>
		<!-- Features -->
				<div id="features-wrapper">
				<section id="features" class="container">
				<div class="row">
					<div class="5u">
						<h3 align="left">Клиент: <%=i.getProperty("dispID") %> </h3>
					</div>
					<div class="5u">
						<input class="button icon fa-file" style="cursor: pointer; width: 280px" id="saveForm1"  value="Нова Профактура" onclick="goToPage('createPro?clientid=<%=KeyFactory.keyToString(i.getKey()) %>')"/>
					</div>

				</div>
				<div class="row">
	 				<div class="10u" align="center" style="width: 100%">
						<form id="addClientForm" method="post" action="addclient" >
							<input name="clientKey" type="hidden" type="text" value="<%=KeyFactory.keyToString(i.getKey()) %>" />
							<input name="sifra"  type="hidden" readonly="readonly" placeholder="Шифра" type="text" value="<%=i.getProperty("sifra") %>" />
						
						<div class="row">
							<div class="5u">
								<input name="ime" placeholder="Име на Клиент" type="text"  value="<%=i.getProperty("ime") %>" />
							</div>
							<div class="5u">
								<input name=prezime placeholder="Презиме" type="text"  value="<%=i.getProperty("prezime") %>" />
							</div>
											
						</div>
						<div class="row">
							<div class="5u">
								<input name="imenafirma" placeholder="Име на Фирма" type="text"  value="<%=i.getProperty("imenafirma") %>" />
							</div>
							<div class="5u">
								<input name="adresa" placeholder="Адреса" type="text" value="<%=i.getProperty("adresa")%>" />
							</div>		
						</div>
						<div class="row">
							<div class="3u">
								<input name="mesto" placeholder="Место" type="text"  value="<%=i.getProperty("mesto")%>" />
							</div>
							<div class="4u">
								<input name="zipcode" placeholder="Поштенски Код" type="text"   value="<%=i.getProperty("zipcode")%>"  />
							</div>
							<div class="3u">
								<input name="opstina" placeholder="Општина" type="text"   value="<%=i.getProperty("opstina")%>"  />
							</div>
						</div>
						<div class="row">
							<div class="5u">
								<input name="smetka" placeholder="Жиро сметка" type="text"   value="<%=i.getProperty("smetka")%>" />
							</div>
							<div class="5u">
								<input name="danbr" placeholder="Даночен Број" type="text"  value="<%=i.getProperty("danbr")%>"  />
							</div>
						</div>
						<div class="row" align="center">
							<div class="3u">
								<input name="tel" placeholder="Телефон" type="text"  value="<%=i.getProperty("tel")%>"  />
							</div>
							<div class="4u">
								<select name="vidnalice">
									<option value="not seelcted" selected="selected">Вид на правно лице</option>
	
									<option value="pravno"  <%if(i.getProperty("vidnalice").equals("pravno")){ %>selected="selected"<%} %> >Правно лице</option>
									<option value="fizicko" <%if(i.getProperty("vidnalice").equals("fizicko")){ %>selected="selected"<%} %> >Физичко лице</option>
									<option value="individzem" <%if(i.getProperty("vidnalice").equals("individzem")){ %>selected="selected"<%} %> >Индивидуален земјоделец</option>
									<option value="zemzadruga" <%if(i.getProperty("vidnalice").equals("zemzadruga")){ %>selected="selected"<%} %> >Земјоделска задруга</option>
								</select>
								
							</div>
							<div class="3u">
								<select name="tip">
									<option value="vip" <%if(i.getProperty("tip").equals("vip")){ %>selected="selected"<%} %> >Vip Клиент</option>
									<option value="basic"  <%if(i.getProperty("tip").equals("basic")){ %>selected="selected"<%} %> >Основен Клиент</option>
								</select>
							</div>		
						
						
						</div>
						<div class="row">	
							
							<div class="5u">
								<textarea  rows="2" name="opis" placeholder="Забелешки" type="text" ><%=( (Text) i.getProperty("opis")).getValue()%></textarea>
							</div>
						</div>
						<div class="row">
						<ul class="actions">
							<li><input class="button icon fa-file" style="cursor: pointer;width: 150px" id="saveForm1" type="submit" value="Зачувај"/></li>
							<li><input class="button icon fa-file" style="cursor: pointer;" id="saveForm1"  value="Откажи" onclick="goToPage('getclients')"/></li>	
						</ul>
						
						</div>
						
					</form>
					</div>
				</div>
				</section>
				
 	</div>
			
			
		
	

		<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

	</body>
</html>