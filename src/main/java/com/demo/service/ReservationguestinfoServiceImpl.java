package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Reservation;
import com.demo.models.Reservationguestinfo;
import com.demo.repositories.ReservationGuestInfoRepository;
import com.demo.repositories.ReservationRepository;


@Service
public  class ReservationguestinfoServiceImpl implements ReservationguestinfoService{

	@Autowired
	private ReservationGuestInfoRepository reservationGuestInfoRepository;
	
	
	@Override
	public Iterable<Reservationguestinfo> findAll() {
		return reservationGuestInfoRepository.findAll();
		
	}
	@Override
	public Reservationguestinfo find(int id) {
		return reservationGuestInfoRepository.findById(id).orElse(null);
	}
	@Override
	public Reservationguestinfo save(Reservationguestinfo  reservationguestinfo) {
		return reservationGuestInfoRepository.save(reservationguestinfo);
	}
	
	@Override
	public int countTotalCusCheckOut(Date date, int hotelid) {
		return reservationGuestInfoRepository.countTotalCusCheckOut(date,hotelid);
	}
	@Override
	public int countTotalCusStaying( Date date, int hotelid){
		return reservationGuestInfoRepository.countTotalCusStaying(date,hotelid);
	}
	@Override
	public List<Reservationguestinfo> getlistCusStaying(Date date, int hotelid) {
		// TODO Auto-generated method stub
		return reservationGuestInfoRepository.getlistCusStaying(date,hotelid);
	}
	@Override
	public int countTotalCusByReservation(int reservationid) {
		// TODO Auto-generated method stub
		return reservationGuestInfoRepository.countTotalCusByReservation(reservationid);
	}
	@Override
	public List<Reservationguestinfo> getlistCusbyreservationroomdetailsid(int reservationroomdetailsid) {
		return reservationGuestInfoRepository.getlistCusbyreservationroomdetailsid(reservationroomdetailsid);
	}

	
	
	
	

}
