package com.hemometal.invoice.mgmt;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.google.appengine.api.datastore.Query.SortDirection;
import com.hemometal.invoice.mgmt.helper.SequenceHelper;

@SuppressWarnings("serial")
public class AddItem extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		loadItemsInReq(req);
		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/items.jsp");
		 d.forward(req, resp);
	}


	private void loadItemsInReq(HttpServletRequest req) {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query query = new Query("item").addSort("date", SortDirection.DESCENDING);
		List<Entity> items = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(1000));
		
		req.setAttribute("itemsList", items);
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Chek if update or insert
		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		String itemkey = req.getParameter("itemKey");
		
		Entity item  = null;
		if(null!=itemkey){
			try {
				item = datastore.get(KeyFactory.stringToKey(itemkey));
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			
			item = new Entity("item");
			SequenceHelper sh = new SequenceHelper();
			item.setProperty("dispID", sh.getNext(sh.ITEM_SEQ));
		}
		
		
		String sifra = req.getParameter("sifra");
		String ime = req.getParameter("ime");
		String cenaSoDDV = req.getParameter("cenaSoDDV").replaceAll("[^\\d.]", "");
		String proizvoditel = req.getParameter("proizvoditel");
		String zemjapotelko = req.getParameter("zemjapotelko");
		String ddv = req.getParameter("ddv");
		String kategorija = req.getParameter("kategorija");
		String merka = req.getParameter("merka");
		
		
		Text opis = new Text(req.getParameter("opis"));
		
		
		
		
		
		if(null == sifra){
			KeyRange range = datastore.allocateIds("itemseq", 1);
			Key theKey = null;
			for (Iterator iterator = range.iterator(); iterator.hasNext();) {
				theKey = (Key) iterator.next();
				
			}
			item.setProperty("sifra", theKey.toString().replaceAll("\\D+",""));
		}else{
			
			item.setProperty("sifra",sifra);
		}
		
		
		float danok = 0;
		String ddvUI = "unknown";
		if("5".equalsIgnoreCase(ddv)){
				danok = (float) 1.05;
				ddvUI = "5%";
				
		}
		if("18".equalsIgnoreCase(ddv)){
			danok = (float) 1.18;
			ddvUI = "18%";
		}
		
		float cenaFloat = new Float(cenaSoDDV);
		float cenaBezDanok = cenaFloat / danok;
		float danokValue = cenaFloat - cenaBezDanok;

		
		String merkaUI = setMerkaUI(merka);
		
		item.setProperty("ime", ime);
		item.setProperty("imeLC", ime.toLowerCase());

		
		item.setProperty("cenaBezDanok", cenaBezDanok);
		item.setProperty("cenaSoDanok", new Float(cenaSoDDV));
		item.setProperty("samoDanok", new Float(danokValue));
		item.setProperty("proizvoditel", proizvoditel);
		item.setProperty("zemjapotelko", zemjapotelko);
		item.setProperty("ddv", ddv);
		item.setProperty("ddvUI", ddvUI);
		item.setProperty("ddvFloat", new Float(danok));
		item.setProperty("kategorija", kategorija);
		item.setProperty("merka", merka);
		item.setProperty("merkaUI", merkaUI);
		item.setProperty("opis", opis);
		item.setProperty("date", new Date());
		
		
		
		Transaction tr = datastore.beginTransaction();
		
		datastore.put(tr,item);
		
		tr.commit();
		
		System.out.println("Saved item" + item.getProperty("sifra"));
		
		loadItemsInReq(req);
		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/items.jsp");
		 d.forward(req, resp);
		
		
		
	}


	private String setMerkaUI(String merka) {
		if (merka.equals("par")) return "Пар";
		if (merka.equals("kg")) return "Кг";
		
		return "undefined";
		
	}
}


