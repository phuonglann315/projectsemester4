package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;




public interface RoomsService {

	public Iterable<Rooms> findAll();
	public Rooms find(int roomid);
	public Rooms save(Rooms  rooms);
	public int counttotalroombyroomtypeinhotel(int roomstypeid);
	public List<Rooms> listroombyroomtypeinhotel(int roomstypeid);
	public List<Rooms> availableRoom(Date checkindate, Date checkoutDate, int roomtypeid, String checkin, String checkout, int bed, int oldbed, Reservation reservation);
	public List<Rooms> availableRoom(Date checkindate, Date checkoutDate, int roomtypeid);
	public List<Rooms> listroombyroomtypeinhotelnothavestatus(int roomstypeid);
	public int countAllRoom(int roomtypeid);
	public List<Rooms> listroombyroomtypeactive(int roomstypeid);
}
