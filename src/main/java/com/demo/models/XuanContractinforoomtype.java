package com.demo.models;
// Generated Nov 29, 2022, 9:55:34 AM by Hibernate Tools 4.3.6.Final

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


public class XuanContractinforoomtype implements java.io.Serializable {

	private int availableroom;
	private double price;
	private String email;
	private String phone;
	private String checkroom;
	public int getAvailableroom() {
		return availableroom;
	}
	public void setAvailableroom(int availableroom) {
		this.availableroom = availableroom;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public XuanContractinforoomtype(int availableroom, double price) {
		super();
		this.availableroom = availableroom;
		this.price = price;
	}
	public XuanContractinforoomtype() {
		super();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public XuanContractinforoomtype(int availableroom, double price, String email) {
		super();
		this.availableroom = availableroom;
		this.price = price;
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public XuanContractinforoomtype(int availableroom, double price, String email, String phone) {
		super();
		this.availableroom = availableroom;
		this.price = price;
		this.email = email;
		this.phone = phone;
	}
	public String getCheckroom() {
		return checkroom;
	}
	public void setCheckroom(String checkroom) {
		this.checkroom = checkroom;
	}
	public XuanContractinforoomtype(int availableroom, double price, String email, String phone, String checkroom) {
		super();
		this.availableroom = availableroom;
		this.price = price;
		this.email = email;
		this.phone = phone;
		this.checkroom = checkroom;
	}
	

	

}
