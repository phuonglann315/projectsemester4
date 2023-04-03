package com.demo.controllers.users;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;





@Controller
@RequestMapping({ "error"})
//@RequestMapping( "demo")
public class ErrorController {

	@RequestMapping(value = { "index", "" }, method = RequestMethod.GET)

	public String index() {
		return "error";
	}
	
}
