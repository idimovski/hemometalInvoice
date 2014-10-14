package com.hemometal.invoice.mgmt.helper;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;

public class SequenceHelper {
	
	public static String PRO_SEQ = "seqPro";
	public static String CLI_SEQ = "seqCli";
	public static String ITEM_SEQ = "seqItem";
	
	
	
	
	public synchronized long getNext(String table){
		long idl = 1;
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Entity  id = null;
		
	
		try {
			id = datastore.get(KeyFactory.createKey(table, "theID"));
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(null != id){
			idl =  ((long) id.getProperty("seq")+1);
		}else{
			id = new Entity(table,"theID");
			
		}
		id.setProperty("seq", idl);
		datastore.put(id);
		
		return idl;
		
	}
	
	
	

}
