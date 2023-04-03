package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.data.domain.Page;

import com.demo.models.Reservationroomdetails;




public interface ReservationroomdetailsService {

	public Iterable<Reservationroomdetails> findAll();
	public Reservationroomdetails find(int id);
	public boolean delete(int id);
	public Reservationroomdetails save(Reservationroomdetails eservationroomdetails );
	public List<Reservationroomdetails> findListByReservationid(int reservationid);
	public Page<Reservationroomdetails> XuanfindListByReservationid(int reservationid,Pageable pageable);
	public List<Reservationroomdetails> findListByInDay(Date date);
	public int countCheckinRoom( int reservationid, int reservationroomtypestt);
	public List<Reservationroomdetails> findListByReservationidandRoomname(int reservationid, String roomname);
	public int counttotalroombusy(int roomstypeid,Date checkindate, Date checkoutdate);
	public List<Reservationroomdetails> listroombusy( int roomstypeid,Date checkindate, Date checkoutdate);
	public List<Reservationroomdetails> findListByNewReservationidandroomstypeid(int reservationid,int roomstypeid);
	public List<Reservationroomdetails> listroomwithstt(int reservationid,int reservationroomtypestt);
	public Reservationroomdetails findlatecheckoutid( int reservationid);
}
