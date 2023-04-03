package com.demo.controllers.users;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.models.Account;
import com.demo.models.Contractinforoomtype;
import com.demo.models.Hotel;
import com.demo.models.Hotelseason;
import com.demo.models.LanHotelInfo;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Roomtype;
import com.demo.service.AccountService;
import com.demo.service.CityService;
import com.demo.service.ContractinforoomtypeService;
import com.demo.service.HotelSeasonService;
import com.demo.service.HotelService;
import com.demo.service.LanHotelInfoService;
import com.demo.service.ProvinceService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationroomdetailsService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;

@Controller
@RequestMapping({"list"})
public class HotelListController {
	
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private ProvinceService provinceService;
	
	@Autowired
	private CityService cityService;
	
	@Autowired
	private LanHotelInfoService lanHotelInfoService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired 
	private HotelSeasonService hotelseasonService;
	
	@Autowired 
	private ContractinforoomtypeService contractinforoomtypeService;
	
	@Autowired
	private RoomTypeService roomTypeService;
	
	@Autowired 
	private ReservationService reservationService;
	
	@RequestMapping(value = {"location"}, method = RequestMethod.GET)
	public String showByLocation(HttpSession session, ModelMap modelMap, @RequestParam("provinceid") int provinceid) {	
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
			Calendar c1 = Calendar.getInstance();
			String t=dateFormat.format(c1.getTime());
			c1.add(Calendar.DATE, 1);			
			String s = dateFormat.format(c1.getTime());
			Date today = new SimpleDateFormat("dd-MM-yyyy").parse(t);
			Date tomorrow = new SimpleDateFormat("dd-MM-yyyy").parse(s);
			List<LanHotelInfo> listhotels = lanHotelInfoService.getHotelByLocationLow(provinceid);	
			List<Roomtype> listroomtype = new ArrayList<Roomtype>();
			listhotels.forEach(h ->{
					roomTypeService.findListRoomtypeByHotelid(h.getHotelid()).forEach(r ->{							
					listroomtype.add(r);				
			});	
			List<Double> listprice = new ArrayList<Double>();
			listroomtype.forEach(lr ->{						
				Contractinforoomtype contractinforoomtype = contractinforoomtypeService.findRoomPrice(h.getContractid(), lr.getRoomstypeid());					
				if(contractinforoomtype != null) {						
					listprice.add(reservationService.addPrice(lr.getRoomstypeid(), h.getContractid(), today, tomorrow));
					Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);
					h.setShowprice(minprice);
				}				
			  });
			 	
			});
				modelMap.put("listhotels", listhotels);
				modelMap.put("province", provinceService.find(provinceid));
				modelMap.put("today", dateFormat.format(today));
				modelMap.put("tomorrow", dateFormat.format(tomorrow));
				return "user/hotelList";	
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}				
	}
		
	@RequestMapping(value = {"searchHome"}, method = RequestMethod.GET)
	public String searchHome(HttpSession session, ModelMap modelMap, @RequestParam("provinceid") int provinceid, 
			@RequestParam("checkin") String checkin, @RequestParam("checkout") String checkout, @RequestParam("guest") int guest,
			@RequestParam("room") int room, RedirectAttributes redirectAttributes) {				
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
				Date checkindate = new SimpleDateFormat("dd-MM-yyyy").parse(checkin);
				Date checkoutdate = new SimpleDateFormat("dd-MM-yyyy").parse(checkout);
				List<LanHotelInfo> listhotels = lanHotelInfoService.getHotelByLocationLow(provinceid);	
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
						Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);
						h.setShowprice(minprice);	
					}				
				  });
				 
				});
					modelMap.put("listhotels", listhotels);
					modelMap.put("checkin", checkin);
					modelMap.put("checkout", checkout);
					modelMap.put("guest", guest);
					modelMap.put("room", room);
					modelMap.put("province", provinceService.find(provinceid));	
					return "user/hotelList";							
		}catch (ParseException e) {			
			e.printStackTrace();
			return "redirect:/home/index";
		}			
	}
	
	
	@RequestMapping(value = {"location/city"}, method = RequestMethod.GET)
	public String showByLocationCity(HttpSession session, ModelMap modelMap, @RequestParam("cityid") int cityid) {
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
			Calendar c1 = Calendar.getInstance();
			String t=dateFormat.format(c1.getTime());
			c1.add(Calendar.DATE, 1);			
			String s = dateFormat.format(c1.getTime());
			Date today = new SimpleDateFormat("dd-MM-yyyy").parse(t);
			Date tomorrow = new SimpleDateFormat("dd-MM-yyyy").parse(s);
			List<LanHotelInfo> listhotels = lanHotelInfoService.getHotelByLocationCityLow(cityid);
			List<Roomtype> listroomtype = new ArrayList<Roomtype>();
			listhotels.forEach(h ->{
					roomTypeService.findListRoomtypeByHotelid(h.getHotelid()).forEach(r ->{							
					listroomtype.add(r);				
			});	
			List<Double> listprice = new ArrayList<Double>();
			listroomtype.forEach(lr ->{						
				Contractinforoomtype contractinforoomtype = contractinforoomtypeService.findRoomPrice(h.getContractid(), lr.getRoomstypeid());					
				if(contractinforoomtype != null) {						
					listprice.add(reservationService.addPrice(lr.getRoomstypeid(), h.getContractid(), today, tomorrow));	
					Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);
					 h.setShowprice(minprice);
				}				
			  });
			 	
			});
				modelMap.put("today", dateFormat.format(today));
				modelMap.put("tomorrow", dateFormat.format(tomorrow));
				modelMap.put("city", cityService.find(cityid));
			return "user/hotelList";
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
					
	}

}
