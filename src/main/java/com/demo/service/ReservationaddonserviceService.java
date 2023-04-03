package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;


import com.demo.models.Reservationaddonservice;


public interface ReservationaddonserviceService {

	public Iterable<Reservationaddonservice> findAll();
	public Reservationaddonservice find(int id);
	public Boolean delete(int id);
	public Reservationaddonservice save(Reservationaddonservice  reservationaddonservice);
	public double totalAddonServiceByreservationidAndpaymentstt( int reservationid,int paymentstt);

	public double totalAddonServiceByreservationid( int reservationid,int paymentstt);
	public List<Reservationaddonservice> listAddonServiceByreservationidAndpaymentstt( int reservationid, int paymentstt);
	public double totalAddonServiceByreservationidandRoomsID(int reservationroomdetailsid);
	public List<Reservationaddonservice> AddonServiceByreservationid( int reservationroomdetailsid,int paymentstt);
	public List<Reservationaddonservice> AddonServiceByreservationid(int reservationroomdetailsid);
}
