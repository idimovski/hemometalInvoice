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

@SuppressWarnings("serial")
public class GetItem extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		
		Key itemKey = KeyFactory.stringToKey(req.getParameter("itemKey")); 
		Entity item = null;
		try {
			item = datastore.get(itemKey);
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		req.setAttribute("item", item);
		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/itemEdit.jsp");
		 d.forward(req, resp);
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		String sifra = req.getParameter("sifra");
		String ime = req.getParameter("ime");
		String cena = req.getParameter("cena");
		String proizvoditel = req.getParameter("proizvoditel");
		String zemjapotelko = req.getParameter("zemjapotelko");
		String ddv = req.getParameter("ddv");
		Text opis = new Text(req.getParameter("opis"));

		
		
	}
}
