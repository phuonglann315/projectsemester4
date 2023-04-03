package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.models.Policies;


public interface PoliciesService {

	public Iterable<Policies> findAll();

	public Policies findById(int policiesid);

	public List<Policies> findPoliciesByRoomtypeandApplyfor(int roomstypeid, String applyfor, Date date);

	public List<Policies> findPoliciesByListRoomtypeHaveExp(List<Integer> roomtypeidList, Date today);

	public List<Policies> findPoliciesByListRoomtype(int roomtypeid,int year,String applyfor);
	public Policies save(Policies  policies);
	public List<Integer> findListYear();
	public List<Policies> findPoliciesByYearOFHotelID(int year,int hotelid);
	public List<Policies> findPoliciesByYearOFHotelID(int year, int roomtypeid,String applyfor);
}
