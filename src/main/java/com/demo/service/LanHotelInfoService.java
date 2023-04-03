package com.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import com.demo.models.LanHotelInfo;



public interface LanHotelInfoService {
	
	//Lan code
	public List<LanHotelInfo> selectRecomHotelLow(Pageable pageable);
	public List<LanHotelInfo> selectRecomHotelHigh(Pageable pageable);
	public List<LanHotelInfo> selectRecomHotelMedium(Pageable pageable);
	public List<LanHotelInfo> getHotelByLocationLow(int provinceid);
	public List<LanHotelInfo> getHotelByLocationHigh(int provinceid);
	public List<LanHotelInfo> getHotelByLocationMedium(int provinceid);
	public List<LanHotelInfo> getHotelByLocationCityLow(int cityid);
	public List<LanHotelInfo> getHotelByLocationCityHigh(int cityid);
	public List<LanHotelInfo> getHotelByLocationCityMedium(int cityid);
	public LanHotelInfo getHotelPageInfoLow(int hotelid);
	public LanHotelInfo getHotelPageInfoHigh(int hotelid);
	public LanHotelInfo getHotelPageInfoMedium(int hotelid);
	public List<LanHotelInfo> getHotelByLocationRelativeLow(int provinceid, int hotelid, Pageable pageable);
	public List<LanHotelInfo> getHotelByLocationRelativeHigh(int provinceid, int hotelid, Pageable pageable);
	public List<LanHotelInfo> getHotelByLocationRelativeMedium(int provinceid, int hotelid, Pageable pageable);
	
	//AJAX
	public List<LanHotelInfo> searchAllHotel(int provinceid);
	public List<LanHotelInfo> searchHotelByName(int provinceid, String keyword);
	public List<LanHotelInfo> getHotelByLocationLowAjax(int provinceid);
	public List<LanHotelInfo> getHotelByLocationHighAjax(int provinceid);
	public List<LanHotelInfo> getHotelByLocationMediumAjax(int provinceid);
}
