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


import com.demo.models.Reservationroomdetails;





@Repository
public interface ReservationroomdetailsRepository extends JpaRepository<Reservationroomdetails, Integer> {
	
	@Query("from Reservationroomdetails where  (reservationroomtypestt=3 ) and ((reservation.checkin < :date and reservation.checkout>=:date) or (reservation.checkin = :date )) order by rooms.roomid")
	public List<Reservationroomdetails> findListByInDay(@Param("date") Date date);
	
	@Query("from Reservationroomdetails where  reservation.reservationid=:reservationid and reservationroomtypestt < 6 order by rooms.roomid")
	public List<Reservationroomdetails> findListByReservationid(@Param("reservationid") int reservationid);
	
	//@Query("from Reservationroomdetails where  reservation.reservationid=:reservationid and reservationroomtypestt < 6 order by rooms.roomid")
	//public Page<Reservationroomdetails> XuanfindListByReservationid(@Param("reservationid") int reservationid,Pageable pageable);
	public Page<Reservationroomdetails> findReservationroomdetailsByReservation_ReservationidAndReservationroomtypesttLessThan(int reservationid, int reservationroomtypestt,Pageable pageable);
	 
	@Query("select count(reservationroomdetailsid) from Reservationroomdetails where  reservation.reservationid=:reservationid and reservationroomtypestt=:reservationroomtypestt")
	public int countCheckinRoom(@Param("reservationid") int reservationid,@Param("reservationroomtypestt") int reservationroomtypestt);
	
	@Query("from Reservationroomdetails where  reservation.reservationid=:reservationid and rooms.roomname like %:roomname% and reservationroomtypestt < 6 order by rooms.roomid")
	public List<Reservationroomdetails> findListByReservationidandRoomname(@Param("reservationid") int reservationid,@Param("roomname") String roomname);
	
	@Query("select count(reservationroomdetailsid) from Reservationroomdetails where  (rooms.roomtype.roomstypeid=:roomstypeid) and ( reservationroomtypestt =0 or reservationroomtypestt =1 or reservationroomtypestt =2) and ((reservation.checkin <=:checkindate and reservation.checkout>:checkindate ) or (reservation.checkin >:checkindate and reservation.checkin <:checkoutdate)) ")
	public int counttotalroombusy(@Param("roomstypeid") int roomstypeid,@Param("checkindate") Date checkindate,@Param("checkoutdate") Date checkoutdate);

	@Query("from Reservationroomdetails where  (rooms.roomtype.roomstypeid=:roomstypeid) and ( reservationroomtypestt =0 or reservationroomtypestt =1 or reservationroomtypestt =2) and ((reservation.checkin <=:checkindate and reservation.checkout>:checkindate ) or (reservation.checkin >:checkindate and reservation.checkin <:checkoutdate)) ")
	public List<Reservationroomdetails> listroombusy(@Param("roomstypeid") int roomstypeid,@Param("checkindate") Date checkindate,@Param("checkoutdate") Date checkoutdate);
	
	@Query("from Reservationroomdetails where  reservation.reservationid=:reservationid and rooms.roomtype.roomstypeid=:roomstypeid order by rooms.roomid")
	public List<Reservationroomdetails> findListByNewReservationidandroomstypeid(@Param("reservationid") int reservationid,@Param("roomstypeid") int roomstypeid);
	
	@Query("from Reservationroomdetails where  reservation.reservationid=:reservationid and reservationroomtypestt=:reservationroomtypestt")
	public List<Reservationroomdetails> listroomwithstt(@Param("reservationid") int reservationid,@Param("reservationroomtypestt") int reservationroomtypestt);
	
	@Query("from Reservationroomdetails where latecheckoutid=:reservationid and reservationroomtypestt <6")
	public Reservationroomdetails findlatecheckoutid(@Param("reservationid") int reservationid);
	
}
