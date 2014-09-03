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
	
	 $( "#additemdialog" ).dialog({
	 	    height: 700,
	 	    width:800,
	 	    modal: false,
	 	   draggable: false,
	 	   	autoOpen: false,
	 	   title: "Нов Производ",
	 	    buttons: {
	 	        "Запиши": function() {
	 	        	$( "#addItemForm" ).submit();
	 	        },
	 	        "Откажи": function() {
	 	        	 $( "#additemdialog" ).dialog("close");
	 	        }
	 	    	
	 	      }
	 	  });
	 
	
});

function openDialog(){
	 $( "#additemdialog" ).dialog("open");
}

function openItem(key){
    
	document.location.href = "getItem?itemKey=" + key;
	alert(key + sifra + ime + cena+proizvoditel+opis);
}

   
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			
		<!-- Features -->
			 <div id="features-wrapper">
				<section id="features" class="container">
				<h3 align="left">Производи:</h3>
				
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
									<label class="description" >Цена</label>
								</td>
								<td width="10%">
									<label class="description" >Производител</label>
								</td>
								<td width="10%">
									<label class="description" >Потекло</label>
								</td>
								
								</tr>
				
			    </table>
			    				
				<ul class="pagination1">
				<%
				int i = 0;
				List<Entity> items  = new ArrayList();
				if (null != request.getAttribute("itemsList")){
					items = (List<Entity>)request.getAttribute("itemsList");
				}
			    for(Entity e : items){
			    i++;	%>
			    
			    
			    
			    <li onmouseup="openItem('<%=KeyFactory.keyToString(e.getKey())%>');">
			    <table border ='1' width='100%' style="cursor: pointer;">
			    				
			    				
								<tr style="cursor: pointer;">
								<td width="10%">
									<label id="rowid" class="description" style="cursor: pointer;"><%=e.getProperty("sifra") %></label>
								</td>
								<td width="40%">
									<label id="" class="description" style="cursor: pointer;"><%=e.getProperty("ime") %></label>
								</td>
								<td width="20%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("cena") %></label>
								</td>
								<td width="10%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("proizvoditel") %></label>
								</td>
								<td width="10%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("zemjapotelko") %></label>
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
						<li><input class="button icon fa-file" style="cursor: pointer;" id="saveForm1" type="submit" value="Нов Производ" onclick="openDialog();"/></li>
						 
						
			</ul>
				
				</section>		
				<div style="display:none">
				<div id="additemdialog">
				<form id="addItemForm" method="post" action="addItem" style="width: 100%" >
				<div class="10u" style="width: 100%"> 
					
					<div class="row">
						
						<div class="5u">
							<input name="ime" placeholder="Име" type="text" />
						</div>
						<div class="5u">
							<input name="cena" placeholder="Цена во Денари" type="text" />
						</div>
					</div>
					<div class="row">
						
						<div class="4u">
							<select name="proizvoditel">
								<option selected="selected">Производител</option>
								<option>Алплер</option>
								<option>Зетор</option>
							</select>
						</div>
						<div class="3u">
							<select name="zemjapotelko">
								<option selected="selected">Потекло</option>
								<option>Турција</option>
								<option>Чешка</option>
							</select>
						</div>
						<div class="3u">
							<select name="kategorija">
								<option selected="selected">Категорија</option>
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
						
						
						
						<div class="5u">
							<select name="merka">
								<option selected="selected">Единечна Мерка</option>
								<option value="par">Парче</option>
								<option value="kg">Килограми</option>
							</select>
						</div>
						<div class="5u">
							<select name="ddv">
								<option selected="selected">ДДВ %</option>
								<option value="5">ДДВ 5%</option>
								<option value="18">ДДВ 18%</option>
							</select>
						</div>
							
					</div>
					<div class="row">
						
						
						<div class="5u">
							<textarea name="opis" placeholder="Опис" type="text" ></textarea>
						</div>
					</div>
					<div class="row">
						
					
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