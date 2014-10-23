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
			//+"<td>"+item.dispID+"</td>"
			+"<td align='left' norwap='nowrap'>"+item.ime+"</td>"
			+"<td>"+item.merkaUI+"</td>"
			+"<td>"+item.kolicina+"</td>"
			+"<td align='right'><span class=\"money\">"+item.cenaBezDanok+"</span>&nbsp;</td>"
			+"<td align='right'><span class=\"money\">"+item.cenaBezDanok * item.kolicina+"</span>&nbsp;</td>"
			+"<td align='right'><span class=\"money\">"+item.samoDanok+"</span>&nbsp;</td>"
			+"<td align='right'><span class=\"money\">"+item.cenaSoDanok+"</span>&nbsp;</td>"
			+"<td align='right'><span class=\"money\">"+item.cenaSoDanok * item.kolicina +"</span>&nbsp;</td>"
			+"<td align='right'>"+item.ddvUI+"</td>"
			+"");
			
	
	$("span.money").formatCurrency();
	
	j++;
	
}



</script>
	<table border="0" width='800px' style="font-family: sans-serif;font-size: small;">
		<tr>
			<td colspan="2"><img src="images/PrintHeader.jpg" width="800px" />
			</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
			<td width="50%">
			<table width=100% style="border-width: thin;	border-spacing: 0px;	border-style: outset; border-spacing: 1px; font-family: sans-serif; " >
				<tr>
					<td>Датум: <%=p.getProperty("dateOnly")%>
					</td>
				</tr>
				<tr>
					<td><font style="font-weight: bold;">ПРО-ФАКТУРА: <%=p.getProperty("dispID")%></font></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
			</td>
			<td width="50%">
				<table style="border-width: thin;	border-spacing: 0px;	border-style: outset; border-spacing: 1px" width=100%>
					<tr><td>
					<%if (!("".equalsIgnoreCase((String) p.getProperty("clientFirmaName")) ))  { %>
					<%=p.getProperty("clientFirmaName")%>
					<%}else{%>
					<%=p.getProperty("clientName")%>&nbsp;<%=p.getProperty("clientPrezime")%>
					<%} %>
					</td></tr>
					<tr><td><%=p.getProperty("clientadresa")%></td></tr>
					<tr><td><%=p.getProperty("clientmesto")%></td></tr>
					<tr><td><%=p.getProperty("clientopstina")%></td></tr>
					
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
						<td rowspan="2">Р.б</td>
						<!-- <td rowspan="2">Шифра</td>-->
						<td rowspan="2">Назив на производот</td>
						<td rowspan="2">Е М</td>
						<td rowspan="2">Кол</td>
						<td colspan="2">Цена без данок</td>
						
						<td rowspan="2">ДДВ по <br> единица</td>
						<td colspan="2">Цена со данок</td>
						
						<td rowspan="2">ДДВ<br>%</td>
					</tr>
					<tr align="center">
						<td>По един.</td>
						<td>Износ</td>
						<td>По един.</td>
						<td>Износ</td>
					</tr>
				</thead>
				</table>
				
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td></td>
			<td>
			<table border="1" style="border-width: thin;border-spacing: 0px;border-style: outset;width: 100% ; " border="0">
				<tr>
					<td style="font-weight: bold;" align="right">Износ без ДДВ:</td><td align="right"><span class="money"><%=p.getProperty("totalValue") %></span></td>
				</tr>
				<tr>
					<td style="font-weight: bold;" align="right">ДДВ:</td><td align="right"><span class="money"> <%=p.getProperty("totalDDV") %></span></td>
				</tr>
				<tr>
					<td style="font-weight: bold;" align="right">За наплата:</td><td align="right"><font style="font-weight: bold;"><span class="money"> <%=p.getProperty("totalValueWithDDV") %></span></font></td>
				</tr>
				
			</table>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td colspan="2">За ненавремено плаќање на фактура пресметуваме законска затезна камата.</td></tr>
		<tr><td colspan="2">Рекламации се примаат во рок од 8 дена.</td></tr>
		<tr><td colspan="2">Во случај на спор надлежен е Oсновниот суд во Битола.</td></tr>
		<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
		<tr><td colspan="2">
			<table style="width: 100%" border="0" >
			<tr align="center">
			<td>_________________________</td>
			<td>_________________________</td>
			<td>_________________________</td>
			</tr>
			<tr align="center">
			<td>Примил</td>
			<td>Директор</td>
			<td>Фактурирал</td>
			</tr>
			</table>
		</td>
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