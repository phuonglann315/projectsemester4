package com.demo.controllers.hotel;

import java.lang.ProcessBuilder.Redirect;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.SchedulingAwareRunnable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Contractinfo;
import com.demo.models.Contractinforoomtype;
import com.demo.models.ContractinforoomtypeId;
import com.demo.models.Hotelseason;
import com.demo.models.Policies;
import com.demo.models.Reservation;
import com.demo.models.Reservationaddonservice;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;
import com.demo.models.XuanReservation;
import com.demo.service.AccountService;
import com.demo.service.ContractinfoService;
import com.demo.service.ContractinforoomtypeService;
import com.demo.service.HotelSeasonService;
import com.demo.service.HotelService;
import com.demo.service.PoliciesService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationaddonserviceService;
import com.demo.service.ReservationguestinfoService;
import com.demo.service.ReservationroomdetailsService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;
import com.demo.service.RoomtypeimageService;

@Controller
@RequestMapping({ "hotel/booking/action" })

public class ExchangeController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private HotelService hotelService;

	@Autowired
	private RoomTypeService roomTypeService;

	@Autowired
	private ReservationguestinfoService reservationguestinfoService;

	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;

	@Autowired
	private RoomtypeimageService roomtypeimageService;

	@Autowired
	private ReservationaddonserviceService reservationaddonserviceService;

	@Autowired
	private PoliciesService policiesService;

	@Autowired
	private ContractinfoService contractinfoService;

	@Autowired
	private RoomsService roomsService;

	@Autowired
	private ContractinforoomtypeService contractinforoomtypeService;

	@Autowired
	private HotelSeasonService hotelSeasonService;

	public Reservation exchangeoldreservationsttconfirm(int roomtype, Date checkindate, Date checkoutdate,
			Reservation oldreservation, int hotelid, int accountid, Date deadline, String changefee, String note,int bed,String checkin,String checkout, int oldbed) {
		List<Reservationroomdetails> listphongcu = reservationroomdetailsService
				.findListByNewReservationidandroomstypeid(oldreservation.getReservationid(),
						oldreservation.getRoomtype().getRoomstypeid());
//giu phong
		List<Reservationroomdetails> holdroomforbooking = holdroomforbooking(oldreservation.getTotalrooms(),
				checkindate, checkoutdate, roomtype, oldreservation,bed,oldbed,checkin,checkout);
	
		// neu giu phong thanh cong
		if (holdroomforbooking.size() ==oldreservation.getTotalrooms()) {
			
			Reservation newreservation = new Reservation();
			newreservation.setAccount(oldreservation.getAccount());
			newreservation.setContractinfo(oldreservation.getContractinfo());
			newreservation.setReservationidcode(oldreservation.getReservationidcode());
			newreservation.setAccount(oldreservation.getAccount());
			newreservation.setCustomername(oldreservation.getCustomername());
			newreservation.setCustomerphone(oldreservation.getCustomerphone());
			newreservation.setCustomeremail(oldreservation.getCustomeremail());
			newreservation.setRoomtype(roomTypeService.find(roomtype));
			newreservation.setTotalrooms(oldreservation.getTotalrooms());
			
			
			double roomtypeprice = 0;
			if (oldreservation.getContractinfo() == null
					&& oldreservation.getBookingchannels().equalsIgnoreCase("DIRECTCHANNEL")) {

				 roomtypeprice=reservationService.addPrice(  roomtype,-1, checkindate, checkoutdate);
			} else {
				 roomtypeprice=reservationService.addPrice(  roomtype,oldreservation.getContractinfo().getContractid(), checkindate, checkoutdate);
				 
			}
			roomtypeprice=(double) ((Math.round(roomtypeprice) * 10)/ 10);
			
			
			System.out.println("roomtypeprice "+roomtypeprice);
			newreservation.setNetprice(roomtypeprice);
			newreservation.setChargefee(Double.parseDouble(changefee.trim()));
			long newnight = (checkoutdate.getTime() - checkindate.getTime()) / (24 * 3600 * 1000);
			double newtotlprice = roomtypeprice * newreservation.getTotalrooms() * newnight;		
			double amount = oldreservation.getPrice() - newtotlprice;
			double chargeFee=0;
			if ((new SimpleDateFormat("dd-MM-yyyy").format(oldreservation.getCheckin()).equalsIgnoreCase(checkin)
					&& new SimpleDateFormat("dd-MM-yyyy").format(oldreservation.getCheckout()).equalsIgnoreCase(checkout))
					&& roomtype == oldreservation.getRoomtype().getRoomstypeid()) {
				chargeFee=0;
			}else {
				chargeFee=Double.parseDouble(changefee.trim());
			}
			// neu booking cu co gia < booking moi-> thanh toan chenh lech
			if (oldreservation.getPrice() < newtotlprice) {
				System.out.println("gia cu thap hon gia moi thi gia moi = charger fee +chenh lech gia moi va gia cu");
				newreservation
						.setPrice(Double.parseDouble(changefee.trim()) + newtotlprice - oldreservation.getPrice());
				newreservation.setPayment1(0.0);
				newreservation.setReservationstt(1);
			} // booking cu co gia lon hon booking moi -> khach ko phai thanh toan them tien
			else {
				System.out.println("gia cu cao hon gia moi thi chi thu charge fee");
				if(chargeFee >0) {
					System.out.println("charge fee >0");
					newreservation.setPrice(chargeFee);
					newreservation.setPayment1(0.0);
					newreservation.setReservationstt(1);
					
				}else {
					newreservation.setPrice(newtotlprice);
					newreservation.setPayment1(newtotlprice);
					newreservation.setReservationstt(2);
				}	
			}

			newreservation.setCreateday(new Date());
			newreservation.setCreateby(accountid);
			newreservation.setBookingchannels(oldreservation.getBookingchannels());
			newreservation.setReservation(oldreservation);
			newreservation.setNote(note);
			Calendar checkintime = Calendar.getInstance();
			checkintime.setTime(checkindate);
			checkintime.set(Calendar.HOUR_OF_DAY, 0);
			checkintime.set(Calendar.SECOND, 0);
			checkintime.set(Calendar.MINUTE, 0);
			newreservation.setCheckin(checkintime.getTime());

			Calendar checkouttime = Calendar.getInstance();
			checkouttime.setTime(checkoutdate);;
			checkouttime.set(Calendar.HOUR_OF_DAY, 0);
			checkouttime.set(Calendar.SECOND, 0);
			checkouttime.set(Calendar.MINUTE, 0);	
			newreservation.setCheckout(checkouttime.getTime());
		
			if (new SimpleDateFormat("dd-MM-yyyy").format(new Date()).equalsIgnoreCase(checkin)) {
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.HOUR_OF_DAY, 1);
				newreservation.setDeadline(cal.getTime());
			} else {
				Calendar deadlinetime = Calendar.getInstance();
				deadlinetime.setTime(deadline);
				deadlinetime.set(Calendar.HOUR_OF_DAY, 18);
				deadlinetime.set(Calendar.SECOND, 0);
				deadlinetime.set(Calendar.MINUTE, 0);
				newreservation.setDeadline(deadlinetime.getTime());
			}
			
			
			newreservation = reservationService.save(newreservation);
			
			updatelistdetailssoluongbangnhau(listphongcu, holdroomforbooking, newreservation);

			oldreservation.setReservationstt(6);
			oldreservation.setReservation(newreservation);
			reservationService.save(oldreservation);
			return newreservation;
		} else {
			return null;
		}

	}

	public Reservation exchangeoldreservationsttUnconfirm(int roomtype, int totalroom, Date checkindate,
			Date checkoutdate, Reservation oldreservation, int hotelid, int accountid, Date deadline, String note,
			String checkin, String checkout,int bed,int oldbed) {
		System.out.println("-----------------");
		System.out.println("exchangeoldreservationsttUnconfirm");
		Date oldcheckin = oldreservation.getCheckin();
		Date oldcheckout = oldreservation.getCheckin();
		// giu phong
		int newtotalroom = totalroom;
		int oldtotalroom = oldreservation.getTotalrooms();
		int oldroomtype = oldreservation.getRoomtype().getRoomstypeid();
		List<Reservationroomdetails> listphongcu = reservationroomdetailsService
				.findListByNewReservationidandroomstypeid(oldreservation.getReservationid(), oldroomtype);
		if ((new SimpleDateFormat("dd-MM-yyyy").format(oldcheckin).equalsIgnoreCase(checkin)
				&& new SimpleDateFormat("dd-MM-yyyy").format(oldcheckout).equalsIgnoreCase(checkout))
				&& totalroom > oldtotalroom && roomtype == oldreservation.getRoomtype().getRoomstypeid()) {
			newtotalroom = totalroom - oldreservation.getTotalrooms();
		}

		List<Reservationroomdetails> holdroomforbooking = holdroomforbooking(newtotalroom, checkindate, checkoutdate,
				roomtype, oldreservation,bed,oldbed,checkin,checkout);
		// neu giu phong thanh cong
		if (holdroomforbooking != null) {

			double roomtypeprice = 0;
			if (oldreservation.getContractinfo() == null
					&& oldreservation.getBookingchannels().equalsIgnoreCase("DIRECTCHANNEL")) {

				 roomtypeprice=reservationService.addPrice(  roomtype,-1, checkindate, checkoutdate);
			} else {
				 roomtypeprice=reservationService.addPrice(  roomtype,oldreservation.getContractinfo().getContractid(), checkindate, checkoutdate);
			}
			roomtypeprice=(double) ((Math.round(roomtypeprice) * 10)/ 10);
			System.out.println("roomtypeprice "+roomtypeprice);
			long newnight = (checkoutdate.getTime() - checkindate.getTime()) / (24 * 3600 * 1000);
			double newtotlprice = 0;
			newtotlprice = roomtypeprice * totalroom * newnight;
			double chenhlechgia = newtotlprice - oldreservation.getPayment1();
			oldreservation.setNetprice(roomtypeprice);			
			oldreservation.setPrice(newtotlprice);
			oldreservation.setRoomtype(roomTypeService.find(roomtype));
			oldreservation.setTotalrooms(totalroom);
			oldreservation.setNote(note);
			oldreservation = reservationService.save(oldreservation);
			Calendar checkintime = Calendar.getInstance();
			checkintime.setTime(checkindate);
			checkintime.set(Calendar.HOUR_OF_DAY, 0);
			checkintime.set(Calendar.SECOND, 0);
			checkintime.set(Calendar.MINUTE, 0);
			oldreservation.setCheckin(checkintime.getTime());

			Calendar checkouttime = Calendar.getInstance();
			checkouttime.setTime(checkoutdate);
			checkouttime.set(Calendar.HOUR_OF_DAY, 0);
			checkouttime.set(Calendar.SECOND, 0);
			checkouttime.set(Calendar.MINUTE, 0);	
			oldreservation.setCheckout(checkouttime.getTime());
		
			if (new SimpleDateFormat("dd-MM-yyyy").format(new Date()).equalsIgnoreCase(checkin)) {
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.HOUR_OF_DAY, 3);
				oldreservation.setDeadline(cal.getTime());
			} else {
				Calendar deadlinetime = Calendar.getInstance();
				deadlinetime.setTime(deadline);
				deadlinetime.set(Calendar.HOUR_OF_DAY, 18);
				deadlinetime.set(Calendar.SECOND, 0);
				deadlinetime.set(Calendar.MINUTE, 0);
				oldreservation.setDeadline(deadlinetime.getTime());
			}
			

			if ((new SimpleDateFormat("dd-MM-yyyy").format(oldcheckin).equalsIgnoreCase(checkin)
					&& new SimpleDateFormat("dd-MM-yyyy").format(oldcheckout).equalsIgnoreCase(checkout))
					&& (roomtype == oldroomtype)) {
				System.out.println("chi co so luong thay doi");

				if (totalroom > oldtotalroom) {
					System.out.println("totalroom > oldreservation.getTotalrooms()");
					updateListDetailsRoomChiThayDoiSoLuong1(holdroomforbooking, oldreservation);

				}
				if (totalroom < oldtotalroom) {
					System.out.println("bat dau chuyen stt list phong cu sang 6");
					int x = oldtotalroom - totalroom;
					for (var i = 0; i < listphongcu.size(); i++) {
						if (i < x) {
							Reservationroomdetails newrsr = listphongcu.get(i);
							System.out.println("newrsr " + newrsr.getReservationroomdetailsid());
							newrsr.setReservationroomtypestt(6);
							reservationroomdetailsService.save(newrsr);
						}
					}
				}
			} else {
				System.out.println("co su thay doi khac ngoai so luong");
				updateListRoomtypeKhacRoomtypecu(listphongcu, holdroomforbooking, oldreservation);
			}

			return oldreservation;
		} else {
			return null;
		}

	}

	private void updatelistdetailssoluongbangnhau(List<Reservationroomdetails> listphongcu,
			List<Reservationroomdetails> holdroomforbooking, Reservation newreservation) {

		for (var i = 0; i < listphongcu.size(); i++) {
			System.out.println(
					" list phong cu Reservationroomdetailsid " + listphongcu.get(i).getReservationroomdetailsid());

			Reservationroomdetails oldrsr = listphongcu.get(i);
			oldrsr.setReservationroomtypestt(6);
			reservationroomdetailsService.save(oldrsr);
			for (var j = 0; j < holdroomforbooking.size(); j++) {
				
				Reservationroomdetails newrsr = holdroomforbooking.get(j);
				newrsr.setReservation(newreservation);
				newrsr.setReservationroomtypestt(newreservation.getReservationstt());
				newrsr.setCusinroom(newreservation.getRoomtype().getNumcusdefault());
				Boolean update = updateListBookingroomDetail(oldrsr, newrsr);
			
				
				reservationroomdetailsService.save(newrsr);

				holdroomforbooking.remove(newrsr);
			}

		}
	}

	private void updateListRoomtypeKhacRoomtypecu(List<Reservationroomdetails> listphongcu,
			List<Reservationroomdetails> holdroomforbooking, Reservation oldreservation) {
		System.out.println("updateListRoomtypeKhacRoomtypecu");
		for (var i = 0; i < listphongcu.size(); i++) {
			Reservationroomdetails oldrsr = listphongcu.get(i);
			oldrsr.setReservationroomtypestt(6);
			reservationroomdetailsService.save(oldrsr);
		}

		for (var i = 0; i < holdroomforbooking.size(); i++) {
			Reservationroomdetails newrsr = holdroomforbooking.get(i);
			newrsr.setReservationroomtypestt(oldreservation.getReservationstt());
			reservationroomdetailsService.save(newrsr);
		}

	}

	private void updateListDetailsRoomChiThayDoiSoLuong1(List<Reservationroomdetails> holdroomforbooking,
			Reservation oldreservation) {
		System.out.println("updateListDetailsRoomChiThayDoiSoLuong1");
		for (var i = 0; i < holdroomforbooking.size(); i++) {
			Reservationroomdetails newrsr = holdroomforbooking.get(i);
			newrsr.setReservationroomtypestt(oldreservation.getReservationstt());
			reservationroomdetailsService.save(newrsr);
		}

	}

	private boolean updateListBookingroomDetail(Reservationroomdetails oldReservationroomdetails,
			Reservationroomdetails newReservationroomdetails) {
		try {
			List<Reservationaddonservice> reservationaddonservices = reservationaddonserviceService
					.AddonServiceByreservationid(oldReservationroomdetails.getReservationroomdetailsid(), 0);
			if (reservationaddonservices.size() > 0) {
				reservationaddonservices.forEach(rsa -> {
					/*Reservationaddonservice reservationaddonservice = new Reservationaddonservice();
					reservationaddonservice.setAddonservice(rsa.getAddonservice());
					reservationaddonservice.setReservationroomdetails(newReservationroomdetails);
					reservationaddonservice.setAmount(rsa.getAmount());
					reservationaddonservice.setQuantity(rsa.getQuantity());
					reservationaddonservice.setPrice(rsa.getPrice());
					reservationaddonservice.setPaymentstt(rsa.getPaymentstt());
					reservationaddonserviceService.save(reservationaddonservice);*/

					rsa.setPaymentstt(6);
					reservationaddonserviceService.save(rsa);
				});
			}
			List<Reservationguestinfo> reservationguestinfos = reservationguestinfoService
					.getlistCusbyreservationroomdetailsid(oldReservationroomdetails.getReservationroomdetailsid());
			if (reservationguestinfos.size() > 0) {
				reservationguestinfos.forEach(rsgi -> {
					Reservationguestinfo reservationguestinfo = new Reservationguestinfo();
					reservationguestinfo.setReservationroomdetails(newReservationroomdetails);
					reservationguestinfo.setBirthday(null);
					reservationguestinfo.setGuestidcardnumber(null);
					reservationguestinfo.setGuestname(null);
					reservationguestinfoService.save(reservationguestinfo);

				});
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	List<Rooms> availableroomforholdroom;
	private List<Reservationroomdetails> holdroomforbooking(int holdNoRoom, Date checkin, Date checkout, int roomtypeid,
			Reservation reservation,int bed,int oldbed,String checkindate,String checkoutdate) {
		try {
			List<Reservationroomdetails> holdroomforbooking = new ArrayList<Reservationroomdetails>();
			List<Rooms>  rooms=  roomsService.availableRoom(checkin, checkout, roomtypeid,checkindate,checkoutdate,bed,oldbed,reservation);
			 availableroomforholdroom =  new ArrayList<Rooms>();
			switch (bed) {
			case 0: {
				rooms.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Double")) {
						availableroomforholdroom.add(r);
						
					}
				});
				break;
			}
			case 1: {
				rooms.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Twin")) {
						availableroomforholdroom.add(r);
					}
				});

				break;
			}
			default:
				availableroomforholdroom = rooms;
				break;
			}

			if (availableroomforholdroom.size() >= holdNoRoom) {
				availableroomforholdroom.forEach(room -> {
					if (holdroomforbooking.size() < holdNoRoom) {
						Reservationroomdetails reservationroomdetails = new Reservationroomdetails();
						reservationroomdetails.setReservation(reservation);
						reservationroomdetails.setRooms(room);
						reservationroomdetails.setReservationroomtypestt(0);
						reservationroomdetails.setLatecheckoutid(0);
						reservationroomdetails.setCusinroom(roomTypeService.find(roomtypeid).getNumcusdefault());
						reservationroomdetails = reservationroomdetailsService.save(reservationroomdetails);
						holdroomforbooking.add(reservationroomdetails);
					}
				});

			}

			return holdroomforbooking;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@RequestMapping(value = { "exchange" }, method = RequestMethod.POST)

	public String exchangebooking(@RequestParam("roomtype") int roomtype, @RequestParam("totalroom") String totalroom,
			@RequestParam("checkin") String checkin, @RequestParam("checkout") String checkout,
			@RequestParam("reservationid") int reservationid, @RequestParam("hotelid") int hotelid,
			@RequestParam(value = "changefee", required = false) String changefee,
			@RequestParam("accountid") int accountid, @RequestParam("deadLine") String deadLine,
			@RequestParam(value = "note", required = false) String note, @RequestParam("bed") int bed, @RequestParam("oldbed") int oldbed) {
		try {
			System.out.println(oldbed);
			Reservation newreservation = new Reservation();
			Reservation oldreservation = reservationService.find(reservationid);
			
			Date checkindate = new SimpleDateFormat("dd-MM-yyyy").parse(checkin);
			Date checkoutdate = new SimpleDateFormat("dd-MM-yyyy").parse(checkout);
			Date deadline = new SimpleDateFormat("dd-MM-yyyy").parse(deadLine);
			int ttroom = Integer.parseInt(totalroom.trim());
			if ((new SimpleDateFormat("dd-MM-yyyy").format(oldreservation.getCheckin()).equalsIgnoreCase(checkin)
					&& new SimpleDateFormat("dd-MM-yyyy").format(oldreservation.getCheckout())
							.equalsIgnoreCase(checkout))
					&& Integer.parseInt(totalroom.trim()) == oldreservation.getTotalrooms()
					&& roomtype == oldreservation.getRoomtype().getRoomstypeid() && oldbed==bed) {
				oldreservation.setNote(note);
				reservationService.save(oldreservation);
				System.out.println("thong tin ko thay doi");
				return "redirect:/hotel/booking/detailsbooking?bookingId=" + oldreservation.getReservationid();
			} else {

				if (oldreservation.getReservationstt() >= 2) {
					System.out.println("thong tin CO thay doi vaf stt booking cu =2");

					newreservation = exchangeoldreservationsttconfirm(roomtype, checkindate, checkoutdate,
							oldreservation, hotelid, accountid, deadline, changefee, note,bed,checkin,checkout,oldbed);

					return "redirect:/hotel/booking/detailsbooking?bookingId=" + newreservation.getReservationid();
				} else {

					newreservation = exchangeoldreservationsttUnconfirm(roomtype, ttroom, checkindate, checkoutdate,
							oldreservation, hotelid, accountid, deadline, note, checkin, checkout,bed,oldbed);

					return "redirect:/hotel/booking/detailsbooking?bookingId=" + newreservation.getReservationid();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "hotel/error";
		}

	}

}
