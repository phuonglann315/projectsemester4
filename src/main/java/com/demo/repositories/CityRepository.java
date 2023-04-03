package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.models.City;
import com.demo.models.Reservation;

@Repository
public interface CityRepository extends JpaRepository<City, Integer> {

	// Xuan code 
	public List<City> findCityByProvince_provinceid(int provinceid);

	 
}
