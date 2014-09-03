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
		<script src="js/jquery-1.10.2.min.js"></script>
		
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

$(document).ready(function() {
	  
	  callFilter();
	// $("ul.pagination1").quickPagination();
	
	//$("#itemsPagination").quickPagination({pagerLocation:"both",pageSize:'20'});
});
  
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			  <% Entity p = (Entity)request.getAttribute("pro"); %>
		<!-- Features -->
			 <div id="features-wrapper">
				<section id="features" class="container">
				<div class="row">
					<div class="4u">
						<h3 align="left">Профактура: <%=p.getProperty("sifra") %></h3>
					</div>
					<div class="4u">
							<input class="button icon fa-file" style="cursor: pointer;" id="saveForm1"  value="Печати" onclick="alert('Print')"/>	
					</div>
					<div class="3u">
							<input class="button icon fa-file" style="cursor: pointer;" id="saveForm1"  value="Зачувај" onclick="alert('зачувај')"/>	
					</div>
				</div>
				<div class="row">
				<div class="10u" align="center" style="width: 100%">
				<form id="addClientForm" method="post" action="addclient" >
					<input name="proKey" type="hidden" type="text" value="<%=KeyFactory.keyToString(p.getKey()) %>" />
					<input name="sifra" type="hidden"  readonly="readonly" placeholder="Шифра" type="text" value="<%=p.getProperty("sifra") %>" />
				
					<div class="row">
						<div class="5u" align="left">
							<label class="description" >Клиент: <%=p.getProperty("clientName") %> (<%=p.getProperty("clientSifra") %>)</label> 
						</div>
					</div>
					<div class="row">
						<h3 align="left">Производи во Профактура:</h3>
					</div>
					<div class="row">
						<div class="10u">
						<ul id="proizvodiSelected" class='pagination1'>
						</ul>
						</div>
					</div>
					<div class="row">
					<div class="10u"></div>
					</div>
					<input id="proizvodiids" type="hidden"/>
					<div class="row">
						<h3 align="left">Одберете Производи:</h3>
					</div>
					<div class="row">
						<div class="3u">
							<select id="proizvoditel" name="proizvoditel">
								<option>Алплер</option>
								<option>Зетор</option>
								
							</select>
						</div>
						<div class="3u">
							<select id="zemjapotelko" name="zemjapotelko">
								<option>Турција</option>
								<option>Чешка</option>
							</select>
						</div>
					
						<div class="4u">
							<select id="kategorija" name="kategorija" title="Kfdsfasdsfk">
								<option value="traktori">Трактори</option>
								<option value="plugovi">Плугови</option>
								<option value="tanjirachi">Тањирачи</option>
								<option value="krimeri">Кримери</option>
								<option value="rotacionikodachki">Ротациони Кодачки</option>
								<option value="frezi">Фрези</option>
								<option value="megurednifrezi">Меѓуредни фрези</option>
								<option value="sealki">Сеалки</option>
								<option value="prikolici">Приколици</option>
								<option value="balirachki">Блирачки</option>
								<option value="senoprevrtuvacki">Сенопревртувачки</option>
								<option value="niskiprskalki">Ниски Прскалки</option>
								<option value="amortizeri">Атомизери</option>
								<option value="mulceri">Мулчери</option>
								<option value="opgradina">Опрема за градина</option>
								<option value="opfarmi">Опрема за фарми</option>
								<option value="opnavodnuvanje">Опрема за наводнување</option>
								<option value="oplozarstvo">Опрема за овоштарство и лозарство</option>
							</select>
						</div>
					
					</div>
					<div class="row">
					<div class="10u">
						<ul id="itemsPagination" class="pagination1">

						</ul>
					</div>
					</div>
					
					
					
					
					
					
				</form>
				</div>
				</div>
			</section>		
			</div>
			
			
		
	

		<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">

function addProizvod(proizvodID, proizvodName, cena){
	/*alert(proizvodID +proizvodName+cena);*/
	//$( "#proizvodiSelected").append("<div class='row'> <div class='3u'><p>" + proizvodName + " </p></div><div class='3u'>" + cena + " </div></div>");
	$( "#proizvodiSelected").append("<li><table><tr><td width='30%'>" + proizvodName + "</td><td width='30%'> " + cena + "</td></tr><table></li>");
}



$( "#proizvoditel" ).change(function() {
	 callFilter();
});

$( "#zemjapotelko" ).change(function() {
	 callFilter();
});
$( "#kategorija" ).change(function() {
	 callFilter();
});



function callFilter(){
var pro = $( "#proizvoditel" ).val();
var zem = $( "#zemjapotelko" ).val();
var kat = $( "#kategorija" ).val();

	
	var jqxhr = $.ajax( "searchItems?zem="+zem+"&pro="+pro+"&kat="+kat )
	  .done(function(data) {	  
		  var obj = jQuery.parseJSON(data);
		  $("#itemsPagination").empty();
		  jQuery.each( obj.results, function( i, val ) {
			  
			 
			  $("#itemsPagination").append("<li onmouseup=\"addProizvod(\'" + val.id +  "\',\'" +val.ime + "\',\'" + val.cena + "\')\";><table><tr><td width='30%'>" + val.ime + "</td><td width='30%'> " + val.cena + "</td><td width='10%' ><a href=\"javascript:addProizvod(\'" + val.id +  "\',\'" +val.ime + "\',\'" + val.cena + "\')\"></a></td></tr><table></li>");
			  
			});
		  
		  
		
	    
	  })
	  .fail(function() {
	    alert( "error" );
	  });

	

}


</script>

	</body>
</html>