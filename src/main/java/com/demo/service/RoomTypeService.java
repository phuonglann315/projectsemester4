package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Roomtype;




public interface RoomTypeService {

	public Iterable<Roomtype> findAll();
	public Roomtype find(int id);
	public Roomtype save(Roomtype  roomtype);
	public List<Roomtype> findListRoomtypeByHotelid( int hotelid);
	public List<Roomtype> findListAllRoomtypeByHotelid(int hotelid);
}
