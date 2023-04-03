package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;




@Repository
public interface RoomRepository extends CrudRepository<Rooms, Integer> {
	
	@Query("select count(roomid) from Rooms where  roomtype.roomstypeid=:roomstypeid and hotelroomstatus=1 ")
	public int counttotalroombyroomtypeinhotel(@Param("roomstypeid") int roomstypeid);
	@Query("from Rooms where  roomtype.roomstypeid=:roomstypeid and hotelroomstatus=1 ")
	public List<Rooms> listroombyroomtypeinhotel(@Param("roomstypeid") int roomstypeid);
	@Query("select count(roomid) from Rooms where  roomtype.roomstypeid=:roomstypeid")
	public int counttotalroombyroomtypeinhotelnothavestatus(@Param("roomstypeid") int roomstypeid);
	@Query("from Rooms where  roomtype.roomstypeid=:roomstypeid and hotelroomstatus=1")
	public List<Rooms> listroombyroomtypeinhotelnothavestatus(@Param("roomstypeid") int roomstypeid);
	
	@Query("from Rooms where  roomtype.roomstypeid=:roomstypeid and hotelroomstatus=1")
	public List<Rooms> listroombyroomtypeactive(@Param("roomstypeid") int roomstypeid);
}
