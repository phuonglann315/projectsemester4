package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Hotelseason;
import com.demo.repositories.HotelSeasonRepository;

@Service
public class HotelSeasonServiceImpl implements HotelSeasonService {

	@Autowired
	private HotelSeasonRepository hotelSeasonRepository;

	@Override
	public Iterable<Hotelseason> findAll() {
		return hotelSeasonRepository.findAll();
	}

	@Override
	public Hotelseason find(int Hotelseasonid) {
		return hotelSeasonRepository.findById(Hotelseasonid).orElse(null);
	}

	@Override
	public Hotelseason save(Hotelseason hotelseason) {
		return hotelSeasonRepository.save(hotelseason);
	}

	@Override
	public Hotelseason findByDate(int hotelid, Date date) {
		return hotelSeasonRepository.findByDate(hotelid, date);
	}

	@Override
	public List<Hotelseason> findListByDate(int hotelid, Date checkindate, Date checkoutdate) {
		return hotelSeasonRepository.findListByDate(hotelid, checkindate, checkoutdate);
	}
	@Override
	public List<Hotelseason> listExpSeason(int hotelid, Date today){
		return hotelSeasonRepository.listExpSeason(hotelid, today);
	}
	@Override
	public List<Hotelseason> findHotelseasonInYear(int hotelid,int year){
		return hotelSeasonRepository.findHotelseasonInYear( hotelid,year);
	};
	@Override
	public List<Integer> findListYear(int hotelid){
		return hotelSeasonRepository.findListYear( hotelid);
	}

	@Override
	public List<Hotelseason> findListHotelSeason(int hotelid) {
		return hotelSeasonRepository.findListHotelSeason(hotelid);
	};
	// Lan code
	/*@Override
	public Hotelseason findSeason(Date today) {
		return hotelSeasonRepository.findSeason(today);
	}

	@Override
	public Hotelseason findSeasonByCheckinout(Date checkin, Date checkout) {
		return hotelSeasonRepository.findSeasonByCheckinout(checkin, checkout);
	}*/

}
