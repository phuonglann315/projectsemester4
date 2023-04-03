package com.demo.service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;


import com.demo.models.LanHotelInfo;
import com.demo.repositories.LanHotelInfoRepository;


@Service
public  class LanHotelInfoServiceImpl implements LanHotelInfoService{

	@Autowired
	private LanHotelInfoRepository lanHotelInfoRepository;
		
	//Lan code
	@Override
	public List<LanHotelInfo> selectRecomHotelLow(Pageable pageable) {
		return lanHotelInfoRepository.selectRecomHotelLow(pageable);
	}


	@Override
	public List<LanHotelInfo> selectRecomHotelHigh(Pageable pageable) {
		return lanHotelInfoRepository.selectRecomHotelHigh(pageable);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationLow(int provinceid) {
		return lanHotelInfoRepository.getHotelByLocationLow(provinceid);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationHigh(int provinceid) {
		return lanHotelInfoRepository.getHotelByLocationHigh(provinceid);
	}
	
	@Override
	public List<LanHotelInfo> getHotelByLocationMedium(int provinceid) {
		return lanHotelInfoRepository.getHotelByLocationMedium(provinceid);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationCityLow(int cityid) {
		return lanHotelInfoRepository.getHotelByLocationCityLow(cityid);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationCityHigh(int cityid) {
		return lanHotelInfoRepository.getHotelByLocationCityHigh(cityid);
	}


	@Override
	public LanHotelInfo getHotelPageInfoLow(int hotelid) {
		return lanHotelInfoRepository.getHotelPageInfoLow(hotelid);
	}


	@Override
	public LanHotelInfo getHotelPageInfoHigh(int hotelid) {
		return lanHotelInfoRepository.getHotelPageInfoHigh(hotelid);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationRelativeLow(int provinceid, int hotelid, Pageable pageable) {
		return lanHotelInfoRepository.getHotelByLocationRelativeLow(provinceid, hotelid, pageable);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationRelativeHigh(int provinceid, int hotelid, Pageable pageable) {
		return lanHotelInfoRepository.getHotelByLocationRelativeHigh(provinceid, hotelid, pageable);
	}


	@Override
	public List<LanHotelInfo> searchAllHotel(int provinceid) {
		return lanHotelInfoRepository.searchAllHotel(provinceid);
	}


	@Override
	public List<LanHotelInfo> searchHotelByName(int provinceid, String keyword) {
		return lanHotelInfoRepository.searchHotelByName(provinceid, keyword);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationLowAjax(int provinceid) {
		return lanHotelInfoRepository.getHotelByLocationLowAjax(provinceid);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationHighAjax(int provinceid) {
		return lanHotelInfoRepository.getHotelByLocationHighAjax(provinceid);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationMediumAjax(int provinceid) {
		return lanHotelInfoRepository.getHotelByLocationMediumAjax(provinceid);
	}


	@Override
	public List<LanHotelInfo> selectRecomHotelMedium(Pageable pageable) {
		return lanHotelInfoRepository.selectRecomHotelMedium(pageable);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationCityMedium(int cityid) {
		return lanHotelInfoRepository.getHotelByLocationCityMedium(cityid);
	}


	@Override
	public LanHotelInfo getHotelPageInfoMedium(int hotelid) {
		return lanHotelInfoRepository.getHotelPageInfoMedium(hotelid);
	}


	@Override
	public List<LanHotelInfo> getHotelByLocationRelativeMedium(int provinceid, int hotelid, Pageable pageable) {
		return lanHotelInfoRepository.getHotelByLocationRelativeMedium(provinceid, hotelid, pageable);
	}
 
}
