package com.demo.controllers.admin;


import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCrypt;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.demo.models.Account;
import com.demo.models.Accounttype;
import com.demo.models.Contractinfo;
import com.demo.models.Hotel;

import com.demo.service.AccountService;
import com.demo.service.AccountTypeService;
import com.demo.service.ContractinfoService;
import com.demo.service.HotelService;


@Controller
@RequestMapping({ "admin/account" })

public class AdminAccountController {

	@Autowired
	private AccountService accountService;
	
	

	@Autowired
	private AccountTypeService accountTypeService;

	
	@Autowired
	private HotelService hotelService;
	@Autowired
	private ContractinfoService contractinfoService;
	

	@RequestMapping(value = { "showlistaccount", "" }, method = RequestMethod.GET)

	public String showlisthotel(HttpSession session, ModelMap modelMap,@RequestParam(value="accountTypeid",required = false) String accountTypeid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
				int accounttypeid=2;
				accounttypeid = accountTypeid !=null?Integer.parseInt(accountTypeid):2;
				List<Account> accounts= accountService.findAccountByAccounttype_accounttypeid(accounttypeid);
				System.out.println(" accounttypeid" +accounttypeid);
				accounts.forEach(a->System.out.println(a.getAccountname()));
				if(accountTypeid !=null) {
					modelMap.put("selectaccounttype", accountTypeid);
				}
				List<Accounttype> accounttypes=(List<Accounttype>) accountTypeService.findAll();
				accounttypes=accounttypes.stream().filter(at->at.getAccounttypeid() != 3 && at.getAccounttypeid() !=4).collect(Collectors.toList());
				modelMap.put("accounttypes", accounttypes);
				modelMap.put("accounts", accounts);
				return "admin/account/showlistaccount";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "addaccount" }, method = RequestMethod.GET)

	public String addaccount(HttpSession session, ModelMap modelMap) {
	
		List<Hotel> listhotel=hotelService.listhotelactive();

		modelMap.put("listhotel",listhotel);
		return "admin/account/addaccount";
	}
	@RequestMapping(value = "addaccount", method = RequestMethod.POST)

	public String addacount(HttpSession session, ModelMap modelmap,@RequestParam("hotelid") int hotelid,@RequestParam("username") String username,
			@RequestParam("phone") String phone,@RequestParam("name") String name,@RequestParam("email") String email
			) {
			
		try {
			Hotel hotel=hotelService.find(hotelid);
			Contractinfo contractinfo = contractinfoService.findContract(hotelid);
			 Account account = new Account();
			 account.setEmail(email);;
			 account.setAccountname(name);
			 account.setPhone(phone);
			 account.setUsername(username);
			 account.setAvatar("user.png");
			 account.setHotel(hotel);
			String password = username+"$123";
			String hashpw=BCrypt.hashpw(password, BCrypt.gensalt());
			account.setPassword(hashpw);
			//string pass mặc định tạo ra là username nhập vào thêm đuôi $123  -> ví dụ nhập vô username: phuocga -> pas là : phuocga$123
		
			account.setAccounttype(accountTypeService.find(2));
			account.setAccountstt(0);
		
			//gọi hàm save account lại
			 accountService.save(account);
			return "redirect:/admin/account/showlistaccount";
			
		} catch (Exception e) {
			return "redirect:/account/register";
		}
		
	}
	
	@RequestMapping(value = { "editaccount" }, method = RequestMethod.GET)

	public String editaccount(HttpSession session, ModelMap modelMap, @RequestParam(value="accountid") int accountid
			){
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("avatar", account.getAvatar());
		        modelMap.put("account", account);
		        List<Hotel> listhotel=hotelService.listhotelactive();
		        modelMap.put("listhotel",listhotel);
		        //--code
		        Account accountedit = accountService.find(accountid);
		        modelMap.put("accountedit", accountedit);
				return "admin/account/editaccount";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	
	
	@RequestMapping(value = { "editaccount" }, method = RequestMethod.POST)
	public String editaccount(HttpSession session, ModelMap modelMap, @RequestParam("accountname")String accountname,
			@RequestParam("phone") String phone, @RequestParam("email")String  email,@RequestParam("accountid") int accountid
			,@RequestParam("hotelid") int hotelid) {
	      Hotel hotelname = hotelService.find(hotelid);
		  Account accountedit = accountService.find(accountid);
		  accountedit.setAccountname(accountname);
		  accountedit.setPhone(phone);
		  accountedit.setEmail(email);
		  accountedit.setHotel(hotelname);
		  accountService.save(accountedit);
		return "redirect:/admin/account/showlistaccount";
	}
	@RequestMapping(value = "error", method = RequestMethod.GET)

	public String error() {

		return "error";
	}

@RequestMapping(value = { "status" }, method = RequestMethod.GET)

public String status(HttpSession session, ModelMap modelMap, @RequestParam("accountid") int accountid,
		@RequestParam("accountstt") int accountstt) {
	if (session.getAttribute("id") != null) {
		int id = Integer.parseInt(session.getAttribute("id").toString());
		Account account = accountService.find(id);
		if (account != null) {
			String role = account.getAccounttype().getAccounttypename().substring(5);
			modelMap.put("accountname", account.getAccountname());
			modelMap.put("role", role);
			modelMap.put("avatar", account.getAvatar());
			// -----------------//
			
			Account accountedit = accountService.find(accountid);
			accountedit.setAccountstt(accountstt);
			accountService.save(accountedit);

			return "redirect:/admin/account/showlistaccount?accountid=" + accountid;
		} else {
			return "redirect:/account/login";
		}
	} else {
		return "redirect:/account/login";
	}
}
}