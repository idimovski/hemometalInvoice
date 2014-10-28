package com.hemometal.invoice.mgmt.auth;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.http.GenericUrl;
import com.hemometal.invoice.mgmt.model.User;

public class AuthFilter implements Filter {
	
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse res = (HttpServletResponse) arg1;
		
		
		String servlet = req.getServletPath();
		
		
		String  email = (String) req.getSession().getAttribute("user");
		
//		String redirected  = (String) req.getSession().getAttribute("redirected");
		
		String servername = req.getServerName();
		
		if (!("localhost".equals(servername))){
		
		
			if(null==email){
				 if((!("/callback".equals(servlet))) && (!("/notauthorized.jsp".equals(servlet)))){
//					 req.getSession().setAttribute("redirected", "true");
					 GenericUrl url = new GenericUrl(req.getRequestURL().toString());
					 url.setRawPath("/authservlet");
					 System.out.println("user not found");
		
					 RequestDispatcher d = arg0.getRequestDispatcher("/authservlet");
					 d.forward(arg0, arg1);
				 }else{
					 chain.doFilter(req, res);
				 }
				 
			}else{
				chain.doFilter(req, res);
				System.out.println("user" + email);
			}
		}else{
			chain.doFilter(req, res);
		}
	
		
	}

}
