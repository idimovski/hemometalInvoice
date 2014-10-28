package com.hemometal.invoice.mgmt.model;

public class User {
	
	private String email;
	private String token;
	private String refreshtoken;
	
	
	public User(String email, String token, String refreshtoken) {
		super();
		this.email = email;
		this.token = token;
		this.refreshtoken = refreshtoken;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getRefreshtoken() {
		return refreshtoken;
	}
	public void setRefreshtoken(String refreshtoken) {
		this.refreshtoken = refreshtoken;
	}
	
	
	

}
