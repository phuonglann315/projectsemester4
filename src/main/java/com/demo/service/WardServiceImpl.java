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
import com.demo.models.Ward;
import com.demo.repositories.CityRepository;
import com.demo.repositories.WardRepository;



@Service
public  class WardServiceImpl implements WardService{

	@Autowired
	private WardRepository wardRepository;
	public List<Ward> findWardByCity_cityid(int cityid){
		return wardRepository.findWardByCity_cityid(cityid);
	}
	@Override
	public Ward find(int id) {
		return wardRepository.findById(id).orElse(null);
	};

	
}
