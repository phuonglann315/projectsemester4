package com.demo.controllers.admin;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.models.Account;
import com.demo.models.City;
import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;
import com.demo.models.Ward;
import com.demo.repositories.ProvinceRepository;
import com.demo.service.AccountService;
import com.demo.service.CityService;
import com.demo.service.HotelService;
import com.demo.service.ProvinceService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationguestinfoService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;
import com.demo.service.WardService;

@Controller
@RequestMapping({ "admin/hotel" })

public class AdminHotelController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private HotelService hotelService;

	@Autowired
	private ProvinceService provinceService;

	@Autowired
	private CityService cityService;

	@Autowired
	private WardService wardService;

	@Autowired
	private RoomTypeService roomTypeService;

	@Autowired
	private RoomsService roomsService;

	@RequestMapping(value = { "showlisthotel", "" }, method = RequestMethod.GET)

	public String showlisthotel(HttpSession session, ModelMap modelMap,
			@RequestParam(value = "pagenumber", required = false) String pagenumber) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
				List<Hotel> hotels = (List<Hotel>) hotelService.findAll();
				modelMap.put("hotels", hotels);
				return "admin/hotel/showlisthotel";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "addhotel" }, method = RequestMethod.GET)

	public String addhotel(HttpSession session, ModelMap modelMap) {

		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
				// ---------code phuoc sau cai nay------------
				modelMap.addAttribute("provinces", provinceService.findAll());
			}
		}
		return "admin/hotel/addhotel";
	}

	@RequestMapping(value = { "edithotel" }, method = RequestMethod.GET)

	public String edithotel(HttpSession session, ModelMap modelMap, @RequestParam("hotelid") int hotelid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
				Hotel hotel = hotelService.find(hotelid);
				int selectward = hotel.getWard().getWardid();
				int selectcity = hotel.getWard().getCity().getCityid();
				int selectprovince = hotel.getWard().getCity().getProvince().getProvinceid();
				List<City> cities = cityService.findCityByProvince_provinceid(selectprovince);
				List<Ward> wards = wardService.findWardByCity_cityid(selectcity);
				modelMap.put("hotel", hotel);
				modelMap.put("selectward", selectward);
				modelMap.put("selectcity", selectcity);
				modelMap.put("selectprovince", selectprovince);
				modelMap.put("cities", cities);
				modelMap.put("wards", wards);
				modelMap.addAttribute("provinces", provinceService.findAll());

				return "admin/hotel/edithotel";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "profilehotel" }, method = RequestMethod.GET)

	public String profilehotel(HttpSession session, ModelMap modelMap, @RequestParam("hotelid") int hotelid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
				System.out.println(hotelid);
				modelMap.put("hotel", hotelService.find(hotelid));
				System.out.println(hotelService.find(hotelid));
				return "admin/hotel/profilehotel";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	int checkroom;

	@RequestMapping(value = { "status" }, method = RequestMethod.GET)

	public String status(RedirectAttributes redirectAttrs,HttpSession session, ModelMap modelMap, @RequestParam("hotelid") int hotelid,
			@RequestParam("hotelstatus") int hotelstatus) {
		Hotel hotel = hotelService.find(hotelid);
		if (hotelstatus == 1) {
			List<Roomtype> hotelRoomtypes = roomTypeService.findListRoomtypeByHotelid(hotelid);
			if (hotelRoomtypes.size() > 0) {
				checkroom = 0;
				hotelRoomtypes.forEach(rt -> {
					if (rt.getRoomtypestt() == 1) {
						List<Rooms> roomlist = roomsService.listroombyroomtypeactive(rt.getRoomstypeid());
						if (roomlist.size() == 0) {
							checkroom += 1;
						}
					}
				});
				if (checkroom > 0) {
					redirectAttrs.addFlashAttribute("msg", "Can't active this hotel due rooms in some roomtype is empty");
				}else {
					hotel.setHotelstatus(hotelstatus);

					hotelService.save(hotel);
					List<Account> acc = accountService.findAccountbyHotel_hotelid(hotelid);
					if (acc.size() > 0) {
						acc.forEach(a -> {
							a.setAccountstt(hotelstatus);
							accountService.save(a);
						});
					}
				}
			}else {
				redirectAttrs.addFlashAttribute("msg", "Can't active this hotel due  roomtype is empty");
			}
		} else {
			hotel.setHotelstatus(hotelstatus);

			hotelService.save(hotel);
			List<Account> acc = accountService.findAccountbyHotel_hotelid(hotelid);
			if (acc.size() > 0) {
				acc.forEach(a -> {
					a.setAccountstt(hotelstatus);
					accountService.save(a);
				});
			}
		}

		return "redirect:/admin/hotel/profilehotel?hotelid=" + hotelid;
	}

}
