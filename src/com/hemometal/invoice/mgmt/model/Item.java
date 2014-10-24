package com.hemometal.invoice.mgmt.model;

public class Item {
	
	private String id;
	private String name;
	private String opis;
	
	
	
	
	public Item(String id, String name, String opis) {
		super();
		this.id = id;
		this.name = name;
		this.opis = opis;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOpis() {
		return opis;
	}
	public void setOpis(String opis) {
		this.opis = opis;
	}
	
	
	
	
	

}
