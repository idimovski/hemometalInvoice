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
public class AddUpdateClient extends HttpServlet {
	
	
	


	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		String itemkey = req.getParameter("clientKey");
		
		Entity item  = null;
		if(null!=itemkey){
			try {
				item = datastore.get(KeyFactory.stringToKey(itemkey));
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			
			item = new Entity("client");
			SequenceHelper sh = new SequenceHelper();
			item.setProperty("dispID", sh.getNext(sh.CLI_SEQ));
		}
		
		
		String sifra = req.getParameter("sifra");
		String ime = req.getParameter("ime");
		String smetka = req.getParameter("smetka");
		String tip = req.getParameter("tip");
		String mesto = req.getParameter("mesto");
		String opstina = req.getParameter("opstina");
		
		String zipcode = req.getParameter("zipcode");
		String danbr = req.getParameter("danbr");
		String tel = req.getParameter("tel");
		String vidnalice = req.getParameter("vidnalice");
		
		
		String adresa = req.getParameter("adresa");
		Text opis = new Text(req.getParameter("opis"));
		
		
		
		
		
		if(null == sifra){
			KeyRange range = datastore.allocateIds("clientseq", 1);
			Key theKey = null;
			for (Iterator iterator = range.iterator(); iterator.hasNext();) {
				theKey = (Key) iterator.next();
				
			}
			item.setProperty("sifra", theKey.toString().replaceAll("\\D+",""));
		}else{
			
			item.setProperty("sifra",sifra);
		}
		
		
		
		item.setProperty("ime", ime);
		item.setProperty("adresa", adresa);
		
		item.setProperty("mesto", mesto);
		item.setProperty("opstina", opstina);
		item.setProperty("zipcode", zipcode);
		item.setProperty("smetka", smetka);
		item.setProperty("danbr", danbr);
		item.setProperty("tel", tel);
		item.setProperty("vidnalice", vidnalice);
		item.setProperty("tip", tip);
		
		
		
		
		item.setProperty("opis", opis);
		item.setProperty("date", new Date());
		
		
		Transaction tr = datastore.beginTransaction();
		
		datastore.put(tr,item);
		
		tr.commit();
		
		System.out.println("Saved client" + item.getProperty("sifra"));
		
	
		 
		RequestDispatcher d = getServletContext().getRequestDispatcher("/getclients");
		d.forward(req, resp);
		
		
		
	}
}
