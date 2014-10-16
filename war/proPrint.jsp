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
		<script src="js/jquery.formatCurrency-1.4.0.min.js"></script>
		
		
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
function addProizvodToPrint(item){
	
	
	$( "#proizvodiSelected").append("<tr align='center'>"
			+"<td>"+j+"</td>"
			+"<td>"+item.dispID+"</td>"
			+"<td align='left'>"+item.ime+"</td>"
			+"<td>"+item.merkaUI+"</td>"
			+"<td>"+"1"+"</td>"
			+"<td align='right'><span class=\"money\">"+item.cena+"</span>&nbsp;</td>"
			+"<td align='right'><span class=\"money\">"+item.cenaSoDanok+"</span>&nbsp;</td>"
			+"<td align='right'>"+item.ddvUI+"</td>"
			+"");
			
	
	$("span.money").formatCurrency();
	
	j++;
	
}



</script>
	<table border="0" width='800px' style="font-family: sans-serif;">
		<tr>
			<td colspan="2"><img src="images/PrintHeader.jpg" width="800px" />
			</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
			<td width="50%">
			<table width=100% style="border-width: thin;	border-spacing: 0px;	border-style: outset; border-spacing: 1px">
				<tr>
					<td>Датум: <%=p.getProperty("dateF")%>
					</td>
				</tr>
				<tr>
					<td>Про-Фактура: <%=p.getProperty("dispID")%>
					</td>
				</tr>
				<tr>
					<td>Клиент: <%=p.getProperty("clientName")%>
				</tr>
			</table>
			</td>
			<td width="50%">
				<table style="border-width: thin;	border-spacing: 0px;	border-style: outset; border-spacing: 1px" width=100%>
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
				<table id='proizvodiSelected' border="1" style="border-width: thin;	border-spacing: 0px;	border-style: outset; " width = '100%'>
				<thead style="font-weight: bold;">
					<tr align="center">
						<td>Р.б</td>
						<td>Шифра</td>
						<td>Назив на производот</td>
						<td>Е М</td>
						<td>Количина</td>
						<td>Цена</td>
						<td>Цена со данок</td>
						<td>ДДВ %</td>
					</tr>
				</thead>
				</table>
				
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="font-weight: bold;">Вкупна Цена: &nbsp; <span class="money"> <%=p.getProperty("totalValue") %> </span></td>
		</tr>
		<tr>
			<td style="font-weight: bold;">Вкупна Цена со ДДВ:&nbsp;<span class="money"> <%=p.getProperty("totalValueWithDDV") %></span></td>
		</tr>
		
	</table>


			
		


<script type="text/javascript">
var curentItems;
<%if(currentItemsJ.length()>0){%>
curentItems = '<%=currentItemsJ%>';
curentItems = JSON.parse(curentItems);
<%}%>

if(null!=curentItems){
		for (var i=0;i<curentItems.items.length;i++){
			var obj = curentItems.items[i];
			addProizvodToPrint(obj);
			
			
		}
}

window.print();
</script>
	</body>
</html>