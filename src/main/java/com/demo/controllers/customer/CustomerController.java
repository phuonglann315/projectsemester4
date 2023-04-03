package com.demo.controllers.customer;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import javax.mail.Session;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.demo.models.Account;
import com.demo.models.Reservation;
import com.demo.models.Reservationroomdetails;
import com.demo.service.AccountService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationroomdetailsService;


@Controller
@RequestMapping({"customer"})

public class CustomerController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;

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
					List<Reservation> reservations = reservationService.findRevByGuestId(account.getAccountid());
					if(!reservations.isEmpty()) {
						var currentdate = new Date();							
						reservations.forEach(re ->{
							if(currentdate.getTime() > re.getDeadline().getTime() && re.getReservationstt() == 0) {
								re.setReservationstt(8);
								 reservationService.save(re);
								 List<Reservationroomdetails> reservationroomdetails = reservationroomdetailsService.findListByReservationid(re.getReservationid());
								 reservationroomdetails.forEach(r ->{
									 r.setReservationroomtypestt(8);
									 reservationroomdetailsService.save(r);				 
								 });
							}
						});						
						modelMap.put("reservations", reservations.stream().sorted(Comparator.comparing(Reservation::getCreateday).reversed())
								  .collect(Collectors.toList()));
						modelMap.put("countBooked", reservationService.countBookingGuestId(id));
						System.out.println("upcoming: " + reservationService.countUpcomingBook(id, new Date()));
						modelMap.put("countUpcoming", reservationService.countUpcomingBook(id, new Date()));
						modelMap.put("countReview", reservationService.countReviewBooking(id));
						modelMap.put("countCancel", reservationService.countCancelBook(id));
						modelMap.put("listUpcoming", reservationService.listUpcoming(id, new Date()));
					}else {
						System.out.println("empty");
						modelMap.put("msg1", "You have not been having any history of booking !");
					}		
				}
			}		
			return "customer/dashboard";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/account/error";
		}
		
	}
	
}
