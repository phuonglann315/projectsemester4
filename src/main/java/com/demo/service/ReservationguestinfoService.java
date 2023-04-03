package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Reservation;
import com.demo.models.Reservationguestinfo;




public interface ReservationguestinfoService {

	public Iterable<Reservationguestinfo> findAll();
	public Reservationguestinfo find(int id);
	public Reservationguestinfo save(Reservationguestinfo  reservationguestinfo);

	public int countTotalCusCheckOut(Date date, int hotelid);
	public int countTotalCusStaying( Date date, int hotelid);
	public List<Reservationguestinfo> getlistCusStaying( Date date, int hotelid);
	public int countTotalCusByReservation( int reservationid);
	public List<Reservationguestinfo> getlistCusbyreservationroomdetailsid(int reservationroomdetailsid);
}
