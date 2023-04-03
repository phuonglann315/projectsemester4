package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Hotel;
import com.demo.models.Hotelseason;
import com.demo.models.Reservation;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;




public interface HotelSeasonService {

	public Iterable<Hotelseason> findAll();
	public Hotelseason find(int Hotelseasonid);
	public Hotelseason save(Hotelseason  hotelseason);
	public Hotelseason findByDate(int hotelid, Date date);
	public List<Hotelseason> findListByDate(int hotelid, Date checkindate, Date checkoutdate);
	public List<Hotelseason> listExpSeason(int hotelid,Date today);
	public List<Hotelseason> findHotelseasonInYear(int hotelid,int year);
	public List<Integer> findListYear(int hotelid);
	public List<Hotelseason> findListHotelSeason(int hotelid);
	//Lan code
	/*
	 * public Hotelseason findSeason(Date today); public Hotelseason
	 * findSeasonByCheckinout(Date checkin, Date checkout);
	 */
}
