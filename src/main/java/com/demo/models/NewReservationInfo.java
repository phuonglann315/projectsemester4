package com.demo.models;

public class NewReservationInfo {

	private double roomtypeprice;
	private double totalamout;
	private int availableroom;
	private int night;
	private int bed;
	private double chargefee;
	private double amount;
	private String msg;
	private String warning;
	public double getRoomtypeprice() {
		return roomtypeprice;
	}
	public void setRoomtypeprice(double roomtypeprice) {
		this.roomtypeprice = roomtypeprice;
	}
	public double getTotalamout() {
		return totalamout;
	}
	public void setTotalamout(double totalamout) {
		this.totalamout = totalamout;
	}
	public int getAvailableroom() {
		return availableroom;
	}
	public void setAvailableroom(int availableroom) {
		this.availableroom = availableroom;
	}
	public int getNight() {
		return night;
	}
	public void setNight(int night) {
		this.night = night;
	}
	public double getChargefee() {
		return chargefee;
	}
	public void setChargefee(double chargefee) {
		this.chargefee = chargefee;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public NewReservationInfo(double roomtypeprice, double totalamout, int availableroom, int night, double chargefee,
			double amount, String msg) {
		super();
		this.roomtypeprice = roomtypeprice;
		this.totalamout = totalamout;
		this.availableroom = availableroom;
		this.night = night;
		this.chargefee = chargefee;
		this.amount = amount;
		this.msg = msg;
	}
	public NewReservationInfo() {
		super();
	}
	public int getBed() {
		return bed;
	}
	public void setBed(int bed) {
		this.bed = bed;
	}
	public NewReservationInfo(double roomtypeprice, double totalamout, int availableroom, int night, int bed,
			double chargefee, double amount, String msg) {
		super();
		this.roomtypeprice = roomtypeprice;
		this.totalamout = totalamout;
		this.availableroom = availableroom;
		this.night = night;
		this.bed = bed;
		this.chargefee = chargefee;
		this.amount = amount;
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "NewReservationInfo [roomtypeprice=" + roomtypeprice + ", totalamout=" + totalamout + ", availableroom="
				+ availableroom + ", night=" + night + ", bed=" + bed + ", chargefee=" + chargefee + ", amount="
				+ amount + ", msg=" + msg + "]";
	}
	public String getWarning() {
		return warning;
	}
	public void setWarning(String warning) {
		this.warning = warning;
	}
	public NewReservationInfo(double roomtypeprice, double totalamout, int availableroom, int night, int bed,
			double chargefee, double amount, String msg, String warning) {
		super();
		this.roomtypeprice = roomtypeprice;
		this.totalamout = totalamout;
		this.availableroom = availableroom;
		this.night = night;
		this.bed = bed;
		this.chargefee = chargefee;
		this.amount = amount;
		this.msg = msg;
		this.warning = warning;
	}
	
	
	
	
	
	
}
