package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Contractinfo;
import com.demo.models.LanHotelInfo;
import com.demo.models.LanRoomtypeInfo;
import com.demo.models.Roomtype;

@Repository
public interface LanRoomtypeInfoRepository extends CrudRepository<Contractinfo, Integer> {

	 @Query("select distinct new com.demo.models.LanRoomtypeInfo(coro.roomtype.hotel, con.contractid, coro.lowseasonprice, "
	  +"coro.roomtype) from Contractinfo con JOIN con.contractinforoomtypes coro "
	  +"where con.contractname = 'Traveloto' and con.contractinfostt = 1 and coro.roomtype.hotel.hotelid = :hotelid "
	  + "order by coro.lowseasonprice asc")
	 public List<LanRoomtypeInfo> getRoomtypePageInfoLow(@Param("hotelid") int hotelid);
	 
	 
	 @Query("select distinct new com.demo.models.LanRoomtypeInfo(coro.roomtype.hotel, con.contractid, coro.hightseasonprice, "
	+"coro.roomtype) from Contractinfo con JOIN con.contractinforoomtypes coro "
	+"where con.contractname = 'Traveloto' and con.contractinfostt = 1 and coro.roomtype.hotel.hotelid = :hotelid "
	+ "order by coro.hightseasonprice asc")
	public List<LanRoomtypeInfo> getRoomtypePageInfoHigh(@Param("hotelid") int hotelid);
	

}
