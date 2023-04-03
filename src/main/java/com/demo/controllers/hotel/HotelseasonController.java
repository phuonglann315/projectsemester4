package com.demo.controllers.hotel;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.demo.models.*;
import com.demo.service.*;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping({ "hotel/hotelseason" })

public class HotelseasonController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private HotelSeasonService hotelSeasonService;

	@Autowired
	private PoliciesService policiesService;

	public static boolean isNumeric(String str) { 
		  try {  
		    Integer.parseInt(str);  
		    return true;
		  } catch(NumberFormatException e){  
		    return false;  
		  }  
		}
	@RequestMapping(value = { "showhotelseason", "" }, method = RequestMethod.GET)
	public String showhotelseason(HttpSession session, ModelMap modelMap,
			@RequestParam(value = "year", required = false) String year) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				Calendar calendar = Calendar.getInstance();
				int thisyear = calendar.get(Calendar.YEAR);
				int hotelid=account.getHotel().getHotelid();
				List<Hotelseason> hotelseasonList = new ArrayList<Hotelseason>();
				if (year != null) {
					if(isNumeric(year)) {
						int	ye=Integer.parseInt(year);
						List<Integer> years = hotelSeasonService.findListYear(hotelid).stream()
								.filter(y -> y != ye).collect(Collectors.toList());
								
						hotelseasonList = hotelSeasonService.findHotelseasonInYear(hotelid,ye);
						modelMap.put("years", years);
						modelMap.put("thisyear", ye);
						modelMap.put("crryear", thisyear);
						modelMap.put("hotelid", hotelid);
						modelMap.put("hotelseasonList", hotelseasonList);
						if(hotelseasonList.size() >0) {
							modelMap.put("stt", hotelseasonList.get(0).getHotelseasonstt());
						}else {
							modelMap.put("msg", "No Information");
						}
						
						return "hotel/myhotel/hotelseason";
					}else {
						return "hotel/error";
					}
				} else {
					hotelseasonList = hotelSeasonService.findHotelseasonInYear(hotelid,
							thisyear);
					List<Integer> years = hotelSeasonService.findListYear(hotelid).stream()
							.filter(y -> y != thisyear).collect(Collectors.toList());
					modelMap.put("years", years);
					modelMap.put("thisyear", thisyear);
					modelMap.put("crryear", thisyear);
					modelMap.put("hotelid", hotelid);
					modelMap.put("hotelseasonList", hotelseasonList);
					if(hotelseasonList.size() >0) {
						modelMap.put("stt", hotelseasonList.get(0).getHotelseasonstt());
					}else {
						modelMap.put("msg", "No Information");
					}
					return "hotel/myhotel/hotelseason";
				}

				
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "createhotelseason"}, method = RequestMethod.GET)
	public String createRoomType(RedirectAttributes redirectAttrs,HttpSession session, ModelMap modelMap,
			@RequestParam(value = "quantityhotelseason", required = false) String quantityhotelseason) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());

				Calendar calendar = Calendar.getInstance();
				int thisyear = calendar.get(Calendar.YEAR);
				int nextyear = thisyear + 1;
				modelMap.put("nextyear", nextyear);
				List<Hotelseason> hotelseasons= hotelSeasonService.findHotelseasonInYear(account.getHotel().getHotelid(), nextyear);

				if(hotelseasons.size()==0 ) {
					if (quantityhotelseason != null) {
						List<Hotelseason> hotelseasonList = new ArrayList<Hotelseason>();
						for(var i=0;i<Integer.parseInt(quantityhotelseason);i++) {						
							Hotelseason hotelseason=new Hotelseason();
							hotelseasonList.add(hotelseason);
							modelMap.put("hotelseasonList", hotelseasonList);
							modelMap.put("total", hotelseasonList.size() *2);
							modelMap.put("quantityhotelseason", quantityhotelseason);
						}
					}

					return "hotel/addnew/addhotelseason";
				}else {
					redirectAttrs.addFlashAttribute("msg1", " The hotel has created some seasons for next year, please check again");
					return "redirect:/hotel/hotelseason/showhotelseason?year="+nextyear;
				}
				
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	
	int check;
	@RequestMapping(value = { "addhotelseason"}, method = RequestMethod.POST)
	public String addhotelseason(RedirectAttributes redirectAttrs,HttpSession session,@RequestParam("fromdate") List<String> fromdate,@RequestParam("todate") List<String> todate,
			@RequestParam("seasonname") List<String> seasonname, @RequestParam("year") int year) {
		try {
			if (session.getAttribute("id") != null) {
				int id = Integer.parseInt(session.getAttribute("id").toString());
				Account account = accountService.find(id);
				if (account != null) {
					check=0;
					fromdate.forEach(fd->{
						check=(fd==null)?1:0;
					});
					todate.forEach(fd->{
						check=(fd==null)?1:0;
					});
					seasonname.forEach(fd->{
						check=(fd==null)?1:0;
					});

				
					if(check==0 ) {
						for(var i=0;i<fromdate.size();i++) {
							Hotelseason hotelseason=new Hotelseason();
							hotelseason.setHotel(account.getHotel());
							hotelseason.setFromdate( new SimpleDateFormat("dd-MM-yyyy").parse(fromdate.get(i)));
							hotelseason.setTodate(new SimpleDateFormat("dd-MM-yyyy").parse(todate.get(i)));
							hotelseason.setSeasonname(seasonname.get(i));
							hotelseason.setHotelseasonstt(0);
							hotelSeasonService.save(hotelseason);
						}
						return "redirect:/hotel/hotelseason/showhotelseason?year="+year;
					}else {
						redirectAttrs.addFlashAttribute("msg1", "Please input value");
						return "redirect:hotel/hotelseason/createhotelseason";
					}
					
				} else {
					return "redirect:/account/login";
				}
			} else {
				return "redirect:/account/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "hotel/error";
		}
		
	}

	@RequestMapping(value = { "changestatus"}, method = RequestMethod.GET)
	public String Changestatus(ModelMap modelMap,@RequestParam("year") int year,@RequestParam("newstt") int newstt
			,@RequestParam("hotelid") int hotelid) {
		Calendar calendar = Calendar.getInstance();
		List<Hotelseason> hotelseasons= hotelSeasonService.findHotelseasonInYear(hotelid, year);
		
		hotelseasons.forEach(hs->{
			hs.setHotelseasonstt(newstt);
			hotelSeasonService.save(hs);
		});
		if(newstt==2) {
			List<Policies> plcchange=policiesService.findPoliciesByYearOFHotelID(year,hotelid);
			if(plcchange.size() >0) {
				plcchange.forEach(pls->{
					pls.setPoliciesstatus(newstt);
					policiesService.save(pls);
				});
			}
		}
		return "redirect:/hotel/hotelseason/showhotelseason?year="+year;
	}
}
