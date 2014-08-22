<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
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
		<!-- <script src="js/jquery.dropotron.min.js"></script> -->
		<!-- <script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script> -->
		<!-- <script src="js/init.js"></script> -->
		<script src="JS/quickpager.jquery.js"></script>
		<script src="JS/jquery.quick.pagination.min.js"></script>
		<script src="JS/jquery-ui.js"></script>
		
			
			<!-- <link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" /> -->
			<link rel="stylesheet" href="css/jquery-ui.css" />
			<link rel="stylesheet" href="css/pagingStyles.css" />
		
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body>
	
	<ul class="pagination1">
				<%
				List<Entity> items  = new ArrayList();
				if (null != request.getAttribute("itemsList")){
					items = (List<Entity>)request.getAttribute("itemsList");
				}
			    for(Entity e : items){ %>
			    
			    
			    <li>
			    <table width='100%' style="cursor: pointer;">
								<tr style="cursor: pointer;">
								<td><label class="description" style="cursor: pointer;"></td>
								<td width="20%">
									<label class="description" style="cursor: pointer;"><a href="details?ptid=<%=e.getProperty("sifra")%>"><font style="font-weight:bold" size='2' face="arial" color="black"><%=e.getProperty("sifra") %></font></a></label>
								</td>
								<td width="30%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("ime") %></label>
								</td>
								<td width="30%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("cena") %></label>
								</td>
								
								<td width="10%">
									<a href="details?ptid=<%=e.getProperty("proizvoditel")%>"><font style="font-weight:bold" size='2' face="arial" color="black">Детали</font></a>
								</td>
								</tr>
							</table>
				</li>
			    
			    
			    <%} %>
			    </ul>
	
	<script type="text/javascript">
$(document).ready(function() {

	// $("ul.pagination1").quickPagination();
	
	$("ul.pagination1").quickPagination({pagerLocation:"both",pageSize:'2'});
	//$("ul.pagination2").quickPager({pagerLocation:"both"});
	
});
</script>

<jsp:include page="header.jsp" ></jsp:include>		
			
		<!-- Features -->
			<!--  <div id="features-wrapper">
				<section id="features" class="container">
					<header>
						<h2><strong>Производи</strong></h2>
					</header>
				-->	
				<!-- <div class="row">
				<div class="10u"> -->
				
				<ul class="pagination1">
				<%
				List<Entity> items1  = new ArrayList();
				if (null != request.getAttribute("itemsList")){
					items = (List<Entity>)request.getAttribute("itemsList");
				}
			    for(Entity e : items){ %>
			    
			    
			    <li>
			    <table width='100%' style="cursor: pointer;">
								<tr style="cursor: pointer;">
								<td><label class="description" style="cursor: pointer;"></td>
								<td width="20%">
									<label class="description" style="cursor: pointer;"><a href="details?ptid=<%=e.getProperty("sifra")%>"><font style="font-weight:bold" size='2' face="arial" color="black"><%=e.getProperty("sifra") %></font></a></label>
								</td>
								<td width="30%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("ime") %></label>
								</td>
								<td width="30%">
									<label class="description" style="cursor: pointer;"><%=e.getProperty("cena") %></label>
								</td>
								
								<td width="10%">
									<a href="details?ptid=<%=e.getProperty("proizvoditel")%>"><font style="font-weight:bold" size='2' face="arial" color="black">Детали</font></a>
								</td>
								</tr>
							</table>
				</li>
			    
			    
			    <%} %>
			    </ul>
			   <!--  </div>
				</div> -->
				
				
				
				
				<form id="addItemForm" method="post" action="addItem" >
				
					
					<div class="row">
						<div class="5u">
							<input width="100" name="sifra" placeholder="Шифра" type="text" />
						</div>
						<div class="5u">
							<input name="ime" placeholder="Име" type="text" />
						</div>
					</div>
					<div class="row">
						<div class="5u">
							<input name="cena" placeholder="Цена во Денари" type="text" />
						</div>
						<div class="5u">
							<select name="proizvoditel">
								<option selected="selected">Производител</option>
								<option>Алплер</option>
								<option>Зетор</option>
							</select>
						</div>
							
					</div>
					<div class="row">
						<div class="5u">
							<select name="zemjapotelko">
								<option selected="selected">Земја на потекло</option>
								<option>Турција</option>
								<option>Чешка</option>
							</select>
						</div>
						<div class="5u">
							<select name="ddv">
								<option selected="selected">ДДВ %</option>
								<option>ДДВ 5%</option>
								<option>ДДВ 18%</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="5u">
							<textarea name="opis" placeholder="Опис" type="text" ></textarea>
						</div>
					
					</div>
					<ul class="actions">
						<li><input class="button icon fa-file" id="saveForm1" type="submit" value="Нов Производ"/></li>
						 
						
					</ul>
				</form>
				</section>		
			</div>
			
			
		
		<!-- Banner -->
			<div id="banner-wrapper">
				<div class="inner">
					<section id="banner" class="container">
						<p>Use this space for <strong>profound thoughts</strong>.<br />
						Or an enormous ad. Whatever.</p>
					</section>
				</div>
			</div>

		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
					
						<!-- Content -->
							<div id="content" class="8u">

								<!-- Post -->
									<article class="box post">
										<header>
											<h2><a href="#">I don’t want to say <strong>it’s the aliens</strong> ...<br />
											but it’s the aliens.</a></h2>
										</header>
										<a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
										<h3>I mean isn't it possible?</h3>
										<p>Phasellus laoreet massa id justo mattis pharetra. Fusce suscipit 
										ligula vel quam viverra sit amet mollis tortor congue. Sed quis mauris 
										sit amet magna accumsan tristique. Curabitur leo nibh, rutrum eu malesuada 
										in, tristique at erat lorem ipsum dolor sit amet lorem ipsum sed consequat 
										magna tempus veroeros lorem sed tempus aliquam lorem ipsum veroeros 
										consequat magna tempus lorem ipsum consequat Phasellus laoreet massa id 
										justo mattis pharetra. Fusce suscipit ligula vel quam viverra sit amet 
										mollis tortor congue. Sed quis mauris sit amet magna accumsan tristique. 
										Curabitur leo nibh, rutrum eu malesuada in, tristique at erat.</p>
										<ul class="actions">
											<li><a href="#" class="button icon fa-file">Continue Reading</a></li>
										</ul>
									</article>

								<!-- Post -->
									<article class="box post">
										<header>
											<h2><a href="#">By the way, many thanks to <strong>regularjane</strong>
											for these awesome demo photos</a></h2>
										</header>
										<a href="#" class="image featured"><img src="images/pic05.jpg" alt="" /></a>
										<h3>You should probably check out her work</h3>
										<p>Phasellus laoreet massa id justo mattis pharetra. Fusce suscipit 
										ligula vel quam viverra sit amet mollis tortor congue. Sed quis mauris 
										sit amet magna accumsan tristique. Curabitur leo nibh, rutrum eu malesuada 
										in, tristique at erat lorem ipsum dolor sit amet lorem ipsum sed consequat 
										consequat magna tempus lorem ipsum consequat Phasellus laoreet massa id 
										in, tristique at erat lorem ipsum dolor sit amet lorem ipsum sed consequat 
										magna tempus veroeros lorem sed tempus aliquam lorem ipsum veroeros 
										consequat magna tempus lorem ipsum consequat Phasellus laoreet massa id 
										justo mattis pharetra. Fusce suscipit ligula vel quam viverra sit amet 
										mollis tortor congue. Sed quis mauris sit amet magna accumsan tristique. 
										Curabitur leo nibh, rutrum eu malesuada in, tristique at erat.</p>
										<p>Erat lorem ipsum veroeros consequat magna tempus lorem ipsum consequat 
										Phasellus laoreet massa id justo mattis pharetra. Fusce suscipit ligula 
										vel quam viverra sit amet mollis tortor congue. Sed quis mauris sit amet 
										magna accumsan tristique. Curabitur leo nibh, rutrum eu malesuada in, 
										tristique at erat. Curabitur leo nibh, rutrum eu malesuada  in, tristique 
										at erat lorem ipsum dolor sit amet lorem ipsum sed consequat magna 
										tempus veroeros lorem sed tempus aliquam lorem ipsum veroeros consequat 
										magna tempus</p>
										<ul class="actions">
											<li><a href="#" class="button icon fa-file">Continue Reading</a></li>
										</ul>
									</article>
							
							</div>
							
						<!-- Sidebar -->
							<div id="sidebar" class="4u">
							
								<!-- Excerpts -->
									<section>
										<ul class="divided">
											<li>

												<!-- Excerpt -->
													<article class="box excerpt">
														<header>
															<span class="date">July 30</span>
															<h3><a href="#">Just another post</a></h3>
														</header>
														<p>Lorem ipsum dolor odio facilisis convallis. Etiam non nunc vel est 
														suscipit convallis non id orci lorem ipsum sed magna consequat feugiat lorem dolore.</p>
													</article>

											</li>
											<li>

												<!-- Excerpt -->
													<article class="box excerpt">
														<header>
															<span class="date">July 28</span>
															<h3><a href="#">And another post</a></h3>
														</header>
														<p>Lorem ipsum dolor odio facilisis convallis. Etiam non nunc vel est 
														suscipit convallis non id orci lorem ipsum sed magna consequat feugiat lorem dolore.</p>
													</article>

											</li>
											<li>

												<!-- Excerpt -->
													<article class="box excerpt">
														<header>
															<span class="date">July 24</span>
															<h3><a href="#">One more post</a></h3>
														</header>
														<p>Lorem ipsum dolor odio facilisis convallis. Etiam non nunc vel est 
														suscipit convallis non id orci lorem ipsum sed magna consequat feugiat lorem dolore.</p>
													</article>

											</li>
										</ul>
									</section>
							
								<!-- Highlights -->
									<section>
										<ul class="divided">
											<li>

												<!-- Highlight -->
													<article class="box highlight">
														<header>
															<h3><a href="#">Something of note</a></h3>
														</header>
														<a href="#" class="image left"><img src="images/pic06.jpg" alt="" /></a>
														<p>Phasellus  sed laoreet massa id justo mattis pharetra. Fusce suscipit ligula vel quam 
														viverra sit amet mollis tortor congue magna lorem ipsum dolor et quisque ut odio facilisis 
														convallis. Etiam non nunc vel est suscipit convallis non id orci. Ut interdum tempus 
														facilisis convallis. Etiam non nunc vel est suscipit convallis non id orci.</p>
														<ul class="actions">
															<li><a href="#" class="button icon fa-file">Learn More</a></li>
														</ul>
													</article>

											</li>
											<li>

												<!-- Highlight -->
													<article class="box highlight">
														<header>
															<h3><a href="#">Something of less note</a></h3>
														</header>
														<a href="#" class="image left"><img src="images/pic07.jpg" alt="" /></a>
														<p>Phasellus  sed laoreet massa id justo mattis pharetra. Fusce suscipit ligula vel quam 
														viverra sit amet mollis tortor congue magna lorem ipsum dolor et quisque ut odio facilisis 
														convallis. Etiam non nunc vel est suscipit convallis non id orci. Ut interdum tempus 
														facilisis convallis. Etiam non nunc vel est suscipit convallis non id orci.</p>
														<ul class="actions">
															<li><a href="#" class="button icon fa-file">Learn More</a></li>
														</ul>
													</article>

											</li>
										</ul>
									</section>
							
							</div>

					</div>
				</div>
			</div>

		<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

	</body>
</html>