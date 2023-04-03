package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Roomtypeimage;




public interface RoomtypeimageService {

	public Iterable<Roomtypeimage> findAll();
	public Roomtypeimage find(int id);
	public Roomtypeimage save(Roomtypeimage  roomtypeimage);
	public List<Roomtypeimage> findNameImageofRoomtype( int roomstypeid);
	public boolean delete(int id);
}
