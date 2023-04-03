package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Account;
import com.demo.models.Contractinfo;
import com.demo.models.Contractinforoomtype;
import com.demo.models.ContractinforoomtypeId;
import com.demo.models.Hotel;
import com.demo.models.Reservation;




public interface ContractinforoomtypeService {

	public Iterable<Contractinforoomtype> findAll();
	public Contractinforoomtype find(ContractinforoomtypeId id);
	public Contractinforoomtype save(Contractinforoomtype  contractinforoomtype);
	public Contractinforoomtype findById(ContractinforoomtypeId contractinforoomtypeId);
	public Contractinforoomtype findRoomPrice(int contractid, int roomstypeid);
	
}
