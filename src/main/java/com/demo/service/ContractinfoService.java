package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Contractinfo;
import com.demo.models.Hotel;
import com.demo.models.Reservation;




public interface ContractinfoService {

	public Iterable<Contractinfo> findAll();
	public Contractinfo find(int contractid);
	public Contractinfo save(Contractinfo  contractinfo);
	public List<Contractinfo> showlistcontract( int hotelid);
	public List<Integer> findYear();
	public List<Contractinfo> showlistcontractwithyear( int hotelid, int year);
	public Contractinfo findContract(int hotelid);
	public boolean findExistAgent(String taxcode, int year,int hotelid);
}
