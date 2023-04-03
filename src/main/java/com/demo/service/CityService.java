package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.City;
import com.demo.models.Hotel;
import com.demo.models.LanHotelInfo;
import com.demo.models.Province;
import com.demo.models.Reservation;


public interface CityService {
	
	//Lan code
	public City find(int cityid);
	public Iterable<City> findAll();
	// Xuan code 
	public List<City> findCityByProvince_provinceid(int provinceid);
}
