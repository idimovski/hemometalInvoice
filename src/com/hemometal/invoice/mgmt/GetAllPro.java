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
import com.google.appengine.api.datastore.Projection;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Text;
import com.google.appengine.api.datastore.Transaction;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;

@SuppressWarnings("serial")
public class GetAllPro extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sifra = req.getParameter("sifra");
		String ime = req.getParameter("ime");
		String prezime = req.getParameter("prezime");
		String firma = req.getParameter("firma");

		
		//String sifra = "71";
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		Query query = new Query("pro");
		if((!("".equals(sifra)))&&(null!= sifra)){
			int sifrai = new Integer(sifra).intValue();
			query.addFilter("dispID", FilterOperator.EQUAL, sifrai);
		}
		
		if((!("".equals(ime)))&&(null!= ime))	query.addFilter("clientNameLC", FilterOperator.EQUAL, ime.toLowerCase());
		if((!("".equals(prezime)))&&(null!= prezime))	query.addFilter("clientPrezimeLC", FilterOperator.EQUAL, prezime.toLowerCase());
		if((!("".equals(firma)))&&(null!= firma))	query.addFilter("clientFirmaNameLC", FilterOperator.EQUAL, firma.toLowerCase());
	
		
		query = query.addSort("date", SortDirection.DESCENDING);
		
		
		
		List<Entity> pros = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(1000));
		
		req.setAttribute("proList", pros);
		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/profakturas.jsp");
		 d.forward(req, resp);
	
	}
	
	/*@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}*/
	
	
}
