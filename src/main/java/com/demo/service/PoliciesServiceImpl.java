package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Policies;
import com.demo.repositories.PoliciesRepository;




@Service
public  class PoliciesServiceImpl implements PoliciesService{

	@Autowired
	private PoliciesRepository policiesRepository;

	@Override
	public Iterable<Policies> findAll() {
		return policiesRepository.findAll();
	}
	
	@Override
	public Policies findById(int policiesid) {
		return policiesRepository.findById(policiesid).orElse(null);
	}

	@Override
	public List<Policies> findPoliciesByRoomtypeandApplyfor(int roomstypeid, String applyfor, Date date) {
		return policiesRepository.findPoliciesByRoomtypeandApplyfor(roomstypeid, applyfor, date);
	}
	@Override
	public Policies save(Policies policies) {
		return policiesRepository.save(policies);
	}

	@Override
	public List<Policies> findPoliciesByListRoomtypeHaveExp(List<Integer> roomtypeidList, Date today){
		return policiesRepository.findPoliciesByListRoomtypeHaveExp(roomtypeidList,today);
	}
	
	@Override
	public List<Policies> findPoliciesByListRoomtype(int roomtypeid,int year,String applyfor) {
		return policiesRepository.findPoliciesByListRoomtype(roomtypeid,year,applyfor);
	}
	
	@Override
	public List<Integer> findListYear(){
		return policiesRepository.findListYear();
	};
	@Override
	public List<Policies> findPoliciesByYearOFHotelID(int year,int hotelid){
		return policiesRepository.findPoliciesByYearOFHotelID(year,hotelid);
	};
	
	@Override
	public List<Policies> findPoliciesByYearOFHotelID(int year, int roomtypeid,String applyfor){
		return policiesRepository.findPoliciesByYearOFHotelID(year,roomtypeid,applyfor);
	};
}
