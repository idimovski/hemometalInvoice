package com.hemometal.invoice.mgmt;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

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
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Text;
import com.google.appengine.api.datastore.Transaction;


@SuppressWarnings("serial")
public class SaveProfaktura extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*loadItemsInReq(req);
		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/items.jsp");
		 d.forward(req, resp);*/
	}


	private void loadItemsInReq(HttpServletRequest req) {
		/*DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query query = new Query("item").addSort("date", SortDirection.DESCENDING);
		List<Entity> items = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(1000));
		
		req.setAttribute("itemsList", items);*/
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("save profaktura called");
		StringBuffer jb = new StringBuffer();
		JSONObject jsonObject = null;
		String line = null;
		try {
			BufferedReader reader = req.getReader();
			while ((line = reader.readLine()) != null)
				jb.append(line);
		} catch (Exception e) { /* report an error */
		}
		System.out.println(jb.toString());
		try {
			jsonObject = (JSONObject) new JSONParser().parse(jb.toString());
		} catch (ParseException e) {
			// crash and burn
			e.printStackTrace();
			throw new IOException("Error parsing JSON request string");
		}

		System.out.println(jsonObject.toJSONString());

		JSONArray items = (JSONArray) jsonObject.get("items");
		String prokey =  jsonObject.get("prokey").toString();
		
		  
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Entity profaktura= null;
		if(null!=prokey){
			try {
				profaktura = datastore.get(KeyFactory.stringToKey(prokey));
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			
			try {
				throw new Exception("profaktura not found");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
//		profaktura.setProperty("items", new Text(items.toJSONString()));
		profaktura.setProperty("items", new Text(jsonObject.toJSONString()));
		
		
		

		
		Transaction tr = datastore.beginTransaction();
		
		datastore.put(tr,profaktura);
		
		tr.commit();
		
		System.out.println("Saved profaktura" + profaktura.getProperty("sifra"));
		
	
		
		
	}
}
