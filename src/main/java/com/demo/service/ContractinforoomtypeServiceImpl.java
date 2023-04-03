package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


import com.demo.models.Contractinforoomtype;
import com.demo.models.ContractinforoomtypeId;
import com.demo.repositories.ContractinforoomtypeRepository;



@Service
public  class ContractinforoomtypeServiceImpl implements ContractinforoomtypeService{

	@Autowired
	private ContractinforoomtypeRepository contractinforoomtypeRepository;

	@Autowired
	private HotelSeasonService hotelSeasonService;
	@Override
	public Iterable<Contractinforoomtype> findAll() {
		// TODO Auto-generated method stub
		return contractinforoomtypeRepository.findAll();
	}
	@Override
	public Contractinforoomtype find(ContractinforoomtypeId id) {
		return contractinforoomtypeRepository.findById(id).orElse(null);
	};
	@Override
	public Contractinforoomtype save(Contractinforoomtype  contractinforoomtype) {
		return contractinforoomtypeRepository.save(contractinforoomtype);
	};
	@Override
	public Contractinforoomtype findById(ContractinforoomtypeId contractinforoomtypeId) {
		return contractinforoomtypeRepository.findById(contractinforoomtypeId).orElse(null);
	}


	@Override
	public Contractinforoomtype findRoomPrice(int contractid, int roomstypeid) {
		return contractinforoomtypeRepository.findRoomPrice(contractid, roomstypeid);
	}

	
	
	

}
