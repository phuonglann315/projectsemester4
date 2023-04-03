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


public class LanLocation {

	private Integer provinceid;
	private String provincename;
	private Integer wardid;
	private String wardname;
	
	
	public Integer getProvinceid() {
		return provinceid;
	}
	public void setProvinceid(Integer provinceid) {
		this.provinceid = provinceid;
	}
	public String getProvincename() {
		return provincename;
	}
	public void setProvincename(String provincename) {
		this.provincename = provincename;
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
	public LanLocation(Integer provinceid, String provincename) {
		super();
		this.provinceid = provinceid;
		this.provincename = provincename;
	}
	
	public LanLocation() {
		super();
	}
	
	
	
	
	
}
