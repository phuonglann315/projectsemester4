package com.demo.repositories;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;
import com.demo.models.Contractinfo;
import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Roomtype;




@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
	
	//Xuan code o day
	//Xuan code o day
		@Query("from Reservation where roomtype.roomstypeid = :roomstypeid")
		public List<Reservation> findListReservationByRoomtypeid(@Param("roomstypeid") int roomstypeid);
		
		@Query("from Reservation where roomtype.hotel.hotelid = :hotelid and reservationstt=:reservationstt" )
		public List<Reservation> findListReservationByHotelid(@Param("hotelid") int hotelid,@Param("reservationstt") int reservationstt);
		
		@Query("select count(reservationid) from Reservation where checkin =:checkin and (reservationstt=2 or reservationstt=3) and roomtype.hotel.hotelid = :hotelid")
		public int countBookingByCheckinDay(@Param("checkin") Date checkin,@Param("hotelid") int hotelid);
		
		@Query("select count(reservationid) from Reservation where checkout =:checkout and (reservationstt=3 or reservationstt=4) and roomtype.hotel.hotelid = :hotelid ")
		public int countBookingByCheckoutDay(@Param("checkout") Date checkout,@Param("hotelid") int hotelid);
		
		@Query("select count(reservationid) from Reservation where month(checkin) =:month and roomtype.hotel.hotelid = :hotelid")
		public int countBookingByMonth(@Param("month") int month,@Param("hotelid") int hotelid);
		
		
		@Query("from Reservation where (roomtype.hotel.hotelid =:hotelid) and (reservationstt=2 or reservationstt=3 or reservationstt=4 ) and ( (checkin <:date and checkout =:date) or (checkin =:date) )  order by reservationstt")
		public List<Reservation> findListReservationByDate(@Param("hotelid") int hotelid,@Param("date") Date date);
		
		@Query("from Reservation where (roomtype.hotel.hotelid =:hotelid) and (reservationstt=2 or reservationstt=3 or reservationstt=4 )and (reservationid like %:keyword% or customername like %:keyword% or customerphone like %:keyword%) and ( (checkin <:date and checkout >=:date) or (checkin =:date) )  order by reservationstt")
		public List<Reservation> findListReservationByDateAndKeyword(@Param("hotelid") int hotelid,@Param("date") Date date,@Param("keyword") String keyword);

		public List<Reservation> findReservationByRoomtype_Hotel_hotelid(int hotelid);
		public List<Reservation> findReservationByReservationstt(@Param("reservationstt")int reservationstt);
		
		@Query("from Reservation where  reservationstt=4 and roomtype.hotel.hotelid = :hotelid and customercomment!='' or customercomment!=null")
		public List<Reservation> showCustomercomment(@Param("hotelid") int hotelid);
	//Lan code
	@Query("from Reservation where guestid = :guestid and bookingchannels = 'ONLINECHANNEL' ")
	public List<Reservation> findRevByGuestId(@Param("guestid") int guestid);
	
	@Query("select count(reservationid) from Reservation where guestid =:guestid and (reservationstt=2 or reservationstt=3 or reservationstt=4 )")
	public int countBookingGuestId(@Param("guestid") int guestid);
	
	@Query("select count(reservationid) from Reservation where guestid =:guestid and reservationstt = 2 and checkin > :today")
	public int countUpcomingBook(@Param("guestid") int guestid, @Param("today") Date today);

	@Query("select count(reservationid) from Reservation where guestid =:guestid and reservationstt = 7")
	public int countCancelBook(@Param("guestid") int guestid);
	
	@Query("select count(reservationid) from Reservation where guestid =:guestid and reservationstt = 4 and customercomment != ''")
	public int countReviewBooking(@Param("guestid") int guestid);
	
	@Query("from Reservation where guestid =:guestid and reservationstt = 2 and checkin > :today")
	public List<Reservation> listUpcoming(@Param("guestid") int guestid, @Param("today") Date today);
}
