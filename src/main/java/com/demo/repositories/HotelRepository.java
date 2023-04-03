package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Roomtype;




@Repository
public interface HotelRepository extends JpaRepository<Hotel, Integer> {
	//xuancode
	@Query("from Hotel where hotelstatus=1")
	public List<Hotel> listhotelactive();
	
	public Page<Hotel> findAll(Pageable pageable);
	// Lan code
	@Query("select count(hotelid) from Hotel where ward.city.province.provinceid = :provinceid and hotelstatus = 1")
	public int countHotelByLocation(@Param("provinceid") int provinceid);

	@Query("from Hotel where ward.city.province.provinceid = :provinceid and hotelstatus = 1")
	public List<Hotel> searchByLocation(@Param("provinceid") int provinceid);
	


}
