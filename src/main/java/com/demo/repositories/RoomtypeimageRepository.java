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
import com.demo.models.Roomtypeimage;




@Repository
public interface RoomtypeimageRepository extends CrudRepository<Roomtypeimage, Integer> {
	
	//Xuan code o day
		@Query("from Roomtypeimage where roomtype.roomstypeid = :roomstypeid")
		public List<Roomtypeimage> findNameImageofRoomtype(@Param("roomstypeid") int roomstypeid);
	
}
