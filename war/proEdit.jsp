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
		<script src="js/jquery.formatCurrency-1.4.0.min.js"></script>
		
		<link rel="stylesheet" href="css/skel.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/style-desktop.css" />
		
		<link rel="stylesheet" href="css/jquery-ui.css" />
		<link rel="stylesheet" href="css/pagingStyles.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body class="homepage">
 <% Entity p = (Entity)request.getAttribute("pro"); %>
			  <% 
			  String currentItemsJ = ""; 
			  if(null!= p.getProperty("items")){ 
			  	currentItemsJ = ((Text) p.getProperty("items")).getValue();
			  }	%>	
	<script type="text/javascript">
	
function printPro(){	
	newwindow=window.open("/proPrint.jsp",'Печати','height=900px,width=850px');
}

function printSpek(){	
	newwindow=window.open("/printspec",'Спецификација','height=900px,width=850px');
}



function goToPage(url){
	    
		document.location.href = url;
		
}

$(document).ready(function() {
	callFilter();
	$("span.money").formatCurrency();
	
	 
	// $("ul.pagination1").quickPagination();
	
	//$("#itemsPagination").quickPagination({pagerLocation:"both",pageSize:'20'});
});
  
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			 
		<!-- Features -->
			 <div id="features-wrapper">
				<section id="features" class="container">
				<div class="row">
					<div class="5u">
						<h4 align="left">Профактура: <%=p.getProperty("dispID") %></h4>
					</div>
					
					<div class="2u">
							<input class="button icon fa-file" style="cursor: pointer;" id="saveForm1"  value="Печати" onclick="printPro()"/>	
					</div>
					
					<div class="2u">
							<input class="button icon fa-file" style="cursor: pointer;" id="saveForm1"  value="Спецификација" onclick="printSpek()"/>	
					</div>
					<div class="2u">
							<input class="button icon fa-file" style="cursor: pointer;" id="saveForm1"  value="Зачувај" onclick="saveProfaktura();"/>	
					</div>
				</div>
				<div class="row">
				<div class="10u" align="center" style="width: 100%">
				<form id="saveProfaktura" method="post" action="saveprofaktura" >
					<input id="proKey" name="proKey" type="hidden" type="text" value="<%=KeyFactory.keyToString(p.getKey()) %>" />
					<input id="clientid" name="clientid" type="hidden" type="text" value="<%=p.getProperty("clientid") %>" />
					
					<input name="sifra" type="hidden"  readonly="readonly" placeholder="Шифра" type="text" value="<%=p.getProperty("sifra") %>" />
					<div class="row">
						<div class="6u" align="left">
							<label class="description" ><h4> Клиент: <%=p.getProperty("clientName") %> (<%=p.getProperty("clientDispID") %>)</h4></label> 
						</div>
						<div class="2u" align="right">
							<select id="tip" name="tip">
								<option <%if(p.getProperty("tip").equals("И-14/15")){ %> selected="selected" <%} %> value="И-14/15">ИПАРД 14/15</option>
								<option <%if(p.getProperty("tip").equals("И-15/16")){ %> selected="selected" <%} %>   value="И-15/16">ИПАРД 15/16</option>
								<option <%if(p.getProperty("tip").equals("Редовен 14")){ %> selected="selected" <%} %>    value="Редовен 14">Редовен 14</option>
								
							</select>
						</div>
						<div class="3u" style="vertical-align: center" >
							<input type="checkbox" title="title"  name="odobrena" id="odobrena"  <%if(p.getProperty("odobrena").equals("true")){ %> checked="checked" <%} %> />Одобрена
						</div>
					</div>
					<div class="row">
						<div>Производи во Профактура:</div>
					</div>
					<div class="row">
						<div class="10u">
						<ul id="proizvodiSelected" class='pagination1'>
						</ul>
						</div>
					</div>
					<div class="row">
						<h3 align="left">Вкупна сума: <b><span id="vkupnaSuma" class="money"><%=p.getProperty("totalValue") %></span></b> (<b><span id="vkupnaSumaDDV" class="money"><%=p.getProperty("totalValueWithDDV") %></span></b>) </h3>
					</div>
					<div class="row">
					<div class="10u"></div>
					</div>
					<input id="proizvodiids" type="hidden"/>
					<div class="row">
						<div class="2u">
						Производи: 
						</div>
						<div class="3u">
							<select id="proizvoditel" name="proizvoditel">
								<option>Алплер</option>
								<option>Зетор</option>
								
							</select>
						</div>
						<div class="2u">
							<select id="zemjapotelko" name="zemjapotelko">
								<option>Турција</option>
								<option>Чешка</option>
							</select>
						</div>
					
						<div class="3u">
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
<script type="text/javascript" charset="utf-8">
function printProfaktura(){
	saveProfaktura();
}


var itemsArray = [];

function changeKolicina(itemID, input, rowid){

	itemsArray[rowid].kolicina = input.value;
	
	
	
		
}

 
function addProizvod(item,rowid) {
	/*alert(proizvodID +proizvodName+cena);*/
	//$( "#proizvodiSelected").append("<div class='row'> <div class='3u'><p>" + proizvodName + " </p></div><div class='3u'>" + cena + " </div></div>");
	//$( "#proizvodiSelected").append("<li><table><tr><td width='30%'>" + item.ime + "</td><td width='30%' align='right'><span class=\"money\"> " + item.cena + "</span></td></tr><table></li>");
	itemsArray.push(item);
	$( "#proizvodiSelected").append("<li><table style=\"cursor: pointer;font-size:large;\" border='1'><tr><td width='5%'>"+item.dispID+"</td><td width='30%'>" + item.ime + "</td><td width='10%'><input type='text' name='kolicina' value='"+item.kolicina+"' onChange='changeKolicina("+item.dispID+",this,"+(itemsArray.length - 1)+")';/></td><td width='20%' align='right'><span class=\"money\"> " + item.cenaBezDanok + "</span></td><td width='20%' align='right'><span class=\"money\">" + item.cenaSoDanok +"</span></td><td width='5%' align='right'>"+item.ddvUI+"</td></tr></table></li>");
	
	/*$("#proizvodiSelected").append(
			"<li><table><tr><td width='30%'>" + proizvodName
					+ "</td><td width='30%'> " + cena
					+ "</td></tr><table></li>");*/
	
					

	$("span.money").formatCurrency();
}

$("#proizvoditel").change(function() {
	callFilter();
});

$("#zemjapotelko").change(function() {
	callFilter();
});
$("#kategorija").change(function() {
	callFilter();
});

var curentItems;
<%if(currentItemsJ.length()>0){%>
curentItems = '<%=currentItemsJ%>';
curentItems = JSON.parse(curentItems);
<%}%>

if(null!=curentItems){
		for (var ii=0;ii<curentItems.items.length;ii++){
			var obj = curentItems.items[ii];
			addProizvod(obj,ii);
		}
		 
}


function saveProfaktura(){
	
	var odobrena = "false";
	
	if($("#odobrena").is(':checked'))
		odobrena = "true";// checked
	else
		odobrena = "false";// checked
	
		
	
	 
	 var proJson = {
		 "prokey" : $("#proKey").val() ,
		 "clientid" :$("#clientid").val() ,
		 "tip" :$("#tip").val() ,
		 "odobrena" :odobrena ,
		 "items" : itemsArray
		 
	 }
	 
	
	 //alert(JSON.stringify(proJson));
	 
	 $.ajax({
		  type: "POST",
		  url: "saveprofaktura",
		  data: JSON.stringify(proJson),
		  success: function (response) {
		      
		        $("#vkupnaSuma").html(response.totalValue);
		        $("#vkupnaSumaDDV").html(response.totalValueDDV);
		    	$("span.money").formatCurrency();
		    	alert("Save Done!"); 
		  }
		 
		});
	 
	 //alert(JSON.stringify(proJson));
	 //alert(itemsArray);
	 
	 
	
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

var itemsResults = null;

function addProizvodFromResults(resultsId){
	addProizvod(itemsResults[resultsId],resultsId);
}



function callFilter(){
var pro = $( "#proizvoditel" ).val();
var zem = $( "#zemjapotelko" ).val();
var kat = $( "#kategorija" ).val();


	
		jQuery.ajax({
		    type: 'GET',
		    encoding:"UTF-8",
		    dataType:"json", 
		    contentType: "application/json; charset=UTF-8",
		    url: "searchItems?zem="+zem+"&pro="+pro+"&kat="+kat,
		    success: function(data) {
		        
		    	
		    	  console.log(data);
				  var obj = data;
				  //var obj = jQuery.parseJSON(data);
				  $("#itemsPagination").empty();
				  itemsResults = obj.results;
				  jQuery.each( obj.results, function( i, item ) {
					  
	/*				 	item.put("dispID", e.getProperty("dispID"));
						item.put("id", KeyFactory.keyToString(e.getKey()));
						item.put("ime", e.getProperty("ime"));
						item.put("cena", e.getProperty("cena"));
						
						item.put("merka", e.getProperty("merka"));
						item.put("proizvoditel", e.getProperty("proizvoditel"));
						item.put("zemjapotelko", e.getProperty("zemjapotelko"));
						item.put("kategorija", e.getProperty("kategorija"));
						item.put("ddv", e.getProperty("ddv"));*/
					  
					 
					  $("#itemsPagination").append("<li onmouseup=\"addProizvodFromResults(\'" + i  + "\')\";><table style=\"cursor: pointer;font-size:large;\" ><tr><td width='5%'>"+item.dispID+"</td><td width='30%'>" + item.ime + "</td><td width='20%' align='right'><span class=\"money\"> " + item.cenaBezDanok + "</span></td><td width='20%' align='right'><span class=\"money\">" + item.cenaSoDanok +"</span></td><td width='10%' ></td><td width='5%' align='right'>"+item.ddvUI+"</td></tr></table></li>");
					  
					});
					$("span.money").formatCurrency();
				  
		    	
		    }
		});
	

	

}


</script>

	</body>
</html>