package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Hotel;
import com.demo.models.Reservation;




public interface HotelService {
	
	public Iterable<Hotel> findAll();
	public Hotel find(int id);
	public Hotel save(Hotel  hotel);
	public List<Hotel> listhotelactive();
	//Lan code
	public int countHotelByLocation(int provinceid);
	public List<Hotel> searchByLocation(int provinceid);
	
}
