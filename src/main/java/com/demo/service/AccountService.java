package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Account;


public interface AccountService extends UserDetailsService{

	public Iterable<Account> findAll();
	public Account find(int id);
	public Account save(Account  account);
	public Account findbyUserName( String username);
	public List<Account> findAccountByAccounttype_accounttypeid(int accounttypeid);
	public List<Account> findAccountbyHotel_hotelid(int hotelid);
}
