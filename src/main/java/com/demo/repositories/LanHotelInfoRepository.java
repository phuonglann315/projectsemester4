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

@Repository
public interface LanHotelInfoRepository extends CrudRepository<Contractinfo, Integer> {

	@Query("select new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min(ro.lowseasonprice), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 "
			+ "GROUP BY ro.roomtype.hotel.hotelid order by ro.roomtype.hotel.totalrating desc")
	public List<LanHotelInfo> selectRecomHotelLow(Pageable pageable);
	
	@Query("select new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min(ro.hightseasonprice), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 "
			+ "GROUP BY ro.roomtype.hotel.hotelid order by ro.roomtype.hotel.totalrating desc")
	public List<LanHotelInfo> selectRecomHotelHigh(Pageable pageable);
	
	@Query("select new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min((ro.hightseasonprice + ro.lowseasonprice)/2), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 "
			+ "GROUP BY ro.roomtype.hotel.hotelid order by ro.roomtype.hotel.totalrating desc")
	public List<LanHotelInfo> selectRecomHotelMedium(Pageable pageable);

	@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min(ro.lowseasonprice), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.ward.city.province.provinceid = :provinceid "
			+ "GROUP BY ro.roomtype.hotel.hotelid")
	public List<LanHotelInfo> getHotelByLocationLow(@Param("provinceid") int provinceid);
	
	@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min(ro.hightseasonprice), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.ward.city.province.provinceid = :provinceid "
			+ "GROUP BY ro.roomtype.hotel.hotelid")
	public List<LanHotelInfo> getHotelByLocationHigh(@Param("provinceid") int provinceid);
	
	@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min((ro.hightseasonprice + ro.lowseasonprice)/2), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.ward.city.province.provinceid = :provinceid "
			+ "GROUP BY ro.roomtype.hotel.hotelid")
	public List<LanHotelInfo> getHotelByLocationMedium(@Param("provinceid") int provinceid);
	
	
	@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min(ro.lowseasonprice), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 "
			+ "and ro.roomtype.hotel.ward.city.province.provinceid = :provinceid and ro.roomtype.hotel.hotelid != :hotelid "
			+ "GROUP BY ro.roomtype.hotel.hotelid order by ro.roomtype.hotel.totalrating desc")
	public List<LanHotelInfo> getHotelByLocationRelativeLow(@Param("provinceid") int provinceid, @Param("hotelid") int hotelid, Pageable pageable);
	
	
	@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min(ro.hightseasonprice), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 "
			+ "and ro.roomtype.hotel.ward.city.province.provinceid = :provinceid and ro.roomtype.hotel.hotelid != :hotelid "
			+ "GROUP BY ro.roomtype.hotel.hotelid order by ro.roomtype.hotel.totalrating desc")
	public List<LanHotelInfo> getHotelByLocationRelativeHigh(@Param("provinceid") int provinceid, @Param("hotelid") int hotelid, Pageable pageable);

	@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min((ro.hightseasonprice + ro.lowseasonprice)/2), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 "
			+ "and ro.roomtype.hotel.ward.city.province.provinceid = :provinceid and ro.roomtype.hotel.hotelid != :hotelid "
			+ "GROUP BY ro.roomtype.hotel.hotelid order by ro.roomtype.hotel.totalrating desc")
	public List<LanHotelInfo> getHotelByLocationRelativeMedium(@Param("provinceid") int provinceid, @Param("hotelid") int hotelid, Pageable pageable);
	
	
	@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min(ro.lowseasonprice), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.ward.city.cityid = :cityid "
			+ "GROUP BY ro.roomtype.hotel.hotelid")
	public List<LanHotelInfo> getHotelByLocationCityLow(@Param("cityid") int cityid);
	
	@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min(ro.hightseasonprice), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.ward.city.cityid = :cityid "
			+ "GROUP BY ro.roomtype.hotel.hotelid")
	public List<LanHotelInfo> getHotelByLocationCityHigh(@Param("cityid") int cityid);
	
	@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, "
			+ "min(ro.hightseasonprice), ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
			+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
			+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.ward.city.cityid = :cityid "
			+ "GROUP BY ro.roomtype.hotel.hotelid")
	public List<LanHotelInfo> getHotelByLocationCityMedium(@Param("cityid") int cityid);

	 @Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, min(ro.lowseasonprice), "
	  +"ro.roomtype, min(im.imagehotelid), im.hotelimagename) " +
	  "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
	  +"where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.hotelid = :hotelid") 
	 public LanHotelInfo getHotelPageInfoLow(@Param("hotelid") int hotelid);
	 
	 @Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, min(ro.hightseasonprice), "
		+"ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
		+"from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
		+"where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.hotelid = :hotelid") 
	 	public LanHotelInfo getHotelPageInfoHigh(@Param("hotelid") int hotelid);
	 
	 @Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel, co.contractid, min(ro.hightseasonprice), "
	 +"ro.roomtype, min(im.imagehotelid), im.hotelimagename) "
	 +"from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
	 +"where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.hotelid = :hotelid") 
	 public LanHotelInfo getHotelPageInfoMedium(@Param("hotelid") int hotelid);
	 
	 //AJAX
	 @Query("select new com.demo.models.LanHotelInfo(hotelid, hotelname) from Hotel where "
	 		+ "ward.city.province.provinceid = :provinceid")
		public List<LanHotelInfo> searchAllHotel(@Param("provinceid") int provinceid);
	 
	 @Query("select new com.demo.models.LanHotelInfo(hotelid, hotelname) from Hotel where "
		 		+ "ward.city.province.provinceid = :provinceid and hotelname like %:keyword%")
			public List<LanHotelInfo> searchHotelByName(@Param("provinceid") int provinceid, @Param("keyword") String keyword);
	 
	 @Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel.hotelid, ro.roomtype.hotel.hotelname, "
	 			+ "ro.roomtype.hotel.ward.wardname, ro.roomtype.hotel.ward.city.cityname, ro.roomtype.publicprice, co.contractid, "
				+ "ro.roomtype.roomstypeid, min(ro.lowseasonprice), min(im.imagehotelid), im.hotelimagename) "
				+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
				+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.ward.city.province.provinceid = :provinceid "
				+ "GROUP BY ro.roomtype.hotel.hotelid")
		public List<LanHotelInfo> getHotelByLocationLowAjax(@Param("provinceid") int provinceid);
		
		@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel.hotelid, ro.roomtype.hotel.hotelname, "
				+ "ro.roomtype.hotel.ward.wardname, ro.roomtype.hotel.ward.city.cityname, ro.roomtype.publicprice, co.contractid, "
				+ "ro.roomtype.roomstypeid, min(ro.hightseasonprice), min(im.imagehotelid), im.hotelimagename ) "
				+ "from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
				+ "where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.ward.city.province.provinceid = :provinceid "
				+ "GROUP BY ro.roomtype.hotel.hotelid")
		public List<LanHotelInfo> getHotelByLocationHighAjax(@Param("provinceid") int provinceid);
		
		@Query("select distinct new com.demo.models.LanHotelInfo(ro.roomtype.hotel.hotelid, ro.roomtype.hotel.hotelname, "
				+"ro.roomtype.hotel.ward.wardname, ro.roomtype.hotel.ward.city.cityname, ro.roomtype.publicprice, co.contractid, "
				+"ro.roomtype.roomstypeid, min((ro.hightseasonprice + ro.lowseasonprice)/2), min(im.imagehotelid), im.hotelimagename) "
				+"from Contractinfo co JOIN co.contractinforoomtypes ro JOIN ro.roomtype.hotel.hotelimages im "
				+"where co.contractname = 'Traveloto' and co.contractinfostt = 1 and ro.roomtype.hotel.ward.city.province.provinceid = :provinceid "
				+"GROUP BY ro.roomtype.hotel.hotelid")
		public List<LanHotelInfo> getHotelByLocationMediumAjax(@Param("provinceid") int provinceid);

}
