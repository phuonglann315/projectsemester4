package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.models.Ward;




@Repository
public interface WardRepository extends JpaRepository<Ward, Integer> {

	// Xuan code 
	public List<Ward> findWardByCity_cityid(int cityid);

	 
}
