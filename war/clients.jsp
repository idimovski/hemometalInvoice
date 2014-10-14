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
$(document).ready(function() {

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
    
	document.location.href = "getClient?clientKey=" + key;
	
}

   
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			
		<!-- Features -->
			 <div id="features-wrapper">
				<section id="features" class="container">
				<h3 align="left">Клиенти:</h3>
				
				<div class="row"></div>
				<div class="row">
				<div class="10u" style="width: 100% " align="center">
				
				
			    <table border ='1' width='100%' style="cursor: pointer;">
			    				<tr style="cursor: pointer;">
								<td width="10%">
									<label class="description">Шифра</label>
								</td>
								<td width="40%">
									<label class="description" >Име</label>
								</td>
								<td width="20%">
									<label class="description" >Телефон</label>
								</td>
								<td width="20%">
									<label class="description" >Тип</label>
								</td>
							
								
								</tr>
				
			    </table>
			    				
				<ul class="pagination1">
				<%
				int i = 0;
				List<Entity> items  = new ArrayList();
				if (null != request.getAttribute("clientList")){
					items = (List<Entity>)request.getAttribute("clientList");
				}
			    for(Entity e : items){
			    i++;	%>
			    
			    
			    
			    <li onmouseup="openItem('<%=KeyFactory.keyToString(e.getKey())%>');">
			    <table border ='1' width='100%' style="cursor: pointer;">
			    				
			    				
								<tr style="cursor: pointer;">
								<td width="10%">
									<label id="rowid" class="description" style="cursor: pointer;"><%=e.getProperty("dispID") %></label>
								</td>
								<td width="40%">
									<label id="" class="description" style="cursor: pointer;"><%=e.getProperty("ime") %></label>
								</td>
								<td width="20%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("tel") %></label>
								</td>
								<td width="20%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("tip") %></label>
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
						<li><input class="button icon fa-file" style="cursor: pointer;" id="saveForm1" type="submit" value="Нов Клиент" onclick="openDialog();"/></li>
						 
						
			</ul>
				
				</section>		
				<div style="display:none">
				<div id="addclientdialog">
				<form id="addClientForm" method="post" action="addclient" >
				
					
					<div class="row">
						
						<div class="5u">
							<input name="ime" placeholder="Име на Клиент" type="text" />
						</div>
						<div class="5u">
							<input name="adresa" placeholder="Адреса" type="text" />
						</div>
						
					
					</div>
					
					<div class="row">
						<div class="3u">
							<input name="mesto" placeholder="Место" type="text" />
						</div>
						<div class="4u">
							<input name="zipcode" placeholder="Пошт. Код" type="text" />
						</div>
						<div class="3u">
							<input name="opstina" placeholder="Општина" type="text" />
						</div>
					
					</div>
					<div class="row">
						<div class="5u">
							<input name="smetka" placeholder="Жиро сметка" type="text" />
						</div>
						<div class="5u">
							<input name="danbr" placeholder="Даночен Број" type="text" />
						</div>
					</div>
					
					<div class="row">
						<div class="3u">
							<input name="tel" placeholder="Телефон" type="text" />
						</div>
						<div class="4u">
							<select name="vidnalice">
								<option value="not seelcted" selected="selected">Вид на правно лице</option>
								<option value="pravno" >Правно лице</option>
								<option value="fizicko">Физичко лице</option>
								<option value="individzem">Индивидуален земјоделец</option>
								<option value="zemzadruga">Земјоделска задруга</option>
							</select>
							
						</div>
						<div class="3u">
							<select name="tip">
								<option value="vip" selected="selected">Vip Клиент</option>
								<option value="basic" >Основен Клиент</option>
							</select>
						</div>
					
					
					</div>
					<div class="row">
						
						
						<div class="5u">
							<textarea name="opis" placeholder="Забелешки" type="text" ></textarea>
						</div>
					

						
					
					</div>
					
					
				</form>
				</div>
				</div>
				
			</div>
			
			
		
	

		<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

	</body>
</html>