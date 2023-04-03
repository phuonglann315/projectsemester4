package com.demo.models;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class LanRoomtypeInfo {

	@JsonIgnore
	private Hotel hotel;
	private Integer contractid;
	private Contractinfo contractinfol;
	private double showprice;
	private double priceDif;
	private Date checkin;
	private Date checkout;
	private String checkindate;
	private String checkoutdate;
	private Double payment2;
	private int roomstypeid;
	private String roomstypename;
	private int netprice;
	private String roomtypeimagename;
	private int numcusdefault;
	private int publicprice;
	@JsonIgnore
	private Roomtype roomtype;
	@JsonIgnore
	private List<Roomtype> roomtypes;
	@JsonIgnore
	private List<Contractinforoomtype> contractinforoomtypes;
	private int availableroom;
	@JsonIgnore
	private List<Reservationroomdetails> listroombusy;

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public Integer getContractid() {
		return contractid;
	}

	public void setContractid(Integer contractid) {
		this.contractid = contractid;
	}

	public Contractinfo getContractinfol() {
		return contractinfol;
	}

	public void setContractinfol(Contractinfo contractinfol) {
		this.contractinfol = contractinfol;
	}

	public double getShowprice() {
		return showprice;
	}

	public void setShowprice(double showprice) {
		this.showprice = showprice;
	}

	public Roomtype getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(Roomtype roomtype) {
		this.roomtype = roomtype;
	}

	public List<Roomtype> getRoomtypes() {
		return roomtypes;
	}

	public void setRoomtypes(List<Roomtype> roomtypes) {
		this.roomtypes = roomtypes;
	}

	public List<Contractinforoomtype> getContractinforoomtypes() {
		return contractinforoomtypes;
	}

	public void setContractinforoomtypes(List<Contractinforoomtype> contractinforoomtypes) {
		this.contractinforoomtypes = contractinforoomtypes;
	}


	public int getAvailableroom() {
		return availableroom;
	}

	public void setAvailableroom(int availableroom) {
		this.availableroom = availableroom;
	}

	public List<Reservationroomdetails> getListroombusy() {
		return listroombusy;
	}

	public void setListroombusy(List<Reservationroomdetails> listroombusy) {
		this.listroombusy = listroombusy;
	}

	public LanRoomtypeInfo(Hotel hotel, Integer contractid, double showprice, Roomtype roomtype) {
		super();
		this.hotel = hotel;
		this.contractid = contractid;
		this.showprice = showprice;
		this.roomtype = roomtype;
	}

	

	public LanRoomtypeInfo(Hotel hotel, Integer contractid, double showprice,
			Roomtype roomtype, int availableroom) {
		super();
		this.hotel = hotel;
		this.contractid = contractid;
		this.showprice = showprice;
		this.roomtype = roomtype;
		this.availableroom = availableroom;
	}
	
	

	public int getRoomstypeid() {
		return roomstypeid;
	}

	public void setRoomstypeid(int roomstypeid) {
		this.roomstypeid = roomstypeid;
	}

	public String getRoomstypename() {
		return roomstypename;
	}

	public void setRoomstypename(String roomstypename) {
		this.roomstypename = roomstypename;
	}

	public int getNetprice() {
		return netprice;
	}

	public void setNetprice(int netprice) {
		this.netprice = netprice;
	}

	public String getRoomtypeimagename() {
		return roomtypeimagename;
	}

	public void setRoomtypeimagename(String roomtypeimagename) {
		this.roomtypeimagename = roomtypeimagename;
	}

	public int getNumcusdefault() {
		return numcusdefault;
	}

	public void setNumcusdefault(int numcusdefault) {
		this.numcusdefault = numcusdefault;
	}

	public int getPublicprice() {
		return publicprice;
	}

	public void setPublicprice(int publicprice) {
		this.publicprice = publicprice;
	}

	public LanRoomtypeInfo(Integer contractid, double showprice, int roomstypeid, String roomstypename, int netprice,
			String roomtypeimagename, int numcusdefault, int publicprice, int availableroom) {
		super();
		this.contractid = contractid;
		this.showprice = showprice;
		this.roomstypeid = roomstypeid;
		this.roomstypename = roomstypename;
		this.netprice = netprice;
		this.roomtypeimagename = roomtypeimagename;
		this.numcusdefault = numcusdefault;
		this.publicprice = publicprice;
		this.availableroom = availableroom;
	}
	
	

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	public Date getCheckout() {
		return checkout;
	}

	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}
	

	public double getPriceDif() {
		return priceDif;
	}

	public void setPriceDif(double priceDif) {
		this.priceDif = priceDif;
	}
	
	

	public String getCheckindate() {
		return checkindate;
	}

	public void setCheckindate(String checkindate) {
		this.checkindate = checkindate;
	}

	public String getCheckoutdate() {
		return checkoutdate;
	}

	public void setCheckoutdate(String checkoutdate) {
		this.checkoutdate = checkoutdate;
	}

	

	public Double getPayment2() {
		return payment2;
	}

	public void setPayment2(Double payment2) {
		this.payment2 = payment2;
	}

	

	public LanRoomtypeInfo(double showprice, double priceDif, String checkindate, String checkoutdate, Double payment2,
			int availableroom) {
		super();
		this.showprice = showprice;
		this.priceDif = priceDif;
		this.checkindate = checkindate;
		this.checkoutdate = checkoutdate;
		this.payment2 = payment2;
		this.availableroom = availableroom;
	}

	public LanRoomtypeInfo() {
		super();
	}
}
