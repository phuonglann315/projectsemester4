package com.demo.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Contractinforoomtype;
import com.demo.models.ContractinforoomtypeId;
import com.demo.models.Hotelseason;
import com.demo.models.Reservation;
import com.demo.models.Reservationroomdetails;
import com.demo.repositories.ReservationRepository;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ContractinfoService contractinfoService;
	@Autowired
	private HotelSeasonService hotelSeasonService;
	@Autowired
	private ContractinforoomtypeService contractinforoomtypeService;

	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private ReservationRepository reservationRepository;

	@Override
	public Iterable<Reservation> findAll() {
		return reservationRepository.findAll();

	}

	@Override
	public Reservation find(int id) {
		return reservationRepository.findById(id).orElse(null);
	}

	@Override
	public Reservation save(Reservation reservation) {
		return reservationRepository.save(reservation);
	}

	@Override
	public List<Reservation> findListReservationByRoomtypeid(int roomstypeid) {
		return reservationRepository.findListReservationByRoomtypeid(roomstypeid);
	}

	@Override
	public List<Reservation> findListReservationByHotelid(int hotelid, int reservationstt) {
		return reservationRepository.findListReservationByHotelid(hotelid, reservationstt);
	}

	@Override
	public int countBookingByCheckinDay(Date checkin,int hotelid) {
		return reservationRepository.countBookingByCheckinDay(checkin,hotelid);
	}

	@Override
	public int countBookingByCheckoutDay(Date checkout,int hotelid) {
		return reservationRepository.countBookingByCheckoutDay(checkout,hotelid);
	}

	@Override
	public int countBookingByMonth(int month,int hotelid) {
		return reservationRepository.countBookingByMonth(month,hotelid);
	}

	@Override
	public List<Reservation> findListReservationByDate(int hotelid, Date date) {

		return reservationRepository.findListReservationByDate(hotelid, date);
	}

	@Override
	public List<Reservation> findListReservationByDateAndKeyword(int hotelid, Date date, String keyword) {
		return reservationRepository.findListReservationByDateAndKeyword(hotelid, date, keyword);
	}
	
	@Override
	public List<Reservation> showCustomercomment(@Param("hotelid") int hotelid){
		return reservationRepository.showCustomercomment(hotelid);
	}
	
	private double priceortherseason;
	private int  n;
	@Override
	public double addPrice( int roomtypeid,int contractid,Date checkindate,Date checkoutdate) {
		 try {
			double roomtypeprice;
			if (contractid < 0) {
				roomtypeprice = roomTypeService.find(roomtypeid).getPublicprice();
			} else {
				int night = (int) (checkoutdate.getTime() - checkindate.getTime())
						/ (24 * 3600 * 1000);
				
				int hotelid=roomTypeService.find(roomtypeid).getHotel().getHotelid();
				Calendar c = Calendar.getInstance();
				c.setTime(checkoutdate);
				c.add(Calendar.DATE, -1);
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
				Date d=c.getTime();
				String s = dateFormat.format(d);
				Date beforcheckout = new SimpleDateFormat("dd-MM-yyyy").parse(s);
				
				Hotelseason hotelseasoncheckin = hotelSeasonService.findByDate(hotelid, checkindate);
				Hotelseason hotelseasoncheckout = hotelSeasonService.findByDate(hotelid, beforcheckout);
				ContractinforoomtypeId contractinforoomtypeId = new ContractinforoomtypeId();
				contractinforoomtypeId.setContractid(contractid);
				contractinforoomtypeId.setRoomtypeid(roomtypeid);
				Contractinforoomtype contractinforoomtype = contractinforoomtypeService
						.findById(contractinforoomtypeId);
				if(contractinforoomtype !=null) {
					roomtypeprice=	actioncheckprice( hotelid, hotelseasoncheckin,  hotelseasoncheckout, contractinforoomtype,
							 checkindate, beforcheckout,night);
					
				}else {
					roomtypeprice= -1;
				}
			}
			return roomtypeprice;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} 
	};
	
	
	private double actioncheckprice(int hotelid,Hotelseason hotelseasoncheckin, Hotelseason hotelseasoncheckout,Contractinforoomtype contractinforoomtype,
			Date checkindate,Date beforcheckout,int night) {
		double roomtypeprice;
		if(hotelseasoncheckin.getHotelseasonid()==hotelseasoncheckout.getHotelseasonid()) {
			if(hotelseasoncheckin.getSeasonname().equalsIgnoreCase("LOW") ) {
		
				roomtypeprice =  contractinforoomtype.getLowseasonprice();
						
			}else  {
				
				roomtypeprice =  contractinforoomtype.getHightseasonprice();
			}	
		}
		else {

			List<Hotelseason> listSeason= hotelSeasonService.findListByDate( hotelid,  checkindate,  beforcheckout);
			
			 priceortherseason=0;
			  n=0;
			  if(listSeason.size() >0) {
				  listSeason.forEach(hs->{
						int nighths=(int) (hs.getTodate().getTime() - hs.getFromdate().getTime())
								/ (24 * 3600 * 1000)+1;
						n=n+nighths;
						
						if(hs.getSeasonname().equalsIgnoreCase("LOW")) {
							priceortherseason=priceortherseason +(nighths * contractinforoomtype.getLowseasonprice());
						}else {
							priceortherseason=priceortherseason +(nighths * contractinforoomtype.getHightseasonprice());
						}
					});
			  }
			if(hotelseasoncheckin.getSeasonname().equalsIgnoreCase("LOW") && hotelseasoncheckout.getSeasonname().equalsIgnoreCase("HIGH")){
				
				
				int nightlowprice=(int) (hotelseasoncheckin.getTodate().getTime() - checkindate.getTime())
						/ (24 * 3600 * 1000)+1;
				
				int nighthighprice=(int) (beforcheckout.getTime() - hotelseasoncheckout.getFromdate().getTime())
						/ (24 * 3600 * 1000)+1;
				
				roomtypeprice=(priceortherseason +(nightlowprice * contractinforoomtype.getLowseasonprice()) +(nighthighprice * contractinforoomtype.getHightseasonprice()))/night;
			}else {						
				int nightlowprice=(int) (beforcheckout.getTime() - hotelseasoncheckout.getFromdate().getTime())
						/ (24 * 3600 * 1000)+1;						
				int nighthighprice=(int) (hotelseasoncheckin.getTodate().getTime() - checkindate.getTime())
						/ (24 * 3600 * 1000)+1;	
				roomtypeprice=(priceortherseason+(nightlowprice * contractinforoomtype.getLowseasonprice()) +(nighthighprice * contractinforoomtype.getHightseasonprice()))/night;
			}
		}
		return (double) Math.round(roomtypeprice * 10) / 10;
	}
	
	
	public List<Reservation> findReservationByRoomtype_Hotel_hotelid(int hotelid){
		return reservationRepository.findReservationByRoomtype_Hotel_hotelid(hotelid);
	};
	public List<Reservation> findReservationByReservationstt(int reservationstt){
		return reservationRepository.findReservationByReservationstt( reservationstt);
	};

	//Lan code
		@Override
		public List<Reservation> findRevByGuestId(int guestid) {
			return reservationRepository.findRevByGuestId(guestid);
		}

		@Override
		public int countBookingGuestId(int guestid) {		
			return reservationRepository.countBookingGuestId(guestid);
		}

		@Override
		public int countUpcomingBook(int guestid, Date today) {
			return reservationRepository.countUpcomingBook(guestid, today);
		}

		@Override
		public int countCancelBook(int guestid) {
			return reservationRepository.countCancelBook(guestid);
		}

		@Override
		public int countReviewBooking(int guestid) {
			return reservationRepository.countReviewBooking(guestid);
		}

		@Override
		public List<Reservation> listUpcoming(int guestid, Date today) {
			return reservationRepository.listUpcoming(guestid, today);
		}

}
