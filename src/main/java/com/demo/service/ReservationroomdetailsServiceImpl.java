package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;

import org.springframework.stereotype.Service;


import com.demo.models.Reservationroomdetails;

import com.demo.repositories.ReservationroomdetailsRepository;


@Service
public  class ReservationroomdetailsServiceImpl implements ReservationroomdetailsService{

	@Autowired
	private ReservationroomdetailsRepository reservationroomdetailsRepository;
	
	@Autowired
	private RoomTypeService roomTypeService;
	

	@Override
	public Iterable<Reservationroomdetails> findAll() {
		return reservationroomdetailsRepository.findAll();
	}

	@Override
	public Reservationroomdetails find(int id) {
		return reservationroomdetailsRepository.findById(id).orElse(null);
	}

	@Override
	public Reservationroomdetails save(Reservationroomdetails reservationroomdetails) {
		// TODO Auto-generated method stub
		return reservationroomdetailsRepository.save(reservationroomdetails);
	}

	@Override
	public List<Reservationroomdetails> findListByInDay(Date date) {
		return reservationroomdetailsRepository.findListByInDay( date);
	}

	@Override
	public List<Reservationroomdetails> findListByReservationid(int reservationid) {
		return reservationroomdetailsRepository.findListByReservationid(reservationid);
	}
	
	@Override
	public Page<Reservationroomdetails> XuanfindListByReservationid(int reservationid,Pageable pageable) {
		return reservationroomdetailsRepository.findReservationroomdetailsByReservation_ReservationidAndReservationroomtypesttLessThan(reservationid, 6,pageable);
		//return reservationroomdetailsRepository.XuanfindListByReservationid(reservationid,pageable);
	}
	@Override
	public int countCheckinRoom(int reservationid, int reservationroomtypestt) {
		return reservationroomdetailsRepository.countCheckinRoom(reservationid, reservationroomtypestt);
	}

	@Override
	public List<Reservationroomdetails> findListByReservationidandRoomname(int reservationid, String roomname) {
		return reservationroomdetailsRepository.findListByReservationidandRoomname(reservationid, roomname);
	}

	@Override
	public int counttotalroombusy(int roomstypeid, Date checkindate, Date checkoutdate) {
		return reservationroomdetailsRepository.counttotalroombusy(roomstypeid,checkindate,checkoutdate);
	}

	@Override
	public List<Reservationroomdetails> listroombusy(int roomstypeid, Date checkindate, Date checkoutdate) {
		return reservationroomdetailsRepository.listroombusy(roomstypeid, checkindate, checkoutdate);
	}

	@Override
	public List<Reservationroomdetails> findListByNewReservationidandroomstypeid(int reservationid, int roomstypeid) {
		return reservationroomdetailsRepository.findListByNewReservationidandroomstypeid(reservationid, roomstypeid);
	}

	@Override
	public boolean delete(int id) {
		try {
			reservationroomdetailsRepository.deleteById(id);
			return true;
			
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Reservationroomdetails> listroomwithstt(int reservationid, int reservationroomtypestt) {		
		return reservationroomdetailsRepository.listroomwithstt(reservationid, reservationroomtypestt);
	}

	@Override
	public Reservationroomdetails findlatecheckoutid(int reservationid) {
		return reservationroomdetailsRepository.findlatecheckoutid(reservationid);
	}
	
	
	

	
	
	
	

}
