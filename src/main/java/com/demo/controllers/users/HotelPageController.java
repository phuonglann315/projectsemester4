package com.demo.controllers.users;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Contractinforoomtype;
import com.demo.models.Hotelseason;
import com.demo.models.LanHotelInfo;
import com.demo.models.LanRoomtypeInfo;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Roomtype;
import com.demo.service.AccountService;
import com.demo.service.ContractinfoService;
import com.demo.service.ContractinforoomtypeService;
import com.demo.service.HotelSeasonService;
import com.demo.service.HotelService;
import com.demo.service.LanHotelInfoService;
import com.demo.service.LanRoomtypeInfoService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationroomdetailsService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;

@Controller
@RequestMapping({ "page/hotel" })
public class HotelPageController {

	@Autowired
	private LanHotelInfoService lanHotelInfoService;

	@Autowired
	private LanRoomtypeInfoService lanRoomtypeInfoService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private HotelSeasonService hotelseasonService;

	@Autowired
	private ContractinfoService contractinfoService;

	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;

	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private RoomsService roomsService;
	
	@Autowired
	private RoomTypeService roomTypeService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private ContractinforoomtypeService contractinforoomtypeService;
	

	@RequestMapping(value = { "" }, method = RequestMethod.GET)
	public String showByLocation(HttpSession session, ModelMap modelMap, @RequestParam("hotelid") int hotelid) {
		try {
			if (session.getAttribute("id") != null) {
				int id = Integer.parseInt(session.getAttribute("id").toString());
				Account account = accountService.find(id);
				if (account != null) {
					String role = account.getAccounttype().getAccounttypename().substring(5);
					modelMap.put("account", account);
					modelMap.put("role", role);
				}
			}
			//check out of time booking
			reservationService.findAll().forEach(re ->{
				 var currentdate = new Date();
				 var deadline = re.getDeadline();
				 if(currentdate.getTime() > deadline.getTime() && re.getBookingchannels().equalsIgnoreCase("ONLINECHANNEL") && re.getReservationstt() == 0) {
					 re.setReservationstt(8);
					 reservationService.save(re);
					 List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService.findListByReservationid(re.getReservationid());
					 reservationroomdetails.forEach(r ->{
						 r.setReservationroomtypestt(8);
						 reservationroomdetailsService.save(r);				 
					 });
				 }		
			});
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Calendar c1 = Calendar.getInstance();
			String t=dateFormat.format(c1.getTime());
			c1.add(Calendar.DATE, 1);			
			String s = dateFormat.format(c1.getTime());
			Date today = dateFormat.parse(t);
			Date tomorrow = dateFormat.parse(s);	
					LanHotelInfo gethotel = lanHotelInfoService.getHotelPageInfoLow(hotelid);
					modelMap.put("hotel", gethotel);
					List<LanRoomtypeInfo> getlistroom  = new ArrayList<LanRoomtypeInfo>();
					List<Roomtype> listroomtype = roomTypeService.findListRoomtypeByHotelid(hotelid);				
					listroomtype.forEach(r ->{
						int countbusy = reservationroomdetailsService.counttotalroombusy(r.getRoomstypeid(), today, tomorrow);
						int totalroom = roomsService.counttotalroombyroomtypeinhotel(r.getRoomstypeid());
						int availableroom = totalroom - countbusy;
						contractinfoService.find(gethotel.getContractid()).getContractinforoomtypes().forEach(c ->{
							if(c.getRoomtype().getRoomstypeid() == r.getRoomstypeid()) {
								Double showprice = reservationService.addPrice(r.getRoomstypeid(), gethotel.getContractid(), today, tomorrow);
								getlistroom.add(new LanRoomtypeInfo(r.getHotel(), gethotel.getContractid(), showprice, roomTypeService.find(r.getRoomstypeid()), availableroom));
							}
						});
						
					});
					modelMap.put("listroomtype", getlistroom.stream().sorted(Comparator.comparing(LanRoomtypeInfo::getShowprice)).collect(Collectors.toList()));
					int provinceId = lanHotelInfoService.getHotelPageInfoLow(hotelid).getHotel().getWard().getCity()
							.getProvince().getProvinceid();
					List<LanHotelInfo> listrelative = lanHotelInfoService.getHotelByLocationRelativeLow(provinceId, hotelid, PageRequest.of(0, 3));
					List<Roomtype> listroomtype1 = new ArrayList<Roomtype>();
					listrelative.forEach(h ->{
							roomTypeService.findListRoomtypeByHotelid(h.getHotelid()).forEach(r ->{							
								listroomtype1.add(r);				
					});	
					List<Double> listprice = new ArrayList<Double>();
					listroomtype1.forEach(lr ->{						
						Contractinforoomtype contractinforoomtype = contractinforoomtypeService.findRoomPrice(h.getContractid(), lr.getRoomstypeid());					
						if(contractinforoomtype != null) {						
							listprice.add(reservationService.addPrice(lr.getRoomstypeid(), h.getContractid(), today, tomorrow));
							Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);
					 		h.setShowprice(minprice);
						}				
					  });					 			
					});					
					modelMap.put("listrelative", listrelative);			
					modelMap.put("today", dateFormat.format(today));
					modelMap.put("tomorrow", dateFormat.format(tomorrow));
			return "user/hotelPage";
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
		
	
	@RequestMapping(value = { "hotelbook" }, method = RequestMethod.GET)
	public String showByLocationTest(HttpSession session, ModelMap modelMap, @RequestParam("hotelid") int hotelid, @RequestParam("checkin") String checkin, 
			@RequestParam("checkout") String checkout, @RequestParam("guest") int guest, @RequestParam("room") int room) {
		try {
			if (session.getAttribute("id") != null) {
				int id = Integer.parseInt(session.getAttribute("id").toString());
				Account account = accountService.find(id);
				if (account != null) {
					String role = account.getAccounttype().getAccounttypename().substring(5);
					modelMap.put("account", account);
					modelMap.put("role", role);
				}
			}
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");			
				Date checkindate = dateFormat.parse(checkin);
				Date checkoutdate = dateFormat.parse(checkout);	
					LanHotelInfo gethotel = lanHotelInfoService.getHotelPageInfoLow(hotelid);
					modelMap.put("hotel", gethotel);
					List<LanRoomtypeInfo> getlistroom  = new ArrayList<LanRoomtypeInfo>();	
						List<Roomtype> listroomtype = roomTypeService.findListRoomtypeByHotelid(hotelid);						
						listroomtype.forEach(r ->{
							try {
								int countbusy = reservationroomdetailsService.counttotalroombusy(r.getRoomstypeid(), dateFormat.parse(checkin), dateFormat.parse(checkout));
								int totalroom = roomsService.counttotalroombyroomtypeinhotel(r.getRoomstypeid());
								int availableroom = totalroom - countbusy;
								contractinfoService.find(gethotel.getContractid()).getContractinforoomtypes().forEach(c ->{
									if(c.getRoomtype().getRoomstypeid() == r.getRoomstypeid()) {
										Double showprice = reservationService.addPrice(r.getRoomstypeid(), gethotel.getContractid(), checkindate, checkoutdate);
										getlistroom.add(new LanRoomtypeInfo(r.getHotel(), gethotel.getContractid(), showprice, roomTypeService.find(r.getRoomstypeid()), availableroom));
									}
								});	
							} catch (ParseException e) {
								e.printStackTrace();
							}
							
						});
						modelMap.put("listroomtype", getlistroom.stream().sorted(Comparator.comparing(LanRoomtypeInfo::getShowprice)).collect(Collectors.toList()));
						int provinceId = lanHotelInfoService.getHotelPageInfoLow(hotelid).getHotel().getWard().getCity()
								.getProvince().getProvinceid();
						
						List<LanHotelInfo> listrelative = lanHotelInfoService.getHotelByLocationRelativeLow(provinceId, hotelid, PageRequest.of(0, 3));
						List<Roomtype> listroomtype1 = new ArrayList<Roomtype>();
						listrelative.forEach(h ->{
								roomTypeService.findListRoomtypeByHotelid(h.getHotelid()).forEach(r ->{							
									listroomtype1.add(r);				
						});	
						List<Double> listprice = new ArrayList<Double>();
						listroomtype1.forEach(lr ->{						
							Contractinforoomtype contractinforoomtype = contractinforoomtypeService.findRoomPrice(h.getContractid(), lr.getRoomstypeid());					
							if(contractinforoomtype != null) {						
								listprice.add(reservationService.addPrice(lr.getRoomstypeid(), h.getContractid(), checkindate, checkoutdate));
								Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);
						 		h.setShowprice(minprice);
							}				
						  });						 			
						});

						modelMap.put("listrelative", listrelative);			
						modelMap.put("checkin", checkin);
						modelMap.put("checkout", checkout);			
						modelMap.put("room", room);
						modelMap.put("guest", guest);
				
			return "user/hotelPage";
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}	
	}
}
