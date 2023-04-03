package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Hotel;
import com.demo.models.LanHotelInfo;
import com.demo.models.LanLocation;
import com.demo.models.Province;
import com.demo.models.Reservation;
import com.demo.repositories.HotelRepository;
import com.demo.repositories.ProvinceRepository;
import com.demo.repositories.ReservationRepository;


@Service
public  class ProvinceServiceImpl implements ProvinceService{

	@Autowired
	private ProvinceRepository provinceRepository;

	//Lan code
	@Override
	public Province find(int provinceid) {
		return provinceRepository.findById(provinceid).orElse(null);
	}

	
	@Override
	public List<LanLocation> getAllProvince() {
		return provinceRepository.getAllProvince();
	}

	@Override
	public List<LanLocation> searchProvince(String keyword) {
		return provinceRepository.searchProvince(keyword);
	}

	@Override
	public List<LanLocation> searchWard(int provinceid) {
		return provinceRepository.searchWard(provinceid);
	}


	@Override
	public List<Province> findAll() {
		 return (List<Province>) provinceRepository.findAll();
	}
}
