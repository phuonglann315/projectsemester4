package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Addonservice;
import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;




public interface AddonserviceService {

	public Iterable<Addonservice> findAll();
	public Addonservice find(int addonserviceid);
	public Addonservice save(Addonservice  addonservice);
	public List<Addonservice> findAddonserviceByHotelid(int hotelid);
	public List<Addonservice> findLateCheckOutByHotelid(int hotelid);
	public List<Addonservice> findExtraBedByHotelid( int hotelid);
	public List<Addonservice> findAddonserviceByHotel_hotelid(int hotelid);
}
