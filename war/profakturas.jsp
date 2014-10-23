<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
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
	$("span.money").formatCurrency();

	// $("ul.pagination1").quickPagination();
	
	$("ul.pagination1").quickPagination({pagerLocation:"both",pageSize:'20'});
	
	//$("ul.pagination2").quickPager({pagerLocation:"both"});
	
	 $( "#addclientdialog" ).dialog({
	 	    height: 700,
	 	    width:800,
	 	    modal: false,
	 	   draggable: false,
	 	   	autoOpen: false,
	 	   title: "Нов Клиент",
	 	    buttons: {
	 	        "Запиши": function() {
	 	        	$( "#addClientForm" ).submit();
	 	        },
	 	        "Откажи": function() {
	 	        	 $( "#addclientdialog" ).dialog("close");
	 	        }
	 	    	
	 	      }
	 	  });
	 
	
});

function openDialog(){
	 $( "#addclientdialog" ).dialog("open");
}

function openItem(key){
    
	document.location.href = "getpro?proKey=" + key;
	
}

function novaprofaktura(){
	document.location.href = "getclients";
}

function barajprofaktura(){
	
	var sifra = $("#sifra").val();
	var ime = $("#ime").val();
	var prezime = $("#prezime").val();
	var firma = $("#firma").val();
	
	document.location.href = "getallpro?sifra=" + sifra+"&ime="+ime + "&prezime=" + prezime + "&firma="+firma;
	
}

   
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			
		<!-- Features -->
			 <div id="features-wrapper">
				<section id="features" class="container">
				<div class="row">
					<div class="5u">
						<h3 align="left">Профактури:</h3>
					</div>
					<div class="5u">
						<input class="button icon fa-file" style="cursor: pointer;" id="saveForm1" type="button" value="Нова Профактура" onclick="novaprofaktura();"/>
					</div>
				</div>
				<div class="row">
				</div>
				<form action="">
					<div class="row">
						<div class="2u">
							<input id="sifra" placeholder="Шифра" type="text"  value="" />
						</div>
						<div class="2u">
							<input id="ime" placeholder="Име на Клиент" type="text"  value="" />
						</div>
						<div class="2u">
							<input id="prezime" placeholder="Презиме на Клиент" type="text"  value="" />
						</div>
						<div class="2u">
							<input id="firma" placeholder="Фирма" type="text"  value="" />
						</div>
						<div class="2u">
							<input class="button icon fa-file" style="cursor: pointer;" id="saveForm1" type="button" value="Барај" onclick="barajprofaktura();"/>
						</div>
						
					</div>			
				</form>			
				<div class="row">
				</div>
				<div class="row">
				<div class="10u" style="width: 100% " align="center">
				
				
			    <table border ='1' width='100%' style="cursor: pointer;">
			    				<tr style="cursor: pointer;">
								<td width="20%">
									<label class="description">Шифра</label>
								</td>
								<td width="30%">
									<label class="description" >Клиент</label>
								</td>
								<td width="20%" align='center'>
									<label class="description" >Дата</label>
								</td>
								<td width="20%" align='right'>
									<label class="description" >Вкупна Сума (Ден)</label>
								</td>
								<td width="10%" align='right'>
									<label class="description" >Одобрена</label>
								</td>
								
							
								
								</tr>
				
			    </table>
			    				
				<ul class="pagination1">
				<%
				int i = 0;
				List<Entity> pros  = new ArrayList();
				if (null != request.getAttribute("proList")){
					pros = (List<Entity>)request.getAttribute("proList");
				}
			    for(Entity e : pros){
			    i++;	%>
			    
			    
			    
			    <li onmouseup="openItem('<%=KeyFactory.keyToString(e.getKey())%>');">
			    <table border ='1' width='100%' style="cursor: pointer;">
			    				
			    				
								<tr style="cursor: pointer;">
								<td width="20%">
									<label id="rowid" class="description" style="cursor: pointer;"><%=e.getProperty("dispID") %></label>
								</td>
								<td width="30%">
									<label id="" class="description" style="cursor: pointer;"><%=e.getProperty("clientName") %>&nbsp; <%=e.getProperty("clientPrezime") %>&nbsp; <%=e.getProperty("clientFirmaName") %></label>
								</td>
								<td width="20%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("dateF") %></label>
								</td>
								<td width="20%" align='right'>
									<label class="description" ><span class="money"><%=e.getProperty("totalValue") %></span></label>
								</td>
								<td width="20%" align='right'>
									<label class="description" ><%=e.getProperty("odobrenaUI") %></label>
								</td>
								
								
							
								</tr>
							</table>
				</li>
			    
			    
			    <%} %>
			    </ul>
			   </div>
				</div>
				
			<br/>
			<ul class="actions">
					<!-- 	<li><input class="button icon fa-file" style="cursor: pointer;" id="saveForm1" type="submit" value="Нов Клиент" onclick="openDialog();"/></li> -->
						 
						
			</ul>
				
				</section>		
			</div>
			
			
		
	

		<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

	</body>
</html>