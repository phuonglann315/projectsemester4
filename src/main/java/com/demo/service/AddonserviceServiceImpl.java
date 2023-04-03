package com.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

import com.demo.models.Addonservice;

import com.demo.repositories.AddonserviceRepository;



@Service
public  class AddonserviceServiceImpl implements AddonserviceService{

	@Autowired
	private AddonserviceRepository addonserviceRepository;


	@Override
	public Iterable<Addonservice> findAll() {
		// TODO Auto-generated method stub
		return addonserviceRepository.findAll();
	}

	@Override
	public Addonservice find(int addonserviceid) {
		return addonserviceRepository.findById(addonserviceid).orElse(null);
	}

	@Override
	public Addonservice save(Addonservice addonservice) {
		return addonserviceRepository.save(addonservice);
	}

	@Override
	public List<Addonservice> findAddonserviceByHotelid(int hotelid) {
		return addonserviceRepository.findAddonserviceByHotelid(hotelid);
	}
	@Override
	public List<Addonservice> findLateCheckOutByHotelid(int hotelid){
		return addonserviceRepository.findLateCheckOutByHotelid(hotelid);
	};
	@Override
	public List<Addonservice> findExtraBedByHotelid( int hotelid){
		return addonserviceRepository.findExtraBedByHotelid(hotelid);
	};
	
	@Override
	public List<Addonservice> findAddonserviceByHotel_hotelid(int hotelid){
		return addonserviceRepository.findAddonserviceByHotel_hotelid(hotelid);
	};

}
