package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Reservation;
import com.demo.models.Reservationroomdetails;




public interface ReservationService {

	public Iterable<Reservation> findAll();
	public Reservation find(int id);
	public Reservation save(Reservation  reservation);
	public List<Reservation> findListReservationByRoomtypeid( int roomstypeid);
	public List<Reservation> findListReservationByHotelid( int hotelid,int reservationstt);
	public int countBookingByCheckinDay(Date checkin,int hotelid);
	public int countBookingByCheckoutDay(Date checkout,int hotelid);
	public int countBookingByMonth(int month,int hotelid);
	public List<Reservation> findListReservationByDate(int hotelid, Date date);
	public List<Reservation> findListReservationByDateAndKeyword( int hotelid,Date date, String keyword);
	public double addPrice( int roomtypeid,int contractid,Date checkindate,Date checkoutdate);
	public List<Reservation> findReservationByRoomtype_Hotel_hotelid(int hotelid);
	public List<Reservation> findReservationByReservationstt(int reservationstt);
	public List<Reservation> showCustomercomment(int hotelid);
	//Lan code
	public List<Reservation> findRevByGuestId(int guestid);
	public int countBookingGuestId(int guestid);
	public int countUpcomingBook(int guestid, Date today);
	public int countCancelBook(int guestid);
	public int countReviewBooking(int guestid);
	public List<Reservation> listUpcoming(int guestid, Date today);
}
