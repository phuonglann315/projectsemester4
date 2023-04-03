package com.demo.controllers.hotel;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demo.models.Account;
import com.demo.models.Contractinfo;
import com.demo.models.Contractinforoomtype;
import com.demo.models.ContractinforoomtypeId;
import com.demo.models.Hotelseason;
import com.demo.models.NewReservationInfo;
import com.demo.models.Policies;
import com.demo.models.Reservation;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Reservationroomdetails;
import com.demo.models.XuanNewReservationroomdetails;
import com.demo.repositories.HotelSeasonRepository;
import com.demo.service.ContractinfoService;
import com.demo.service.ContractinforoomtypeService;
import com.demo.service.HotelSeasonService;
import com.demo.service.PoliciesService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationaddonserviceService;
import com.demo.service.ReservationguestinfoService;
import com.demo.service.ReservationroomdetailsService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;
import com.demo.service.RoomtypeimageService;

@RestController
@RequestMapping("ajax/search")
public class AjaxSearchByRoomNameController {

	@Autowired
	private ReservationguestinfoService reservationguestinfoService;

	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;


	@Autowired
	private ReservationaddonserviceService reservationaddonserviceService;

	

	@RequestMapping(value = "searchByRoomName", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<XuanNewReservationroomdetails> searchByRoomName(@RequestParam("reservationid") int reservationid,@RequestParam(value="searchroomindetailsbooking",required = false) String searchroomindetailsbooking) {
		List<XuanNewReservationroomdetails> listXuanNewReservationroomdetails=new ArrayList<XuanNewReservationroomdetails>();
		List<Reservationroomdetails> reservationroomdetails =new ArrayList<Reservationroomdetails>();
		if ( searchroomindetailsbooking != null) {
			reservationroomdetails = reservationroomdetailsService
					.findListByReservationidandRoomname(reservationid,
							searchroomindetailsbooking);
			
			if (reservationroomdetails.size() < 0) {
				reservationroomdetails= reservationroomdetailsService.findListByReservationid(reservationid);						
			} 
		} else {
			reservationroomdetails= reservationroomdetailsService.findListByReservationid(reservationid);
		}
		reservationroomdetails.forEach(x->{
			System.out.println(x.getRooms().getRoomname());
		});
		
		reservationroomdetails.forEach(rsr->{
			XuanNewReservationroomdetails x=new XuanNewReservationroomdetails();
			x.setReservationid(reservationid);
			x.setRoomid(rsr.getRooms().getRoomid());
			x.setReservationroomdetailsid(rsr.getReservationroomdetailsid());
			x.setRoomName(rsr.getRooms().getRoomname());
			List<String> cusName= new ArrayList<String>();
			List<Reservationguestinfo> listCus=reservationguestinfoService.getlistCusbyreservationroomdetailsid(rsr.getReservationroomdetailsid());
			if(listCus.size()>0) {
				listCus.forEach(c->{
					
					cusName.add(c.getGuestname());
				});
			}
			x.setCustomername(cusName);
			var totalAmountByRoom=reservationaddonserviceService.totalAddonServiceByreservationidandRoomsID( rsr.getReservationroomdetailsid());
			x.setAmount(totalAmountByRoom);
			int stt=rsr.getReservationroomtypestt();		
			switch (stt) {
			case 0: {
				x.setReservationroomtypestt("Hold");
				  break;
			}
			case 1: {
				x.setReservationroomtypestt("Deposit");
				  break;
			}
			case 2: {
				x.setReservationroomtypestt("Confirm");
				  break;
			}
			case 3: {
				x.setReservationroomtypestt("Staying");
				  break;
			}
			case 4: {
				x.setReservationroomtypestt("Check-out");
				  break;
			}
			case 5: {
				x.setReservationroomtypestt("Expired");
				  break;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + stt);
			}
			listXuanNewReservationroomdetails.add(x);
			
		});
		return listXuanNewReservationroomdetails;
	}

	@RequestMapping(value = "sort", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<XuanNewReservationroomdetails> sort(@RequestParam("reservationid") int reservationid,@RequestParam(value="searchroomindetailsbooking",required = false) String searchroomindetailsbooking,@RequestParam("sortType") int sortType) {
		List<XuanNewReservationroomdetails> listXuanNewReservationroomdetails=searchByRoomName(reservationid, searchroomindetailsbooking);
		switch (sortType) {
		case 0: {
			return listXuanNewReservationroomdetails.stream().sorted(Comparator.comparing(XuanNewReservationroomdetails::getAmount).reversed()).collect(Collectors.toList());			
		}
	
		default:
			return listXuanNewReservationroomdetails;
		}
	}
	
	

}
