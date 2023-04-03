package com.demo.controllers.hotel;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.demo.models.Addonservice;
import com.demo.models.Contractinfo;
import com.demo.models.Contractinforoomtype;
import com.demo.models.ContractinforoomtypeId;
import com.demo.models.Hotelseason;
import com.demo.models.NewReservationInfo;
import com.demo.models.Policies;
import com.demo.models.Reservation;
import com.demo.models.Reservationguestinfo;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Rooms;
import com.demo.models.XuanAddonservice;
import com.demo.models.XuanNewReservationroomdetails;
import com.demo.repositories.HotelSeasonRepository;
import com.demo.service.AddonserviceService;
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
@RequestMapping("ajax/serviceforroom")
public class AjaxServiceForRoomController {

	@Autowired
	private AddonserviceService addonserviceService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;
	@Autowired
	private RoomsService roomsService;

	@RequestMapping(value = "shownameservice", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public XuanAddonservice shownameservice(@RequestParam("addonserviceid") int addonserviceid,
			@RequestParam(value = "reservationid", required = false) String reservationid) {
		Addonservice addonservice = addonserviceService.find(addonserviceid);
		XuanAddonservice xuanAddonservice = new XuanAddonservice();
		if (addonservice.getNetprice() == 0) {

			double netprice = reservationService.find(Integer.parseInt(reservationid)).getNetprice() / 2;
			xuanAddonservice = new XuanAddonservice(addonservice.getAddonserviceid(),
					addonservice.getAddonservicename(), netprice);
		} else {
			xuanAddonservice = new XuanAddonservice(addonservice.getAddonserviceid(),
					addonservice.getAddonservicename(), addonservice.getPrice());
		}

		return xuanAddonservice;
	}

	private List<Rooms> roomss;
	private int cou;

	@RequestMapping(value = "holdforcheckoutlate", method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public String holdforcheckoutlate(@RequestParam("reservationroomdetailsid") int reservationroomdetailsid,
			@RequestParam("roomtypeid") int roomtypeid) {
		try {
			Reservationroomdetails reservationroomdetails = reservationroomdetailsService
					.find(reservationroomdetailsid);
			String bedtype = reservationroomdetails.getRooms().getRoomtypecontent();
			Date checkin = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.DATE, 1);
			String s = dateFormat.format(c1.getTime());
			Date checkout = new SimpleDateFormat("dd-MM-yyyy").parse(s);

			List<Rooms> allRoom = roomsService.listroombyroomtypeinhotel(roomtypeid);
			List<Reservationroomdetails> busyroom = reservationroomdetailsService.listroombusy(roomtypeid, checkin,
					checkout);
			System.out.println("lis phong ban ");
			busyroom.forEach(r -> {
				System.out.println(r.getRooms().getRoomname());
			});
			List<Rooms> rooms = new ArrayList<Rooms>();
			busyroom.forEach(rb -> {
				Rooms r = new Rooms();
				r.setRoomid(rb.getRooms().getRoomid());
				r.setRoomname(rb.getRooms().getRoomname());
				r.setRoomtype(rb.getRooms().getRoomtype());
				rooms.add(r);
			});
			List<Rooms> availberooms = new ArrayList<Rooms>();
			if (allRoom.size() > rooms.size()) {
				for (var i = 0; i < allRoom.size(); i++) {
					for (var j = 0; j < rooms.size(); j++) {
						if (allRoom.get(i).getRoomid() == rooms.get(j).getRoomid()) {
							allRoom.remove(allRoom.get(i));
						}
					}
				}
			} else {
				allRoom = new ArrayList<Rooms>();
			}
			// List<Rooms> availableroom = roomsService.availableRoom(checkin, checkout,
			// roomtypeid);
			System.out.println("-----");
			allRoom.forEach(r -> {
				System.out.println(r.getRoomname());
			});
			List<Rooms> availableroom = allRoom;
			System.out.println("bedtype " + bedtype);
			roomss = new ArrayList<Rooms>();
			if (bedtype.equalsIgnoreCase("Double")) {
				availableroom.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Double")) {
						roomss.add(r);
					}
				});
			} else if (bedtype.equalsIgnoreCase("Twin")) {
				availableroom.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Twin")) {
						roomss.add(r);
					}
				});
			} else {
				roomss = availableroom;
			}

			cou = 0;
			roomss.forEach(v -> {
				if (v.getRoomid() == reservationroomdetails.getRooms().getRoomid()) {
					cou += 1;
				}
			});

			return String.valueOf(cou);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}

	}

}
