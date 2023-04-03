package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Contractinfo;
import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.repositories.ContractinfoRepository;
import com.demo.repositories.HotelRepository;
import com.demo.repositories.ReservationRepository;


@Service
public  class ContractinfoServiceImpl implements ContractinfoService{

	@Autowired
	private ContractinfoRepository contractinfoRepository;
	
	@Override
	public Iterable<Contractinfo> findAll() {
		return contractinfoRepository.findAll();
		
	}
	@Override
	public Contractinfo find(int contractid) {
		return contractinfoRepository.findById(contractid).orElse(null);
	}
	@Override
	public Contractinfo save(Contractinfo  contractinfo) {
		return contractinfoRepository.save(contractinfo);
	}
	@Override
	public List<Contractinfo> showlistcontract(int hotelid) {
		return contractinfoRepository.showlistcontract(hotelid);
	}
	

	@Override
	public Contractinfo findContract(int hotelid) {
		return contractinfoRepository.findContract(hotelid);
	}
	@Override
	public List<Integer> findYear(){
		return contractinfoRepository.findYear();
	}
	@Override
	public List<Contractinfo> showlistcontractwithyear( int hotelid, int year){
		return contractinfoRepository.showlistcontractwithyear(hotelid,year);
	}
	@Override
	public boolean findExistAgent(String taxcode, int year,int hotelid) {
		if(contractinfoRepository.findExistAgent(taxcode, year,hotelid).size()>0) {
			return true;
		}
		return false;
	}
}
