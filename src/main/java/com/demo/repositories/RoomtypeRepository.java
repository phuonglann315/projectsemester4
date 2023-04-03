package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Roomtype;




@Repository
public interface RoomtypeRepository extends CrudRepository<Roomtype, Integer> {
	
	@Query("from Roomtype where hotel.hotelid = :hotelid and roomtypestt=1")
	public List<Roomtype> findListRoomtypeByHotelid(@Param("hotelid") int hotelid);
	
	
	@Query("from Roomtype where hotel.hotelid = :hotelid order by roomtypestt")
	public List<Roomtype> findListAllRoomtypeByHotelid(@Param("hotelid") int hotelid);
}
