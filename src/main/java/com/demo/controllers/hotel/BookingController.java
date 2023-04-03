package com.demo.controllers.hotel;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Contractinfo;


import com.demo.models.Policies;
import com.demo.models.Reservation;
import com.demo.models.Reservationaddonservice;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Reservationroomdetails;

import com.demo.models.Roomtype;
import com.demo.models.Roomtypeimage;
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
@RequestMapping({ "hotel/booking" })

public class BookingController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private  ReservationguestinfoService rservationguestinfoService;

	@Autowired
	private RoomTypeService roomTypeService;

	

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

	

	@RequestMapping(value = { "bookingtoday" }, method = RequestMethod.GET)

	public String bookingtoday(HttpSession session, ModelMap modelMap,
			@RequestParam(value = "searchbookingtoday", required = false) String searchbookingtoday) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				int idhotel = account.getHotel().getHotelid();
				SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				List<Reservation> reservations = reservationService.findListReservationByDate(idhotel, new Date());
				List<XuanReservation> xuanreservations = convertToListXuanReservation(reservations);

				modelMap.put("reservations", xuanreservations);
				modelMap.put("logo", account.getHotel().getLogo());

				modelMap.put("accountname", account.getAccountname());
				modelMap.put("avatar", account.getAvatar());
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("role", role);
				return "hotel/booking/bookingtoday";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}

	@RequestMapping(value = { "createbooking" }, method = RequestMethod.GET)

	public String createbooking(HttpSession session, ModelMap modelMap) {
		try {
			if (session.getAttribute("id") != null) {
				int id = Integer.parseInt(session.getAttribute("id").toString());
				Account account = accountService.find(id);
				if (account != null) {
					int hotelid = account.getHotel().getHotelid();
					modelMap.put("hotelid", hotelid);
					modelMap.put("logo", account.getHotel().getLogo());
					modelMap.put("accountname", account.getAccountname());
					String role = account.getAccounttype().getAccounttypename().substring(5);
					modelMap.put("role", role);
					modelMap.put("avatar", account.getAvatar());

					// -----
					modelMap.put("checkin", new Date());
					SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
					Calendar c1 = Calendar.getInstance();
					c1.add(Calendar.DATE, 1);
					String s = dateFormat.format(c1.getTime());
					Date checkout = new SimpleDateFormat("dd-MM-yyyy").parse(s);
					modelMap.put("checkout", checkout);
					List<Contractinfo> contractinfos = contractinfoService.showlistcontract(hotelid);
					modelMap.put("contractinfos", contractinfos);
					List<Roomtype> roomtypes = roomTypeService.findListRoomtypeByHotelid(hotelid);
					modelMap.put("roomtypes", roomtypes);

					return "hotel/booking/createbooking";
				} else {
					return "redirect:/account/login";
				}
			} else {
				return "redirect:/account/login";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "hotel/error";
		}

	}

	@RequestMapping(value = { "service" }, method = RequestMethod.GET)

	public String service(HttpSession session, ModelMap modelMap,
			@RequestParam(value = "searchrooms", required = false) String searchrooms) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				List<Roomtype> roomtypes = roomTypeService.findListRoomtypeByHotelid(account.getHotel().getHotelid());
				List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService
						.findListByInDay(new Date());
				if (searchrooms != null) {
					reservationroomdetails = reservationroomdetails.stream()
							.filter(r -> r.getRooms().getRoomname().contains(searchrooms)).collect(Collectors.toList());
					if (reservationroomdetails.size() == 0) {
						reservationroomdetails = reservationroomdetailsService.findListByInDay(new Date());
						modelMap.put("msg", "No Infomation");
					}
				}
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("roomtypes", roomtypes);
				modelMap.put("reservationroomdetails", reservationroomdetails);
				modelMap.put("accountname", account.getAccountname());
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
				return "hotel/booking/service";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}

	@RequestMapping(value = { "managebooking" }, method = RequestMethod.GET)

	public String managebooking(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("accountname", account.getAccountname());
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());

				List<Reservation> reservations = reservationService
						.findReservationByRoomtype_Hotel_hotelid(account.getHotel().getHotelid());

				modelMap.put("reservations", reservations);

				return "hotel/booking/managebooking";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}
	
	@RequestMapping(value = { "exchangebooking" }, method = RequestMethod.GET)

	public String exchangebooking(HttpSession session, ModelMap modelMap, Reservation reservation, int hotelid,
			int policyId) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("accountname", account.getAccountname());
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
			int alo=0;
			if(reservation.getPaymentchannel1()!=null&& reservation.getPaymentchannel1().contains("from latecheckout request")) {
					modelMap.put("alo", "alo");
					alo=1;
				}
				if (reservation.getReservationstt() > 2 && alo==0) {
					return "hotel/error";
				} else {
					List<Roomtype> listroomType = roomTypeService.findListRoomtypeByHotelid(hotelid);
					modelMap.put("listroomType", listroomType);
					int roomtypeid = reservation.getRoomtype().getRoomstypeid();
					int totalroom = roomsService.counttotalroombyroomtypeinhotel(roomtypeid);
					int busyroom = reservationroomdetailsService.counttotalroombusy(roomtypeid,
							reservation.getCheckin(), reservation.getCheckout());
					int availableroom = totalroom - busyroom;
					modelMap.put("hotelid", hotelid);
					modelMap.put("totalroom", totalroom);
					modelMap.put("availableroom", availableroom);

					int night = (int) (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())
							/ (24 * 3600 * 1000);
					modelMap.put("night", night);
					Policies policies = policiesService.findById(policyId);
					double changefee = 0;
					double refundfee = 0;
					if (reservation.getReservationstt() == 2) {
						refundfee = policies.getRefund() / 100 * reservation.getPrice();
						changefee = policies.getReissue() / 100 * reservation.getPrice();
					} else if (reservation.getReservationstt() == 1) {
						refundfee = policies.getRefund() / 100 * reservation.getPayment1();
					}

					List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService
							.findListByReservationid(reservation.getReservationid());
					int countDouble =0;
					int countTwin =0;
					for(var i=0;i<reservationroomdetails.size();i++) {
						if(reservationroomdetails.get(i).getRooms().getRoomtypecontent().equalsIgnoreCase("Double")) {
							countDouble +=1;
						}else if(reservationroomdetails.get(i).getRooms().getRoomtypecontent().equalsIgnoreCase("Twin")) {
							countTwin +=1;
						}
					};

					int bed;
					if (countDouble > 0 && countTwin ==0) {
						bed = 0;
					} else if (countDouble == 0 && countTwin >0) {
						bed = 1;
					} else {
						bed = 2;
					}
					modelMap.put("bedType", bed);
					modelMap.put("policy", policies);
					modelMap.put("changefee", changefee);
					modelMap.put("refundfee", refundfee);
					modelMap.put("accountid", account.getAccountid());

					modelMap.put("roomtypeprice", reservation.getNetprice());

					modelMap.put("date", new Date());
					return "hotel/booking/exchangebooking";
				}

			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.GET)
	public String editbooking(HttpSession session, ModelMap modelMap, @RequestParam("bookingId") int bookingId,
			@RequestParam(value = "action") String action,
			@RequestParam(value = "policyId", required = false) int policyId) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				int hotelid = account.getHotel().getHotelid();
				Reservation reservation = reservationService.find(bookingId);
				modelMap.put("accountname", account.getAccountname());
				if (reservation != null) {
					showBooking(modelMap, reservation);
					switch (action) {
					case "edit": {
						List<Contractinfo> s = contractinfoService.showlistcontract(hotelid);
						List<Contractinfo> showlistcontract = new ArrayList<Contractinfo>();
						if (reservation.getContractinfo() != null) {
							s.forEach(c -> {
								if (c.getContractid() == reservation.getContractinfo().getContractid()) {
									showlistcontract.add(c);
								}
							});
							s.forEach(c -> {
								if (c.getContractid() != reservation.getContractinfo().getContractid()) {
									showlistcontract.add(c);
								}
							});
							modelMap.put("showlistcontract", showlistcontract);
						} else {
							modelMap.put("showlistcontract", s);
						}

						return "hotel/booking/editbooking";
					}
					case "exchangeorrefund": {
						return exchangebooking(session, modelMap, reservation, hotelid, policyId);
					}
					case "payment": {
						return "hotel/booking/paymentbooking";
					}
					default:
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

	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String editbooking(@RequestParam("bookingId") int bookingId,
			@RequestParam("customername") String customername, @RequestParam("customerphone") String customerphone,
			@RequestParam(value = "contractinfoid", required = false) String contractinfoid,
			@RequestParam(value = "bookingchannels", required = false) String bookingchannels) {

		Reservation reservation = reservationService.find(bookingId);
		reservation.setCustomername(customername);
		reservation.setCustomerphone(customerphone);
		if (contractinfoid != null) {
			int id = Integer.parseInt(contractinfoid);
			reservation.setContractinfo(contractinfoService.find(id));
		} else {
			reservation.setContractinfo(null);
		}
		if (bookingchannels != null) {
			reservation.setBookingchannels(bookingchannels);
		}

		reservationService.save(reservation);
		return "redirect:/hotel/booking/detailsbooking?bookingId=" + reservation.getReservationid();

	}

	@RequestMapping(value = { "detailsbooking" }, method = RequestMethod.GET)

	public String detailsbooking(HttpSession session, ModelMap modelMap, @RequestParam("bookingId") int bookingId) {

		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				Reservation reservation = reservationService.find(bookingId);
				modelMap.put("accountname", account.getAccountname());
				if (reservation != null) {
					showBooking(modelMap, reservation);
					List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService
							.findListByReservationid(bookingId);
					modelMap.put("reservationroomdetails", reservationroomdetails);

					return "hotel/booking/detailsbooking";

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

	public List<Reservationroomdetails> convertToList(Reservationroomdetails[] rsrls) {
		List<Reservationroomdetails> reservationroomdetails = new ArrayList<Reservationroomdetails>();
		for (var i = 0; i < rsrls.length; i++) {
			Reservationroomdetails rsrl = new Reservationroomdetails();
			rsrl.setReservationroomdetailsid(rsrls[i].getReservationroomdetailsid());
			rsrl.setRooms(rsrls[i].getRooms());
			rsrl.setReservation(rsrls[i].getReservation());
			rsrl.setReservationroomtypestt(rsrls[i].getReservationroomtypestt());
			rsrl.setReservationguestinfos(rsrls[i].getReservationguestinfos());
			rsrl.setReservationaddonservices(rsrls[i].getReservationaddonservices());
			reservationroomdetails.add(rsrl);
		}

		return reservationroomdetails;
	}

	public void showBooking(ModelMap modelMap, Reservation reservation) {
		modelMap.put("reservation", reservation);
		if(reservation.getPaymentchannel1()!=null&& reservation.getPaymentchannel1().contains("from latecheckout request")) {
			modelMap.put("alo", "alo");
		}
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
		modelMap.put("checkin", simpleDateFormat.format(reservation.getCheckin()));
		modelMap.put("checkout", simpleDateFormat.format(reservation.getCheckout()));
		int guestdefault = reservation.getRoomtype().getNumcusdefault();
		modelMap.put("guestdefault", guestdefault);
		int maxcus = reservation.getRoomtype().getMaxcus();
		modelMap.put("maxcus", maxcus);
		long night = (reservation.getCheckout().getTime() - reservation.getCheckin().getTime()) / (24 * 3600 * 1000);
		modelMap.put("night", night);
		double addonservice = reservationaddonserviceService
				.totalAddonServiceByreservationidAndpaymentstt(reservation.getReservationid(), 0);
		modelMap.put("addonservice", addonservice);
		
		List<Policies> policies = policiesService.findPoliciesByRoomtypeandApplyfor(
				reservation.getRoomtype().getRoomstypeid(), reservation.getBookingchannels(), new Date());
		modelMap.put("policies", policies);
		Policies policy = new Policies();

		int todayToCheckInday;
		int todayToCheckOutday;
		String today = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
		todayToCheckInday = new SimpleDateFormat("dd-MM-yyyy").format(reservation.getCheckin()).equalsIgnoreCase(today)
				? 0
				: -1;
		todayToCheckOutday = new SimpleDateFormat("dd-MM-yyyy").format(reservation.getCheckout())
				.equalsIgnoreCase(today) ? 0 : -1;
		int counttocheckin = (int) ((reservation.getCheckin().getTime() - new Date().getTime()) / (24 * 3600 * 1000));
		System.out.println("counttocheckin " + counttocheckin);
		for (Policies p : policies) {
			if (p.getMinbeforecheckindate() <= counttocheckin && counttocheckin < p.getMaxbeforcheckindate()) {
				policy = p;
			}

		}
		if (policy.getPoliciesid() == null) {
			for (Policies p : policies) {
				if (p.getMinbeforecheckindate() == 0) {
					policy = p;
				}

			}
		}
		modelMap.put("policy", policy);
		if (todayToCheckInday == 0 && reservation.getReservationstt() == 2) {

			modelMap.put("checkintoday", "checkintoday");
		} else if (todayToCheckOutday == 0 && reservation.getReservationstt() == 3) {

			modelMap.put("checkouttoday", "checkouttoday");
		}
		int c = (int) (counttocheckin + night);
		if (c >= 0 && c < night && reservation.getReservationstt() == 2) {

			modelMap.put("showbuttoncheckin", c);
		}
		Reservation oldReservation = reservation.getReservation();
		if (oldReservation != null && oldReservation.getReservationstt() == 6) {
			modelMap.put("oldprice", oldReservation.getNetprice());
			int oldnight = (int) ((oldReservation.getCheckout().getTime() - oldReservation.getCheckin().getTime())
					/ (24 * 3600 * 1000));
			modelMap.put("oldnight", oldnight);
			double oldPaid = oldReservation.getPrice();
			modelMap.put("oldPaid", oldPaid);
			double oldNetPrice = oldReservation.getNetprice();
			modelMap.put("oldNetPrice", oldNetPrice);
			int oldtotalroom = oldReservation.getTotalrooms();
			modelMap.put("oldtotalroom", oldtotalroom);
			double refundcharge = policy.getRefund() / 100 * oldReservation.getPrice();
			modelMap.put("refundcharge", refundcharge);
			double amount = (oldNetPrice * oldnight * oldtotalroom) - refundcharge;
			modelMap.put("amount", amount);
			modelMap.put("oldnote", oldReservation.getNote());
			modelMap.put("oldstt", oldReservation.getReservationstt());

		}
		if (oldReservation != null) {
			modelMap.put("relatedid", oldReservation.getReservationid());

		}

		if (reservation.getReservationstt() == 7) {
			double refundfee = (reservation.getNetprice() * reservation.getTotalrooms() * night)
					- reservation.getRefundamount();
			modelMap.put("refunddate", simpleDateFormat.format(reservation.getRefunddate()));
			modelMap.put("refundfee", refundfee);
		}

		Reservationroomdetails roomlatecheckout = reservationroomdetailsService
				.findlatecheckoutid(reservation.getReservationid());
		if (roomlatecheckout != null) {
			modelMap.put("roomlatecheckout", 1);
		} else {
			modelMap.put("roomlatecheckout", -1);
		}

	}

	public List<XuanReservation> convertToListXuanReservation(List<Reservation> reservations) {
		List<XuanReservation> xuanreservations = new ArrayList<XuanReservation>();
		reservations.forEach(rs -> {
			XuanReservation xuanreservation = new XuanReservation();
			xuanreservation.setReservationid(rs.getReservationid());
			xuanreservation.setAccount(rs.getAccount());
			xuanreservation.setContractinfo(rs.getContractinfo());
			xuanreservation.setRoomtype(rs.getRoomtype());
			xuanreservation.setReservationidcode(rs.getReservationidcode());
			xuanreservation.setCheckin(rs.getCheckin());
			xuanreservation.setCheckout(rs.getCheckout());
			xuanreservation.setTotalrooms(rs.getTotalrooms());
			xuanreservation.setCustomername(rs.getCustomername());
			xuanreservation.setCustomerphone(rs.getCustomerphone());
			xuanreservation.setPayment1(rs.getPayment1());
			xuanreservation.setPayment2(rs.getPayment2());
			xuanreservation.setPaymentdat1(rs.getPaymentdat1());
			xuanreservation.setPaymentdat2(rs.getPaymentdat2());
			xuanreservation.setReservationstt(rs.getReservationstt());
			xuanreservation.setPrice(rs.getPrice());
			xuanreservation.setCreateday(rs.getCreateday());
			xuanreservation.setPaymentchannel1(rs.getPaymentchannel1());
			xuanreservation.setBookingchannels(rs.getBookingchannels());
			xuanreservation
					.setCheckCheckinProcess(reservationroomdetailsService.countCheckinRoom(rs.getReservationid(), 3));
			xuanreservation
					.setCheckCheckoutProcess(reservationroomdetailsService.countCheckinRoom(rs.getReservationid(), 4));
			xuanreservations.add(xuanreservation);
		});

		return xuanreservations;
	}

	public XuanReservation convertToXuanReservation(Reservation reservations) {

		XuanReservation xuanreservation = new XuanReservation();
		xuanreservation.setReservationid(reservations.getReservationid());
		xuanreservation.setAccount(reservations.getAccount());
		xuanreservation.setContractinfo(reservations.getContractinfo());
		xuanreservation.setRoomtype(reservations.getRoomtype());
		xuanreservation.setReservationidcode(reservations.getReservationidcode());
		xuanreservation.setCheckin(reservations.getCheckin());
		xuanreservation.setCheckout(reservations.getCheckout());
		xuanreservation.setTotalrooms(reservations.getTotalrooms());
		xuanreservation.setCustomername(reservations.getCustomername());
		xuanreservation.setCustomerphone(reservations.getCustomerphone());
		xuanreservation.setPayment1(reservations.getPayment1());
		xuanreservation.setPayment2(reservations.getPayment2());
		xuanreservation.setPaymentdat1(reservations.getPaymentdat1());
		xuanreservation.setPaymentdat2(reservations.getPaymentdat2());
		xuanreservation.setReservationstt(reservations.getReservationstt());
		xuanreservation.setPrice(reservations.getPrice());
		xuanreservation.setCreateday(reservations.getCreateday());
		xuanreservation.setPaymentchannel1(reservations.getPaymentchannel1());
		xuanreservation.setBookingchannels(reservations.getBookingchannels());
		xuanreservation.setCheckCheckinProcess(
				reservationroomdetailsService.countCheckinRoom(reservations.getReservationid(), 3));
		xuanreservation.setCheckCheckoutProcess(
				reservationroomdetailsService.countCheckinRoom(reservations.getReservationid(), 4));

		return xuanreservation;
	}

	@RequestMapping(value = "addnote", method = RequestMethod.POST)
	public String editbooking(@RequestParam("reservationid") int reservationid,
			@RequestParam(value = "addnote", required = false) String addnote) {

		Reservation reservation = reservationService.find(reservationid);
		reservation.setNote(addnote);

		reservationService.save(reservation);
		return "redirect:/hotel/booking/detailsbooking?bookingId=" + reservation.getReservationid();

	}

	@RequestMapping(value = "refund", method = RequestMethod.POST)
	public String refund(@RequestParam("reservationid") int reservationid,
			@RequestParam(value = "addnote", required = false) String addnote,
			@RequestParam("refundcharge") double refundcharge) {
		System.out.println(refundcharge);
		Reservation reservation = reservationService.find(reservationid);
		if (reservation.getReservationstt() == 1) {
			reservation.setRefundamount(reservation.getPayment1() - refundcharge);
		} else {
			long newnight = (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())
					/ (24 * 3600 * 1000);
			double total = reservation.getNetprice() * reservation.getTotalrooms() * newnight;
			reservation.setRefundamount(total - refundcharge);
		}

		reservation.setReservationstt(7);
		reservation.setRefunddate(new Date());
		reservation.setNote(addnote);
		List<Reservationroomdetails> listReservationroomdetails = reservationroomdetailsService
				.findListByReservationid(reservationid);
		listReservationroomdetails.forEach(rsrdt -> {
			List<Reservationaddonservice> listReservationaddonservice = reservationaddonserviceService
					.AddonServiceByreservationid(rsrdt.getReservationroomdetailsid(), 0);
			listReservationaddonservice.forEach(addonroom -> {
				addonroom.setPaymentstt(7);
				reservationaddonserviceService.save(addonroom);
			});
			rsrdt.setReservationroomtypestt(7);
			reservationroomdetailsService.save(rsrdt);

		});
		reservationService.save(reservation);

		Reservation related = reservation.getReservation();
		if (related != null && related.getReservationstt() < 2) {
			related.setReservationstt(7);
			related.setRefundamount(0.0);
			related.setRefunddate(new Date());
			reservationService.save(related);
			List<Reservationroomdetails> listReservationroomdetailsrelated = reservationroomdetailsService
					.findListByReservationid(related.getReservationid());
			listReservationroomdetailsrelated.forEach(rsrdt -> {
				List<Reservationaddonservice> listReservationaddonservice = reservationaddonserviceService
						.AddonServiceByreservationid(rsrdt.getReservationroomdetailsid(), 0);
				listReservationaddonservice.forEach(addonroom -> {
					addonroom.setPaymentstt(7);
					reservationaddonserviceService.save(addonroom);
				});
				rsrdt.setReservationroomtypestt(7);
				reservationroomdetailsService.save(rsrdt);

			});
		}

		return "redirect:/hotel/booking/detailsbooking?bookingId=" + reservation.getReservationid();

	}

	@RequestMapping(value = "payment", method = RequestMethod.GET)
	public String payment(HttpSession session, ModelMap modelMap, @RequestParam("reservationid") int reservationid,
			@RequestParam("paymentchannel") String paymentchannel, @RequestParam("minamount") double minamount,
			@RequestParam("maxamount") double maxamount, @RequestParam("amount") double amount,
			@RequestParam(value = "paymentsnote", required = false) String paymentsnote,
			@RequestParam(value = "check", required = false) String check) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				if (check.equalsIgnoreCase("")) {

					Reservation reservation = reservationService.find(reservationid);
					if (amount == maxamount) {
						System.out.println("-------------------------------reservation.getPayment1() "
								+ reservation.getPayment1());
						if (reservation.getPayment1() > 0) {
							reservation.setPayment2(amount);
							reservation.setPaymentdat2(new Date());
							reservation.setPaymentchannel2(paymentchannel);
							reservation.setPaymentsnote2(paymentsnote);

						} else {
							if (reservation.getReservation() == null) {
								reservation.setPayment1(amount);
								reservation.setPaymentdat1(new Date());
								reservation.setPaymentchannel1(paymentchannel);
								reservation.setPaymentsnote1(paymentsnote);
							} else {
								reservation.setPayment2(reservation.getPrice());
								int night = (int) (reservation.getCheckout().getTime()
										- reservation.getCheckin().getTime()) / (24 * 3600 * 1000);
								reservation.setPrice(night * reservation.getNetprice() * reservation.getTotalrooms());
								reservation.setPayment1(reservation.getPrice() - reservation.getPayment2());
								reservation.setReservationstt(2);
								reservation.setPaymentchannel1("old booking");
								reservation.setPaymentchannel2(paymentchannel);
								reservation.setPaymentdat1(new Date());
								reservation.setPaymentdat2(new Date());
							}

						}
						reservation.setReservationstt(2);
					} else if (amount != maxamount) {
						reservation.setPayment1(amount);
						reservation.setPaymentdat1(new Date());
						reservation.setPaymentchannel1(paymentchannel);
						reservation.setPaymentsnote1(paymentsnote);
						reservation.setReservationstt(1);
					}

					reservationService.save(reservation);
					List<Reservationroomdetails> listReservationroomdetailsrelated = reservationroomdetailsService
							.findListByReservationid(reservationid);
					listReservationroomdetailsrelated.forEach(rsrdt -> {
						rsrdt.setReservationroomtypestt(reservation.getReservationstt());
						reservationroomdetailsService.save(rsrdt);
					});
				}
				return "redirect:/hotel/booking/detailsbooking?bookingId=" + reservationid;
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}

	}

	@RequestMapping(value = "confirm", method = RequestMethod.GET)
	public String confirm(@RequestParam("reservationid") int reservationid) {
		Reservation reservation = reservationService.find(reservationid);
		reservation.setPayment2(reservation.getPrice());
		int night = (int) (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())
				/ (24 * 3600 * 1000);
		reservation.setPrice(night * reservation.getNetprice() * reservation.getTotalrooms());
		reservation.setPayment1(reservation.getPrice() - reservation.getPayment2());
		reservation.setReservationstt(2);
		reservation.setPaymentdat1(new Date());
		reservation.setPaymentdat2(new Date());
		reservation.setPaymentchannel1("old booking");
		reservation.setPaymentchannel2("old booking");
		List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService
				.findListByReservationid(reservation.getReservationid());
		reservationroomdetails.forEach(r -> {
			r.setReservationroomtypestt(2);
		});
		reservationService.save(reservation);
		return "redirect:/hotel/booking/detailsbooking?bookingId=" + reservationid;

	}

	@RequestMapping(value = "invoice", method = RequestMethod.GET)
	public String invoice() {

		return "hotel/booking/invoice";

	}

	@RequestMapping(value = "updatedatabase", method = RequestMethod.GET)
	public String updatedatabase() {
		List<Reservation> reservation = reservationService.findReservationByReservationstt(2);
		reservation.forEach(r->{
			List<Reservationroomdetails> listroomwithstt=reservationroomdetailsService.listroomwithstt(r.getReservationid(), 2);
			listroomwithstt.forEach(x->{
				Reservationguestinfo n=new Reservationguestinfo();
				n.setReservationroomdetails(x);
				n.setGuestidcardnumber("3253253253");
				n.setGuestname("Lee Min-ho");
				n.setBirthday(new Date());
				rservationguestinfoService.save(n);
			});
		});
		return "hotel/booking/check";

	}

	public double list(int hotelid, int contractid, Date checkinDate, Date checkoutDate) {
		List<Double> minPrice = new ArrayList<Double>();
		List<Roomtype> listRoomtype = roomTypeService.findListRoomtypeByHotelid(hotelid);
		listRoomtype.forEach(r -> {
			double price = reservationService.addPrice(r.getRoomstypeid(), contractid, checkinDate, checkoutDate);
			minPrice.add(price);
		});
		var x = Collections.min(minPrice);
		System.out.println(x);
		return x;

	}

}
