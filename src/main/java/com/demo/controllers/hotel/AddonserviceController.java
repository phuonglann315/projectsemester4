package com.demo.controllers.hotel;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Addonservice;
import com.demo.models.Reservation;
import com.demo.models.Reservationaddonservice;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Roomtype;
import com.demo.service.AccountService;
import com.demo.service.AddonserviceService;
import com.demo.service.HotelService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationguestinfoService;
import com.demo.service.RoomTypeService;

@Controller
@RequestMapping({ "hotel/addonservices" })

public class AddonserviceController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private AddonserviceService addonserviceService;
	@Autowired
	private HotelService hotelService;

	
	@RequestMapping(value = { "changestatus","" }, method = RequestMethod.POST)
	public ResponseEntity<String> changeStatus(@RequestParam("id")Integer id, @RequestParam("status")int statusId, ModelMap modelMap) {
		Addonservice addonservice=addonserviceService.find(id);
		addonservice.setAddonservicestt(statusId);
		addonserviceService.save(addonservice);
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}

	@RequestMapping(value = { "showaddonservices" }, method = RequestMethod.GET)

	public String addonservices(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				List<Addonservice> myList=addonserviceService.findAddonserviceByHotel_hotelid(account.getHotel().getHotelid());
				modelMap.put("myList", myList);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				return "hotel/myhotel/addonservices";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	@RequestMapping(value = { "createAddonService" }, method = RequestMethod.GET)
	public String showCreateAddonService(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				int hotelid=account.getHotel().getHotelid();				
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				modelMap.put("hotelid", hotelid);
				return "hotel/addnew/newaddonservices";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	
	
	@RequestMapping(value = { "createAddonService" }, method = RequestMethod.POST)
	public String createAddonService(@RequestParam("hotelid") int hotelid,@RequestParam("addonservicename") String addonservicename,
			@RequestParam("servicetype") String servicetype,
			@RequestParam("netprice") int netprice,@RequestParam("price") int price) {			
		Addonservice addonservice=new Addonservice();
		addonservice.setAddonservicename(addonservicename);
		addonservice.setHotel(hotelService.find(hotelid));
		addonservice.setNetprice(netprice);
		addonservice.setPrice(price);
		addonservice.setServicetype(servicetype);
		addonservice.setAddonservicestt(0);
		addonserviceService.save(addonservice);
		return "redirect:/hotel/addonservices/showaddonservices";
	}
	
	
	@RequestMapping(value = { "editAddonService" }, method = RequestMethod.GET)
	public String showEditAddonService(HttpSession session, ModelMap modelMap,@RequestParam("addonServiceId") int addonServiceId) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				int hotelid=account.getHotel().getHotelid();				
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				modelMap.put("hotelid", hotelid);
				Addonservice addonservice=addonserviceService.find(addonServiceId);
				if(addonservice !=null) {
					modelMap.put("addonservice", addonservice);
					return "hotel/myhotel/editaddonservices";
				}else {
					return "hotel/error";
				}
				
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	
	
	

	@RequestMapping(value = { "editAddonService" }, method = RequestMethod.POST)
	public String EditAddonService(@RequestParam("hotelid") int hotelid,@RequestParam("addonservicename") String addonservicename,
			@RequestParam("servicetype") String servicetype,
			@RequestParam("netprice") int netprice,@RequestParam("price") int price, @RequestParam("addonServiceId") int addonServiceId) {
		Addonservice addonservice=addonserviceService.find(addonServiceId);
		addonservice.setAddonservicename(addonservicename);
		addonservice.setHotel(hotelService.find(hotelid));
		addonservice.setNetprice(netprice);
		addonservice.setPrice(price);
		addonservice.setServicetype(servicetype);
		addonservice.setAddonservicestt(0);
		addonserviceService.save(addonservice);
		return "redirect:/hotel/addonservices/showaddonservices";
	}
	
}
