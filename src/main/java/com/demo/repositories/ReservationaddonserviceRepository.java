package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;
import com.demo.models.Reservationaddonservice;


@Repository
public interface ReservationaddonserviceRepository extends CrudRepository<Reservationaddonservice, Integer> {
	@Query("select sum(amount) from Reservationaddonservice where reservationroomdetails.reservation.reservationid =:reservationid and paymentstt =:paymentstt")
	public double totalAddonServiceByreservationidAndpaymentstt(@Param("reservationid") int reservationid,@Param("paymentstt") int paymentstt);
	
	@Query("select sum(amount) from Reservationaddonservice where reservationroomdetails.reservation.reservationid =:reservationid and paymentstt =:paymentstt")
	public double totalAddonServiceByreservationid(@Param("reservationid") int reservationid,@Param("paymentstt") int paymentstt);
	
	@Query("select count(reservationaddonserviceid) from Reservationaddonservice where reservationroomdetails.reservation.reservationid =:reservationid and paymentstt =:paymentstt")
	public int checkaddonservice(@Param("reservationid") int reservationid,@Param("paymentstt") int paymentstt);
	
	@Query("select sum(amount) from Reservationaddonservice where reservationroomdetails.reservationroomdetailsid=:reservationroomdetailsid and paymentstt =0")
	public double totalAddonServiceByreservationidandRoomsID(@Param("reservationroomdetailsid") int reservationroomdetailsid);
	
	@Query("from Reservationaddonservice where reservationroomdetails.reservationroomdetailsid=:reservationroomdetailsid and paymentstt =:paymentstt")
	public List<Reservationaddonservice> AddonServiceByreservationid(@Param("reservationroomdetailsid") int reservationroomdetailsid,@Param("paymentstt") int paymentstt);
	
	@Query(" from Reservationaddonservice where reservationroomdetails.reservation.reservationid =:reservationid and paymentstt =:paymentstt")
	public List<Reservationaddonservice> listAddonServiceByreservationidAndpaymentstt(@Param("reservationid") int reservationid,@Param("paymentstt") int paymentstt);
	
	@Query("from Reservationaddonservice where reservationroomdetails.reservationroomdetailsid=:reservationroomdetailsid and  paymentstt<7")
	public List<Reservationaddonservice> AddonServiceByreservationid(@Param("reservationroomdetailsid") int reservationroomdetailsid);

	
}
