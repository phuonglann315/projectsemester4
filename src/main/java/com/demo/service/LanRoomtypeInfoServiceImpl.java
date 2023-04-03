package com.demo.service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


import com.demo.models.LanHotelInfo;
import com.demo.models.LanRoomtypeInfo;
import com.demo.repositories.LanHotelInfoRepository;
import com.demo.repositories.LanRoomtypeInfoRepository;


@Service
public  class LanRoomtypeInfoServiceImpl implements LanRoomtypeInfoService{

	@Autowired
	private LanRoomtypeInfoRepository lanRoomtypeInfoRepository;

	@Override
	public List<LanRoomtypeInfo> getRoomtypePageInfoLow(int hotelid) {
		return lanRoomtypeInfoRepository.getRoomtypePageInfoLow(hotelid);
	}

	@Override
	public List<LanRoomtypeInfo> getRoomtypePageInfoHigh(int hotelid) {
		return lanRoomtypeInfoRepository.getRoomtypePageInfoHigh(hotelid);
	}
}
