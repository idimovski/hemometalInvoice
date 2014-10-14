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

   
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			
		<!-- Features -->
			 <div id="features-wrapper">
				<section id="features" class="container">
				<h3 align="left">Профактури:</h3>
				
				<div class="row"></div>
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
								<td width="20%" align='center'>
									<label class="description" >Вкупна Сума (Ден)</label>
								</td>
								<td width="10%" align='center'>
									<label class="description" >Исполнета</label>
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
									<label id="" class="description" style="cursor: pointer;"><%=e.getProperty("clientName") %></label>
								</td>
								<td width="20%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("dateF") %></label>
								</td>
								<td width="20%" align='right'>
									<label class="description" ><span class="money"><%=e.getProperty("totalValue") %></span></label>
								</td>
								<td width="20%" align='right'>
									<label class="description" >ТБД</label>
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