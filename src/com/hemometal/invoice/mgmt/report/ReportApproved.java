package com.hemometal.invoice.mgmt.report;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.datastore.Text;
import com.hemometal.invoice.mgmt.model.Item;

public class ReportApproved extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
		String tip = req.getParameter("tip"); if (null==tip) tip = "И-14/15";
		
		req.setAttribute("tip", tip);
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		Query query = new Query("pro");
		
		query.addFilter("tip", FilterOperator.EQUAL, tip);
		
		
		query.addFilter("odobrena", FilterOperator.EQUAL,"true");
		query.addFilter("deleted", FilterOperator.EQUAL, "false");
		query.addSort("date",SortDirection.DESCENDING);
		
		List<Entity> pros = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
		
		if(null == pros) pros = new ArrayList<>();
		
		HashMap<String, Item>  itemsSummary  = new HashMap<>();
		
		
		for (Iterator iterator = pros.iterator(); iterator.hasNext();) {
			Entity entity = (Entity) iterator.next();
			
			JSONObject items = null;
			try {
				items = (JSONObject) new JSONParser().parse(((Text) entity.getProperty("items")).getValue());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JSONArray itemsArray = (JSONArray) items.get("items");
			
			for (Iterator iteratorinner = itemsArray.iterator(); iteratorinner.hasNext();) {
				
				JSONObject item = (JSONObject) iteratorinner.next();
				String itemKey = item.get("dispID").toString();
				String cenaSoDanok = item.get("cenaSoDanok").toString();
				float cenaSoDanokF = new Float(cenaSoDanok).floatValue();
				String ime = item.get("ime").toString();
				String kolicina = item.get("kolicina").toString();
				int kolicinaint = new Integer(kolicina).intValue();
				String proizvoditel = item.get("proizvoditel").toString();
				String zemjapotelko = item.get("zemjapotelko").toString();
				
				Item hashItem = itemsSummary.get(itemKey);
				if (null==hashItem){
					hashItem = new Item(itemKey, ime, "", (kolicinaint),cenaSoDanok, proizvoditel, zemjapotelko, cenaSoDanokF);
					itemsSummary.put(itemKey, hashItem);
				}else{
					hashItem.setKolicina(hashItem.getKolicina() + kolicinaint); 
					hashItem.setVkupnaCena(hashItem.getVkupnaCena() + cenaSoDanokF);
					itemsSummary.put(itemKey, hashItem);
					
				}
				
				req.setAttribute("itemsSummary", itemsSummary);
				
				System.out.println("");
					
				
				
				
				
				
				
		
			
				
			}
			
			
			
			
			
		}
	
		RequestDispatcher d = getServletContext().getRequestDispatcher("/report-approved.jsp");
		 d.forward(req, resp);
		
	}

}
