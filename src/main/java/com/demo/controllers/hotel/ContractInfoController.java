package com.demo.controllers.hotel;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.demo.models.*;
import com.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping({ "hotel/contractinfo" })

public class ContractInfoController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private ContractinfoService contractinfoService;
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private ContractinforoomtypeService contractinforoomtypeService;
	@RequestMapping(value = { "showcontractinfo", "showcontractinfo/{yearnumber}" }, method = RequestMethod.GET)
	public String showcontractinfo(@PathVariable(value = "yearnumber",required = false) String yearnumber,HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				Date date = new Date();
				int yearnum = new Date().getYear() + 1900;
				if(yearnumber != null){
					yearnum =  Integer.parseInt(yearnumber);
				}
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				modelMap.put("yearList", contractinfoService.findYear());
				modelMap.put("yearChoose", yearnum);
				modelMap.put("contractList",contractinfoService.showlistcontractwithyear(account.getHotel().getHotelid(),yearnum));
				return "hotel/myhotel/agency";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	
	@RequestMapping(value = { "changestatus" }, method = RequestMethod.POST)
	public ResponseEntity<String> changeStatus(@RequestParam("id")Integer id, @RequestParam("status")int statusId, ModelMap modelMap) {
		Contractinfo contractinfo = contractinfoService.find(id);
		contractinfo.setContractinfostt(statusId);
		contractinfoService.save(contractinfo);
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}
	
	@RequestMapping(value = { "createcontract" }, method = RequestMethod.GET)
	public String createContract(HttpSession session, ModelMap modelMap, @RequestParam(value="taxcode",required = false)String taxcode, 
			@RequestParam(value="contractyear",required = false)String contractyear) {
	
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
				int hotelid = account.getHotel().getHotelid();
				modelMap.put("hotelid", hotelid);	
				List<Integer> years=new ArrayList<>();
				years.add(thisyear);
				years.add(nextyear);
				if(taxcode !=null) {				
					int year=Integer.parseInt(contractyear);
					Boolean result  =  contractinfoService.findExistAgent(taxcode, year,hotelid);
					System.out.println("result" +result);
					if(result == true) {		
						System.out.println("dung" +result);
						return "redirect:/hotel/contractinfo/showcontractinfo/"+year;
					}else {
						modelMap.put("taxcode", taxcode);	
						modelMap.put("contractyear", year);
						if(year==thisyear) {
							SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
							Calendar c1 = Calendar.getInstance();
							c1.add(Calendar.DATE, 1);
							String s = dateFormat.format(c1.getTime());
							modelMap.put("fromdate", s);	
						}
						
						List<Roomtype> roomtypes=roomTypeService.findListRoomtypeByHotelid(account.getHotel().getHotelid());
						modelMap.put("roomtypes", roomtypes);
						return "hotel/addnew/addagency";
					}
				}else {
					modelMap.put("years", years);
					return "hotel/addnew/addagency";
				}

			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
		
	}
	
	@RequestMapping(value = { "showcontractinfodetails"}, method = RequestMethod.GET)
	public String showcontractinfodetails(HttpSession session, ModelMap modelMap, @RequestParam("contractinfoid")int contractinfoid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				Contractinfo contractinfo=contractinfoService.find(contractinfoid);
				modelMap.put("contractinfo", contractinfo);
				List<Roomtype> roomtypes=roomTypeService.findListRoomtypeByHotelid(account.getHotel().getHotelid());
				List<Contractinforoomtype> Contractinforoomtypes=new ArrayList<Contractinforoomtype>();
				roomtypes.forEach(r->{
					ContractinforoomtypeId contractinforoomtypeid=new ContractinforoomtypeId();
					contractinforoomtypeid.setContractid(contractinfoid);
					contractinforoomtypeid.setRoomtypeid(r.getRoomstypeid());
					Contractinforoomtype Contractinforoomtype=new Contractinforoomtype();
					Contractinforoomtype=contractinforoomtypeService.find(contractinforoomtypeid);
					Contractinforoomtypes.add(Contractinforoomtype);
					modelMap.put("Contractinforoomtypes", Contractinforoomtypes);
					
				});
				return "hotel/myhotel/contractinfodetails";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	
	
	
	
	
	@RequestMapping(value = { "createcontract" }, method = RequestMethod.POST)
	public String createContractPost( @RequestParam("contractname")String contractname,	@RequestParam("channel")String channel,@RequestParam("hotelid")int hotelid
			,@RequestParam("taxcode")String taxcode,@RequestParam("fromdate")String fromdate,@RequestParam("todate")String todate,
			@RequestParam("email")String email,@RequestParam("phone")String phone,@RequestParam("address")String address,
			@RequestParam("roomstypeid")List<Integer> roomstypeid,@RequestParam("hightseasonprice")List<Integer> hightseasonprice,
			@RequestParam("lowseasonprice")List<Integer> lowseasonprice) {
		try {
			System.out.println("--------------"+taxcode);
			Contractinfo contractinfo=new Contractinfo();
			contractinfo.setContractname(contractname);
			contractinfo.setAddress(address);
			contractinfo.setChannel(channel);
			contractinfo.setHotel(hotelService.find(hotelid));
			Date fromdates = new SimpleDateFormat("dd-MM-yyyy").parse(fromdate);
			Date todates = new SimpleDateFormat("dd-MM-yyyy").parse(todate);
			contractinfo.setFromdate(fromdates);
			contractinfo.setTodate(todates);
			contractinfo.setContractinfostt(0);
			contractinfo.setEmail(email);
			contractinfo.setPhone(phone);
			contractinfo.setTaxcode(taxcode);
			contractinfo= contractinfoService.save(contractinfo);
			for(var i=0;i<roomstypeid.size();i++) {
				Contractinforoomtype Contractinforoomtype=new Contractinforoomtype();
				ContractinforoomtypeId contractinforoomtypeid=new ContractinforoomtypeId();
				contractinforoomtypeid.setContractid(contractinfo.getContractid());
				contractinforoomtypeid.setRoomtypeid(roomstypeid.get(i));
				Contractinforoomtype.setId(contractinforoomtypeid);
				Contractinforoomtype.setLowseasonprice(lowseasonprice.get(i));
				Contractinforoomtype.setHightseasonprice(hightseasonprice.get(i));
				contractinforoomtypeService.save(Contractinforoomtype);
			}
			
			return "redirect:/hotel/contractinfo/showcontractinfodetails?contractinfoid="+contractinfo.getContractid();
		} catch (Exception e) {
			e.printStackTrace();
			return "hotel/error";
		}
	}
	
	
	@RequestMapping(value = { "changestt"}, method = RequestMethod.GET)
	public String changestt(@RequestParam("contractid")int contractid,@RequestParam("stt")int stt) {
		Contractinfo contractinfo=contractinfoService.find(contractid);
		contractinfo.setContractinfostt(stt);
		contractinfoService.save(contractinfo);
		return "redirect:/hotel/contractinfo/showcontractinfodetails?contractinfoid="+contractid;
	}
	
	@RequestMapping(value = { "editcontract"}, method = RequestMethod.GET)
	public String editcontract(HttpSession session, ModelMap modelMap, @RequestParam("contractinfoid")int contractinfoid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				Contractinfo contractinfo=contractinfoService.find(contractinfoid);
				modelMap.put("contractinfo", contractinfo);
				List<Roomtype> roomtypes=roomTypeService.findListRoomtypeByHotelid(account.getHotel().getHotelid());
				List<Contractinforoomtype> Contractinforoomtypes=new ArrayList<Contractinforoomtype>();
				roomtypes.forEach(r->{
					ContractinforoomtypeId contractinforoomtypeid=new ContractinforoomtypeId();
					contractinforoomtypeid.setContractid(contractinfoid);
					contractinforoomtypeid.setRoomtypeid(r.getRoomstypeid());
					Contractinforoomtype Contractinforoomtype=new Contractinforoomtype();
					Contractinforoomtype=contractinforoomtypeService.find(contractinforoomtypeid);
					Contractinforoomtypes.add(Contractinforoomtype);
					modelMap.put("Contractinforoomtypes", Contractinforoomtypes);
					
				});
				return "hotel/myhotel/editcontractinfo";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	
	
	@RequestMapping(value = { "editcontract" }, method = RequestMethod.POST)
	public String EactionditContract( @RequestParam("contractid")int contractid, @RequestParam("contractname")String contractname,	
			@RequestParam("channel")String channel,
			@RequestParam("taxcode")String taxcode,
			@RequestParam("email")String email,@RequestParam("phone")String phone,@RequestParam("address")String address,
			@RequestParam("roomstypeid")List<Integer> roomstypeid,@RequestParam("hightseasonprice")List<Double> hightseasonprice,
			@RequestParam("lowseasonprice")List<Double> lowseasonprice) {
		try {
			Contractinfo contractinfo=contractinfoService.find(contractid);
			contractinfo.setContractname(contractname);
			contractinfo.setAddress(address);
			contractinfo.setChannel(channel);
			contractinfo.setEmail(email);
			contractinfo.setPhone(phone);
			contractinfo.setTaxcode(taxcode);
			contractinfo= contractinfoService.save(contractinfo);
			for(var i=0;i<roomstypeid.size();i++) {
				ContractinforoomtypeId contractinforoomtypeid=new ContractinforoomtypeId();
				contractinforoomtypeid.setContractid(contractid);
				contractinforoomtypeid.setRoomtypeid(roomstypeid.get(i));
				Contractinforoomtype contractinforoomtype=contractinforoomtypeService.find(contractinforoomtypeid);
				contractinforoomtype.setLowseasonprice(lowseasonprice.get(i));
				contractinforoomtype.setHightseasonprice(hightseasonprice.get(i));
				contractinforoomtypeService.save(contractinforoomtype);
			}
			
			return "redirect:/hotel/contractinfo/showcontractinfodetails?contractinfoid="+contractinfo.getContractid();
		} catch (Exception e) {
			e.printStackTrace();
			return "hotel/error";
		}
	}
	
}
