<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>


<!-- Header -->
			<div id="header-wrapper">
				<div id="header" class="container">
					
					<!-- Logo -->
					<!-- 
						<h1 id="logo"><a href="index.html">Hemometal</a></h1>
						<p>Invoice Management System</p>
					 -->
					<!-- Nav -->
					    <%Entity i = (Entity)request.getAttribute("client"); %>
						<nav id="nav">
							<ul>
								<li><a class="icon fa-home" href="index.html"><span>Профактури</span></a>
								<%if (null!=i){ %>
									<ul>
										<li><a href="createPro?clientid=<%=KeyFactory.keyToString(i.getKey())%>">Нова Профактура за <%= i.getProperty("ime") %></a></li>
									</ul>
									<%} %>
								</li>
								<li>
									<a href="getclients" class="icon fa-bar-chart-o"><span>Клиенти</span></a>
									<!--<ul>
										<li><a href="getclients">Клиенти</a></li>
										<li><a href="addItem">Производи</a></li>
									</ul>-->
								</li>
								<li><a class="icon fa-cog" href="addItem"><span>Производи</span></a></li>
								<li><a class="icon fa-retweet" href="right-sidebar.html"><span>За Нас</span></a></li>
								<li><a class="icon fa-sitemap" href="no-sidebar.html"><span>Инфо</span></a></li>
							</ul>
						</nav>

				</div>
			</div>