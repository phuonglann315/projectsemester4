package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;


@Repository
public interface AccountRepository extends JpaRepository<Account, Integer> {
	@Query("from Account where username=:username")
	public Account findbyUserName(@Param("username") String username);	

	public List<Account> findAccountByAccounttype_accounttypeid(@Param("accounttypeid")int accounttypeid);
	
	public List<Account> findAccountByHotel_hotelid(@Param("hotelid") int hotelid);
	
}
