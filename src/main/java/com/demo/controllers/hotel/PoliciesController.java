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

import com.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.models.Account;
import com.demo.models.Hotelseason;
import com.demo.models.Policies;
import com.demo.models.Reservation;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Roomtype;

@Controller
@RequestMapping({ "hotel/policies" })

public class PoliciesController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private RoomTypeService roomTypeService;

	@Autowired
	private PoliciesService policiesService;

	@Autowired
	private HotelSeasonService hotelseasonService;

	@RequestMapping(value = { "showpolicies",
			"showpolicies/{typeroomId}/{year}/{applyfor}" }, method = RequestMethod.GET)
	public String policies(@PathVariable(value = "typeroomId", required = false) String typeroomId,
			@PathVariable(value = "year", required = false) String year,
			@PathVariable(value = "applyfor", required = false) String applyfor, HttpSession session,
			ModelMap modelMap) {

		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				int roomTypeId = 1;
				if (typeroomId != null) {
					roomTypeId = Integer.parseInt(typeroomId);
				}
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				Calendar calendar = Calendar.getInstance();
				int thisyear = calendar.get(Calendar.YEAR);
				int nextyear = thisyear + 1;
				int hotelid = account.getHotel().getHotelid();
				modelMap.put("nextyear", nextyear);
				List<String> listapply = new ArrayList<String>();
				listapply.add("ONLINECHANNEL");
				listapply.add("AGENTCHANNEL");
				listapply.add("DIRECTCHANNEL");
				modelMap.put("listapply", listapply);
				List<Roomtype> roomtypeList = roomTypeService.findListRoomtypeByHotelid(hotelid);
				Roomtype roomtype = roomTypeService.find(roomTypeId);
				int y = (year == null) ? thisyear : Integer.parseInt(year);
				String a = (applyfor == null) ? "ONLINECHANNEL" : applyfor;

				List<Policies> lsPolices = policiesService.findPoliciesByListRoomtype(roomTypeId, y, a);
				if(lsPolices.size()>0) {
					int stt = lsPolices.get(0).getPoliciesstatus();	
					modelMap.put("stt", stt);
				}
				
				modelMap.put("policiesList", lsPolices);
				modelMap.put("year", y);
				modelMap.put("applyfor", a);
				List<Integer> years = policiesService.findListYear();
				modelMap.put("years", years);

				modelMap.put("typeRoomName", roomtype.getRoomstypename());
				modelMap.put("typeroomSelected", roomTypeId);
				modelMap.put("roomTypeList", roomtypeList);

				return "hotel/myhotel/policy";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "createpolicies" }, method = RequestMethod.GET)
	public String createRoomType(RedirectAttributes redirectAttrs,HttpSession session, ModelMap modelMap,@RequestParam(value="roomtype",required = false) String roomtype,
			@RequestParam(value="applyfor",required = false) String applyfor,@RequestParam(value="number",required = false) String number) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				modelMap.put("roomtype", new Roomtype());
				List<Roomtype> roomTypeList = roomTypeService
						.findListRoomtypeByHotelid(account.getHotel().getHotelid());
				Calendar calendar = Calendar.getInstance();
				int thisyear = calendar.get(Calendar.YEAR);
				int nextyear = thisyear + 1;
				int hotelid=account.getHotel().getHotelid();
				modelMap.put("nextyear", nextyear);
				modelMap.put("hotelid", hotelid);
				modelMap.put("roomTypeList", roomTypeList);
				List<Hotelseason> lsHotelSeason = hotelseasonService
						.findHotelseasonInYear(hotelid,nextyear);
				if(lsHotelSeason.size() >0) {
					
					if(roomtype!=null) {
						
						modelMap.put("total", number);
						List<Policies> policiesinsert=new ArrayList<Policies>();
						for(var i=0;i<Integer.parseInt(number);i++) {
							policiesinsert.add(new Policies());
						}
						modelMap.put("policiesinsert",policiesinsert);	
						modelMap.put("ok", "ok");
						int roomtypeid=Integer.parseInt(roomtype);
						modelMap.put("roomtype", roomTypeService.find(roomtypeid));
						modelMap.put("applyfor", applyfor);
						modelMap.put("lsHotelSeason", lsHotelSeason);					
										
						List<Policies> policiesinserted= policiesService.findPoliciesByListRoomtype(roomtypeid, nextyear,applyfor);
						if(policiesinserted.size() >0 ) {
							for(var i=0;i<lsHotelSeason.size();i++) {
								for(var j=0;j<policiesinserted.size();j++) {
									String pf=new SimpleDateFormat("dd-MM-yyyy").format(policiesinserted.get(j).getFromdate());
									String pt=new SimpleDateFormat("dd-MM-yyyy").format(policiesinserted.get(j).getTodate());
									String htsf=new SimpleDateFormat("dd-MM-yyyy").format(lsHotelSeason.get(i).getFromdate());
									String htst=new SimpleDateFormat("dd-MM-yyyy").format(lsHotelSeason.get(i).getTodate());
									if(pf.equalsIgnoreCase(htsf) && pt.equalsIgnoreCase(htst)) {
											
										lsHotelSeason.remove(i);
										j=lsHotelSeason.size();
									}
								}
							}		
							modelMap.put("lsHotelSeason", lsHotelSeason);
							
						}else if(policiesinserted.size() ==0 ){
							modelMap.put("lsHotelSeason", lsHotelSeason);
						}
						
						
					}
				}else {
					modelMap.put("msg", "Please Create Hotel Season fist");
				}	
				return "hotel/addnew/policy";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "createpolicies" }, method = RequestMethod.POST)
	public String createRoom(@RequestParam(value="minbeforecheckindate",required = false)  List<Integer> minbeforecheckindate,
			@RequestParam(value="maxbeforcheckindate",required = false)  List<Integer> maxbeforcheckindate, @RequestParam("applyfor") String applyfor,
			@RequestParam(value="content",required = false) List<String> content, @RequestParam("roomtypeid") int roomtypeid, @RequestParam("hotelseasonid") int hotelseasonid,
			@RequestParam(value="refund",required = false)  List<Integer> refund, @RequestParam("year") int year, @RequestParam("total") int total,@RequestParam(value="reissue",required = false)  List<Integer> reissue) {
			
		
		if(  minbeforecheckindate.size() ==total &&  maxbeforcheckindate.size() ==total 
				&&  content.size()==total  && refund.size() == total 
				&& reissue.size() ==total ) {				
			for(var i=0;i<minbeforecheckindate.size();i++) {
				Policies policies=new Policies();
				policies.setPoliciescontent(content.get(i));
				Hotelseason hotelseason = hotelseasonService.find(hotelseasonid);
				policies.setFromdate(hotelseason.getFromdate());
				policies.setTodate(hotelseason.getTodate());
				policies.setMaxbeforcheckindate(maxbeforcheckindate.get(i));
				policies.setMinbeforecheckindate(minbeforecheckindate.get(i));
				policies.setRefund(refund.get(i));
				policies.setReissue(reissue.get(i));
				policies.setPoliciesstatus(0);
				policies.setApplyfor(applyfor);
				policies.setRoomtype(roomTypeService.find(roomtypeid));
				policiesService.save(policies);	
			}
			return "redirect:/hotel/policies/showpolicies/"+roomtypeid+"/"+year+"/"+applyfor;
		}else {
			System.out.println("minbeforecheckindate");
			minbeforecheckindate.forEach(r->{
				System.out.println(r);
			});
			System.out.println("maxbeforcheckindate");
			maxbeforcheckindate.forEach(r->{
				System.out.println(r);
			});
			System.out.println(content.size() ==total);
			System.out.println(refund.size() ==total);
			System.out.println(reissue.size() ==total);
			return "redirect:/hotel/policies/createpolicies?roomtype="+roomtypeid+"&applyfor="+applyfor+"&number="+String.valueOf(total);
		}
	}
	
	
	
	@RequestMapping(value = { "editpolicies" }, method = RequestMethod.GET)
	public String editpolicies(RedirectAttributes redirectAttrs,HttpSession session, ModelMap modelMap,@RequestParam("year") int year,
			@RequestParam(value="roomtype") int roomtype,@RequestParam("applyfor") String applyfor,@RequestParam(value="stt") int stt) {
		
		List<Policies> plcchange= policiesService.findPoliciesByYearOFHotelID( year,  roomtype, applyfor);
		plcchange.forEach(pls->{
			pls.setPoliciesstatus(stt);
			policiesService.save(pls);
		});
		return "redirect:/hotel/policies/showpolicies/"+roomtype+"/"+year+"/"+applyfor;
		
	}

}
