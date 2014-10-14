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
		
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body class="homepage">
 <% Entity p = (Entity)request.getSession().getAttribute("pro"); %>
			  <% 
			  String currentItemsJ = ""; 
			  if(null!= p.getProperty("items")){ 
			  	currentItemsJ = ((Text) p.getProperty("items")).getValue();
			  }	%>
			  
<script type="text/javascript">

var j = 1;
function addProizvod(proizvodID, proizvodName, cena, ddv, merka){
	
	//$( "#proizvodiSelected").append("<div class='row'> <div class='3u'><p>" + proizvodName + " </p></div><div class='3u'>" + cena + " </div></div>");
	
	if (ddv == 1) ddv = "5%";
	if (ddv == 2) ddv = "18%";
	
	$( "#proizvodiSelected").append("<tr>"
			+"<td>"+j+"</td>"
			+"<td>"+proizvodID+"</td>"
			+"<td>"+proizvodName+"</td>"
			+"<td>"+merka+"</td>"
			+"<td>"+j+"</td>"
			+"<td>"+cena+"</td>"
			+"<td>"+ddv+"</td>"
			+"");
			
	
	//$("span.money").formatCurrency();
	
	j++;
	
}



</script>
	<table border="1" width='800px'>
		<tr>
			<td colspan="2"><img src="images/PrintHeader.png" width="800px" />
			</td>
		</tr>
		<tr>
			<td width="50%">
			<table>
				<tr>
					<td>Датум: <%=p.getProperty("dateF")%>
					</td>
				</tr>
				<tr>
					<td>Про-Фактура: <%=p.getProperty("dispID")%>
					</td>
				</tr>
			</table>
			</td>
			<td width="50%">
				<table>
					<tr><td>Велковски Димитар</td></tr>
					<tr><td>Кравари</td></tr>
					<tr><td>Битола</td></tr>
				</table>
			</td>
		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
		<tr>
			<td colspan="2">
				<!--<table border="1" width = '100%'>
					<tr>
						<td>Р.б</td>
						<td>Шифра</td>
						<td>Назив на производот</td>
						<td>Е М</td>
						<td>Количина</td>
						<td>Цена</td>
						<td>Тар %</td>
					</tr>
					
				</table>-->
				<table id='proizvodiSelected' border="1" width = '100%'>
					<tr>
						<td>Р.б</td>
						<td>Шифра</td>
						<td>Назив на производот</td>
						<td>Е М</td>
						<td>Количина</td>
						<td>Цена</td>
						<td>Тар %</td>
					</tr>
					
				</table>
				
			</td>
		</tr>
	</table>


	<!-- Features -->
			 <div id="features-wrapper">
				<section id="features" class="container">
				<div class="row">
					<div class="4u">
						<h3 align="left">Профактура: <%=p.getProperty("dispID") %></h3>
					</div>
				</div>
				<div class="row">
				
				
					<input id="proKey" name="proKey" type="hidden" type="text" value="<%=KeyFactory.keyToString(p.getKey()) %>" />
					<input id="clientid" name="clientid" type="hidden" type="text" value="<%=p.getProperty("clientid") %>" />
					
					<input name="sifra" type="hidden"  readonly="readonly" placeholder="Шифра" type="text" value="<%=p.getProperty("sifra") %>" />
				
					<div class="row">
						<div class="5u" align="left">
							<label class="description" >Клиент: <%=p.getProperty("clientName") %> (<%=p.getProperty("clientSifra") %>)</label> 
						</div>
					</div>
					
					
					
					
					
					
					
				
				</div>
				</div>
			</section>		
			</div>
			
			
		


<script type="text/javascript">
var curentItems;
<%if(currentItemsJ.length()>0){%>
curentItems = '<%=currentItemsJ%>';
curentItems = JSON.parse(curentItems);
<%}%>

if(null!=curentItems){
		for (var i=0;i<curentItems.items.length;i++){
			var obj = curentItems.items[i];
			addProizvod(curentItems.items[i].dispID,curentItems.items[i].name, curentItems.items[i].cena, curentItems.items[i].ddv,curentItems.items[i].merka);
			
			
		}
}
</script>
	</body>
</html>