package com.demo.controllers.hotel;

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
@RequestMapping({ "hotel" })

public class HotelController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private ReservationService reservationService;
	

	@Autowired
	private RoomTypeService roomTypeService;


	@Autowired
	private ReservationguestinfoService reservationguestinfoService;

	@RequestMapping(value = { "dashboard", "" }, method = RequestMethod.GET)

	public String dashboard(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
				Date today = new Date();
				int hotelid=account.getHotel().getHotelid();
				modelMap.put("hotel", account.getHotel());
				modelMap.put("roomtypes", roomTypeService.findListRoomtypeByHotelid(hotelid));
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("totalbookingcheckintoday", reservationService.countBookingByCheckinDay(today,hotelid));
				modelMap.put("totalbookingcheckouttoday", reservationService.countBookingByCheckoutDay(today,hotelid));
				modelMap.put("totalcuscheckouttoday", reservationguestinfoService.countTotalCusCheckOut(today,hotelid));
				modelMap.put("totalcusstayingbydate", reservationguestinfoService.countTotalCusStaying(today,hotelid));

				return "hotel/dashboard/dashboard";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "mypayment" }, method = RequestMethod.GET)

	public String mypayment(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				return "hotel/myaccount/mypayment";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "editmyaccount" }, method = RequestMethod.GET)

	public String editmyaccount(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				return "hotel/myaccount/myaccount";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	
	@RequestMapping(value = { "reviews" }, method = RequestMethod.GET)

	public String reviews(HttpSession session, ModelMap modelMap,@RequestParam(value="reservationid",required = false) String reservationid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				if(reservationid ==null) {
					modelMap.put("com", reservationService.showCustomercomment(account.getHotel().getHotelid()));
				}
				else {
					int ida= Integer.parseInt(reservationid);
					modelMap.put("rs", reservationService.find(ida));
				}
				
				return "hotel/dashboard/reviews";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "replytocus" }, method = RequestMethod.GET)

	public String replytocus(HttpSession session, ModelMap modelMap,@RequestParam("reservationid") int reservationid,@RequestParam("replyfromhotel") String replyfromhotel) {
	Reservation rs=	reservationService.find(reservationid);
		rs.setReplyfromhotel(replyfromhotel);
		reservationService.save(rs);
		return "redirect:/hotel/dashboard/reviews";
	}

	

	

	
	
	

	@RequestMapping(value = "error", method = RequestMethod.GET)

	public String error() {

		return "error";
	}
}
