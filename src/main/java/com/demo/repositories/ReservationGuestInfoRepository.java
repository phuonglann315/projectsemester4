package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;
import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Reservationguestinfo;




@Repository
public interface ReservationGuestInfoRepository extends CrudRepository<Reservationguestinfo, Integer> {
	
	@Query("select count(reservationguestinfoid) from Reservationguestinfo where reservationroomdetails.reservation.checkout =:date and (reservationroomdetails.reservation.reservationstt=3 or reservationroomdetails.reservation.reservationstt=4) and reservationroomdetails.rooms.roomtype.hotel.hotelid =:hotelid ")
	public int countTotalCusCheckOut(@Param("date") Date date,@Param("hotelid")int hotelid);
	@Query("select count(reservationguestinfoid) from Reservationguestinfo where ((reservationroomdetails.reservation.checkin < :date and reservationroomdetails.reservation.checkout >=:date) or (reservationroomdetails.reservation.checkin = :date)) and reservationroomdetails.reservationroomtypestt=3 and reservationroomdetails.rooms.roomtype.hotel.hotelid =:hotelid")
	public int countTotalCusStaying(@Param("date") Date date,@Param("hotelid")int hotelid);
	@Query("from Reservationguestinfo where reservationroomdetails.reservation.checkin <= :date and reservationroomdetails.reservation.checkout >=:date and reservationroomdetails.reservation.reservationstt=3  and reservationroomdetails.rooms.roomtype.hotel.hotelid =:hotelid")
	public List<Reservationguestinfo> getlistCusStaying(@Param("date") Date date,@Param("hotelid")int hotelid);
	
	
	@Query("select count(reservationguestinfoid) from Reservationguestinfo where  reservationroomdetails.reservation.reservationid=:reservationid")
	public int countTotalCusByReservation(@Param("reservationid") int reservationid);
	
	@Query("from Reservationguestinfo where reservationroomdetails.reservationroomdetailsid=:reservationroomdetailsid")
	public List<Reservationguestinfo> getlistCusbyreservationroomdetailsid(@Param("reservationroomdetailsid")int reservationroomdetailsid);
}
