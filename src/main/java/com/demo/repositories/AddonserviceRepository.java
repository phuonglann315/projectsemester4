package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;
import com.demo.models.Addonservice;
import com.demo.models.Reservationaddonservice;


@Repository
public interface AddonserviceRepository extends CrudRepository<Addonservice, Integer> {
	
	
	@Query("from Addonservice where hotel.hotelid=:hotelid and addonservicestt =1 and servicetype='Other Service' order by addonservicename")
	public List<Addonservice> findAddonserviceByHotelid(@Param("hotelid") int hotelid);

	@Query("from Addonservice where hotel.hotelid=:hotelid and addonservicestt =1 and  servicetype='Extra Bed' order by addonservicename")
	public List<Addonservice> findExtraBedByHotelid(@Param("hotelid") int hotelid);
	
	@Query("from Addonservice where hotel.hotelid=:hotelid and addonservicestt =1  and servicetype='Late Check-out' order by addonservicename")	
	public List<Addonservice> findLateCheckOutByHotelid(@Param("hotelid") int hotelid);
	
	
	public List<Addonservice> findAddonserviceByHotel_hotelid(@Param("hotelid") int hotelid);
}
