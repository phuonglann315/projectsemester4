package com.demo.controllers.users;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.websocket.server.PathParam;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;

import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demo.models.Account;
import com.demo.models.Addonservice;
import com.demo.models.City;
import com.demo.models.Contractinforoomtype;
import com.demo.models.Hotel;
import com.demo.models.Hotelseason;
import com.demo.models.LanLocation;
import com.demo.models.LanRoomtypeInfo;
import com.demo.models.Policies;
import com.demo.models.LanHotelInfo;
import com.demo.models.Province;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;
import com.demo.models.Roomtypeimage;
import com.demo.models.Ward;
import com.demo.service.AccountService;
import com.demo.service.AddonserviceService;
import com.demo.service.CityService;
import com.demo.service.ContractinfoService;
import com.demo.service.ContractinforoomtypeService;
import com.demo.service.HotelSeasonService;
import com.demo.service.HotelService;
import com.demo.service.LanHotelInfoService;
import com.demo.service.PoliciesService;
import com.demo.service.ProvinceService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationroomdetailsService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;

@RestController
@RequestMapping({ "ajaxuser" })
public class AjaxSearchController {

	@Autowired
	private ProvinceService provinceService;

	@Autowired
	private LanHotelInfoService lanHotelInfoService;

	@Autowired
	private HotelSeasonService hotelseasonService;

	@Autowired
	private HotelService hotelService;

	@Autowired
	private RoomsService roomsService;

	@Autowired
	private RoomTypeService roomTypeService;

	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;

	@Autowired
	private ContractinforoomtypeService contractinforoomtypeService;
	
	@Autowired 
	private ReservationService reservationService;
	
	@Autowired
	private PoliciesService policiesService;
	
	@Autowired
	private ContractinfoService contractinfoService;
	
	@Autowired
	private AccountService accountService;
	
	
 
	@RequestMapping(value = "autocomplete", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<LanLocation> ajaxSearchHome(@RequestParam(value = "term", required = false) String term) {
		if (term == null) {
			return provinceService.getAllProvince();
		} else {
			return provinceService.searchProvince(term);
		}
	}

	@RequestMapping(value = "getSortWard", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<LanLocation> getSortWard(@RequestParam("provinceid") int provinceid) {
		return provinceService.searchWard(provinceid);
	}

	@RequestMapping(value = "autocompleteHotel", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<LanHotelInfo> ajaxSearchHotel(@RequestParam(value = "term", required = false) String term,
			@RequestParam("provinceid") int provinceid) {
		if (term == null) {
			List<LanHotelInfo> listHotel = new ArrayList<LanHotelInfo>();
			listHotel.add(new LanHotelInfo(0, "All hotels"));
			lanHotelInfoService.searchAllHotel(provinceid).forEach(l -> {
				listHotel.add(l);
			});
			return listHotel;
		} else {
			List<LanHotelInfo> listHotel = new ArrayList<LanHotelInfo>();
			listHotel.add(new LanHotelInfo(0, "All hotels"));
			lanHotelInfoService.searchHotelByName(provinceid, term).forEach(l -> {
				listHotel.add(l);
			});
			return listHotel;
		}
	}

	@RequestMapping(value = "ajaxButtonSearch", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<LanHotelInfo> ajaxButtonSearch(@RequestParam("provinceid") int provinceid,
			@RequestParam("checkin") String checkin, @RequestParam("checkout") String checkout) {
		try {
			if (provinceid != 0) {				
				Date checkindate = new SimpleDateFormat("dd-MM-yyyy").parse(checkin);
				Date checkoutdate = new SimpleDateFormat("dd-MM-yyyy").parse(checkout);
				List<LanHotelInfo> listhotels = lanHotelInfoService.getHotelByLocationLowAjax(provinceid);								
				List<Roomtype> listroomtype = new ArrayList<Roomtype>();
				listhotels.forEach(h ->{
						roomTypeService.findListRoomtypeByHotelid(h.getHotelid()).forEach(r ->{							
						listroomtype.add(r);				
				});	
				List<Double> listprice = new ArrayList<Double>();
				listroomtype.forEach(lr ->{						
					Contractinforoomtype contractinforoomtype = contractinforoomtypeService.findRoomPrice(h.getContractid(), lr.getRoomstypeid());					
					if(contractinforoomtype != null) {						
						listprice.add(reservationService.addPrice(lr.getRoomstypeid(), h.getContractid(), checkindate, checkoutdate));
						h.setPublicprice(roomTypeService.find(lr.getRoomstypeid()).getPublicprice());
					}				
				  });
				 Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);
				 h.setShowprice(minprice);	
				});
				return listhotels;	
			}
 		
		}catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	@RequestMapping(value = "ajaxHotelName", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<LanHotelInfo> ajaxHotelName(@RequestParam("hotelid") int hotelid,
			@RequestParam("provinceid") int provinceid, @RequestParam("checkin") String checkin,
			@RequestParam("checkout") String checkout) {
		try {
			if (hotelid != 0) {
				List<LanHotelInfo> listhotels = lanHotelInfoService.getHotelByLocationLowAjax(provinceid);
				System.out.println("get list");
				System.out.println("list: " + listhotels);				
				Date checkindate = new SimpleDateFormat("dd-MM-yyyy").parse(checkin);
				Date checkoutdate = new SimpleDateFormat("dd-MM-yyyy").parse(checkout);
				List<Roomtype> listroomtype = new ArrayList<Roomtype>();
				listhotels.forEach(h ->{
						roomTypeService.findListRoomtypeByHotelid(h.getHotelid()).forEach(r ->{							
						listroomtype.add(r);				
				});	
				List<Double> listprice = new ArrayList<Double>();
				listroomtype.forEach(lr ->{						
					Contractinforoomtype contractinforoomtype = contractinforoomtypeService.findRoomPrice(h.getContractid(), lr.getRoomstypeid());					
					if(contractinforoomtype != null) {						
						listprice.add(reservationService.addPrice(lr.getRoomstypeid(), h.getContractid(), checkindate, checkoutdate));									
					}				
				  });
				 Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);
				 h.setShowprice(minprice);	
				});
				List<LanHotelInfo> filterName = listhotels.stream().filter(h -> h.getHotelid() == hotelid)
						.collect(Collectors.toList());
				return filterName;
								
			}else {
				List<LanHotelInfo> listhotels = lanHotelInfoService.getHotelByLocationLowAjax(provinceid);
				Date checkindate = new SimpleDateFormat("dd-MM-yyyy").parse(checkin);
				Date checkoutdate = new SimpleDateFormat("dd-MM-yyyy").parse(checkout);
				List<Roomtype> listroomtype = new ArrayList<Roomtype>();
				listhotels.forEach(h ->{
						roomTypeService.findListRoomtypeByHotelid(h.getHotelid()).forEach(r ->{							
						listroomtype.add(r);				
				});	
				List<Double> listprice = new ArrayList<Double>();
				listroomtype.forEach(lr ->{						
					Contractinforoomtype contractinforoomtype = contractinforoomtypeService.findRoomPrice(h.getContractid(), lr.getRoomstypeid());					
					if(contractinforoomtype != null) {						
						listprice.add(reservationService.addPrice(lr.getRoomstypeid(), h.getContractid(), checkindate, checkoutdate));									
					}				
				  });
				 Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);
				 h.setShowprice(minprice);	
				});
				return listhotels;			
			}	
		}catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "ajaxSortDistrict", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<LanHotelInfo> ajaxSortDistrict(@RequestParam("wardid") int[] wardid,  @RequestParam("price") String price,
			@RequestParam("checkin") String checkin, @RequestParam("checkout") String checkout, @RequestParam("provinceid") int provinceid) {
		try {		
					List<LanHotelInfo> listhotels = lanHotelInfoService.getHotelByLocationLowAjax(provinceid);
					Date checkindate = new SimpleDateFormat("dd-MM-yyyy").parse(checkin);
					Date checkoutdate = new SimpleDateFormat("dd-MM-yyyy").parse(checkout);
					List<Roomtype> listroomtype = new ArrayList<Roomtype>();
					listhotels.forEach(h ->{
							roomTypeService.findListRoomtypeByHotelid(h.getHotelid()).forEach(r ->{							
							listroomtype.add(r);				
					});	
					List<Double> listprice = new ArrayList<Double>();
					listroomtype.forEach(lr ->{						
						Contractinforoomtype contractinforoomtype = contractinforoomtypeService.findRoomPrice(h.getContractid(), lr.getRoomstypeid());					
						if(contractinforoomtype != null) {						
							listprice.add(reservationService.addPrice(lr.getRoomstypeid(), h.getContractid(), checkindate, checkoutdate));									
						}				
					  });
					 Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);
					 h.setShowprice(minprice);	
					});
					int getprice = Integer.parseInt(price);
					
			 if (wardid != null) {	
				List<LanHotelInfo> filterWard = new ArrayList<LanHotelInfo>();
				List<LanHotelInfo> filterWardPrice = new ArrayList<LanHotelInfo>();								
					for(int ward : wardid) {
						if(ward > 0) {
							List<LanHotelInfo> filterDistrict = listhotels.stream()
									.filter(h -> hotelService.find(h.getHotelid()).getWard().getWardid() == ward)
									.collect(Collectors.toList());	
							filterWard.addAll(filterDistrict);
						}else {
							filterWard.addAll(listhotels);
						}					
				    }
					if(getprice > 0) {					
						switch (getprice) {
							case 1: {
								System.out.println("case 1");									
								filterWardPrice = filterWard.stream().filter(f -> f.getShowprice() > 10 && f.getShowprice() <= 80).collect(Collectors.toList());													
								return filterWardPrice;
							}case 2: {							
								System.out.println("case 2");								
								filterWardPrice = filterWard.stream().filter(f -> f.getShowprice() > 80 && f.getShowprice() <= 100).collect(Collectors.toList());													
								return filterWardPrice;
							}case 3: {							
								System.out.println("case 3");								
								filterWardPrice = filterWard.stream().filter(f -> f.getShowprice() > 100 && f.getShowprice() <= 150).collect(Collectors.toList());													
								return filterWardPrice;
							}case 4: {
								System.out.println("case 4");								
								filterWardPrice = filterWard.stream().filter(f -> f.getShowprice() > 150).collect(Collectors.toList());													
								return filterWardPrice;
							}
							default:
								throw new IllegalArgumentException("Unexpected value: " + price);
							}						
					}else {
						return filterWard;
					}			
			} 			
			 else {
				return listhotels;
			}
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	// check số lượng phòng còn trống theo loại phòng
	@RequestMapping(value = "ajaxCheckRoom", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public int ajaxCheckRoom(@RequestParam("roomtypeid") int roomtypeid, @RequestParam("checkin") String checkin,
			@RequestParam("checkout") String checkout) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
			int totalroom = roomsService.counttotalroombyroomtypeinhotel(roomtypeid);
			int busyroom = reservationroomdetailsService.counttotalroombusy(roomtypeid, simpleDateFormat.parse(checkin),
					simpleDateFormat.parse(checkout));
			return totalroom - busyroom;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	// check số lượng phòng cho change date
		@RequestMapping(value = "ajaxCheckRoomChange", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
		public LanRoomtypeInfo ajaxCheckRoomChange(@RequestParam("roomtypeid") int roomtypeid, @RequestParam("checkindate") String checkindate,
				@RequestParam("night") int night, @RequestParam("totalrooms") int totalrooms, @RequestParam("contractid") int contractid,
				@RequestParam("oldPrice") Double oldPrice, @RequestParam("chargefee") Double chargefee) {
			try {				
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
				Calendar checkout = Calendar.getInstance();
				checkout.setTime(simpleDateFormat.parse(checkindate));
				checkout.add(Calendar.DAY_OF_MONTH, night);
				int totalroom = roomsService.counttotalroombyroomtypeinhotel(roomtypeid);
				int busyroom = reservationroomdetailsService.counttotalroombusy(roomtypeid, simpleDateFormat.parse(checkindate), checkout.getTime());
				
				//check room price chênh lệch
				Double priceDif = 0.0;
				Double newPrice  = reservationService.addPrice(roomtypeid, contractid, simpleDateFormat.parse(checkindate), checkout.getTime());
				if(newPrice > oldPrice) {
					priceDif = (newPrice - oldPrice)*totalrooms*night;
				}else {
					priceDif = 0.0;
				}
				
				Double payment2 = (priceDif + chargefee + 3);
				System.out.println("checkin 1: " + checkindate);
				int available = totalroom - busyroom;
				LanRoomtypeInfo getroom = new LanRoomtypeInfo(newPrice, priceDif, checkindate, simpleDateFormat.format(checkout.getTime()), payment2, available);
				System.out.println("checkin: " + getroom.getCheckindate());
				System.out.println("checkout: " + getroom.getCheckoutdate());	
				System.out.println("price: " + getroom.getShowprice());
				System.out.println("night: " + night);
				System.out.println("rooms: " + totalroom);
				System.out.println("price old: " + oldPrice);
				System.out.println("price dif: " + priceDif);
				System.out.println("payment2: " + getroom.getPayment2());
				System.out.println("available: " + (totalroom - busyroom));
				return getroom;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		
		
	
	@RequestMapping(value = "ajaxCheckRefund", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<Integer> ajaxCheckRefund(@RequestParam("roomtypeid") int roomtypeid, @RequestParam("checkindate") String checkindate) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date in = simpleDateFormat.parse(checkindate);
			List<Policies> listpolicies = policiesService.findPoliciesByRoomtypeandApplyfor(roomtypeid, "ONLINECHANNEL", in);				
			List<Integer> refund = new ArrayList<Integer>();
			int countdate = (int) ((in.getTime() - new Date().getTime())/(1000*60*60*24));
			listpolicies.forEach(p ->{		
				 if(p.getMinbeforecheckindate() <= countdate && countdate <= p.getMaxbeforcheckindate()) {								
					 refund.add(p.getRefund());
				 }				
			 });
			System.out.println("ajax: " + refund);
			return refund;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "ajaxCheckReissue", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<Integer> ajaxCheckReissue(@RequestParam("roomtypeid") int roomtypeid, @RequestParam("checkindate") String checkindate) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date in = simpleDateFormat.parse(checkindate);
			List<Policies> listpolicies = policiesService.findPoliciesByRoomtypeandApplyfor(roomtypeid, "ONLINECHANNEL", in);				
			List<Integer> reissue = new ArrayList<Integer>();
			int countdate = (int) ((in.getTime() - new Date().getTime())/(1000*60*60*24));
			listpolicies.forEach(p ->{		
				 if(p.getMinbeforecheckindate() <= countdate && countdate <= p.getMaxbeforcheckindate()) {								
					 reissue.add(p.getReissue());
				 }				
			 });
			return reissue;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "ajaxListHotelPage", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<LanRoomtypeInfo> ajaxListHotelPage(@RequestParam("hotelid") int hotelid, @RequestParam("checkin") String checkin, @RequestParam("checkout") String checkout) {
		try {
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
			List<LanRoomtypeInfo> getlistroom  = new ArrayList<LanRoomtypeInfo>();
			List<Roomtype> listroomtype = roomTypeService.findListRoomtypeByHotelid(hotelid);	
			LanHotelInfo gethotel = lanHotelInfoService.getHotelPageInfoLow(hotelid);
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date checkindate = dateFormat.parse(checkin);
			Date checkoutdate = dateFormat.parse(checkout);
			listroomtype.forEach(r ->{
				int countbusy = reservationroomdetailsService.counttotalroombusy(r.getRoomstypeid(), checkindate, checkoutdate);
				int totalroom = roomsService.counttotalroombyroomtypeinhotel(r.getRoomstypeid());
				int availableroom = totalroom - countbusy;
				contractinfoService.find(gethotel.getContractid()).getContractinforoomtypes().forEach(c ->{
					
					if(c.getRoomtype().getRoomstypeid() == r.getRoomstypeid()) {
						//List<Roomtypeimage> imgroom = (List<Roomtypeimage>) roomTypeService.find(r.getRoomstypeid()).getRoomtypeimages();						
						Roomtype getroomtype = roomTypeService.find(r.getRoomstypeid());						
						Roomtypeimage roomtypeimage = getroomtype.getRoomtypeimages().stream().min(Comparator.comparing(Roomtypeimage::getRoomtypeimageid)).get();
						Double showprice = reservationService.addPrice(r.getRoomstypeid(), gethotel.getContractid(), checkindate, checkoutdate);
						getlistroom.add(new LanRoomtypeInfo(gethotel.getContractid(), showprice, r.getRoomstypeid(), r.getRoomstypename(), 
								getroomtype.getNetprice(), roomtypeimage.getRoomtypeimagename(), 
								getroomtype.getNumcusdefault(), 
								getroomtype.getPublicprice(), availableroom));
					}
				});
				
			});
			
			return getlistroom.stream().sorted(Comparator.comparing(LanRoomtypeInfo::getShowprice)).collect(Collectors.toList());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// check số lượng khách tối đa trong 1 phòng
	@RequestMapping(value = "ajaxCheckGuest", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public int ajaxCheckGuest(@RequestParam("roomtypeid") int roomtypeid) {
		try {
			Roomtype roomtype = roomTypeService.find(roomtypeid);
			return roomtype.getNumcusdefault();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	// get list room
	@RequestMapping(value = "ajaxGetListRoom", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<Rooms> ajaxGetListRoom(@RequestParam("roomtypeid") int roomtypeid,
			@RequestParam("totalrooms") int totalrooms, @RequestParam("checkin") String checkin,
			@RequestParam("checkout") String checkout) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
			List<Rooms> listroomavailable = roomsService.availableRoom(simpleDateFormat.parse(checkin),
					simpleDateFormat.parse(checkout), roomtypeid);
			List<Rooms> selectroom = new ArrayList<Rooms>();
			Random rand = new Random();
			for (int i = 0; i < totalrooms; i++) {
				int randomIndex = rand.nextInt(listroomavailable.size());
				selectroom.add(listroomavailable.get(randomIndex));
				listroomavailable.remove(randomIndex);
			}
			System.out.println("totalroom: " + totalrooms);
			selectroom.forEach(r -> {
				System.out.println("roomid: " + r.getRoomid());
				System.out.println("room name: " + r.getRoomname());
				System.out.println("-------------------");
			});
			return selectroom;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// check password
		@RequestMapping(value = "ajaxCheckPassword", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
		public boolean ajaxCheckPassword(@RequestParam("username") String username, @RequestParam("accPass") String accPass) {
			try {
				Account account = accountService.findbyUserName(username);
				String curPass = account.getPassword();
				if(BCrypt.checkpw(accPass, curPass) == true) {
					return true;
				}else {
					return false;
				}
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}

	
}
