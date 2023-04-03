package com.demo.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.demo.models.Reservationaddonservice;
import com.demo.repositories.ReservationaddonserviceRepository;

@Service
public class ReservationaddonserviceServiceImpl implements ReservationaddonserviceService {

	@Autowired
	private ReservationaddonserviceRepository reservationaddonserviceRepository;

	@Override
	public Iterable<Reservationaddonservice> findAll() {
		return reservationaddonserviceRepository.findAll();

	}

	@Override
	public Reservationaddonservice find(int id) {
		return reservationaddonserviceRepository.findById(id).orElse(null);
	}

	@Override
	public Reservationaddonservice save(Reservationaddonservice reservationaddonservice) {
		return reservationaddonserviceRepository.save(reservationaddonservice);
	}

	@Override
	public double totalAddonServiceByreservationidAndpaymentstt(int reservationid, int paymentstt) {
		return (reservationaddonserviceRepository.checkaddonservice(reservationid, paymentstt) > 0)
				? reservationaddonserviceRepository.totalAddonServiceByreservationidAndpaymentstt(reservationid,
						paymentstt)
				: 0;

	}

	@Override
	public double totalAddonServiceByreservationid(int reservationid,int paymentstt) {
		if(listAddonServiceByreservationidAndpaymentstt(reservationid, paymentstt).size() >0) {
		
		return reservationaddonserviceRepository.totalAddonServiceByreservationid(reservationid,paymentstt);
		}
		 return 0;

	}



	@Override
	public double totalAddonServiceByreservationidandRoomsID(int reservationroomdetailsid) {
		try {
			List<Reservationaddonservice> l= AddonServiceByreservationid( reservationroomdetailsid,0);
			if (l.size() > 0) {
				return reservationaddonserviceRepository
						.totalAddonServiceByreservationidandRoomsID(reservationroomdetailsid);
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public Boolean delete(int id) {
		try {
			reservationaddonserviceRepository.deleteById(id);
			return true;

		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Reservationaddonservice> AddonServiceByreservationid(int reservationroomdetailsid,int paymentstt) {
		return reservationaddonserviceRepository.AddonServiceByreservationid(reservationroomdetailsid, paymentstt);
	}

	@Override
	public List<Reservationaddonservice> listAddonServiceByreservationidAndpaymentstt(int reservationid,
			int paymentstt) {
		return  reservationaddonserviceRepository.listAddonServiceByreservationidAndpaymentstt(reservationid,paymentstt);
	}

	@Override
	public List<Reservationaddonservice> AddonServiceByreservationid(int reservationroomdetailsid) {
		// TODO Auto-generated method stub
		return reservationaddonserviceRepository.AddonServiceByreservationid(reservationroomdetailsid);
	}


	

}
