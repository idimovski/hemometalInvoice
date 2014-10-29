package com.hemometal.invoice.mgmt.model;

public class Item {
	
	private String id;
	private String name;
	private String opis;
	private int kolicina;
	private String cena;
	private String cenaSoDanok;
	private String proizvoditel;
	private String zemja;
	private Float vkupnaCena;
	
	
	
	
	
	public Item(String id, String name, String opis, int kolicina,
			String cenaSoDanok, String proizvoditel, String zemja,
			Float vkupnaCena) {
		super();
		this.id = id;
		this.name = name;
		this.opis = opis;
		this.kolicina = kolicina;
		this.cenaSoDanok = cenaSoDanok;
		this.proizvoditel = proizvoditel;
		this.zemja = zemja;
		this.vkupnaCena = vkupnaCena;
	}


	public String getCenaSoDanok() {
		return cenaSoDanok;
	}


	public void setCenaSoDanok(String cenaSoDanok) {
		this.cenaSoDanok = cenaSoDanok;
	}


	public String getProizvoditel() {
		return proizvoditel;
	}


	public void setProizvoditel(String proizvoditel) {
		this.proizvoditel = proizvoditel;
	}


	public String getZemja() {
		return zemja;
	}


	public void setZemja(String zemja) {
		this.zemja = zemja;
	}


	public Float getVkupnaCena() {
		return vkupnaCena;
	}


	public void setVkupnaCena(Float vkupnaCena) {
		this.vkupnaCena = vkupnaCena;
	}


	public int getKolicina() {
		return kolicina;
	}


	public void setKolicina(int kolicina) {
		this.kolicina = kolicina;
	}


	public String getCena() {
		return cena;
	}


	public void setCena(String cena) {
		this.cena = cena;
	}


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
