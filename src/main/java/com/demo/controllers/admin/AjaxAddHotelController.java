package com.demo.controllers.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.demo.models.Account;
import com.demo.models.Addonservice;
import com.demo.models.City;
import com.demo.models.Contractinfo;
import com.demo.models.Contractinforoomtype;
import com.demo.models.ContractinforoomtypeId;
import com.demo.models.Hotel;
import com.demo.models.Hotelseason;
import com.demo.models.NewReservationInfo;
import com.demo.models.Policies;
import com.demo.models.Reservation;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Rooms;
import com.demo.models.Ward;
import com.demo.models.XuanAddonservice;
import com.demo.models.XuanLocation;
import com.demo.models.XuanNewReservationroomdetails;
import com.demo.repositories.HotelSeasonRepository;
import com.demo.service.AddonserviceService;
import com.demo.service.CityService;
import com.demo.service.ContractinfoService;
import com.demo.service.ContractinforoomtypeService;
import com.demo.service.HotelSeasonService;
import com.demo.service.HotelService;
import com.demo.service.PoliciesService;
import com.demo.service.ReservationService;
import com.demo.service.ReservationaddonserviceService;
import com.demo.service.ReservationguestinfoService;
import com.demo.service.ReservationroomdetailsService;
import com.demo.service.RoomTypeService;
import com.demo.service.RoomsService;
import com.demo.service.RoomtypeimageService;
import com.demo.service.WardService;

@RestController
@RequestMapping("ajax/addhotel")
public class AjaxAddHotelController {
	@Autowired
	private HotelService hotelService;
	@Autowired
	private CityService cityService;

	@Autowired
	private WardService wardService;
	@RequestMapping(value = "showlistcity", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<XuanLocation> shownameservice(@RequestParam("provinceid") int provinceid) {
			System.out.println("-----------------");
			 List<XuanLocation> xuanLocations=new ArrayList<XuanLocation>();
			 List<City> cities=cityService.findCityByProvince_provinceid(provinceid);
			 cities.forEach(c->{
				 XuanLocation x=new XuanLocation();
				 x.setCityid(c.getCityid());
				 x.setCityname(c.getCityname());
				 xuanLocations.add(x);
			 });
		return xuanLocations;
	}

	@RequestMapping(value = "showlistward", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<XuanLocation> showlistward(@RequestParam("cityid") int cityid) {
			System.out.println("-----------------");
			 List<XuanLocation> xuanLocations=new ArrayList<XuanLocation>();
			 List<Ward> wards=wardService.findWardByCity_cityid(cityid);
			 wards.forEach(c->{
				 XuanLocation x=new XuanLocation();
				 x.setCityid(c.getWardid());
				 x.setCityname(c.getWardname());
				 xuanLocations.add(x);
			 });
		return xuanLocations;
	}
	
	@RequestMapping(value = { "addhotelaction" }, method = RequestMethod.POST, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)

	public String addhotelaction(
			@RequestParam("ward") int ward,
			@RequestParam("street") String street,
			@RequestParam("hotelname") String hotelname,
			@RequestParam("spa") int spa,
			@RequestParam("pool") int pool,
			@RequestParam( "beach") int beach,
			@RequestParam("bar") int bar,
			@RequestParam( "restaurants") int restaurants,
			@RequestParam( "frontdesk") int frontdesk,
			@RequestParam( "transport") int transport,
			@RequestParam( "shuttle") int shuttle,
			@RequestParam("parking") int parking,
			@RequestParam( "fitnesscenter") int fitnesscenter,
			@RequestParam("description") String description
			) {

				Hotel hotel = new Hotel();
				hotel.setHotelname(hotelname);
				hotel.setWard(wardService.find(ward));
				hotel.setStreet(street);
				hotel.setLogo("dove.png");
				hotel.setSpa(spa);
				hotel.setTransport(transport);
				hotel.setPool(pool);
				hotel.setBeach(beach);
				hotel.setBar(bar);
				hotel.setRestaurants(restaurants);
				hotel.setFrontdesk(frontdesk);
				hotel.setShuttle(shuttle);
				hotel.setParking(parking);
				hotel.setFitnesscenter(fitnesscenter);
				hotel.setDescription(description);
				hotel = hotelService.save(hotel);
				if(hotel !=null) {
					return hotel.getHotelid().toString();
				}else {
					return "0";
				}
				
			}
	
	
	@RequestMapping(value = { "edithotelaction" }, method = RequestMethod.POST, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)

	public String edithotelaction(
			@RequestParam("ward") int ward,
			@RequestParam("street") String street,
			@RequestParam("hotelname") String hotelname,
			@RequestParam("spa") int spa,
			@RequestParam("pool") int pool,
			@RequestParam( "beach") int beach,
			@RequestParam("bar") int bar,
			@RequestParam( "restaurants") int restaurants,
			@RequestParam( "frontdesk") int frontdesk,
			@RequestParam( "transport") int transport,
			@RequestParam( "shuttle") int shuttle,
			@RequestParam("parking") int parking,
			@RequestParam( "fitnesscenter") int fitnesscenter,
			@RequestParam("description") String description,
			@RequestParam("hotelid") int hotelid) {

				Hotel hotel = hotelService.find(hotelid);
				hotel.setHotelname(hotelname);
				hotel.setWard(wardService.find(ward));
				hotel.setStreet(street);
				hotel.setLogo("dove.png");
				hotel.setSpa(spa);
				hotel.setTransport(transport);
				hotel.setPool(pool);
				hotel.setBeach(beach);
				hotel.setBar(bar);
				hotel.setRestaurants(restaurants);
				hotel.setFrontdesk(frontdesk);
				hotel.setShuttle(shuttle);
				hotel.setParking(parking);
				hotel.setFitnesscenter(fitnesscenter);
				hotel.setDescription(description);
				hotel = hotelService.save(hotel);
				if(hotel !=null) {
					return hotel.getHotelid().toString();
				}else {
					return "0";
				}
				
			}
}
