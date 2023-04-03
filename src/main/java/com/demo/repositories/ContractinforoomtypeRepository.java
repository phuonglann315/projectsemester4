package com.demo.repositories;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Contractinfo;
import com.demo.models.Contractinforoomtype;
import com.demo.models.ContractinforoomtypeId;
import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Roomtype;




@Repository
public interface ContractinforoomtypeRepository extends CrudRepository<Contractinforoomtype, ContractinforoomtypeId> {

	
	@Query("from Contractinforoomtype where contractinfo.contractid=:contractid and roomtype.roomstypeid = :roomstypeid")
	public Contractinforoomtype findRoomPrice(@Param("contractid") int contractid, @Param("roomstypeid") int roomstypeid);

}
