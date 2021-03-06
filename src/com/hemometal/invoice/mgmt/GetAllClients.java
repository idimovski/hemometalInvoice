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
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;

@SuppressWarnings("serial")
public class GetAllClients extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		Query query = new Query("client").addSort("date", SortDirection.DESCENDING);
		
		String ime = req.getParameter("ime");
		String prezime = req.getParameter("prezime");
		String imenafirma = req.getParameter("imenafirma");
		String mesto = req.getParameter("mesto");
		String opstina = req.getParameter("opstina");
	
		
		if((!("".equals(ime)))&&(null!= ime))	query.addFilter("imeLC", FilterOperator.EQUAL, ime.toLowerCase());
		if((!("".equals(prezime)))&&(null!= prezime))	query.addFilter("prezimeLC", FilterOperator.EQUAL, prezime.toLowerCase());
		if((!("".equals(imenafirma)))&&(null!= imenafirma))	query.addFilter("imenafirmaLC", FilterOperator.EQUAL, imenafirma.toLowerCase());
		if((!("".equals(mesto)))&&(null!= mesto))	query.addFilter("mestoLC", FilterOperator.EQUAL, mesto.toLowerCase());
		if((!("".equals(opstina)))&&(null!= opstina))	query.addFilter("opstinaLC", FilterOperator.EQUAL, opstina.toLowerCase());

		
		query.addFilter("deleted", FilterOperator.EQUAL, "false");

		List<Entity> items = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(1000));
		
		req.setAttribute("clientList", items);
		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/clients.jsp");
		 d.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
	
	
}
