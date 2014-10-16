package com.hemometal.invoice.mgmt;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;

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
public class CreateProfactura extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SequenceHelper sh = new SequenceHelper();
		long displayID = sh.getNext(sh.PRO_SEQ);
		System.out.println(sh.PRO_SEQ + " " + displayID);
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		String clientid = req.getParameter("clientid");
		
		Entity pro = new Entity("pro");
		
		Key proKey =  datastore.put(pro);
		
		pro.setProperty("sifra", proKey.toString().replaceAll("\\D+",""));
		pro.setProperty("dispID", new Long(displayID));
		
		
		pro.setProperty("clientid", clientid);
		
		Entity client = null;
		try {
			client = datastore.get(KeyFactory.stringToKey(clientid));
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		pro.setProperty("clientName", client.getProperty("ime"));
		pro.setProperty("clientSifra", client.getProperty("sifra"));
		pro.setProperty("date", new Date());
		SimpleDateFormat dt = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss");
		dt.setTimeZone(TimeZone.getTimeZone("Europe/Skopje"));
		pro.setProperty("dateF", dt.format(new Date()));
		pro.setProperty("totalValue", "0");
		pro.setProperty("totalValueWithDDV", "0");

		 
		
		datastore.put(pro);
		
		req.setAttribute("pro", pro);
		req.getSession().setAttribute("pro", pro);
		RequestDispatcher d = getServletContext().getRequestDispatcher("/proEdit.jsp");
		d.forward(req, resp);
		
	}


	private void loadItemsInReq(HttpServletRequest req) {
		
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Chek if update or insert
		
//		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
//		String itemkey = req.getParameter("itemKey");
//		
//		Entity item  = null;
//		if(null!=itemkey){
//			try {
//				item = datastore.get(KeyFactory.stringToKey(itemkey));
//			} catch (EntityNotFoundException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}else{
//			
//			item = new Entity("item");
//		}
//		
//		
//		String sifra = req.getParameter("sifra");
//		String ime = req.getParameter("ime");
//		String cena = req.getParameter("cena");
//		String proizvoditel = req.getParameter("proizvoditel");
//		String zemjapotelko = req.getParameter("zemjapotelko");
//		String ddv = req.getParameter("ddv");
//		String kategorija = req.getParameter("kategorija");
//		String merka = req.getParameter("merka");
//		
//		
//		Text opis = new Text(req.getParameter("opis"));
//		
//		
//		
//		
//		
//		if(null == sifra){
//			KeyRange range = datastore.allocateIds("itemseq", 1);
//			Key theKey = null;
//			for (Iterator iterator = range.iterator(); iterator.hasNext();) {
//				theKey = (Key) iterator.next();
//				
//			}
//			item.setProperty("sifra", theKey.toString().replaceAll("\\D+",""));
//		}else{
//			
//			item.setProperty("sifra",sifra);
//		}
//		
//		
//		
//		item.setProperty("ime", ime);
//		item.setProperty("cena", cena);
//		item.setProperty("proizvoditel", proizvoditel);
//		item.setProperty("zemjapotelko", zemjapotelko);
//		item.setProperty("ddv", ddv);
//		item.setProperty("kategorija", kategorija);
//		item.setProperty("merka", merka);
//		item.setProperty("opis", opis);
//		item.setProperty("date", new Date());
//		
//		
//		Transaction tr = datastore.beginTransaction();
//		
//		datastore.put(tr,item);
//		
//		tr.commit();
//		
//		System.out.println("Saved item" + item.getProperty("sifra"));
//		
//		loadItemsInReq(req);
//		
//		RequestDispatcher d = getServletContext().getRequestDispatcher("/items.jsp");
//		 d.forward(req, resp);
//		
		
		
	}
}
