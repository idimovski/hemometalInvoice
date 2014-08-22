package com.hemometal.invoice.mgmt;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.sun.xml.internal.fastinfoset.algorithm.IEEE754FloatingPointEncodingAlgorithm;

@SuppressWarnings("serial")
public class HemometalinvoceServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query query = new Query("item");
		List<Entity> items = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(1000));
		
		for (Iterator iterator = items.iterator(); iterator.hasNext();) {
			Entity entity = (Entity) iterator.next();
			datastore.delete(entity.getKey());
		}

		
		
		
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world  - zdravo USA");
	}
}
