package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.City;
import com.demo.models.Hotel;
import com.demo.models.LanHotelInfo;
import com.demo.models.Province;
import com.demo.models.Reservation;
import com.demo.repositories.CityRepository;



@Service
public  class CityServiceImpl implements CityService{

	@Autowired
	private CityRepository cityRepository;
	// Xuan code 
		public List<City> findCityByProvince_provinceid(int provinceid){
			return cityRepository.findCityByProvince_provinceid(provinceid);
		};
	//Lan code
	@Override
	public City find(int cityid) {
		return cityRepository.findById(cityid).orElse(null);
	}
	
	@Override
	public Iterable<City> findAll() {
		return cityRepository.findAll();
	}

	
}
