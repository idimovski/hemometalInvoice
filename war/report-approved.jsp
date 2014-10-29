<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@ page import="com.hemometal.invoice.mgmt.model.*"%>
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
	
	<%
	String tip = (String)request.getAttribute("tip"); if (null==tip) tip = "И-14/15";
	
	float totalValue = 0.0F;
	%>
	<script type="text/javascript">
function reload(selectOption){
	document.location.href = "/reportapproved?tip="+selectOption.value;
}


   
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			
		<!-- Features -->
			 <div id="features-wrapper">
				<section id="features" class="container">
				<div class="row">
					<div class="5u">
						<h3 align="left">Производи од Одобрени Профактури:</h3>
					</div>
					<div class="5u">
						
					</div>
				</div>
				<div class="row">
				</div>
				<form action="">
					<div class="row">
						<div class="2u">
							<select id="tip" onchange="reload(this)">
								<option <%if (tip.equals("И-14/15")){ %> selected="selected"<%} %> value="И-14/15">ИПАРД 14/15</option>
								<option <%if (tip.equals("И-15/16")){ %> selected="selected"<%} %> value="И-15/16">ИПАРД 15/16</option>
								<option <%if (tip.equals("Редовен 14")){ %> selected="selected"<%} %> value="Редовен 14">Редовен 14</option>
							</select>
						</div>
						
						<div class="2u">
							<!-- <input class="button icon fa-file" style="cursor: pointer;" id="saveForm1" type="button" value="Барај" onclick="barajprofaktura();"/> -->
						</div>
						
					</div>			
				</form>			
				<div class="row">
				</div>
				<div class="row">
				<div class="10u" style="width: 100% " align="center">
				
				
			    <table border ='1' width='100%' style="cursor: pointer;">
			    				<tr style="cursor: pointer;">
								<td width="5%">
									<label class="description">Шифра</label>
								</td>
								<td width="52%">
									<label class="description" >Име</label>
								</td>
								<td width="20%" align="right">
									<label class="description" >Цена</label>
								</td>
								<td width="8%" align='center'>
									<label class="description" >Количина</label>
								</td>
								<td width="15%" align='right'>
									<label class="description" >Вкупна Сума (Ден)</label>
								</td>
								
								
							
								
								</tr>
				
			    </table>
			    				
				<ul class="pagination1">
				<%
				int i = 0;
				HashMap<String,Item>  itemsSummary  = null;
				if (null != request.getAttribute("itemsSummary")){
					itemsSummary = (HashMap<String,Item>)request.getAttribute("itemsSummary");
				}else{
					itemsSummary  = new HashMap<String,Item>();
				}
				Iterator it = itemsSummary.entrySet().iterator();
			    while (it.hasNext()) {
			        Map.Entry pairs = (Map.Entry)it.next();
			      	Item item = (Item) pairs.getValue();
			        it.remove(); // avoids a ConcurrentModificationException
					totalValue = totalValue+ item.getVkupnaCena();
%>
			    
			    
			    
			    <li>
			    <table border ='1' width='100%' style="cursor: pointer;font-size:large;">
			    				
			    				
								<tr style="cursor: pointer;">
								<td width="5%">
									<label id="rowid" class="description" ><%=item.getId() %></label>
								</td>
								<td width="52%">
									<label id="" class="description"><%=item.getName() + " (" + item.getProizvoditel() + " - "  +item.getZemja()+")" %></label>
								</td>
								<td width="20%" align="right">
									<label class="description"><span class="money"><%=item.getCenaSoDanok() %></span></label>
								</td>
								<td width="8%" align="center" nowrap="nowrap">
									<label class="description"><%=item.getKolicina() %></label>
								</td>
								<td width="15%" align='right'>
									<label class="description" ><span class="money"><%=item.getVkupnaCena() %></span></label>
								</td>
								
								
								
							
								</tr>
							</table>
				</li>
			    
			    
			    <%} %>
			    </ul>
			   </div>
				</div>
				
			<br/>
			<div class="row">
			<div class="5u"><h3> Вкупно:&nbsp;<label class="description"><span class="money"><%=totalValue %></span></label></h3> </div>
			</div>
			<ul class="actions">
					<!-- 	<li><input class="button icon fa-file" style="cursor: pointer;" id="saveForm1" type="submit" value="Нов Клиент" onclick="openDialog();"/></li> -->
						 
						
			</ul>
				
				</section>		
			</div>
			
			
		
	

		<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
$("span.money").formatCurrency();
</script>
	</body>
</html>