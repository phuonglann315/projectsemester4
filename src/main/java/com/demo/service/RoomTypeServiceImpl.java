package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Roomtype;
import com.demo.repositories.HotelRepository;
import com.demo.repositories.ReservationRepository;
import com.demo.repositories.RoomtypeRepository;


@Service
public  class RoomTypeServiceImpl implements RoomTypeService{

	@Autowired
	private RoomtypeRepository roomtypeRepository;
	
	@Override
	public Iterable<Roomtype> findAll() {
		return roomtypeRepository.findAll();
		
	}
	@Override
	public Roomtype find(int id) {
		return roomtypeRepository.findById(id).orElse(null);
	}
	@Override
	public Roomtype save(Roomtype  roomtype) {
		return roomtypeRepository.save(roomtype);
	}
	

	@Override
	public List<Roomtype> findListRoomtypeByHotelid(int hotelid ) {
		return roomtypeRepository.findListRoomtypeByHotelid(hotelid);
	}
	
	@Override
	public List<Roomtype> findListAllRoomtypeByHotelid(int hotelid){
		return roomtypeRepository.findListAllRoomtypeByHotelid( hotelid);
	}
	

}
