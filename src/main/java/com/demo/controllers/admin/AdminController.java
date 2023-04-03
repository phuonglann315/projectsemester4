package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Reservation;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Roomtype;
import com.demo.service.AccountService;
import com.demo.service.HotelService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationguestinfoService;
import com.demo.service.RoomTypeService;

@Controller
@RequestMapping({ "admin" })

public class AdminController {
	@Autowired
	private AccountService accountService;



	@Autowired
	private HotelService hotelService;



	@RequestMapping(value = { "index", "" }, method = RequestMethod.GET)

	public String index(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
		

				return "admin/index/index";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	
	@RequestMapping(value = "error", method = RequestMethod.GET)

	public String error() {

		return "error";
	}
}
