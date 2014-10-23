package com.hemometal.invoice.mgmt;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.KeyRange;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Text;
import com.google.appengine.api.datastore.Transaction;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.hemometal.invoice.mgmt.helper.ItemHelper;
import com.hemometal.invoice.mgmt.helper.SequenceHelper;

@SuppressWarnings("serial")
public class PrintSpec extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Entity pro = (Entity) req.getSession().getAttribute("pro");
		
		try {
			setSpecToPro(pro);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		req.getSession().setAttribute("pro", pro);

		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/proSpecPrint.jsp");
		 d.forward(req, resp);
	}
	
	
	private void setSpecToPro(Entity profaktura) throws ParseException {
		JSONObject items =  (JSONObject) new JSONParser().parse(((Text) profaktura.getProperty("items")).getValue());
		JSONArray itemsArray = (JSONArray) items.get("items");
		
		//System.out.println(items);
		
		ItemHelper ih = new ItemHelper();
		ArrayList<String> opisList = new ArrayList<String>();
		double total = 0;
		for (Iterator iterator = itemsArray.iterator(); iterator.hasNext();) {
			JSONObject item = (JSONObject) iterator.next();
			String itemKey = item.get("id").toString();
			String opis =  ((Text) ih.getItemDetails(itemKey).getProperty("opis")).getValue();
			opisList.add(opis);
		
			
		}

		profaktura.setProperty("opisList", opisList);
	}

}


