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
import com.demo.models.Roomtypeimage;
import com.demo.repositories.HotelRepository;
import com.demo.repositories.ReservationRepository;
import com.demo.repositories.RoomtypeimageRepository;


@Service
public  class RoomtypeimageServiceImpl implements RoomtypeimageService{

	@Autowired
	private RoomtypeimageRepository roomtypeimageRepository;
	
	@Override
	public Iterable<Roomtypeimage> findAll() {
		return roomtypeimageRepository.findAll();
		
	}
	@Override
	public Roomtypeimage find(int id) {
		return roomtypeimageRepository.findById(id).orElse(null);
	}
	@Override
	public Roomtypeimage save(Roomtypeimage  roomtypeimage) {
		return roomtypeimageRepository.save(roomtypeimage);
	}
	@Override
	public List<Roomtypeimage> findNameImageofRoomtype(int roomstypeid) {
		return roomtypeimageRepository.findNameImageofRoomtype(roomstypeid);
	}
	@Override
	public boolean delete(int id) {
		try {
			roomtypeimageRepository.deleteById(id);
			return true;
			
		} catch (Exception e) {
			return false;
		}
	}
	
	

	
	
	

}
