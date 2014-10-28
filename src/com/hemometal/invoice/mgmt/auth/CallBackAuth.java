package com.hemometal.invoice.mgmt.auth;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.auth.oauth2.AuthorizationCodeFlow;
import com.google.api.client.auth.oauth2.AuthorizationCodeResponseUrl;
import com.google.api.client.auth.oauth2.BearerToken;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.StoredCredential;
import com.google.api.client.extensions.servlet.auth.oauth2.AbstractAuthorizationCodeCallbackServlet;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets.Details;
import com.google.api.client.http.BasicAuthentication;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.LowLevelHttpRequest;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.plus.Plus;
import com.google.api.services.plus.model.Person;
import com.google.api.services.plus.model.Person.Emails;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.hemometal.invoice.mgmt.model.User;


public class CallBackAuth extends AbstractAuthorizationCodeCallbackServlet   {
	
	
	private static final long serialVersionUID = 1L;
	
	private static ArrayList<String> list = new ArrayList<>();
	

	protected void onSuccess(HttpServletRequest req, HttpServletResponse resp, Credential credential)
	      throws ServletException, IOException {
		
	
		list.add("ivanco888@gmail.com");
		list.add("dimitarvelkovski@gmail.com");
		
		System.out.println("callback servlet called");
		
		Plus plus = new Plus(new NetHttpTransport(),new JacksonFactory(),credential);
		
		Person mePerson = plus.people().get("me").execute();
		String email = mePerson.getEmails().get(0).getValue();
		
		if(list.contains(email)){
		
			Entity user = new Entity("user");
			user.setProperty("token", credential.getAccessToken());
			user.setProperty("refreshtoken", credential.getRefreshToken());
			user.setProperty("email", email);
			user.setProperty("date", new Date());
			
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			datastore.put(user);
			req.getSession().setAttribute("user", email);
			
		    resp.sendRedirect("/getallpro");
		    System.out.println("user found");
		}else{
			System.out.println("not authorized email:" + email);
			req.setAttribute("message", "User ID:" + email + " is not authorized." );
			resp.sendRedirect("/notauthorized.jsp");
			
		}
	  }

	  protected void onError(
	      HttpServletRequest req, HttpServletResponse resp, AuthorizationCodeResponseUrl errorResponse)
	      throws ServletException, IOException {
	    // handle error
	  }

	  protected String getRedirectUri(HttpServletRequest req) throws ServletException, IOException {
	    GenericUrl url = new GenericUrl(req.getRequestURL().toString());
	    url.setRawPath("/callback");
	    return url.build();
	  }

	  protected AuthorizationCodeFlow initializeFlow() throws IOException {
		  ArrayList<String> scopes = new ArrayList<String>();
		  scopes.add("https://www.googleapis.com/auth/userinfo.email");
		  
		  GoogleClientSecrets sec = new GoogleClientSecrets();
		  Details det = new Details().setClientId("650778583722-ppp4r2cjjqkoqo63v62hbj1s30fcbvr3.apps.googleusercontent.com");
		  det.setClientSecret("0r_xXmGb5VFb1CBl_cPrFBUH");
		  sec.setWeb(det);
		  
		  AuthorizationCodeFlow af = new GoogleAuthorizationCodeFlow.Builder(new NetHttpTransport(), new JacksonFactory(), sec , scopes).build();
		 
//		  AuthorizationCodeFlow af =  new AuthorizationCodeFlow.Builder(BearerToken.authorizationHeaderAccessMethod(),new NetHttpTransport(), new JacksonFactory(), new GenericUrl("https://accounts.google.com/o/oauth2/token"),   null,	        "650778583722-ppp4r2cjjqkoqo63v62hbj1s30fcbvr3.apps.googleusercontent.com",      "https://accounts.google.com/o/oauth2/auth")
		  
//		  .
		  
		  return af;
	   
	  }

	  protected String getUserId(HttpServletRequest req) throws ServletException, IOException {
		
		
		  
		return null;
	  }

}
