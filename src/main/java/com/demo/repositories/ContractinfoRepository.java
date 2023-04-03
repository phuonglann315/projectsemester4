package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Contractinfo;
import com.demo.models.Policies;





@Repository
public interface ContractinfoRepository extends CrudRepository<Contractinfo, Integer> {
	
	@Query("from Contractinfo where  hotel.hotelid=:hotelid and contractinfostt=1 and channel='AGENTCHANNEL'")
	public List<Contractinfo> showlistcontract(@Param("hotelid") int hotelid);

	@Query(value = "select distinct year(fromdate) from contractinfo group by fromdate ",nativeQuery = true)
	public List<Integer> findYear();
	@Query("from Contractinfo where  hotel.hotelid=:hotelid and year(fromdate) = :yearnum")
	public List<Contractinfo> showlistcontractwithyear(@Param("hotelid") int hotelid,@Param("yearnum") int yearnum);
	
	//Lan code
	@Query("from Contractinfo where hotel.hotelid=:hotelid and contractinfostt=1 and contractname = 'Traveloto'")
	public Contractinfo findContract(@Param("hotelid") int hotelid);
	
	@Query("from Contractinfo where taxcode=:taxcode and hotel.hotelid=:hotelid   and contractinfostt<2 and year(todate)=:year")
	public List<Contractinfo> findExistAgent(@Param("taxcode") String taxcode, @Param("year") int year,@Param("hotelid") int hotelid);
	
}
