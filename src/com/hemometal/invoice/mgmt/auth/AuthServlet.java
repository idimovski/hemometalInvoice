package com.hemometal.invoice.mgmt.auth;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.auth.oauth2.AuthorizationCodeFlow;
import com.google.api.client.auth.oauth2.BearerToken;
import com.google.api.client.extensions.servlet.auth.oauth2.AbstractAuthorizationCodeServlet;
import com.google.api.client.http.BasicAuthentication;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;
import com.hemometal.invoice.mgmt.model.User;

public class AuthServlet extends AbstractAuthorizationCodeServlet  {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws IOException {
		
		System.out.println("auth servlet called");
		
//		User  user = (User)request.getSession().getAttribute("user");
//		
//		if(null==user){
			initializeFlow();
//		}else{
//			 GenericUrl url = new GenericUrl(request.getRequestURL().toString());
//			  url.setRawPath("/getallpro");
//			
//		}
	  }

	  @Override
	  protected String getRedirectUri(HttpServletRequest req) throws ServletException, IOException {
	    GenericUrl url = new GenericUrl(req.getRequestURL().toString());
	    url.setRawPath("/callback");
	    
	    
	    return url.build();
	  }

	  @Override
	  protected AuthorizationCodeFlow initializeFlow() throws IOException {
		  ArrayList<String> scopes = new ArrayList<String>();
		  scopes.add("https://www.googleapis.com/auth/userinfo.email");
		 
		  AuthorizationCodeFlow af =  new AuthorizationCodeFlow.Builder(
				  BearerToken.authorizationHeaderAccessMethod(),
				  new NetHttpTransport(), 
				  new JacksonFactory(), 
				  new GenericUrl("https://accounts.google.com/o/oauth2/auth"),   
				  new BasicAuthentication("s6BhdRkqt3", "7Fjfp0ZBr1KtDRbnfVdmIw"),	        
				  "650778583722-ppp4r2cjjqkoqo63v62hbj1s30fcbvr3.apps.googleusercontent.com",      
				  "https://accounts.google.com/o/oauth2/auth")
		  .setScopes(scopes).build();
		  
		  return af;
	  }

	  @Override
	  protected String getUserId(HttpServletRequest req) throws ServletException, IOException {
		return null;
	    
	  }

}
