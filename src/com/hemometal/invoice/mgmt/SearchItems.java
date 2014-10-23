package com.hemometal.invoice.mgmt;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
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
import com.google.appengine.api.datastore.Text;

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
		
		List<Entity> items = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
		
		JSONObject resultsObj = new JSONObject();
		JSONArray results = new JSONArray();
		for (Iterator iterator = items.iterator(); iterator.hasNext();) {
			Entity e = (Entity) iterator.next();
			
			System.out.println(e.getProperty("ime"));
			
			JSONObject item = new JSONObject();
			item.put("dispID", e.getProperty("dispID"));
			item.put("id", KeyFactory.keyToString(e.getKey()));
			item.put("ime", e.getProperty("ime"));
			item.put("cenaBezDanok", e.getProperty("cenaBezDanok"));
			item.put("cenaSoDanok", e.getProperty("cenaSoDanok"));
			
			item.put("merka", e.getProperty("merka"));
			item.put("merkaUI", e.getProperty("merkaUI"));
			
			item.put("proizvoditel", e.getProperty("proizvoditel"));
			item.put("zemjapotelko", e.getProperty("zemjapotelko"));
			item.put("kategorija", e.getProperty("kategorija"));
			item.put("ddv", e.getProperty("ddv"));
			item.put("ddvUI", e.getProperty("ddvUI"));
			item.put("samoDanok", e.getProperty("samoDanok"));
			item.put("kolicina", "1");
			
			
			
			
			
			
	
			results.add(item);
		}
		resultsObj.put("results",results);
//		System.out.println(resultsObj.toString().getBytes());
		System.out.println(resultsObj.toJSONString());

		
		
		resp.setContentType("application/json;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter pw = resp.getWriter();
		pw.write(resultsObj.toString());
	
		
		
	
	}

}


