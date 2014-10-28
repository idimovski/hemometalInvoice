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
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body class="homepage">


	<!-- Header -->
			<div id="header-wrapper">
				<div id="header" class="container">
					
					<!-- Logo -->
						<h1 id="logo"><a href="index.html">NOT AUTHORIZED</a></h1>
						<p>Hemometal Invoice Management System</p>
						<p><%=request.getAttribute("message") %></p>
						
						
					
					<!-- Nav 
						<nav id="nav">
							<ul>
								<li><a class="icon fa-home" href="index.html"><span>ÐÑÐ¾ÑÐ°ÐºÑÑÑÐ¸</span></a></li>
								<li>
									<a href="" class="icon fa-bar-chart-o"><span>ÐÐ´Ð¼Ð¸Ð½Ð¸ÑÑÑÐ°ÑÐ¸ÑÐ°</span></a>
									<ul>
										<li><a href="#">ÐÐ»Ð¸ÐµÐ½ÑÐ¸</a></li>
										<li><a href="items.jsp">ÐÑÐ¾Ð¸Ð·Ð²Ð¾Ð´Ð¸</a></li>
									</ul>
								</li>
								<li><a class="icon fa-cog" href="left-sidebar.html"><span>ÐÐ·Ð²ÐµÑÑÐ°Ð¸</span></a></li>
								<li><a class="icon fa-retweet" href="right-sidebar.html"><span>ÐÐ° ÐÐ°Ñ</span></a></li>
								<li><a class="icon fa-sitemap" href="no-sidebar.html"><span>ÐÐ½ÑÐ¾</span></a></li>
							</ul>
						</nav>-->

				</div>
			</div>	
			
		<!-- Features
			<div id="features-wrapper">
				<section id="features" class="container">
					<header>
						<h2><strong>Hemometal</strong>Invoice Management system!</h2>
					</header>
					<div class="row">
						<div class="4u">

							<!-- Feature -->
								<section>
									<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
									<header>
										<h3>Okay, so what is this?</h3>
									</header>
									<p>This is <strong>Strongly Typed</strong>, a free, fully responsive site template 
									by <a href="http://html5up.net">HTML5 UP</a>. Free for personal and commercial use under the 
									<a href="http://html5up.net/license">CCA 3.0 license</a>.</p>
								</section>

						</div>
						<div class="4u">

							<!-- Feature -->
								<section>
									<a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
									<header>
										<h3>Nice! What is HTML5 UP?</h3>
									</header>
									<p><a href="http://html5up.net">HTML5 UP</a> is a side project of <a href="http://n33.co">AJâs</a> (= me).  
									I started it as a way to both test my <strong>skel</strong> framework and sharpen up my coding
									and design skills a bit.</p>
								</section>
								
						</div>
						<div class="4u">

							<!-- Feature -->
								<section>
									<a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
									<header>
										<h3>Skel? What's that?</h3>
									</header>
									<p><strong>Skel</strong> is a lightweight framework for building responsive 
									sites and apps. All of my stuff at <a href="http://html5up.net">HTML5 UP</a> (including this 
									one) are built on this framework.</p>
								</section>

						</div>
					</div>
					<ul class="actions">
						<li><a href="#" class="button icon fa-file">Tell Me More</a></li>
					</ul>
				</section>		
			</div>
		
		

		
	

	</body>
</html>