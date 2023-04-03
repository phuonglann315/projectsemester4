package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.demo.models.Hotel;

import com.demo.repositories.HotelRepository;



@Service
public  class HotelServiceImpl implements HotelService{

	@Autowired
	private HotelRepository hotelRepository;
	
	@Override
	public Iterable<Hotel> findAll() {
		return hotelRepository.findAll();
		
	}
	@Override
	public Hotel find(int id) {
		return hotelRepository.findById(id).orElse(null);
	}
	@Override
	public Hotel save(Hotel  hotel) {
		return hotelRepository.save(hotel);
	}
	@Override
	public List<Hotel> listhotelactive(){
		return hotelRepository.listhotelactive();
	};
	
	
	//lannnn
	@Override
	public int countHotelByLocation(int provinceid) {
		return hotelRepository.countHotelByLocation(provinceid);
	}
	
	@Override
	public List<Hotel> searchByLocation(int provinceid) {
		return hotelRepository.searchByLocation(provinceid);
	}	
	

}
