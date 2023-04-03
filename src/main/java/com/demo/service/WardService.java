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
import com.demo.models.Ward;


public interface WardService {
	
	public List<Ward> findWardByCity_cityid(int cityid);
	public Ward find(int id);
}
