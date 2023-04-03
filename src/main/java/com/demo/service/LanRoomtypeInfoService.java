package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import com.demo.models.LanHotelInfo;
import com.demo.models.LanRoomtypeInfo;



public interface LanRoomtypeInfoService {
	
	//Lan code
	public List<LanRoomtypeInfo> getRoomtypePageInfoLow(int hotelid);
	public List<LanRoomtypeInfo> getRoomtypePageInfoHigh(int hotelid);
}
