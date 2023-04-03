package com.demo.controllers.customer;

import java.io.File;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.demo.models.Account;
import com.demo.models.Contractinfo;
import com.demo.models.Contractinforoomtype;
import com.demo.models.Hotel;
import com.demo.models.Hotelseason;
import com.demo.models.Policies;
import com.demo.models.Reservation;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;
import com.demo.models.Roomtypeimage;
import com.demo.paypal.PayPalConfig;
import com.demo.paypal.PayPalResult;
import com.demo.paypal.PayPalSucess;
import com.demo.service.AccountService;
import com.demo.service.ContractinfoService;
import com.demo.service.ContractinforoomtypeService;
import com.demo.service.HotelSeasonService;
import com.demo.service.HotelService;
import com.demo.service.MailService;
import com.demo.service.PoliciesService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationroomdetailsService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;


@Controller
@RequestMapping({"user"})

public class CustomerBookingController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private HotelService hotelService;
	
	
	@Autowired
	private ReservationService reservationService;
	
	
	@Autowired
	private RoomTypeService roomTypeService;
	
	@Autowired
	private RoomsService roomsService;
	
	@Autowired
	private ContractinfoService contractinfoService;
	
	@Autowired
	private ContractinforoomtypeService contractinforoomtypeService;
	
	@Autowired
	private PoliciesService policiesService;
	
	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private Environment environment;
	

	@RequestMapping(value = { "createbooking" }, method = RequestMethod.GET)
	public String index(HttpSession session, ModelMap modelMap, @RequestParam("hotelid") int hotelid, @RequestParam("checkin") String checkin,
			@RequestParam("checkout") String checkout, @RequestParam("totalrooms") int totalrooms, @RequestParam("contractid") int contractid,
			@RequestParam("roomstypeid") int roomstypeid, RedirectAttributes redirectAttributes) {
		Account account = new Account();
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("account", account);
				modelMap.put("role", role);
				modelMap.put("reservations", reservationService.findRevByGuestId(account.getAccountid()));		
				if(role.equalsIgnoreCase("CUSTOMER")) {	
					createbooking(modelMap, hotelid, account, checkin, checkout, totalrooms, contractid, roomstypeid, redirectAttributes);
					return "customer/booking";
				}else {
					return "redirect:/home/index";
				}
			}
		}else {
			return createbooking(modelMap, hotelid, account, checkin, checkout, totalrooms, contractid, roomstypeid, redirectAttributes);
		}
		return null;	
	}

	private String createbooking(ModelMap modelMap, int hotelid, Account account, String checkin, String checkout, int totalrooms,
			int contractid, int roomstypeid, RedirectAttributes redirectAttributes) {
		try {
			Hotel hotel = hotelService.find(hotelid);
			Roomtype roomtype = roomTypeService.find(roomstypeid);
			Contractinfo contract = contractinfoService.find(contractid);
			if(hotel == null || roomtype == null || contract == null) {
				System.out.println("Fail!"); 
				redirectAttributes.addFlashAttribute("msg", "Your booking not available. Please, booking again!"); 
				return "redirect:/account/error";
			}else {						
				Roomtype selectroom = roomTypeService.find(roomstypeid);
			    Contractinforoomtype roominfo = contractinforoomtypeService.findRoomPrice(contractid, roomstypeid);
			    Double roomprice = 0.0;			       
			    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			    Date checkindate = dateFormat.parse(checkin);
			    Date checkoutdate = dateFormat.parse(checkout);
			    int night = (int) (checkoutdate.getTime() - checkindate.getTime())/(1000*60*60*24);
			    roomprice = reservationService.addPrice(roomstypeid, contractid, checkindate, checkoutdate);
			    Double payable = roomprice*totalrooms*night;
				Reservation newReservation = new Reservation();			
				newReservation.setContractinfo(contractinfoService.find(contractid));
				newReservation.setAccount(account);
				System.out.println("acc: " + account);
				newReservation.setRoomtype(selectroom);
				newReservation.setCheckin(dateFormat.parse(checkin));
				newReservation.setCheckout(dateFormat.parse(checkout));
				newReservation.setTotalrooms(totalrooms);
				if(account != null) {
					newReservation.setCustomername(account.getAccountname());
					newReservation.setCustomerphone(account.getPhone());			
					newReservation.setCustomeremail(account.getEmail());  					
				}else {
					newReservation.setCustomername("");
					newReservation.setCustomerphone("");			
					newReservation.setCustomeremail("");  
				}
				newReservation.setReservationstt(0);	// BEFORE HOLD
				newReservation.setNetprice(roomprice); //giá đơn vị phòng
				newReservation.setPrice(payable);
				newReservation.setServicefee(3.0);
				newReservation.setCreateday(new Date());
				newReservation.setPaymentsnote1(null); //get room content
				//set deadline for payment = now + 1 hour				
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.HOUR_OF_DAY, 1);
				newReservation.setDeadline(cal.getTime());
				newReservation.setNote(null);
				newReservation.setBookingchannels("ONLINECHANNEL");					
				newReservation.setCheckin(checkindate);	
				newReservation.setCheckout(checkoutdate);
				List<Rooms> listroomavailable = roomsService.availableRoom(dateFormat.parse(checkin), dateFormat.parse(checkout), roomstypeid);										
		        modelMap.put("reservation", newReservation);
				modelMap.put("checkin", checkin);
				modelMap.put("checkout", checkout);		
				Map<String,List<Rooms>> RoomByBed = new HashMap<>();  
				RoomByBed =  listroomavailable.stream().collect(Collectors.groupingBy(r -> r.getRoomtypecontent())); 			 
				List<String> type = new ArrayList<String>();			 
				RoomByBed.entrySet().stream().forEach(r ->{				
					 type.add(r.getKey());
				 });
				modelMap.put("typebed", type);		
				modelMap.put("roominfo", roominfo);	
				modelMap.put("listpolicies", policiesService.findPoliciesByRoomtypeandApplyfor(roomstypeid, "ONLINECHANNEL", dateFormat.parse(checkin)));
				modelMap.put("night", night);			
				return "customer/booking";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	 @RequestMapping(value = "createbooking", method = RequestMethod.POST) 
	 public String createbooking(HttpSession session, ModelMap modelMap, @ModelAttribute("reservation") Reservation reservation, RedirectAttributes redirectAttributes) {		
		 try {	
			 Account account = new Account();
				if (session.getAttribute("id") != null) {
					int id = Integer.parseInt(session.getAttribute("id").toString());
					account = accountService.find(id);
					if (account != null) {
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("account", account);
						modelMap.put("role", role);
						modelMap.put("reservations", reservationService.findRevByGuestId(account.getAccountid()));						
					}
				}
			 //check & insert list room
			 List<Rooms> listroomavailable = roomsService.availableRoom(reservation.getCheckin(), reservation.getCheckout(), reservation.getRoomtype().getRoomstypeid());					 
			 //check list available vs total rooms
			 if(listroomavailable.size() >= reservation.getTotalrooms()) {				 
				 //list room reservation				
				 List<Rooms> getroom = new ArrayList<Rooms>();	
				 Map<String,List<Rooms>> RoomByBed = new HashMap<>();  				
				 if(!reservation.getPaymentsnote1().equalsIgnoreCase("") || !reservation.getPaymentsnote1().isEmpty()) {
					//group list room by bed
					 RoomByBed =  listroomavailable.stream().collect(Collectors.groupingBy(r -> r.getRoomtypecontent())); 			 					 
					 RoomByBed.entrySet().stream().forEach(r ->{							 
						 //get list room with selected room content					 
					     if(r.getKey().equalsIgnoreCase(reservation.getPaymentsnote1())) {
					    	 System.out.println("room content: " + r.getKey());
					    	 System.out.println("total rooms: " + r.getValue().size());
					    	 System.out.println("reservation rooms: " + reservation.getTotalrooms());
					    	 if(r.getValue().size() >= reservation.getTotalrooms()) {
					    		 Random rand = new Random();				
							        for (int i = 0; i < reservation.getTotalrooms(); i++) {		 
							            int randomIndex = rand.nextInt(r.getValue().size());		 
							            getroom.add(r.getValue().get(randomIndex));
							            r.getValue().remove(randomIndex);						            
							      }
							     getroom.forEach(ro ->{
							        System.out.println("list avail 1: " + ro.getRoomname());
							     });   
					    	 }else if(r.getValue().size() < reservation.getTotalrooms()) {
					    		 Map<String,List<Rooms>> RoomByBed1 = new HashMap<>();
					    		 RoomByBed1 =  listroomavailable.stream().collect(Collectors.groupingBy(ro -> ro.getRoomtypecontent()));
								 int left = reservation.getTotalrooms() - r.getValue().size();
					    		 getroom.addAll(r.getValue());
					    		 RoomByBed1.entrySet().stream().forEach(roo ->{
					    			 if(!roo.getKey().equalsIgnoreCase(reservation.getPaymentsnote1())) {
					    				 Random rand = new Random();				
									        for (int i = 0; i < left; i++) {		 
									            int randomIndex = rand.nextInt(roo.getValue().size());		 
									            getroom.add(roo.getValue().get(randomIndex));
									            roo.getValue().remove(randomIndex);						            
									      }
					    			 }
					    		 });				    		 
					    		 getroom.forEach(ro ->{
								        System.out.println("list avail 2: " + ro.getRoomname());
								 }); 
						     }				    	
					     }
					});
					
				 }
				 //not select bed type
				 else {					 
						 Random rand = new Random();				
					        for (int i = 0; i < reservation.getTotalrooms(); i++) {						        
					            int randomIndex = rand.nextInt(listroomavailable.size());		 
					            getroom.add(listroomavailable.get(randomIndex));
					            listroomavailable.remove(randomIndex);						            
					      }
					        getroom.forEach(ro ->{
						        System.out.println("list avail 3: " + ro.getRoomname());
						 });
					 }
				 reservationService.save(reservation);				 
				 //add list room	 
				 getroom.forEach(r ->{
					 Reservationroomdetails reservationRoom = new Reservationroomdetails();
					 reservationRoom.setReservation(reservation);
					 reservationRoom.setRooms(r);
					 reservationRoom.setCusinroom(r.getRoomtype().getNumcusdefault());
					 reservationRoom.setReservationroomtypestt(0);	
					 reservationroomdetailsService.save(reservationRoom);
				 });								
				 return "redirect:/user/reviewbooking?reservationid=" + reservation.getReservationid();  	 
			 }else if (listroomavailable.size() < reservation.getTotalrooms()) {
				System.out.println("Fail!"); 
				redirectAttributes.addFlashAttribute("msg", "Your number room booking not available. Please, edit your booking!"); 
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
				String in = simpleDateFormat.format(reservation.getCheckin());
				String out = simpleDateFormat.format(reservation.getCheckout());
				return "redirect:/user/createbooking?hotelid=" + reservation.getRoomtype().getHotel().getHotelid() + "&contractid=" + reservation.getContractinfo().getContractid() 
						+ "&checkin=" + in + "&checkout=" + out + "&roomstypeid=" + reservation.getRoomtype().getRoomstypeid() + "&totalrooms=" + 1;
			 }
			 return "redirect:/user/reviewbooking?reservationid=" + reservation.getReservationid(); 
			
		 }catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		 
    }
	
	 @RequestMapping(value = { "reviewbooking" }, method = RequestMethod.GET)
	 public String reviewbooking(HttpSession session, ModelMap modelMap, HttpSession httpSession, @RequestParam("reservationid") int reservationid, RedirectAttributes redirectAttributes) {
		 try {
			 Account account = new Account();
				if (session.getAttribute("id") != null) {
					int id = Integer.parseInt(session.getAttribute("id").toString());
					account = accountService.find(id);
					if (account != null) {
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("account", account);
						modelMap.put("role", role);					
					}
				}
				Reservation reservation = reservationService.find(reservationid);
				List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService.findListByReservationid(reservationid);
				List<Policies> listpolicies = policiesService.findPoliciesByRoomtypeandApplyfor(reservation.getRoomtype().getRoomstypeid(), "ONLINECHANNEL", reservation.getCheckin());
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
				String in = simpleDateFormat.format(reservation.getCheckin());
				String out = simpleDateFormat.format(reservation.getCheckout());
				 var currentdate = new Date();
				 var deadline = reservation.getDeadline();
				 if(reservation != null) {
					 System.out.println("stt: " + reservation.getReservationstt());
					 switch (reservation.getReservationstt()) {

					 //HOLD BOOKING -> confirm payment or cancel
						case 0: {
							 if(currentdate.getTime() < deadline.getTime() && reservation.getPayment2() == null) {
								
									 System.out.println("case 1.1");
									 String authtoken = environment.getProperty("paypal.authtoken");	
									 modelMap.put("reservation", reservation);
									 modelMap.put("in", in);
									 modelMap.put("out", out);
									 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
									 modelMap.put("listpolicies", policiesService.findPoliciesByRoomtypeandApplyfor(reservation.getRoomtype().getRoomstypeid(), "ONLINECHANNEL", reservation.getCheckin()));
									 modelMap.put("reservationroom", reservationroomdetails);
									 modelMap.put("posturl", environment.getProperty("paypal.posturl"));
									 modelMap.put("returnurl", environment.getProperty("paypal.returnurl"));
									 modelMap.put("business", environment.getProperty("paypal.business"));						
									 session.setAttribute("reservationID", reservationid);
								 break;
							 }else if(currentdate.getTime() > deadline.getTime() && reservation.getPayment2() == null){
								 System.out.println("case 1.2: expire"); 
								 reservation.setReservationstt(8);
								 reservationService.save(reservation);	
								 reservationroomdetails.forEach(r ->{
									 r.setReservationroomtypestt(8);
									 reservationroomdetailsService.save(r);	

								 });
								 modelMap.put("reservation", reservation);
								 modelMap.put("in", in);
								 modelMap.put("out", out);
								 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
								 modelMap.put("listpolicies", listpolicies);
								 modelMap.put("msg", "This booking has already expired!");
								 break;
							 }else if(reservation.getPayment2() != null){								 
								 System.out.println("case 1.3: payment change date"); 
								 modelMap.put("posturl", environment.getProperty("paypal.posturl"));
								 modelMap.put("returnurl", environment.getProperty("paypal.returnurl"));
								 modelMap.put("business", environment.getProperty("paypal.business"));						
								 session.setAttribute("reservationID", reservationid);								 
								 modelMap.put("reservation", reservation);
								 if(!reservation.getReplyfromhotel().isEmpty() || reservation.getReplyfromhotel() != "") {	
									 session.setAttribute("oldreservationID", Integer.parseInt(reservation.getReplyfromhotel()));
									 modelMap.put("oldreservation", reservationService.find(Integer.parseInt(reservation.getReplyfromhotel())));
								 }									 
								 modelMap.put("reservationroom", reservationroomdetails);
								 modelMap.put("in", in);
								 modelMap.put("out", out);
								 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
								 modelMap.put("listpolicies", listpolicies);								
								 break;
							 }
							 
						}
						//already payment 
						case 2: {
							System.out.println("already payment");
							if(listpolicies != null) {
								 listpolicies.forEach(p ->{
										int reissue = 0;
										if(p.getReissue() < 100) {
											int countdate = (int) ((reservation.getCheckin().getTime() - new Date().getTime())/(1000*60*60*24));								 
											 if(p.getMinbeforecheckindate() <= countdate && countdate <= p.getMaxbeforcheckindate()) {
												 reissue = p.getReissue();
												 modelMap.put("reissue", reissue);
												 modelMap.put("chargefee", (reservation.getPrice()*reissue/100));
												 System.out.println("issue: " + reissue);
											 }								
										}								 										 
									 });
									 listpolicies.forEach(p ->{
										 int refund = 0;
										 int countdate = (int) ((reservation.getCheckin().getTime() - new Date().getTime())/(1000*60*60*24));
										 if(p.getMinbeforecheckindate() <= countdate && countdate <= p.getMaxbeforcheckindate()) {								
											 refund = p.getRefund();
											 modelMap.put("refund", refund);
											 modelMap.put("refundamount", ((reservation.getPrice()*refund)/100) + reservation.getServicefee());								
											 System.out.println("refund: " + refund);
											 System.out.println("refundamount: " + ((reservation.getPrice()*refund)/100));
										 }
									 });
							}							 
							 modelMap.put("reservation", reservation);							
							 modelMap.put("reservationroom", reservationroomdetails);
							 modelMap.put("in", in);
							 modelMap.put("out", out);
							 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
							 modelMap.put("listpolicies", listpolicies);
							 modelMap.put("msg1", "This booking has been payment.");
							 break;
						}//already check in
						case 3:{
							 System.out.println("checkin");															 
							 modelMap.put("reservation", reservation);
							 modelMap.put("reservationroom", reservationroomdetails);
							 modelMap.put("in", in);
							 modelMap.put("out", out);
							 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
							 modelMap.put("refundamount", reservation.getRefundamount());
							 modelMap.put("listpolicies", listpolicies);
							 modelMap.put("msg1", "This booking has already check in!");
							 break;
						}//already check out
						case 4:{
							 System.out.println("checkout");															 
							 modelMap.put("reservation", reservation);
							 modelMap.put("reservationroom", reservationroomdetails);
							 modelMap.put("in", in);
							 modelMap.put("out", out);
							 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
							 modelMap.put("refundamount", reservation.getRefundamount());
							 modelMap.put("listpolicies", listpolicies);
							 SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
							 System.out.println("today:" + dateFormat.format(new Date()));
							 System.out.println("checkout:" + dateFormat.format(reservation.getCheckout()));							
							 long diffTime = Math.abs(new Date().getTime() - reservation.getCheckout().getTime());
							 int countday = (int) Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 							
							 modelMap.put("countday", countday);
							 modelMap.put("msg1", "This booking has already check out!");
							 break;
						}//already expire => already payment but not coming
						case 5:{
							 System.out.println("not coming");															 
							 modelMap.put("reservation", reservation);
							 modelMap.put("reservationroom", reservationroomdetails);
							 modelMap.put("in", in);
							 modelMap.put("out", out);
							 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
							 modelMap.put("refundamount", reservation.getRefundamount());
							 modelMap.put("listpolicies", listpolicies);
							 modelMap.put("msg", "This booking has already expired!");
							 break;
						}
						//already change date
						case 6:{
							 System.out.println("change date");															 
							 modelMap.put("reservation", reservation);
							 modelMap.put("reservationroom", reservationroomdetails);
							 modelMap.put("in", in);
							 modelMap.put("out", out);
							 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
							 modelMap.put("refundamount", reservation.getRefundamount());
							 modelMap.put("listpolicies", listpolicies);
							 modelMap.put("msg1", "This booking has already change date!");
							 break;
						}
						//already refund
						case 7:{
							 System.out.println("refund");															 
							 modelMap.put("reservation", reservation);
							 modelMap.put("reservationroom", reservationroomdetails);
							 modelMap.put("in", in);
							 modelMap.put("out", out);
							 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
							 modelMap.put("refundamount", reservation.getRefundamount());
							 modelMap.put("listpolicies", listpolicies);
							 modelMap.put("msg1", "This booking has already refund!");
							 break;
						}
						case 8: {
							if(reservation.getReservationidcode() != null && reservation.getPayment2() == null) {
								System.out.println("expire");
								 modelMap.put("reservation", reservation);
								 modelMap.put("in", in);
								 modelMap.put("out", out);
								 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
								 modelMap.put("listpolicies", listpolicies);
								 modelMap.put("msg", "This booking has already expired!");
								 break;
							}else if(reservation.getReservationidcode() != null && reservation.getPayment2() != null) {
								System.out.println("cancel");
								 modelMap.put("reservation", reservation);
								 modelMap.put("in", in);
								 modelMap.put("out", out);
								 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
								 modelMap.put("listpolicies", listpolicies);
								 modelMap.put("msg", "This booking has been cancel!");
								 break;
							}
							else if(reservation.getReservationidcode() == null) {
								System.out.println("cancel");
								 modelMap.put("reservation", reservation);
								 modelMap.put("in", in);
								 modelMap.put("out", out);
								 modelMap.put("night", (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24));
								 modelMap.put("listpolicies", listpolicies);
								 modelMap.put("msg", "This booking has been cancel!");
								 break;
							}
						}
						default:{
							throw new IllegalArgumentException("Unexpected value: " + reservation.getReservationstt());
						}
					 }				
				 }
			 
		 }catch (Exception e) {
			e.printStackTrace();
			return "redirect:/account/error";
		}		
		 return "customer/checkout";
	 } 
	 
	 @RequestMapping(value = { "reviewbooking/payment" }, method = RequestMethod.GET)
	 public String reviewbookingpay(HttpSession session, ModelMap modelMap, @RequestParam("reservationid") int reservationid, @RequestParam("reservationcode") String reservationcode, RedirectAttributes redirectAttributes) {
		 try {
			 Account account = new Account();
				if (session.getAttribute("id") != null) {
					int id = Integer.parseInt(session.getAttribute("id").toString());
					account = accountService.find(id);
					if (account != null) {
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("account", account);
						modelMap.put("role", role);
						modelMap.put("reservations", reservationService.findRevByGuestId(account.getAccountid()));						
					}
				}
			 Reservation reservation = reservationService.find(reservationid);
			 if(reservation != null) {
				 var currentdate = new Date();
				 var deadline = reservation.getDeadline();
				 if(currentdate.getTime() > deadline.getTime() && reservation.getReservationstt() == 0) {
					 reservation.setReservationstt(8);
					 reservationService.save(reservation);
					 List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService.findListByReservationid(reservationid);
					 reservationroomdetails.forEach(r ->{
						 r.setReservationroomtypestt(8);
						 reservationroomdetailsService.save(r);				 
					 });
					 System.out.println("out of time");
					 modelMap.put("msg", "oops ! your booking is out of time for payment");
					 modelMap.put("content", "Please, Booking Again And Payment In Time!");
					 return "customer/failbooking";
				 }else if(reservation.getReservationstt() > 0 && reservation.getReservationstt() < 8) {
					 modelMap.put("reservation", reservation);					
					 return "customer/bookingsuccess";						 
				 } else {
					 System.out.println("in time");
					 if(reservation.getReservationidcode().equalsIgnoreCase(reservationcode) && reservation.getReservationstt() == 0) { 
						 return "redirect:/user/reviewbooking?reservationid=" + reservationid;
					 }else {
						 modelMap.put("msg", "Oops ! We Are Unable To Process Your Payment");
						 modelMap.put("content", "Looks Like We Encountered An Error. Please Try Again. If You Continue To Have Issue, Try Another Payment Method.");
						 return "customer/failbooking";
					 }
				 } 
			 }else {
				 modelMap.put("msg", "Oops ! We Are Unable To Process Your Payment");
				 modelMap.put("content", "Looks Like We Encountered An Error. Please Try Again. If You Continue To Have Issue, Try Another Payment Method.");
				 return "customer/failbooking";
			 }
			 
		 }catch (Exception e) {
			e.printStackTrace();
			 modelMap.put("msg", "Oops ! We Are Unable To Process Your Payment");
			 modelMap.put("content", "Looks Like We Encountered An Error. Please Try Again. If You Continue To Have Issue, Try Another Payment Method.");
			 return "customer/failbooking";
		}		
		 
	 } 
	 
	 
	 @RequestMapping(value = "booking/success", method = RequestMethod.GET)
		public String paymentsuccess(HttpServletRequest request, HttpSession session, ModelMap modelMap) {
		 try {
			 Account account = new Account();
				if (session.getAttribute("id") != null) {
					int id = Integer.parseInt(session.getAttribute("id").toString());
					account = accountService.find(id);
					if (account != null) {
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("account", account);
						modelMap.put("role", role);
						modelMap.put("reservations", reservationService.findRevByGuestId(account.getAccountid()));						
					}
				} 
			PayPalConfig payPalConfig = new PayPalConfig();
			payPalConfig.setAuthToken(environment.getProperty("paypal.authtoken"));
			payPalConfig.setBusiness(environment.getProperty("paypal.business"));
			payPalConfig.setPosturl(environment.getProperty("paypal.posturl"));
			payPalConfig.setReturnurl(environment.getProperty("paypal.returnurl"));
			PayPalResult result = PayPalSucess.getPayPal(request, payPalConfig);
			System.out.println("first name: " + result.getFirst_name());
			System.out.println("last name: " + result.getLast_name());
			System.out.println("street: " + result.getAddress_street());
			System.out.println("city: " + result.getAddress_city());
			System.out.println("fee: " + result.getPayment_fee());
			Reservation reservation = new Reservation();
			int reservationid = Integer.parseInt(session.getAttribute("reservationID").toString());
			int oldReservationid = 0;
			String oldRevId = "";
			reservation = reservationService.find(reservationid);									
			//payment success
			if(result.getPayment_fee() != null) {				
				if(reservation.getReservationidcode() == null) {
						int leftLimit = 48; // numeral '0'
						  int rightLimit = 122; // letter 'z'
						  int targetStringLength = 7;
						   Random random = new Random();
						   String reservationidcode = random.ints(leftLimit, rightLimit + 1)
						      .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
						      .limit(targetStringLength)
						      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
						      .toString();			 
						reservation.setReservationidcode(reservationidcode);
						reservation.setReservationstt(2);						
						//change date (update old booking)
						if(session.getAttribute("oldreservationID") != null) {							
							oldRevId = session.getAttribute("oldreservationID").toString();
							oldReservationid = Integer.parseInt(oldRevId);		
							session.removeAttribute("oldreservationID");
							System.out.println("session 1: " + oldRevId);							
							Reservation oldreservation = reservationService.find(oldReservationid);
							oldreservation.setReservationstt(6);	
							reservationService.save(oldreservation);
							List<Reservationroomdetails> oldreservationroomdetails = reservationroomdetailsService.findListByReservationid(oldReservationid);
							oldreservationroomdetails.forEach(r ->{
								 r.setReservationroomtypestt(6);
								 reservationroomdetailsService.save(r);				 
							 });
							reservation.setPayment1(0.0);
							reservation.setReplyfromhotel(null);
							reservation.setChargefee(reservation.getChargefee());
							reservation.setDeadline(new Date());
							reservationService.save(reservation);
							List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService.findListByReservationid(reservationid);
							reservationroomdetails.forEach(r ->{
								 r.setReservationroomtypestt(2);
								 reservationroomdetailsService.save(r);				 
							 });
						}else {
							reservation.setPayment1(reservation.getPrice() + reservation.getServicefee());
							reservation.setPaymentdat1(new Date());
							reservation.setChargefee(reservation.getChargefee());
							reservation.setDeadline(new Date());
							reservationService.save(reservation);
							List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService.findListByReservationid(reservationid);
							reservationroomdetails.forEach(r ->{
								 r.setReservationroomtypestt(2);
								 reservationroomdetailsService.save(r);				 
							 });
						}						
						System.out.println("session 1 after: " + oldRevId);
				}else {
					reservation.setReservationstt(2);
					if(session.getAttribute("oldreservationID") != null) {
						//oldRevId = session.getAttribute("oldreservationID").toString();
						//session.removeAttribute(oldRevId);						
						oldRevId = session.getAttribute("oldreservationID").toString();
						oldReservationid = Integer.parseInt(oldRevId);	
						session.removeAttribute("oldreservationID");
						System.out.println("session 2: " + oldReservationid);
						Reservation oldreservation = reservationService.find(oldReservationid);
						oldreservation.setReservationstt(6);	
						reservationService.save(oldreservation);
						List<Reservationroomdetails> oldreservationroomdetails = reservationroomdetailsService.findListByReservationid(oldReservationid);
						oldreservationroomdetails.forEach(r ->{
							 r.setReservationroomtypestt(6);
							 reservationroomdetailsService.save(r);				 
						 });
						reservation.setPayment1(0.0);
						reservation.setReplyfromhotel(null);						
					}else {
						reservation.setPayment1(reservation.getPrice() + reservation.getServicefee());
						reservation.setPaymentdat1(new Date());
					}
					reservation.setDeadline(new Date());
					reservationService.save(reservation);
					List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService.findListByReservationid(reservationid);
					reservationroomdetails.forEach(r ->{
						 r.setReservationroomtypestt(2);
						 reservationroomdetailsService.save(r);				 
					 });
					System.out.println("session 2 after: " + oldReservationid);
				}
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
				String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request).replacePath(null).build()
						.toUriString();
				File file = ResourceUtils.getFile("classpath:email_content_paymentsuccess.txt");		
				String content = new String(Files.readAllBytes(file.toPath()));
				content = content.replace("$reservationCode", reservation.getReservationidcode());
				content = content.replace("$hotelname", reservation.getRoomtype().getHotel().getHotelname());
				content = content.replace("$bookingStt", "Confirm");
				content = content.replace("$checkin", String.valueOf(simpleDateFormat.format(reservation.getCheckin())));
				content = content.replace("$checkout", String.valueOf(simpleDateFormat.format(reservation.getCheckout())));
				content = content.replace("$deadline", String.valueOf(simpleDateFormat.format(reservation.getDeadline())));
				content = content.replace("$night", String.valueOf((reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24)));
				content = content.replace("$numCus", String.valueOf(reservation.getRoomtype().getNumcusdefault()));
				content = content.replace("$totalRooms", String.valueOf(reservation.getTotalrooms()));
				content = content.replace("$roomType", reservation.getRoomtype().getRoomstypename());
				content = content.replace("$reservationDetail", baseUrl + "/user/reviewbooking/payment?reservationid=" + reservation.getReservationid() + "&reservationcode=" + reservation.getReservationidcode());
				content = content.replace("$cusName", reservation.getCustomername());
				content = content.replace("$cusPhone", reservation.getCustomerphone());
				content = content.replace("$cusEmail", reservation.getCustomeremail());
							
				String from = environment.getProperty("spring.mail.username");
				mailService.Send(from, reservation.getCustomeremail(), "Confirm booking successfully #" + reservation.getReservationidcode(), content);
				modelMap.put("content", "Booking successful!");
				modelMap.put("sub", "Thank you for choosing Traveloto! Your Reservation ID Is: " + "#" + reservation.getReservationidcode() + ", A confirmation Email has been sent to you.");				
				modelMap.put("reservationid", reservationid);
				modelMap.put("reservationcode", reservation.getReservationidcode());						
					modelMap.put("reservation", reservation);					
					return "customer/bookingsuccess";				
			}
			//payment fail
			else {
				 modelMap.put("msg", "Oops ! We Are Unable To Process Your Payment");
				 modelMap.put("content", "Looks Like We Encountered An Error. Please Try Again. If You Continue To Have Issue, Try Another Payment Method.");
				 modelMap.put("reservation", reservation);				
				 return "customer/failbooking";
			}	
		}catch (Exception e) {
				e.printStackTrace();
				return "redirect:/account/error";
		}			
	}

	
	 
	 @RequestMapping(value = { "cancelbooking" }, method = RequestMethod.GET)
	 public String cancelbooking(HttpSession session, ModelMap modelMap , @RequestParam("reservationid") int reservationid) {
		 try {
			 Account account = new Account();
				if (session.getAttribute("id") != null) {
					int id = Integer.parseInt(session.getAttribute("id").toString());
					account = accountService.find(id);
					if (account != null) {
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("account", account);
						modelMap.put("role", role);
						modelMap.put("reservations", reservationService.findRevByGuestId(account.getAccountid()));						
					}
				}
			 Reservation reservation = reservationService.find(reservationid);
			 reservation.setReservationstt(8);
			 reservationService.save(reservation);
			 List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService.findListByReservationid(reservationid);
			 reservationroomdetails.forEach(r ->{
				 r.setReservationroomtypestt(8);
				 reservationroomdetailsService.save(r);				 
			 });	
			 return "redirect:/home";
		 }catch (Exception e) {
			e.printStackTrace();
			return "redirect:/account/error";
		}	 
	 } 
	 
	 //refund
	 @RequestMapping(value = { "confirmRefund" }, method = RequestMethod.GET)
	 public String confirmRefund(HttpSession session, ModelMap modelMap , @RequestParam("reservationid") int reservationid, @RequestParam("refund") Double refund) {
		 try {
			 Account account = new Account();
				if (session.getAttribute("id") != null) {
					int id = Integer.parseInt(session.getAttribute("id").toString());
					account = accountService.find(id);
					if (account != null) {
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("account", account);
						modelMap.put("role", role);											
					}
				}
			 Reservation reservation = reservationService.find(reservationid);
			 reservation.setReservationstt(7);		 
			 reservation.setRefundamount(((reservation.getPrice()*refund)/100)+reservation.getServicefee());
			 reservation.setRefunddate(new Date());
			 reservationService.save(reservation);
			 List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService.findListByReservationid(reservationid);
			 reservationroomdetails.forEach(r ->{
				 r.setReservationroomtypestt(7);
				 reservationroomdetailsService.save(r);				 
			 });	
			 return "redirect:/user/reviewbooking?reservationid=" + reservationid;
		 }catch (Exception e) {
			e.printStackTrace();
			return "redirect:/account/error";
		}	 
	 } 
	 
	 
	 //CHANGE DATE
	 @RequestMapping(value = { "changdatebooking" }, method = RequestMethod.GET)
	 public String changebookingdate(HttpSession session, ModelMap modelMap, RedirectAttributes redirectAttributes, @RequestParam("reservationid") int reservationid, 
			 @RequestParam("checkin") String checkin,  @RequestParam("checkout") String checkout, @RequestParam("priceDif") Double priceDif, 
			 @RequestParam("roompricenew") Double roompricenew, @RequestParam("chargefee") Double chargefee) {
		 try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			 Reservation newReservation = new Reservation();
			 Reservation reservation = reservationService.find(reservationid);
			 Account account = new Account();
				if (session.getAttribute("id") != null) {
					int id = Integer.parseInt(session.getAttribute("id").toString());
					account = accountService.find(id);
					if (account != null) {
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("account", account);
						modelMap.put("role", role);	
						newReservation.setAccount(account);
					}
				}
			 long night = (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24);
			 newReservation.setContractinfo(contractinfoService.find(reservation.getContractinfo().getContractid()));
			 newReservation.setCheckin(dateFormat.parse(checkin));
			 newReservation.setCheckout(dateFormat.parse(checkout));
			 newReservation.setRoomtype(reservation.getRoomtype());
			 newReservation.setCustomername(reservation.getCustomername());
			 newReservation.setCustomerphone(reservation.getCustomerphone());
			 newReservation.setCustomeremail(reservation.getCustomeremail());
			 newReservation.setPayment1(reservation.getPayment1());			 
			 newReservation.setTotalrooms(reservation.getTotalrooms());
			 
			 //total charge = chargefee(reissue fee) + service fee
			 newReservation.setChargefee(chargefee);			 
			 newReservation.setNetprice(roompricenew);		
			 Double newPrice = roompricenew*night*reservation.getTotalrooms() + chargefee;
			 newReservation.setPrice(newPrice);
			 newReservation.setServicefee(3.0);
			 newReservation.setPayment2(priceDif + chargefee + 3.0);
			 newReservation.setPaymentdat2(new Date());
			 newReservation.setCreateday(new Date());
			 newReservation.setNote(null);			
			 newReservation.setBookingchannels("ONLINECHANNEL");	
			 newReservation.setReservationstt(0);
			 Calendar cal = Calendar.getInstance();
			 //cal.add(Calendar.HOUR_OF_DAY, 1);
			 cal.add(Calendar.MINUTE, 5);
			 newReservation.setDeadline(cal.getTime());
			 int leftLimit = 48; // numeral '0'
			  int rightLimit = 122; // letter 'z'
			  int targetStringLength = 7;
			   Random random = new Random();
			   String reservationidcode = random.ints(leftLimit, rightLimit + 1)
			      .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
			      .limit(targetStringLength)
			      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
			      .toString();			 
			newReservation.setReservationidcode(reservationidcode);
			newReservation.setPaymentsnote1(reservation.getPaymentsnote1());	
			//get note old reservation
			newReservation.setReplyfromhotel(String.valueOf(reservationid));
			 //CHECK LIST ROOM AGAIN
			
			 List<Rooms> listroomavailable = roomsService.availableRoom(dateFormat.parse(checkin), dateFormat.parse(checkout), reservation.getRoomtype().getRoomstypeid());					 			 			
			 if(listroomavailable.size() >= reservation.getTotalrooms()) {				 				
				 List<Rooms> getroom = new ArrayList<Rooms>();	
				 Map<String,List<Rooms>> RoomByBed = new HashMap<>();  				
				 if(!reservation.getPaymentsnote1().equalsIgnoreCase("") || !reservation.getPaymentsnote1().isEmpty()) {
					 System.out.println("type bed: " + reservation.getPaymentsnote1());
					 RoomByBed =  listroomavailable.stream().collect(Collectors.groupingBy(r -> r.getRoomtypecontent())); 			 					 
					 RoomByBed.entrySet().stream().forEach(r ->{							 				 
					     if(r.getKey().equalsIgnoreCase(reservation.getPaymentsnote1())) {
					    	 System.out.println("room content: " + r.getKey());
					    	 System.out.println("total rooms: " + r.getValue().size());
					    	 System.out.println("reservation rooms: " + reservation.getTotalrooms());
					    	 if(r.getValue().size() >= reservation.getTotalrooms()) {
					    		 Random rand = new Random();				
							        for (int i = 0; i < reservation.getTotalrooms(); i++) {		 
							            int randomIndex = rand.nextInt(r.getValue().size());		 
							            getroom.add(r.getValue().get(randomIndex));
							            r.getValue().remove(randomIndex);						            
							      }
							     getroom.forEach(ro ->{
							        System.out.println("list avail 1: " + ro.getRoomname());
							     });   
					    	 }else if(r.getValue().size() < reservation.getTotalrooms()) {
					    		 Map<String,List<Rooms>> RoomByBed1 = new HashMap<>();
					    		 RoomByBed1 =  listroomavailable.stream().collect(Collectors.groupingBy(ro -> ro.getRoomtypecontent()));
								 int left = reservation.getTotalrooms() - r.getValue().size();
					    		 getroom.addAll(r.getValue());
					    		 RoomByBed1.entrySet().stream().forEach(roo ->{
					    			 if(!roo.getKey().equalsIgnoreCase(reservation.getPaymentsnote1())) {
					    				 Random rand = new Random();				
									        for (int i = 0; i < left; i++) {		 
									            int randomIndex = rand.nextInt(roo.getValue().size());		 
									            getroom.add(roo.getValue().get(randomIndex));
									            roo.getValue().remove(randomIndex);						            
									      }
					    			 }
					    		 });				    		 
					    		 getroom.forEach(ro ->{
								        System.out.println("list avail 2: " + ro.getRoomname());
								 }); 
						     }				    	
					     }
					});
					
				 }
				 //not select bed type
				 else {					 
						 Random rand = new Random();				
					        for (int i = 0; i < reservation.getTotalrooms(); i++) {						        
					            int randomIndex = rand.nextInt(listroomavailable.size());		 
					            getroom.add(listroomavailable.get(randomIndex));
					            listroomavailable.remove(randomIndex);						            
					      }
					        getroom.forEach(ro ->{
						        System.out.println("list avail 3: " + ro.getRoomname());
						 });
					 }
				 reservationService.save(newReservation);				 
				 //add list room	 
				 getroom.forEach(r ->{
					 Reservationroomdetails reservationRoom = new Reservationroomdetails();
					 reservationRoom.setReservation(newReservation);
					 reservationRoom.setRooms(r);
					 reservationRoom.setCusinroom(r.getRoomtype().getNumcusdefault());
					 reservationRoom.setReservationroomtypestt(0);	
					 reservationroomdetailsService.save(reservationRoom);
				 });
				 modelMap.put("oldreservationid", reservationid);
				 modelMap.put("chargefee", chargefee);
				 return "redirect:/user/reviewbooking?reservationid=" + newReservation.getReservationid();  	 
			 }else if (listroomavailable.size() < reservation.getTotalrooms()) {
				System.out.println("Fail!"); 
				redirectAttributes.addFlashAttribute("msg", "Your booking not available in change date. Please, select another date!"); 
				return "redirect:/user/reviewbooking?reservationid=" + reservationid;
			 }			
			 return "redirect:/user/reviewbooking?reservationid=" + reservationid;
		 }catch (Exception e) {
			e.printStackTrace();
			return "redirect:/account/error";
		}	 
	 }
	 
	 @RequestMapping(value ="confirm/paylater", method = RequestMethod.GET)
		public String index(HttpSession session, @RequestParam("reservationid") int reservationid, ModelMap modelMap, HttpServletRequest request, RedirectAttributes redirectAttributes) {
			try {	
				Account account = new Account();
				if (session.getAttribute("id") != null) {
					int id = Integer.parseInt(session.getAttribute("id").toString());
					account = accountService.find(id);
					if (account != null) {
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("account", account);
						modelMap.put("role", role);
						modelMap.put("reservations", reservationService.findRevByGuestId(account.getAccountid()));						
					}
				}
				Reservation reservation = reservationService.find(reservationid);
				SimpleDateFormat dateformat = new SimpleDateFormat("HH:mm - dd-MM-yyyy");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.HOUR_OF_DAY, 1);
				reservation.setDeadline(cal.getTime());
				int leftLimit = 48; // numeral '0'
				  int rightLimit = 122; // letter 'z'
				  int targetStringLength = 7;
				   Random random = new Random();
				   String reservationidcode = random.ints(leftLimit, rightLimit + 1)
				      .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
				      .limit(targetStringLength)
				      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
				      .toString();			 
				reservation.setReservationidcode(reservationidcode);
				reservationService.save(reservation);					
				String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request).replacePath(null).build()
						.toUriString();
				File file = ResourceUtils.getFile("classpath:email_content_confirmhold.txt");		
				String content = new String(Files.readAllBytes(file.toPath()));
				content = content.replace("$reservationCode", reservation.getReservationidcode());
				content = content.replace("$hotelname", reservation.getRoomtype().getHotel().getHotelname());
				content = content.replace("$bookingStt", "Hold");
				content = content.replace("$checkin", String.valueOf(simpleDateFormat.format(reservation.getCheckin())));
				content = content.replace("$checkout", String.valueOf(simpleDateFormat.format(reservation.getCheckout())));
				content = content.replace("$deadline", String.valueOf(dateformat.format(reservation.getDeadline())));
				content = content.replace("$night", String.valueOf((reservation.getCheckout().getTime() - reservation.getCheckin().getTime())/(1000*60*60*24)));
				content = content.replace("$numCus", String.valueOf(reservation.getRoomtype().getNumcusdefault()));
				content = content.replace("$totalRooms", String.valueOf(reservation.getTotalrooms()));
				content = content.replace("$roomType", reservation.getRoomtype().getRoomstypename());
				content = content.replace("$reservationPayment", baseUrl + "/user/reviewbooking/payment?reservationid=" + reservationid + "&reservationcode=" + reservation.getReservationidcode());
				content = content.replace("$cusName", reservation.getCustomername());
				content = content.replace("$cusPhone", reservation.getCustomerphone());
				content = content.replace("$cusEmail", reservation.getCustomeremail());
							
				String from = environment.getProperty("spring.mail.username");
				mailService.Send(from, reservation.getCustomeremail(), "Confirm hold booking #" + reservation.getReservationidcode(), content);
				modelMap.put("content", "Hold booking successful! Your booking would be held for 1 hour.");
				modelMap.put("sub", "Thank you for choosing Traveloto! Your Reservation ID Is: " + "#" + reservation.getReservationidcode() + ", A confirmation Email has been sent to you.");		
				modelMap.put("deadline", dateformat.format(reservation.getDeadline()));
				modelMap.put("reservationid", reservationid);
				modelMap.put("reservationcode", reservation.getReservationidcode());				
				redirectAttributes.addFlashAttribute("msg", "Sent");
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("msg", "Failed");
			}
			return "customer/confirmbooking";
		}
	 
	 @RequestMapping(value = { "updatecomment" }, method = RequestMethod.POST)
	 public String updatecom(HttpSession session, ModelMap modelMap , @RequestParam("revId") int reservationid, @RequestParam("comment") String comment, 
			 @RequestParam("rating") String rating, RedirectAttributes redirectAttributes) {
		 try {
			 Account account = new Account();
				if (session.getAttribute("id") != null) {
					int id = Integer.parseInt(session.getAttribute("id").toString());
					account = accountService.find(id);
					if (account != null) {
						String role = account.getAccounttype().getAccounttypename().substring(5);
						modelMap.put("account", account);
						modelMap.put("role", role);
						modelMap.put("reservations", reservationService.findRevByGuestId(account.getAccountid()));						
					}
				}
				 boolean result = checkForbidden(comment.toLowerCase());
				 if(result == false) {
					 redirectAttributes.addFlashAttribute("forbidden", "You cannot post comments containing prohibited words!");				
				 }
				 else {
					 Reservation reservation = reservationService.find(reservationid);
					 reservation.setRating(BigDecimal.valueOf(Long.parseLong(rating)));
					 reservation.setCustomercomment(comment);	
					 reservationService.save(reservation);					 
				 }			 
			 return "redirect:/user/reviewbooking?reservationid=" + reservationid;
		 }catch (Exception e) {
			e.printStackTrace();
			return "redirect:/account/error";
		}	 
	 } 
	 
	 private boolean checkForbidden(String value) {
		boolean check = true;
		String[] forbidden = new String[]{"Fuck", "Motherfucker", "Fucking", "ass", "shit", "sex"};			 
		 for(String test: forbidden) {
			 if(value.contains(test.toLowerCase())) {
				 check = false;
				 break;
			 }			 
		 }
		 return check;
	 }
	 
}
