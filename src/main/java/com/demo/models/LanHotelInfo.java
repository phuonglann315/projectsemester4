package com.demo.models;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class LanHotelInfo {
	
	
	private Hotel hotel;
	private int hotelid;
	private String hotelname;
	private String wardname;
	private String cityname;
	private int publicprice;
	private Integer contractid;
	private Roomtype roomtype;
	private int roomtypeid;
	private double showprice;
	private int imagehotelid;
	private String hotelimagename;

	
	public Hotel getHotel() {
		return hotel;
	}


	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	
	
	public LanHotelInfo(int hotelid, String hotelname) {
		super();
		this.hotelid = hotelid;
		this.hotelname = hotelname;
	}


	public int getHotelid() {
		return hotelid;
	}


	public void setHotelid(int hotelid) {
		this.hotelid = hotelid;
	}


	public String getHotelname() {
		return hotelname;
	}


	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}


	public Integer getContractid() {
		return contractid;
	}


	public void setContractid(Integer contractid) {
		this.contractid = contractid;
	}

	


	public double getShowprice() {
		return showprice;
	}


	public void setShowprice(double d) {
		this.showprice = d;
	}


	public Roomtype getRoomtype() {
		return roomtype;
	}



	public void setRoomtype(Roomtype roomtype) {
		this.roomtype = roomtype;
	}
	
	

	public int getRoomtypeid() {
		return roomtypeid;
	}


	public void setRoomtypeid(int roomtypeid) {
		this.roomtypeid = roomtypeid;
	}


	public int getImagehotelid() {
		return imagehotelid;
	}


	public void setImagehotelid(int imagehotelid) {
		this.imagehotelid = imagehotelid;
	}


	public String getHotelimagename() {
		return hotelimagename;
	}


	public void setHotelimagename(String hotelimagename) {
		this.hotelimagename = hotelimagename;
	}
	
	

	public String getWardname() {
		return wardname;
	}


	public void setWardname(String wardname) {
		this.wardname = wardname;
	}


	public String getCityname() {
		return cityname;
	}


	public void setCityname(String cityname) {
		this.cityname = cityname;
	}


	public int getPublicprice() {
		return publicprice;
	}


	public void setPublicprice(int publicprice) {
		this.publicprice = publicprice;
	}


	public LanHotelInfo() {
		super();
	}


	public LanHotelInfo(Hotel hotel, Integer contractid, double showprice, Roomtype roomtype, int imagehotelid,
			String hotelimagename) {
		super();
		this.hotel = hotel;
		this.contractid = contractid;
		this.roomtype = roomtype;
		this.showprice = showprice;
		this.imagehotelid = imagehotelid;
		this.hotelimagename = hotelimagename;
	}


	public LanHotelInfo(int hotelid, String hotelname, String wardname, String cityname, int publicprice,
			Integer contractid, int roomtypeid, double showprice, int imagehotelid, String hotelimagename) {
		super();
		this.hotelid = hotelid;
		this.hotelname = hotelname;
		this.wardname = wardname;
		this.cityname = cityname;
		this.publicprice = publicprice;
		this.contractid = contractid;
		this.roomtypeid = roomtypeid;
		this.showprice = showprice;
		this.imagehotelid = imagehotelid;
		this.hotelimagename = hotelimagename;
	}

	

}
