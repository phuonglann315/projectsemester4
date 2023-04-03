package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Account;
import com.demo.models.Accounttype;


public interface AccountTypeService{

	public Iterable<Accounttype> findAll();
	public Accounttype find(int id);

}
