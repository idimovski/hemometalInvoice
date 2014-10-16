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
		<script src="js/jquery.formatCurrency-1.4.0.min.js"></script>
		
		
		<link rel="stylesheet" href="css/skel.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/style-desktop.css" />
			
			
		
		<link rel="stylesheet" href="css/jquery-ui.css" />
		<link rel="stylesheet" href="css/pagingStyles.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body class="homepage">
	
	
	<script type="text/javascript">
$(document).ready(function() {
	  /*$('#cena').formatCurrency();
	  $('#cena').blur(function()
              {
                  $('#cena').formatCurrency();
              });*/
	
});
	
	
function goToPage(url){
	    
		document.location.href = url;
		
}
  
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			<%Entity i = (Entity)request.getAttribute("item"); %>
		<!-- Features -->
			 	<div id="features-wrapper">
			 	<section id="features" class="container">
			 	<div class="row">
			 		<div class="5u">
			 			<h3 align="left">Производ: <%=i.getProperty("dispID") %></h3>	
			 		</div>
			 		<div class="5u">
			 			
			 		</div>	
			 	</div>
				<div class="row">
				<div class="10u" align="center" style="width: 100%">	
					<form id="addItemForm" method="post" action="addItem">
					<input name="itemKey" type="hidden" type="text" value="<%=KeyFactory.keyToString(i.getKey()) %>" />
					<input name="sifra" type="hidden" readonly="readonly" placeholder="Шифра" type="text" value="<%=i.getProperty("sifra") %>" />
					
					<div class="row">	
						<div class="5u">
							<input name="ime" placeholder="Име" type="text" value="<%=i.getProperty("ime") %>" />
						</div>
						<div class="5u">
							<input id="cena" name="cena" placeholder="Цена во Денари" type="text" value="<%=i.getProperty("cena") %>" />
						</div>
					</div>
					<div class="row">
						
						<div class="3u">
							<select name="proizvoditel">
								<option <%if(i.getProperty("proizvoditel").equals("Алплер")){ %>selected="selected"<%} %> >Алплер</option>
								<option <%if(i.getProperty("proizvoditel").equals("Зетор")){ %>selected="selected"<%} %> >Зетор</option>
								
							</select>
						</div>
						<div class="3u">
							<select name="zemjapotelko">
								<option <%if(i.getProperty("zemjapotelko").equals("Турција")){ %>selected="selected"<%} %> >Турција</option>
								<option <%if(i.getProperty("zemjapotelko").equals("Чешка")){ %>selected="selected"<%} %> >Чешка</option>
							</select>
						</div>
						<div class="4u">
							<select name="kategorija" title="Kfdsfasdsfk">
								<option <%if(i.getProperty("kategorija").equals("traktori")){ %>selected="selected"<%} %> value="traktori">Трактори</option>
								<option <%if(i.getProperty("kategorija").equals("plugovi")){ %>selected="selected"<%} %> value="plugovi">Плугови</option>
								<option <%if(i.getProperty("kategorija").equals("tanjirachi")){ %>selected="selected"<%} %> value="tanjirachi">Тањирачи</option>
								<option <%if(i.getProperty("kategorija").equals("krimeri")){ %>selected="selected"<%} %> value="krimeri">Кримери</option>
								<option <%if(i.getProperty("kategorija").equals("rotacionikodachki")){ %>selected="selected"<%} %>  value="rotacionikodachki">Ротациони Кодачки</option>
								<option <%if(i.getProperty("kategorija").equals("frezi")){ %>selected="selected"<%} %>  value="frezi">Фрези</option>
								<option <%if(i.getProperty("kategorija").equals("megurednifrezi")){ %>selected="selected"<%} %>  value="megurednifrezi">Меѓуредни фрези</option>
								<option <%if(i.getProperty("kategorija").equals("sealki")){ %>selected="selected"<%} %>  value="sealki">Сеалки</option>
								<option  <%if(i.getProperty("kategorija").equals("prikolici")){ %>selected="selected"<%} %> value="prikolici">Приколици</option>
								<option  <%if(i.getProperty("kategorija").equals("balirachki")){ %>selected="selected"<%} %> value="balirachki">Блирачки</option>
								<option  <%if(i.getProperty("kategorija").equals("senoprevrtuvacki")){ %>selected="selected"<%} %> value="senoprevrtuvacki">Сенопревртувачки</option>
								<option  <%if(i.getProperty("kategorija").equals("niskiprskalki")){ %>selected="selected"<%} %> value="niskiprskalki">Ниски Прскалки</option>
								<option  <%if(i.getProperty("kategorija").equals("amortizeri")){ %>selected="selected"<%} %> value="amortizeri">Атомизери</option>
								<option  <%if(i.getProperty("kategorija").equals("mulceri")){ %>selected="selected"<%} %> value="mulceri">Мулчери</option>
								<option  <%if(i.getProperty("kategorija").equals("opgradina")){ %>selected="selected"<%} %> value="opgradina">Опрема за градина</option>
								<option  <%if(i.getProperty("kategorija").equals("opfarmi")){ %>selected="selected"<%} %> value="opfarmi">Опрема за фарми</option>
								<option  <%if(i.getProperty("kategorija").equals("opnavodnuvanje")){ %>selected="selected"<%} %> value="opnavodnuvanje">Опрема за наводнување</option>
								<option  <%if(i.getProperty("kategorija").equals("oplozarstvo")){ %>selected="selected"<%} %> value="oplozarstvo">Опрема за овоштарство и лозарство</option>
							</select>
						</div>
							
					</div>
					<div class="row">
						
						
						
						<div class="5u">
							<select name="merka">
								<option <%if(i.getProperty("merka").equals("par")){ %>selected="selected"<%} %>  value="par">Парче</option>
								<option <%if(i.getProperty("merka").equals("kg")){ %>selected="selected"<%} %>  value="kg">Килограми</option>
							</select>
						</div>
							<div class="5u">
							<select name="ddv">
								<option value="5" <%if(i.getProperty("ddv").equals("5")){ %>selected="selected"<%} %>>ДДВ 5%</option>
								<option value="18" <%if(i.getProperty("ddv").equals("18")){ %>selected="selected"<%} %>>ДДВ 18%</option>
							</select>
						</div>
							
					</div>
					<div class="row">
						
						<div class="5u">
							<textarea rows="2" name="opis" placeholder="Опис" type="text" ><%=( (Text) i.getProperty("opis")).getValue()%></textarea>
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
			</section>		
			</div>
		
			
			
		
	

		<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

	</body>
</html>