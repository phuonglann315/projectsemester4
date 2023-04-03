package com.demo.repositories;

import java.util.Date;
import java.util.List;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Policies;

@Repository
public interface PoliciesRepository extends CrudRepository<Policies, Integer> {

	@Query("from Policies where  roomtype.roomstypeid=:roomstypeid and fromdate<=:date and todate>=:date and applyfor=:applyfor and policiesstatus=1")
	public List<Policies> findPoliciesByRoomtypeandApplyfor(@Param("roomstypeid") int roomstypeid,
			@Param("applyfor") String applyfor, @Param("date") Date date);

	@Query("from Policies where roomtype.roomstypeid in (:lsId) and todate > :today")
	public List<Policies> findPoliciesByListRoomtypeHaveExp(@Param("lsId") List<Integer> roomtypeidList,
			@Param("today") Date today);

	
	@Query("from Policies where  roomtype.roomstypeid = :roomtypeid and year(fromdate)=:year and applyfor=:applyfor and policiesstatus<2 ORDER BY year(fromdate)")
	public List<Policies> findPoliciesByListRoomtype(@Param("roomtypeid") int roomtypeid, @Param("year") int year,@Param("applyfor") String applyfor);
			

	@Query("select year(fromdate) from Policies  GROUP BY  year(fromdate) ORDER BY year(fromdate)")
	public List<Integer> findListYear();

	@Query("from Policies where  year(fromdate)=:year and roomtype.hotel.hotelid=:hotelid  ORDER BY year(fromdate)")
	public List<Policies> findPoliciesByYearOFHotelID(@Param("year") int year,@Param("hotelid") int hotelid);
	
	@Query("from Policies where  year(fromdate)=:year and roomtype.roomstypeid=:roomtypeid and applyfor=:applyfor")
	public List<Policies> findPoliciesByYearOFHotelID(@Param("year") int year,@Param("roomtypeid") int roomtypeid,@Param("applyfor") String applyfor);
}
