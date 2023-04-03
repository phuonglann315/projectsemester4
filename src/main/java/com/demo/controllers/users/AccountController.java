package com.demo.controllers.users;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.demo.models.Account;
import com.demo.service.AccountService;
import com.demo.service.AccountTypeService;
import com.demo.service.MailService;
import com.demo.validators.AccountValidator;


@Controller
@RequestMapping({ "account" })
//@RequestMapping( "demo")
public class AccountController implements ServletContextAware {
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private MailService mailService;

	@Autowired
	private Environment environment;

	@Autowired
	private AccountTypeService accountTypeService;

	@Autowired
	private AccountValidator accountValidator;
	
	private ServletContext servletContext;

	// xuan code o day
	@RequestMapping(value = "login", method = RequestMethod.GET)

	public String Login(@RequestParam(value = "error", required = false) String error, ModelMap modelMap,HttpSession session) {
		if((session.getAttribute("id")==null)) {
			if (error != null) {
				modelMap.put("msg", "Can not found username or wrong password");
			}
			return "account/login";
		} else {
			int rolesId= Integer.parseInt(session.getAttribute("rolesId").toString());
			switch (rolesId) {
			case 1: 
				return "redirect:/home/index"; 
			case 2: 
				return "redirect:/hotel/dashboard"; 
			case 3: 
				return "redirect:/admin/index"; 
			case 4: 
				return "redirect:/agentscs/index"; 				
			default:
				return "redirect:/home/index"; 
			}
			
		}
		
	}

	@RequestMapping(value = "welcome", method = RequestMethod.GET)

	public String Welcome(Authentication authentication, ModelMap modelMap,HttpSession session) {
		String username = authentication.getName();
		Account account=accountService.findbyUserName(username);
		int rolesId= account.getAccounttype().getAccounttypeid();
		int id=Integer.parseInt(account.getAccountid().toString());
		session.setAttribute("id", id);
		session.setAttribute("rolesId", rolesId);
		
		switch (rolesId) {
		case 1: 
			return "redirect:/home/index"; 
		case 2: 
			return "redirect:/hotel/dashboard"; 
		case 3: 
			return "redirect:/admin/index"; 
		case 4: 
			return "redirect:/agentscs/index"; 				
		default:
			return "redirect:/home/index"; 
		}
	}

	
	
	@RequestMapping(value = "accessDenied", method = RequestMethod.GET)

	public String AccessDenied() {

		return "account/accessDenie";
	}
	
	
	
	//------------------------------------------------------------------------
	// dac code o day
	
	@RequestMapping(value = "register", method = RequestMethod.GET)

	public String register(ModelMap map) {
		map.put("account", new Account());
		return "account/register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)

	public String register(@ModelAttribute("account") @Valid Account account, HttpServletRequest request,
			BindingResult bindingResult,@RequestParam("confirmPass") String confirmPass, ModelMap map, RedirectAttributes redirAttrs) {
		try {
			if (account != null) {

				accountValidator.validate(account, bindingResult);
				if (bindingResult.hasErrors() || confirmPass.equals(account.getPassword())==false) {
					if (!confirmPass.equals(account.getPassword())) {
						map.put("errorConfirm", "Confirm password not match");
					}
					return "account/register";
				} else {
					String securityCode = UUID.randomUUID().toString().replace("-", "");
					String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request).replacePath(null).build()
							.toUriString();
					System.out.println("Read file from resource folder using Spring ResourceUtils");
					File file = ResourceUtils.getFile("classpath:email_content_security.txt");
					String content = new String(Files.readAllBytes(file.toPath()));
					content = content.replace("$userTerm", account.getAccountname());
					content = content.replace("$userVerify", baseUrl + "/account/verify?code=" + securityCode+"&username="+account.getUsername());
                    account.setAvatar("user.png");
                    account.setPassword(encoder.encode(account.getPassword()));
					account.setAccounttype(accountTypeService.find(1));
					account.setAccountstt(0);
					account.setVerifycode(securityCode);
					String from = environment.getProperty("spring.mail.username");
					mailService.Send(from, account.getEmail(), "Verify Your Account", content);                     
					accountService.save(account);
					return "redirect:/account/checkemail";	
				}
				
			}
			return "redirect:account/error";	
		} catch (Exception e) {
			return "redirect:/account/register";
		}
	}
	
	@RequestMapping(value = "updateMail", method = RequestMethod.POST)
	public String updateMail(@RequestParam("username") String username, @RequestParam("newMail") String newMail, RedirectAttributes redirAttrs) {
		try {
			Account account = accountService.findbyUserName(username);								
					account.setEmail(newMail);					
					accountService.save(account);
					int rolesId= account.getAccounttype().getAccounttypeid();
					switch (rolesId) {
					case 1: 
						redirAttrs.addFlashAttribute("msg", "Update Info Success!");
						return "redirect:/customer"; 
					case 2: 
						return "redirect:/hotel/dashboard"; 
					case 3: 
						return "redirect:/admin/index"; 
					case 4: 
						return "redirect:/agentscs/index"; 				
					default:
						return "redirect:/home/index"; 
					}						
		} catch (Exception e) {
			return "redirect:/account/register";
		}
	}
	
	@RequestMapping(value = "updatePhone", method = RequestMethod.POST)
	public String updatePhone(@RequestParam("username") String username, @RequestParam("newPhone") String newPhone, RedirectAttributes redirAttrs) {
		try {
			Account account = accountService.findbyUserName(username);										
					account.setPhone(newPhone);					
					accountService.save(account);
					int rolesId= account.getAccounttype().getAccounttypeid();
					switch (rolesId) {
					case 1: 
						redirAttrs.addFlashAttribute("msg", "Update Info Success!");
						return "redirect:/customer"; 
					case 2: 
						return "redirect:/hotel/dashboard"; 
					case 3: 
						return "redirect:/admin/index"; 
					case 4: 
						return "redirect:/agentscs/index"; 				
					default:
						return "redirect:/home/index"; 
					}						
		} catch (Exception e) {
			return "redirect:/account/register";
		}
	}
	
	@RequestMapping(value = "updateName", method = RequestMethod.POST)
	public String updateName(@RequestParam("username") String username, @RequestParam("accountname") String accountname, RedirectAttributes redirAttrs) {
		try {
			Account account = accountService.findbyUserName(username);										
					account.setAccountname(accountname);;					
					accountService.save(account);
					int rolesId= account.getAccounttype().getAccounttypeid();
					switch (rolesId) {
					case 1: 
						redirAttrs.addFlashAttribute("msg", "Update Info Success!");
						return "redirect:/customer"; 
					case 2: 
						return "redirect:/hotel/dashboard"; 
					case 3: 
						return "redirect:/admin/index"; 
					case 4: 
						return "redirect:/agentscs/index"; 				
					default:
						return "redirect:/home/index"; 
					}						
		} catch (Exception e) {
			return "redirect:/account/register";
		}
	}
	
	
	@RequestMapping(value = "updatePassword", method = RequestMethod.POST)
	public String updatePassword(@RequestParam("username") String username, @RequestParam("newPass") String newPass, RedirectAttributes redirAttrs) {
		try {
			Account account = accountService.findbyUserName(username);	
					account.setPassword(encoder.encode(newPass));							
					accountService.save(account);
					int rolesId= account.getAccounttype().getAccounttypeid();
					switch (rolesId) {
					case 1: 
						redirAttrs.addFlashAttribute("msg", "Change Password Success!");
						return "redirect:/customer"; 
					case 2: 
						return "redirect:/hotel/dashboard"; 
					case 3: 
						return "redirect:/admin/index"; 
					case 4: 
						return "redirect:/agentscs/index"; 				
					default:
						return "redirect:/home/index"; 
					}						
		} catch (Exception e) {
			return "redirect:/account/register";
		}
	}
	
	@RequestMapping(value = { "updateAvatar"}, method = RequestMethod.POST)
	public String uploadAvatar(@RequestParam("username") String username, @RequestParam("avatar") MultipartFile avatar, RedirectAttributes redirAttrs) {	
		try {
			Account account = accountService.findbyUserName(username);
			if(avatar != null && avatar.getSize() > 0) {
				String filename = upload(avatar);
				System.out.println("new file name: " + filename);
				System.out.println("File Info");
				System.out.println("file name: " + avatar.getOriginalFilename());
				System.out.println("File size: " + avatar.getSize());
				System.out.println("File type: " + avatar.getContentType());	
				account.setAvatar(filename);							
				accountService.save(account);
				int rolesId= account.getAccounttype().getAccounttypeid();
				switch (rolesId) {
				case 1: 
					redirAttrs.addFlashAttribute("msg", "Change Avatar Success!");
					return "redirect:/customer"; 
				case 2: 					
					return "redirect:/hotel/dashboard"; 
				case 3: 
					return "redirect:/admin/index"; 
				case 4: 
					return "redirect:/agentscs/index"; 				
				default:
					return "redirect:/home/index"; 
				}	
			}else {
				int rolesId= account.getAccounttype().getAccounttypeid();
				switch (rolesId) {
				case 1: 
					redirAttrs.addFlashAttribute("msg", "Change Avatar Failed!");
					return "redirect:/customer"; 
				case 2: 
					return "redirect:/hotel/dashboard"; 
				case 3: 
					return "redirect:/admin/index"; 
				case 4: 
					return "redirect:/agentscs/index"; 				
				default:
					return "redirect:/home/index"; 
				}
			}
			
		} catch (Exception e) {
			return "redirect:/account/register";
		}
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	private String upload(MultipartFile file) {
		try {
			String name = UUID.randomUUID().toString().replace("-", "");
			int lastIndex = file.getOriginalFilename().lastIndexOf(".");
			String fileName = name + file.getOriginalFilename().substring(lastIndex);
			byte[] bytes = file.getBytes();
			Path path = Paths.get(System.getProperty("user.dir") + "/src/main/uploads/account/" + fileName);
			Files.write(path, bytes);
			return fileName;
		} catch (Exception e) {
			return null;
		}
	}

	@RequestMapping(value = "verify", method = RequestMethod.GET)

	public String verify( @RequestParam("username") String username, @RequestParam("code") String code, RedirectAttributes redirAttrs, ModelMap modelMap) {
		Account account = accountService.findbyUserName(username);
		if (account!=null) {
			if (account.getVerifycode().equalsIgnoreCase(code) && account.getAccountstt()==0) {

				account.setAccountstt(1);
				account.setVerifycode("");
				accountService.save(account);
				return "redirect:wellcome";
			}else {
				return "redirect:account/error";	
			}
			
		}else {
			return "redirect:account/error";
		}
	
		
	}
	@RequestMapping(value = "checkemail", method = RequestMethod.GET)

	public String checkemail() {		
		return "account/checkemail";
	}
	
	@RequestMapping(value = "wellcome", method = RequestMethod.GET)

	public String wellcome() {		
		return "account/wellcome";
	}
}
