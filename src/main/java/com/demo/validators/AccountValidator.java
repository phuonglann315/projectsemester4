package com.demo.validators;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.models.Account;
import com.demo.service.AccountService;

@Component
public class AccountValidator implements Validator {

	@Autowired
	private AccountService accountService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(Account.class);
	}

	@Override
	public void validate(Object object, Errors errors) {
		Account account = (Account) object;
	    Account find = null;
	    List<Account> accounts = (List<Account>) accountService.findAll();
	    for (Account account2 : accounts) {
			if (account2.getUsername().equalsIgnoreCase(account.getUsername())) {
				errors.rejectValue("username", "account.username.exists");
			}
			if (account2.getEmail().equalsIgnoreCase(account.getEmail())) {
				errors.rejectValue("email", "account.email.exists");
			}
		}
	    
	    if (!Pattern.matches("^(\\d|\\w){6,50}$", account.getUsername())) {
	    	errors.rejectValue("username", "account.username.error");
		} 
	    if (!Pattern.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{8,16}$", account.getPassword())) {
	    	errors.rejectValue("password", "account.password.error");
		} 
	    if (!Pattern.matches("([0-9]{10,12})\\b", account.getPhone())) {
	    	errors.rejectValue("phone", "account.phone.error");
		} 
	    if (!Pattern.matches("(^[A-Za-z]{3,16})([ ]{0,1})([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})", account.getAccountname())) {
	    	errors.rejectValue("accountname", "account.fullname.error");
		} 
	    if (!Pattern.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", account.getEmail())) {
	    	errors.rejectValue("email", "account.email.error");
		}
	    
	    
	    
	    
	    
		
	}

}
