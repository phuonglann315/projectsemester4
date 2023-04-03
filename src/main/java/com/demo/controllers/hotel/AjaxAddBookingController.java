package com.demo.controllers.hotel;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demo.models.Contractinfo;
import com.demo.models.Contractinforoomtype;
import com.demo.models.ContractinforoomtypeId;
import com.demo.models.Hotelseason;
import com.demo.models.Reservation;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Rooms;
import com.demo.models.XuanContractinforoomtype;
import com.demo.service.AddonserviceService;
import com.demo.service.ContractinfoService;
import com.demo.service.ContractinforoomtypeService;
import com.demo.service.HotelSeasonService;
import com.demo.service.HotelService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationroomdetailsService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;

@RestController
@RequestMapping("ajax/addbooking")
public class AjaxAddBookingController {

	@Autowired
	private AddonserviceService addonserviceService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private ContractinfoService contractinfoService;
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private ContractinforoomtypeService contractinforoomtypeService;
	@Autowired
	private RoomsService roomsService;
	@Autowired
	private HotelSeasonService hotelSeasonService;
	@Autowired
	private ReservationService reservationService;

	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;

	private int countAvailableRoom;

	private List<Rooms> availableRoomList;

	@RequestMapping(value = "findPriceRoomtypeByContract", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public XuanContractinforoomtype findPriceRoomtypeByContract(@RequestParam("roomtypeid") int roomtypeid,
			@RequestParam("checkin") String checkin, @RequestParam("checkout") String checkout,
			@RequestParam("contractid") int contractid, @RequestParam("hotelid") int hotelid,
			@RequestParam("bed") int bed) {
		try {

			Date checkindate = new SimpleDateFormat("dd-MM-yyyy").parse(checkin);
			Date checkoutdate = new SimpleDateFormat("dd-MM-yyyy").parse(checkout);
			double roomtypeprice = reservationService.addPrice(roomtypeid, contractid, checkindate, checkoutdate);

			XuanContractinforoomtype xuanContractinforoomtype = new XuanContractinforoomtype();
			String email = null;
			String phone = null;
			if (contractid > 0) {
				Contractinfo contractinfo = contractinfoService.find(contractid);
				xuanContractinforoomtype.setEmail(contractinfo.getEmail());
				xuanContractinforoomtype.setPhone(contractinfo.getPhone());
			}
			List<Rooms> availableRoom = roomsService.availableRoom(checkindate, checkoutdate, roomtypeid);
			countAvailableRoom = 0;

			switch (bed) {
			case 0: {

				availableRoom.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Double")) {
						countAvailableRoom += 1;
					}
				});

				break;
			}
			case 1: {

				availableRoom.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Twin")) {
						countAvailableRoom += 1;
					}
				});

				break;
			}
			default:
				countAvailableRoom = availableRoom.size();
				break;
			}

			xuanContractinforoomtype.setAvailableroom(countAvailableRoom);
			if (bed < 2 && countAvailableRoom == 0) {
				xuanContractinforoomtype
						.setCheckroom("This room type does not have a separate bed type as you choose.");
			}
			xuanContractinforoomtype.setPrice(roomtypeprice);
			return xuanContractinforoomtype;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@RequestMapping(value = { "createbooking" }, method = RequestMethod.POST, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)

	public String create(@RequestParam("roomtypeid") int roomtypeid, @RequestParam("checkin") String checkin,
			@RequestParam("checkout") String checkout, @RequestParam("contractid") int contractid,
			@RequestParam("quantity") int quantity, @RequestParam("price") double price,
			@RequestParam("customername") String customername, @RequestParam("customerphone") String customerphone,
			@RequestParam("Deadline") String Deadline, @RequestParam("hotelid") int hotelid,
			@RequestParam("customeremail") String customeremail,
			@RequestParam(value = "note", required = false) String note, @RequestParam("bed") int bed) {
		try {
			System.out.println("price " + price);

			Reservation reservation = new Reservation();
			Date checkindate = new SimpleDateFormat("dd-MM-yyyy").parse(checkin);
			Date checkoutdate = new SimpleDateFormat("dd-MM-yyyy").parse(checkout);
			int night = (int) (checkoutdate.getTime() - checkindate.getTime()) / (24 * 3600 * 1000);
			Calendar checkintime = Calendar.getInstance();
			checkintime.setTime(checkindate);			
			checkintime.set(Calendar.HOUR_OF_DAY, 0);
			checkintime.set(Calendar.SECOND, 0);
			checkintime.set(Calendar.MINUTE, 0);
			reservation.setCheckin(checkintime.getTime());

			Calendar checkouttime = Calendar.getInstance();
			checkouttime.setTime(checkoutdate);
			checkouttime.set(Calendar.HOUR_OF_DAY, 0);
			checkouttime.set(Calendar.SECOND, 0);
			checkouttime.set(Calendar.MINUTE, 0);
			reservation.setCheckout(checkouttime.getTime());

			Date deadlinedate = new SimpleDateFormat("dd-MM-yyyy").parse(Deadline);
			if (new SimpleDateFormat("dd-MM-yyyy").format(new Date()).equalsIgnoreCase(checkin)) {
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.HOUR_OF_DAY, 3);
				reservation.setDeadline(cal.getTime());
			} else {
				Calendar deadlinetime = Calendar.getInstance();
				deadlinetime.setTime(deadlinedate);
				deadlinetime.set(Calendar.HOUR_OF_DAY, 14);
				deadlinetime.set(Calendar.SECOND, 0);
				deadlinetime.set(Calendar.MINUTE, 0);
				reservation.setDeadline(deadlinetime.getTime());
			}

			

			reservation.setRoomtype(roomTypeService.find(roomtypeid));
			reservation.setTotalrooms(quantity);
			reservation.setCustomername(customername);
			reservation.setCustomerphone(customerphone);
			reservation.setReservationstt(0);
			reservation.setPayment1(0.0);
			reservation.setCustomeremail(customeremail);
			reservation.setNetprice(price);
			reservation.setPrice(price * quantity * night);
			reservation.setCreateday(new Date());
			reservation.setNote(note);
			if (contractid < 0) {
				reservation.setBookingchannels("DIRECTCHANNEL");
			} else {
				reservation.setContractinfo(contractinfoService.find(contractid));
				reservation.setBookingchannels("AGENTCHANNEL");
			}

			List<Rooms> availableRoom = roomsService.availableRoom(checkindate, checkoutdate, roomtypeid);
			availableRoomList = new ArrayList<Rooms>();
			switch (bed) {
			case 0: {
				availableRoom.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Double")) {
						availableRoomList.add(r);
					}
				});

				break;
			}
			case 1: {
				availableRoom.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Twin")) {
						availableRoomList.add(r);
					}
				});

				break;
			}
			default:
				availableRoomList = availableRoom;
				break;
			}
			if (availableRoomList.size() >= quantity) {
				reservation = reservationService.save(reservation);
				System.out.println("------reservation " + reservation.getReservationid());
				List<Reservationroomdetails> listreservationroomdetails = new ArrayList<Reservationroomdetails>();
				for (var i = 0; i < quantity; i++) {
					Reservationroomdetails reservationroomdetails = new Reservationroomdetails();
					reservationroomdetails.setReservation(reservation);
					reservationroomdetails.setReservationroomtypestt(0);
					reservationroomdetails.setRooms(availableRoomList.get(i));
					reservationroomdetails.setLatecheckoutid(0);
					reservationroomdetails.setCusinroom(roomTypeService.find(roomtypeid).getNumcusdefault());
					reservationroomdetails = reservationroomdetailsService.save(reservationroomdetails);
					listreservationroomdetails.add(reservationroomdetails);
				}
			}
			return reservation.getReservationid().toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}

	}

}
