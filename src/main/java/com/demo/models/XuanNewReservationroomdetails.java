package com.demo.models;
// Generated Nov 19, 2022, 1:43:07 PM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.List;
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


public class XuanNewReservationroomdetails implements java.io.Serializable {

	private int reservationroomdetailsid;
	private int reservationid;
	private int roomid;
	private String roomName;
	private List<String> customername;
	private Double amount;
	private String reservationroomtypestt;
	public Integer getReservationroomdetailsid() {
		return reservationroomdetailsid;
	}
	public void setReservationroomdetailsid(Integer reservationroomdetailsid) {
		this.reservationroomdetailsid = reservationroomdetailsid;
	}
	public int getReservationid() {
		return reservationid;
	}
	public void setReservationid(int reservationid) {
		this.reservationid = reservationid;
	}
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	
	
	
	public XuanNewReservationroomdetails() {
		super();
	}
	public List<String> getCustomername() {
		return customername;
	}
	public void setCustomername(List<String> customername) {
		this.customername = customername;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public void setReservationroomdetailsid(int reservationroomdetailsid) {
		this.reservationroomdetailsid = reservationroomdetailsid;
	}
	
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getReservationroomtypestt() {
		return reservationroomtypestt;
	}
	public void setReservationroomtypestt(String reservationroomtypestt) {
		this.reservationroomtypestt = reservationroomtypestt;
	}
	public XuanNewReservationroomdetails(int reservationroomdetailsid, int reservationid, int roomid, String roomName,
			List<String> customername, Double amount, String reservationroomtypestt) {
		super();
		this.reservationroomdetailsid = reservationroomdetailsid;
		this.reservationid = reservationid;
		this.roomid = roomid;
		this.roomName = roomName;
		this.customername = customername;
		this.amount = amount;
		this.reservationroomtypestt = reservationroomtypestt;
	}
	
	

}
