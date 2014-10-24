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
					    <% Entity p = (Entity)request.getAttribute("pro"); %>
					    <% Entity ii = (Entity)request.getAttribute("item"); %>
					    
						<nav id="nav">
							<ul>
								<li><a class="icon fa-home" href="getallpro"><span>Профактури</span></a>
								<%if (null!=p){ %>
									<ul>
										<li><a href="delete?objid=<%=KeyFactory.keyToString(p.getKey())%>&kind=pro">Избриши Профактура Број&nbsp;<%=p.getProperty("dispID") %></a></li>
									</ul>
									<%} %>
								<%if (null!=i){ %>
									<ul>
										<li><a href="createPro?clientid=<%=KeyFactory.keyToString(i.getKey())%>">Нова Профактура за <%= i.getProperty("ime") %></a></li>
									</ul>
									<%} %>
								</li>
								<li>
									<a href="getclients" class="icon fa-bar-chart-o"><span>Клиенти</span></a>
									<%if (null!=i){ %>
									<ul>
										<li><a href="delete?objid=<%=KeyFactory.keyToString(i.getKey())%>&kind=client">Избриши Клиент Број&nbsp;<%=i.getProperty("dispID") %></a></li>
									</ul>
									<%} %>
								</li>
								<li>
									<a class="icon fa-cog" href="addItem"><span>Производи</span></a>
									
									<%if (null!=ii){ %>
									<ul>
										<li><a href="delete?objid=<%=KeyFactory.keyToString(ii.getKey())%>&kind=item">Избриши Производ Број&nbsp;<%=ii.getProperty("dispID") %></a></li>
									</ul>
									<%} %>
								
								</li>
								
								<li><a class="icon fa-retweet" href="right-sidebar.html"><span>За Нас</span></a></li>
								<li><a class="icon fa-sitemap" href="no-sidebar.html"><span>Инфо</span></a></li>
							</ul>
						</nav>

				</div>
			</div>