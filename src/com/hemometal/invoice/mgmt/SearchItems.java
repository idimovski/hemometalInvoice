package com.hemometal.invoice.mgmt;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;

@SuppressWarnings("serial")
public class SearchItems extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String kategorija = req.getParameter("kat");
		String zemja = req.getParameter("zem");
		String proizvoditel = req.getParameter("pro");
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
//		Query query = new Query("item").addFilter("kategorija", FilterOperator.EQUAL, kategorija)
//				.addFilter("proizvoditel", FilterOperator.EQUAL, proizvoditel)
//				.addFilter("zemjapotelko", FilterOperator.EQUAL, zemja)
//				.addSort("ime", SortDirection.ASCENDING);
		
		Query query = new Query("item");
		
		List<Entity> items = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(1000));
		
		JSONObject resultsObj = new JSONObject();
		JSONArray results = new JSONArray();
		for (Iterator iterator = items.iterator(); iterator.hasNext();) {
			Entity e = (Entity) iterator.next();
			
			
			JSONObject item = new JSONObject();
			item.put("id", KeyFactory.keyToString(e.getKey()));
			item.put("ime", e.getProperty("ime"));
			item.put("cena", e.getProperty("cena"));
			results.add(item);
		}
		resultsObj.put("results",results);
		System.out.println(resultsObj.toJSONString());
		
		PrintWriter pw =resp.getWriter();
		pw.print(resultsObj.toJSONString());
	
		
		
	
	}

}
