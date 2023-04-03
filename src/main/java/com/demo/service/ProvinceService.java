package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Hotel;
import com.demo.models.LanHotelInfo;
import com.demo.models.LanLocation;
import com.demo.models.Province;
import com.demo.models.Reservation;


public interface ProvinceService {
	
	//Xuan code
		public List<Province> findAll();
	//Lan code
	public Province find(int provinceid);
	public List<LanLocation> getAllProvince();
	public List<LanLocation> searchProvince(String keyword);	
	public List<LanLocation> searchWard(int provinceid);
	
}
