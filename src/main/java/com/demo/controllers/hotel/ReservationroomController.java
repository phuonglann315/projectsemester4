package com.demo.controllers.hotel;

import java.lang.ProcessBuilder.Redirect;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.models.Account;
import com.demo.models.Addonservice;
import com.demo.models.Contractinfo;
import com.demo.models.Policies;
import com.demo.models.Reservation;
import com.demo.models.Reservationaddonservice;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;
import com.demo.models.Roomtypeimage;
import com.demo.service.AccountService;
import com.demo.service.AddonserviceService;
import com.demo.service.HotelService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationaddonserviceService;
import com.demo.service.ReservationguestinfoService;
import com.demo.service.ReservationroomdetailsService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;
import com.demo.service.RoomtypeimageService;

@Controller
@RequestMapping({ "hotel/reservationroom" })

public class ReservationroomController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private AddonserviceService addonserviceService;

	@Autowired
	private ReservationguestinfoService reservationguestinfoService;

	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;

	@Autowired
	private RoomtypeimageService roomtypeimageService;

	@Autowired
	private RoomsService roomsService;
	@Autowired
	private ReservationaddonserviceService reservationaddonserviceService;

	Boolean check = false;

	@RequestMapping(value = { "addonservice" }, method = RequestMethod.GET)

	public String addonservice(HttpSession session, ModelMap modelMap, @RequestParam("bookingId") int bookingId,
			@RequestParam("roomid") int roomid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				Reservation reservation = reservationService.find(bookingId);
				Rooms rooms = roomsService.find(roomid);
				if (reservation != null && rooms != null) {
					List<Reservationroomdetails> reservationroomdetailses = reservationroomdetailsService
							.findListByReservationid(reservation.getReservationid());

					reservationroomdetailses.forEach(rs -> {
						if (rs.getRooms().getRoomid() == rooms.getRoomid()) {
							check = true;
						}
					});

					if (check == true) {
						showBooking(modelMap, reservation, rooms);
						modelMap.put("logo", account.getHotel().getLogo());
						modelMap.put("accountname", account.getAccountname());
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("role", role);
						modelMap.put("avatar", account.getAvatar());
						return "hotel/rooms/addonservice";
					} else {
						return "hotel/error";
					}
				} else {
					return "hotel/error";
				}
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}
	
	
	@RequestMapping(value = { "canceladdon" }, method = RequestMethod.GET)

	public String canceladdon(HttpSession session, ModelMap modelMap, @RequestParam("reservationaddonserviceid") int reservationaddonserviceid) {

		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				Reservationaddonservice reservationaddonservice=reservationaddonserviceService.find(reservationaddonserviceid);
				Reservationroomdetails reservationroomdetails=reservationaddonservice.getReservationroomdetails();
				reservationaddonservice.setPaymentstt(7);
				if(reservationroomdetails.getLatecheckoutid() >0) {
					Reservation latebooking=reservationService.find(reservationroomdetails.getLatecheckoutid());
					List<Reservationroomdetails> lateroom=reservationroomdetailsService.findListByReservationid(reservationroomdetails.getLatecheckoutid());
					lateroom.forEach(r->{
						r.setReservationroomtypestt(7);
						reservationroomdetailsService.save(r);
					});
					latebooking.setRefundamount(0.0);
					latebooking.setRefunddate(new Date());
					latebooking.setReservationstt(7);
					reservationService.save(latebooking);
		
					reservationroomdetails.setLatecheckoutid(0);
					reservationroomdetailsService.save(reservationroomdetails);
				}
				if(reservationaddonservice.getAddonservice().getServicetype().equals("Extra Bed")) {
					reservationroomdetails.setCusinroom(reservationroomdetails.getCusinroom()-1);
				}
				reservationaddonserviceService.save(reservationaddonservice);
				
				return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="
				+ reservationroomdetails.getReservationroomdetailsid();
			} else {
				
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}

	public void showBooking(ModelMap modelMap, Reservation reservation, Rooms rooms) {
		modelMap.put("reservation", reservation);
		List<Roomtypeimage> listImages = roomtypeimageService
				.findNameImageofRoomtype(reservation.getRoomtype().getRoomstypeid());
		List<String> listImage =new ArrayList<>();
		listImages.forEach(im->{
			listImage.add(im.getRoomtypeimagename());
		});
		if (listImage.size() > 0) {
			String bg1 = listImage.get(new Random().nextInt(listImage.size()));
			String bg2 = listImage.get(new Random().nextInt(listImage.size()));
			modelMap.put("bg1", bg1);
			modelMap.put("bg2", bg2);

		} else {
			modelMap.put("bg1", "bg-bread-defaul.jpg");
			modelMap.put("bg2", "room-defaul.jpg");
		}

	}

	@RequestMapping(value = { "addcustomer" }, method = RequestMethod.GET)

	public String addcustomer(RedirectAttributes redirectAttrs,
			@RequestParam("reservationroomdetailsid") int reservationroomdetailsid,
			@RequestParam("guestname") List<String> guestname,
			@RequestParam("reservationguestinfoid") List<Integer> reservationguestinfoid,
			@RequestParam("guestidcardnumber") List<String> guestidcardnumber) {
		Reservationroomdetails reservationroom = reservationroomdetailsService.find(reservationroomdetailsid);
		List<Reservationguestinfo> reservationguestinfos = reservationguestinfoService
				.getlistCusbyreservationroomdetailsid(reservationroomdetailsid);

		for (var k = 0; k < reservationguestinfoid.size(); k++) {
			Reservationguestinfo reservationguestinfo = new Reservationguestinfo();
			for (var i = 0; i < guestname.size(); i++) {
				reservationguestinfo.setGuestname(guestname.get(i));
				for (var j = 0; j < guestidcardnumber.size(); j++) {
					reservationguestinfo.setGuestidcardnumber(guestidcardnumber.get(j));
					guestidcardnumber.remove(guestidcardnumber.get(j));
					guestname.remove(guestname.get(i));
					j = guestidcardnumber.size();

				}
				i = guestname.size();
			}
			if (reservationguestinfoid.get(k) != null) {
				reservationguestinfo.setReservationguestinfoid(reservationguestinfoid.get(k));
			}
			reservationguestinfo.setBirthday(new Date());
			reservationguestinfo.setReservationroomdetails(reservationroom);
			reservationguestinfoService.save(reservationguestinfo);
		}
		redirectAttrs.addFlashAttribute("msg1", "Traveller information has been saved");
		return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="
				+ reservationroomdetailsid;

	}

	@RequestMapping(value = { "addaddonservice" }, method = RequestMethod.GET)

	public String addaddonservice(HttpSession session, RedirectAttributes redirectAttrs,
			@RequestParam("reservationroomdetailsid") int reservationroomdetailsid,
			@RequestParam("quantity") String quantity, @RequestParam("addonserviceid") int addonserviceid,
			@RequestParam("paymentchannel") String paymentchannel,@RequestParam("paymentchannel1") String paymentchannel1,
			@RequestParam(value = "check", required = false) String check, @RequestParam("price") double price,
			@RequestParam("typeservice") int typeservice,
			@RequestParam(value = "holdroom", required = false) String holdroom) {
		try {
			System.out.println("quantity " + quantity);
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			int idhotel = account.getHotel().getHotelid();
			
			if (!(check.equalsIgnoreCase("erros"))) {

				Reservationroomdetails reservationroom = reservationroomdetailsService.find(reservationroomdetailsid);
				if (holdroom.equalsIgnoreCase("ok")) {
			
				return	addLateCheckOutService( redirectAttrs, reservationroomdetailsid,  idhotel, reservationroom, quantity, addonserviceid,
							 paymentchannel, paymentchannel1, price,typeservice);
	 
				} else {
					System.out.println("ko co giu phong");
					Reservationaddonservice reservationaddonservice = new Reservationaddonservice();
					reservationaddonservice=actionAddon(quantity, reservationroom, addonserviceid, price, typeservice, paymentchannel);
					reservationaddonservice.setLatecheckoutid(0);
					if(reservationaddonservice.getAddonservice().getServicetype().equalsIgnoreCase("Extra Bed")) {
						List<Reservationguestinfo> a = new ArrayList<Reservationguestinfo>();
						for (var i = 0; i <Integer.parseInt(quantity) ; i++) {
							a.add(new Reservationguestinfo());
						}
						redirectAttrs.addFlashAttribute("a", a);
					}
					reservationaddonserviceService.save(reservationaddonservice);
					return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="
					+ reservationroomdetailsid;
				}

			}else {
				return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="
						+ reservationroomdetailsid;
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("msg3", "The request was unsuccess.");
			return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="
					+ reservationroomdetailsid;
		}

	}

	private List<Reservationguestinfo> update(List<Reservationguestinfo> gues,
			Reservationroomdetails latecheckoutreservationroom) {
		List<Reservationguestinfo> newlist = new ArrayList<Reservationguestinfo>();
		gues.forEach(g -> {
			Reservationguestinfo gu = new Reservationguestinfo();
			gu.setBirthday(g.getBirthday());
			gu.setGuestidcardnumber(g.getGuestidcardnumber());
			gu.setGuestname(g.getGuestname());
			gu.setReservationroomdetails(latecheckoutreservationroom);
			gu = reservationguestinfoService.save(gu);
			if (gu != null) {
				newlist.add(gu);
			}

		});
		return newlist;
	}
	
	private Reservationaddonservice actionAddon(String quantity, Reservationroomdetails reservationroom, int addonserviceid, double price,
			int typeservice, String paymentchannel) {
		int q = Integer.parseInt(quantity.trim());

		Reservationaddonservice reservationaddonservice = new Reservationaddonservice();
		Addonservice addonservice = addonserviceService.find(addonserviceid);
		reservationaddonservice.setReservationroomdetails(reservationroom);
		reservationaddonservice.setAddonservice(addonservice);
		reservationaddonservice.setCreateday(new Date());
		reservationaddonservice.setPrice(price);
		reservationaddonservice.setQuantity(q);
		reservationaddonservice.setAmount(price * q);
		if (paymentchannel.equalsIgnoreCase("POSTPAID")) {
			reservationaddonservice.setPaymentstt(0);
		} else {
			reservationaddonservice.setPaymentstt(1);
			reservationaddonservice.setPaymentchannel(paymentchannel);
			reservationaddonservice.setPaymentdate(new Date());
		}
		
		if (typeservice == 1) {
			reservationroom.setCusinroom(reservationroom.getCusinroom() + q);
			reservationroomdetailsService.save(reservationroom);
		}
		return reservationaddonservice;
	}
	
	private String addLateCheckOutService(RedirectAttributes redirectAttrs,int reservationroomdetailsid, int idhotel,Reservationroomdetails reservationroom,String quantity,int addonserviceid,
			String paymentchannel,String paymentchannel1, double price,int typeservice) {
		try {
			int roomid = reservationroom.getRooms().getRoomid();
			Date checkin = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.DATE, 1);
			String s = dateFormat.format(c1.getTime());
			Date checkout = new SimpleDateFormat("dd-MM-yyyy").parse(s);
			Calendar c2 = Calendar.getInstance();
			c2.add(Calendar.HOUR_OF_DAY, 1);
			String d = dateFormat.format(c2.getTime());
			Date deadline = new SimpleDateFormat("dd-MM-yyyy").parse(d);
			List<Rooms> availableroom = roomsService.availableRoom(checkin, checkout,
					reservationroom.getReservation().getRoomtype().getRoomstypeid());
			int c = (int) availableroom.stream().filter(r -> r.getRoomid() == roomid).count();
			if (c > 0) {
				// tạo phòng mới với thông tin CI và CO là ngày hôm nay( check out booking cũ), giá và net price là số tiền cho serice late check out
				// deadline là 18h
				Reservation oldReservation = reservationroom.getReservation();
				Reservation latecheckoutReservation = new Reservation();
				latecheckoutReservation.setAccount(oldReservation.getAccount());
				latecheckoutReservation.setContractinfo(oldReservation.getContractinfo());
				latecheckoutReservation.setReservation(oldReservation);
				latecheckoutReservation.setRoomtype(oldReservation.getRoomtype());
				latecheckoutReservation.setCheckin(oldReservation.getCheckout());
				Calendar checkouttime = Calendar.getInstance();
				checkouttime.setTime(oldReservation.getCheckout());
				checkouttime.set(Calendar.HOUR_OF_DAY, 18);
				checkouttime.set(Calendar.SECOND, 0);
				checkouttime.set(Calendar.MINUTE, 0);
				latecheckoutReservation.setCheckout(checkouttime.getTime());
				latecheckoutReservation.setTotalrooms(1);
				latecheckoutReservation.setCustomername(oldReservation.getCustomername());
				latecheckoutReservation.setCustomeremail(oldReservation.getCustomeremail());
				latecheckoutReservation.setCustomerphone(oldReservation.getCustomerphone());
				latecheckoutReservation.setPayment1(0.0);
				latecheckoutReservation.setReservationstt(0);
				latecheckoutReservation.setNetprice(price);
				latecheckoutReservation.setPrice(price);
				latecheckoutReservation.setCreateday(checkin);
				latecheckoutReservation.setCreateby(idhotel);
				latecheckoutReservation.setDeadline(checkouttime.getTime());
				latecheckoutReservation.setNote("This booking is late check-out for room "
						+ reservationroom.getRooms().getRoomname() + "booking "
						+ oldReservation.getReservationid() + ". Pax payment in addonservice for old booking ");
				latecheckoutReservation.setBookingchannels(oldReservation.getBookingchannels());
				latecheckoutReservation = reservationService.save(latecheckoutReservation);
				//sau khi tao booking thì giữ đúng phòng đó cho khách
				if (latecheckoutReservation != null) {
					Reservationroomdetails latecheckoutreservationroom = new Reservationroomdetails();
					latecheckoutreservationroom.setRooms(reservationroom.getRooms());
					latecheckoutreservationroom.setCusinroom(reservationroom.getCusinroom());
					latecheckoutreservationroom.setReservationroomtypestt(0);
					latecheckoutreservationroom.setLatecheckoutid(0);
					latecheckoutreservationroom.setReservation(latecheckoutReservation);
					latecheckoutreservationroom = reservationroomdetailsService
							.save(latecheckoutreservationroom);
					//sau khi giữ được đúng phòng đó thì chuyển thông tin khách ở phòng cũ chuyển sang p mới
					if (latecheckoutreservationroom != null) {
						List<Reservationguestinfo> gues = reservationguestinfoService
								.getlistCusbyreservationroomdetailsid(reservationroomdetailsid);
						List<Reservationguestinfo> newlist = update(gues, latecheckoutreservationroom);
						// sau khi chuyển tên khách sang p mới thì ghi nhận latecheckout id cho phòng cũ
						reservationroom.setLatecheckoutid(latecheckoutReservation.getReservationid());
						reservationroom = reservationroomdetailsService.save(reservationroom);
						// cuối cùng là ghi nhận service cho phòng mới
						Reservationaddonservice reservationaddonservice = new Reservationaddonservice();
						reservationaddonservice=actionAddon(quantity, reservationroom, addonserviceid, price, typeservice, paymentchannel);
						reservationaddonservice.setLatecheckoutid(latecheckoutReservation.getReservationid());
						reservationaddonserviceService.save(reservationaddonservice);
						redirectAttrs.addFlashAttribute("msg3", "Success.");
					} else {
						latecheckoutReservation.setReservationstt(7);
						reservationService.save(latecheckoutReservation);
						redirectAttrs.addFlashAttribute("msg3", "The request was unsuccess.");
					}

				} else {
					redirectAttrs.addFlashAttribute("msg3", "The request was unsuccess.");
				}
			} else {
				redirectAttrs.addFlashAttribute("msg3",
						"This room has expired during operation. The request was unsuccess.");
			}
			return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="+ reservationroomdetailsid;
			
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("msg3", "Erros!The request was unsuccess.");
			return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="+ reservationroomdetailsid;
			
		}
		
	};
	
	@RequestMapping(value = { "chekinforall" }, method = RequestMethod.GET)

	public String chekinforall(HttpSession session, ModelMap modelMap,
			@RequestParam("reservationid") int reservationid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				int hotelid = account.getHotel().getHotelid();
				Reservation reservation = reservationService.find(reservationid);
				if (reservation != null) {
					List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService
							.findListByReservationid(reservationid);
					reservationroomdetails.forEach(r -> {
						r.setCheckintime(new Date());
						r.setReservationroomtypestt(3);
					});
					reservation.setReservationstt(3);
					reservationService.save(reservation);
					return "redirect:/hotel/booking/detailsbooking?bookingId=" + reservationid;

				} else {
					return "hotel/error";
				}
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}

	@RequestMapping(value = { "chekoutforall" }, method = RequestMethod.GET)

	public String chekoutforall(HttpSession session, ModelMap modelMap,
			@RequestParam("reservationid") int reservationid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				int hotelid = account.getHotel().getHotelid();
				Reservation reservation = reservationService.find(reservationid);
				if (reservation != null) {
					List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService
							.findListByReservationid(reservationid);
					reservationroomdetails.forEach(r -> {
						r.setCheckouttime(new Date());
						r.setReservationroomtypestt(4);
					});
					reservation.setReservationstt(4);
					reservationService.save(reservation);
					return "redirect:/hotel/booking/detailsbooking?bookingId=" + reservationid;

				} else {
					return "hotel/error";
				}
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}

	@RequestMapping(value = { "paymentaddon" }, method = RequestMethod.GET)

	public String paymentaddon(RedirectAttributes redirectAttrs,
			@RequestParam("reservationroomdetailsid") int reservationroomdetailsid,
			@RequestParam(value = "paymentforid", required = false) List<Integer> paymentforid,
			@RequestParam(value = "chonpayment", required = false) String chonpayment,@RequestParam(value = "roomlatecheckout", required = false) String  roomlatecheckout) {
		if (paymentforid != null) {
			paymentforid.forEach(x -> {
				Reservationaddonservice reservationaddonservice = reservationaddonserviceService.find(x);
				if(roomlatecheckout !=null ) {
					int idbookinghold=Integer.parseInt(roomlatecheckout);
					if(reservationaddonservice.getLatecheckoutid() == idbookinghold) {
						Reservation latebooking=reservationService.find(idbookinghold);
						List<Reservationroomdetails> lateroom=reservationroomdetailsService.findListByReservationid(idbookinghold);
						lateroom.forEach(r->{
							r.setReservationroomtypestt(3);
							reservationroomdetailsService.save(r);
						});
						latebooking.setPayment1(latebooking.getPrice());
						latebooking.setPaymentchannel1(chonpayment +" from latecheckout request");
						latebooking.setPaymentdat1(new Date());
						latebooking.setReservationstt(3);
						reservationService.save(latebooking);
					}
					reservationaddonservice.setPaymentstt(6);
				}else {
					reservationaddonservice.setPaymentstt(1);
				}
				reservationaddonservice.setPaymentchannel(chonpayment);
				reservationaddonservice.setPaymentdate(new Date());
				reservationaddonserviceService.save(reservationaddonservice);
			});
			
			
		}
		if (paymentforid == null) {
			redirectAttrs.addFlashAttribute("msg", "Please select payment object");
		}
		return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="
				+ reservationroomdetailsid;
	}

	@RequestMapping(value = { "checkineachroom" }, method = RequestMethod.GET)

	public String checkineachroom(@RequestParam("reservationroomdetailsid") int reservationroomdetailsid) {

		Reservationroomdetails reservationroomdetails = reservationroomdetailsService.find(reservationroomdetailsid);
		reservationroomdetails.setCheckintime(new Date());
		reservationroomdetails.setReservationroomtypestt(3);

		reservationroomdetailsService.save(reservationroomdetails);
		Reservation reservation = reservationroomdetails.getReservation();
		List<Reservationroomdetails> alllist = reservationroomdetailsService
				.findListByReservationid(reservation.getReservationid());
		List<Reservationroomdetails> checkedinlist = reservationroomdetailsService
				.listroomwithstt(reservation.getReservationid(), 3);
		if (alllist.size() == checkedinlist.size()) {
			reservation.setReservationstt(3);
			reservationService.save(reservation);
		}
		return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="
				+ reservationroomdetailsid;
	}

	@RequestMapping(value = { "checkouteachroom" }, method = RequestMethod.GET)

	public String checkouteachroom(@RequestParam("reservationroomdetailsid") int reservationroomdetailsid) {

		Reservationroomdetails reservationroomdetails = reservationroomdetailsService.find(reservationroomdetailsid);
		reservationroomdetails.setCheckouttime(new Date());
		reservationroomdetails.setReservationroomtypestt(4);
		reservationroomdetailsService.save(reservationroomdetails);
		Reservation reservation = reservationroomdetails.getReservation();
		List<Reservationroomdetails> alllist = reservationroomdetailsService
				.findListByReservationid(reservation.getReservationid());

		List<Reservationroomdetails> checkedinlist = reservationroomdetailsService
				.listroomwithstt(reservation.getReservationid(), 4);
		if (alllist.size() == checkedinlist.size()) {
			reservation.setReservationstt(4);
			reservationService.save(reservation);
		}
		return "redirect:/hotel/reservationroom/showreservationroom?reservationroomdetailsid="
				+ reservationroomdetailsid;
	}

	@RequestMapping(value = { "showreservationroom" }, method = RequestMethod.GET)

	public String showreservationroom(HttpSession session, ModelMap modelMap,
			@RequestParam("reservationroomdetailsid") int reservationroomdetailsid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				int hotelid = account.getHotel().getHotelid();
				modelMap.put("accountname", account.getAccountname());
				Reservationroomdetails reservationroom = reservationroomdetailsService.find(reservationroomdetailsid);

				if (reservationroom != null) {
					showRoom(modelMap, reservationroom, hotelid);
					return "hotel/rooms/roombookingdetails";

				} else {
					return "hotel/error";
				}
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}

	public void showRoom(ModelMap modelMap, Reservationroomdetails reservationroom, int hotelid) {
		modelMap.put("reservationroom", reservationroom);
		Reservation reservation = reservationroom.getReservation();
		modelMap.put("reservation", reservation);
		List<Roomtypeimage> listImages = roomtypeimageService
				.findNameImageofRoomtype(reservation.getRoomtype().getRoomstypeid());
		List<String> listImage =new ArrayList<>();
		listImages.forEach(im->{
			listImage.add(im.getRoomtypeimagename());
		});
		if (listImage.size() > 0) {
			String bg1 = listImage.get(new Random().nextInt(listImage.size()));
			String bg2 = listImage.get(new Random().nextInt(listImage.size()));
			modelMap.put("bg1", bg1);
			modelMap.put("bg2", bg2);
		} else {
			modelMap.put("bg1", "bg-bread-defaul.jpg");
			modelMap.put("bg2", "room-defaul.jpg");
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		DateFormat dateFormat = DateFormat.getTimeInstance(DateFormat.DEFAULT);
		if (reservationroom.getCheckintime() != null) {
			modelMap.put("checkin", simpleDateFormat.format(reservationroom.getCheckintime()));
			modelMap.put("checkintime", dateFormat.format(reservationroom.getCheckintime()));
		}
		if (reservationroom.getCheckouttime() != null) {
			modelMap.put("checkouttime", dateFormat.format(reservationroom.getCheckouttime()));
			modelMap.put("checkout", simpleDateFormat.format(reservationroom.getCheckouttime()));
		}

		int maxcus = reservation.getRoomtype().getMaxcus();
		modelMap.put("maxcus", maxcus);
		long night = (reservation.getCheckout().getTime() - reservation.getCheckin().getTime()) / (24 * 3600 * 1000);
		modelMap.put("night", night);
		int todayToCheckInday;
		int todayToCheckOutday;
		int counttocheckin = (int) ((reservation.getCheckin().getTime() - new Date().getTime()) / (24 * 3600 * 1000));
		String today = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
		todayToCheckInday = new SimpleDateFormat("dd-MM-yyyy").format(reservation.getCheckin()).equalsIgnoreCase(today)
				? 0
				: -1;
		todayToCheckOutday = new SimpleDateFormat("dd-MM-yyyy").format(reservation.getCheckout())
				.equalsIgnoreCase(today) ? 0 : -1;

		if (todayToCheckInday == 0 && reservation.getReservationstt() == 2) {

			modelMap.put("checkintoday", "checkintoday");
		} else if (todayToCheckOutday == 0 && reservation.getReservationstt() == 3) {

			modelMap.put("checkouttoday", "checkouttoday");
		}
		int c = (int) (counttocheckin + night);

		if (c >= 0 && c <= night && reservationroom.getReservationroomtypestt() == 2) {
			System.out.println("c " + c);
			modelMap.put("showbuttoncheckin", c);
		}

		List<Reservationguestinfo> reservationguestinfos = reservationguestinfoService
				.getlistCusbyreservationroomdetailsid(reservationroom.getReservationroomdetailsid());
		int so = 0;
		if(reservationguestinfos.size() ==0) {
			modelMap.put("sokhach", 0);
		}
		if (reservationguestinfos.size() < reservationroom.getCusinroom()) {
			so = reservationroom.getCusinroom() - reservationguestinfos.size();
			
		}
		for (var i = 0; i < so; i++) {
			reservationguestinfos.add(new Reservationguestinfo());
		}
		modelMap.put("reservationguestinfos", reservationguestinfos);

		List<Addonservice> addonservice = addonserviceService.findAddonserviceByHotelid(hotelid);
		modelMap.put("addonservice", addonservice);

		List<Addonservice> extrabedservice = addonserviceService.findExtraBedByHotelid(hotelid);
		modelMap.put("extrabedservice", extrabedservice);

		List<Addonservice> latecheckoutservice = addonserviceService.findLateCheckOutByHotelid(hotelid);
		modelMap.put("latecheckoutservice", latecheckoutservice);

		List<Reservationaddonservice> reservationaddonservices = reservationaddonserviceService
				.AddonServiceByreservationid(reservationroom.getReservationroomdetailsid());
		modelMap.put("reservationaddonservices", reservationaddonservices);

		double totalamount = reservationaddonserviceService
				.totalAddonServiceByreservationidandRoomsID(reservationroom.getReservationroomdetailsid());
		if (totalamount > 0) {
			modelMap.put("totalamount", totalamount);
		}
		if(reservationroom.getLatecheckoutid() >0 ) {
			modelMap.put("roomlatecheckout", reservationroom.getLatecheckoutid());
		}else {
			modelMap.put("roomlatecheckout", -1);
		}

	}

}
