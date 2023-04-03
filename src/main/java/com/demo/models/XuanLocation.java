package com.demo.models;


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


public class XuanLocation {

	private Integer cityid;	
	private String cityname;
	private Integer wardid;
	private String wardname;
	public Integer getCityid() {
		return cityid;
	}
	public void setCityid(Integer cityid) {
		this.cityid = cityid;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public Integer getWardid() {
		return wardid;
	}
	public void setWardid(Integer wardid) {
		this.wardid = wardid;
	}
	public String getWardname() {
		return wardname;
	}
	public void setWardname(String wardname) {
		this.wardname = wardname;
	}
	public XuanLocation(Integer cityid, String cityname, Integer wardid, String wardname) {
		super();
		this.cityid = cityid;
		this.cityname = cityname;
		this.wardid = wardid;
		this.wardname = wardname;
	}
	public XuanLocation(Integer cityid, String cityname) {
		super();
		this.cityid = cityid;
		this.cityname = cityname;
	}
	public XuanLocation() {
		super();
	}
	
	
	
	
	
	
	
}
