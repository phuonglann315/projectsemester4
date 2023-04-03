package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Account;
import com.demo.models.Accounttype;
import com.demo.repositories.AccountRepository;
import com.demo.repositories.AccountTypeRepository;


@Service
public class AccountTypeServiceImpl implements AccountTypeService{

	@Autowired
	private AccountTypeRepository accountTypeRepository;


	@Override
	public Accounttype find(int id) {
		
		return accountTypeRepository.findById(id).orElse(null);
	}
	@Override
	public Iterable<Accounttype> findAll() {
		
		return accountTypeRepository.findAll();
	}
	

}
