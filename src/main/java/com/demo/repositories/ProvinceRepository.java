package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.LanLocation;
import com.demo.models.Province;

@Repository
public interface ProvinceRepository extends CrudRepository<Province, Integer> {

	// Lan code

	@Query("select new com.demo.models.LanLocation(provinceid, provincename) from Province")
	public List<LanLocation> getAllProvince();
	
	@Query("select new com.demo.models.LanLocation(provinceid, provincename) from Province where provincename like %:keyword%")
	public List<LanLocation> searchProvince(@Param("keyword") String keyword);
	
	@Query("select new com.demo.models.LanLocation(wa.wardid, wa.wardname) from Ward wa JOIN wa.city.province pro where pro.provinceid = :provinceid")
	public List<LanLocation> searchWard(@Param("provinceid") int provinceid);

	 //Xuan code cho Phuoc Ga
	
}
