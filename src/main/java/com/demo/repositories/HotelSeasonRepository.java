package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.demo.models.Hotelseason;





@Repository
public interface HotelSeasonRepository extends JpaRepository<Hotelseason, Integer> {
	
	@Query("from Hotelseason where  hotel.hotelid=:hotelid and fromdate<=:date and todate>=:date and hotelseasonstt=1")
	public Hotelseason findByDate(@Param("hotelid") int hotelid,@Param("date") Date date);
	
	@Query("from Hotelseason where  hotel.hotelid=:hotelid and (fromdate>:checkindate and todate>:checkindate) and (fromdate<:checkoutdate and todate<:checkoutdate)")
	public List<Hotelseason> findListByDate(@Param("hotelid") int hotelid,@Param("checkindate") Date checkindate,@Param("checkoutdate") Date checkoutdate);
	
	@Query("from Hotelseason where hotel.hotelid=:hotelid and year(fromdate) = :year and hotelseasonstt<2")
	public List<Hotelseason> findHotelseasonInYear(@Param("hotelid")int hotelid,@Param("year") int year);
	
	@Query("from Hotelseason where hotel.hotelid=:hotelid and todate  >= :today order by fromdate asc ")
	public List<Hotelseason> listExpSeason( @Param("hotelid") int hotelid, @Param("today") Date today);
	
	@Query("select year(fromdate) from Hotelseason where hotel.hotelid=:hotelid  GROUP BY  year(fromdate) ORDER BY year(fromdate)")
	public List<Integer> findListYear(@Param("hotelid")int hotelid);
	
	@Query("from Hotelseason where hotel.hotelid =  :hotelid")
	public List<Hotelseason> findListHotelSeason(@Param("hotelid") int hotelid);
// Lan code
	@Query("from Hotelseason where fromdate <= :today and todate >= :today")
	public Hotelseason findSeason(@Param("today") Date today);

	@Query("from Hotelseason where fromdate <= :checkin and todate >= :checkout")
	public Hotelseason findSeasonByCheckinout(@Param("checkin") Date checkin, @Param("checkout") Date checkout);
	
}
