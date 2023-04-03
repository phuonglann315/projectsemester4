package com.demo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Account;
import com.demo.models.Accounttype;
import com.demo.repositories.AccountRepository;


@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	private AccountRepository accountRepository;
	@Override
	public Iterable<Account> findAll() {
		return accountRepository.findAll();
		
	}
	@Override
	public Account find(int id) {
		return accountRepository.findById(id).orElse(null);
	}
	@Override
	public Account save(Account account) {
		return accountRepository.save(account);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account=accountRepository.findbyUserName(username);
		if(account == null) {
			throw new UsernameNotFoundException("not found email address");
		}else {
			List<GrantedAuthority> accounttypes= new ArrayList<GrantedAuthority>();
			accounttypes.add(new SimpleGrantedAuthority(account.getAccounttype().getAccounttypename()));		
			return new User(username,account.getPassword(),accounttypes);
		}
		
	}
	
	@Override
	public List<Account> findAccountByAccounttype_accounttypeid(int accounttypeid){
		return accountRepository.findAccountByAccounttype_accounttypeid( accounttypeid);
	};
	@Override
	public Account findbyUserName(String username) {
		return accountRepository.findbyUserName(username);
	}
	@Override
	public List<Account> findAccountbyHotel_hotelid( int hotelid){
		return accountRepository.findAccountByHotel_hotelid(hotelid);
	};

}
