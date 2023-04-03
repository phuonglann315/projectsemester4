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
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.models.Account;
import com.demo.models.Contractinforoomtype;
import com.demo.models.Hotelseason;
import com.demo.models.LanHotelInfo;
import com.demo.models.LanRoomtypeInfo;
import com.demo.models.Roomtype;
import com.demo.service.AccountService;
import com.demo.service.ContractinfoService;
import com.demo.service.ContractinforoomtypeService;
import com.demo.service.HotelSeasonService;
import com.demo.service.HotelService;
import com.demo.service.LanHotelInfoService;
import com.demo.service.ReservationService;
import com.demo.service.RoomTypeService;



@Controller
@RequestMapping({ "home",""})
public class HomeController {
	
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private LanHotelInfoService lanHotelInfoService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired 
	private HotelSeasonService hotelseasonService;
	
	@Autowired 
	private ReservationService reservationService;
	
	@Autowired 
	private RoomTypeService roomTypeService;

	@Autowired
	private ContractinforoomtypeService contractinforoomtypeService;

	@RequestMapping(value = { "index", "" }, method = RequestMethod.GET)
	public String index(HttpSession session, ModelMap modelMap) {
		
	try {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("account", account);
				modelMap.put("role", role);
				System.out.println("role: " + role);
			}
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Calendar c1 = Calendar.getInstance();
		String t=dateFormat.format(c1.getTime());
		c1.add(Calendar.DATE, 1);			
		String s = dateFormat.format(c1.getTime());
		Date today = new SimpleDateFormat("dd-MM-yyyy").parse(t);
		Date tomorrow = new SimpleDateFormat("dd-MM-yyyy").parse(s);
		List<LanHotelInfo> listhotels = lanHotelInfoService.selectRecomHotelLow(PageRequest.of(0, 4));
		List<Roomtype> listroomtype = new ArrayList<Roomtype>();
		listhotels.forEach(h ->{
				roomTypeService.findListRoomtypeByHotelid(h.getHotelid()).forEach(r ->{							
				listroomtype.add(r);				
		});	
		List<Double> listprice = new ArrayList<Double>();
		List<Integer> listoldprice = new ArrayList<Integer>();
		listroomtype.forEach(lr ->{	
			System.out.println("list old: " + lr.getPublicprice());
			System.out.println("contract: " + lr.getRoomstypeid());
			Contractinforoomtype contractinforoomtype = contractinforoomtypeService.findRoomPrice(h.getContractid(), lr.getRoomstypeid());					
			if(contractinforoomtype != null) {	
				
				listprice.add(reservationService.addPrice(lr.getRoomstypeid(), h.getContractid(), today, tomorrow));							
				Double minprice = listprice.stream().mapToDouble(v -> v).min().orElseThrow(NoSuchElementException::new);				
		 		h.setShowprice(minprice);
			}
			listoldprice.add(lr.getPublicprice());	
			
		  });
			 
		     //Integer minoldprice = listoldprice.stream().mapToInt(r ->r).min().orElseThrow(NoSuchElementException::new);
		     //h.setPublicprice(minoldprice);
		});
		modelMap.put("listhotels", listhotels);
		modelMap.put("counthcm", hotelService.countHotelByLocation(1));
		modelMap.put("counthn", hotelService.countHotelByLocation(2));
		modelMap.put("countpt", hotelService.countHotelByLocation(6));
		modelMap.put("countnt", hotelService.countHotelByLocation(4));
		modelMap.put("countdn", hotelService.countHotelByLocation(3));
	}catch (Exception e) {
		e.printStackTrace();
	}
		
		return "user/home";
	}
	
	@RequestMapping(value = {"aboutus"}, method = RequestMethod.GET)
	public String aboutus() {	
		return "user/aboutus";
	}

	
}
