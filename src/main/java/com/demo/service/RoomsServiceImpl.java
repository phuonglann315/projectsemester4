package com.demo.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Hotel;
import com.demo.models.Reservation;
import com.demo.models.Reservationroomdetails;
import com.demo.models.Rooms;
import com.demo.models.Roomtype;
import com.demo.repositories.HotelRepository;
import com.demo.repositories.ReservationRepository;
import com.demo.repositories.RoomRepository;
import com.demo.repositories.RoomtypeRepository;

@Service
public class RoomsServiceImpl implements RoomsService {

	@Autowired
	private RoomRepository roomRepository;

	@Autowired
	private ReservationroomdetailsService reservationroomdetailsService;

	@Override
	public Iterable<Rooms> findAll() {
		// TODO Auto-generated method stub
		return roomRepository.findAll();
	}

	@Override
	public Rooms find(int roomid) {
		// TODO Auto-generated method stub
		return roomRepository.findById(roomid).orElse(null);
	}

	@Override
	public Rooms save(Rooms rooms) {
		// TODO Auto-generated method stub
		return roomRepository.save(rooms);
	}

	@Override
	public int counttotalroombyroomtypeinhotel(int roomstypeid) {
		return roomRepository.counttotalroombyroomtypeinhotel(roomstypeid);
	}

	@Override
	public List<Rooms> listroombyroomtypeinhotel(int roomstypeid) {
		// TODO Auto-generated method stub
		return roomRepository.listroombyroomtypeinhotel(roomstypeid);
	}
	List<Rooms> allRoom;

	private int checkroom;
	@Override
	public List<Rooms> availableRoom(Date checkindate, Date checkoutDate, int roomtypeid, String checkin, String checkout, int bed, int oldbed, Reservation reservation) {
		//b1: tim ra tat ca cac phong trong chua bao gom phong da giu của loại phòng này
		allRoom=new ArrayList<Rooms>();
		allRoom = listroombyroomtypeinhotel(roomtypeid);
		List<Reservationroomdetails> busyroom = reservationroomdetailsService.listroombusy(roomtypeid, checkindate,
				checkoutDate);
		busyroom.forEach(r->{
			System.out.println(r.getRooms().getRoomname());
		});
		List<Rooms> rooms = new ArrayList<Rooms>();
		busyroom.forEach(rb -> {
			Rooms r = new Rooms();
			r.setRoomid(rb.getRooms().getRoomid());
			r.setRoomname(rb.getRooms().getRoomname());
			r.setRoomtype(rb.getRooms().getRoomtype());
			r.setRoomtypecontent(rb.getRooms().getRoomtypecontent());
			rooms.add(r);
		});
		
		if (allRoom.size() > rooms.size()) {
			for (var i = 0; i < allRoom.size(); i++) {
				for (var j = 0; j < rooms.size(); j++) {
					if (allRoom.get(i).getRoomid() == rooms.get(j).getRoomid()) {
						allRoom.remove(allRoom.get(i));
					}
				}
			}
		} else {
			allRoom= new ArrayList<Rooms>();
		}
		
		// khach muon doi loại giuong ->xet roomtypeid khach muon == oldreoomtype va cung ngay CI, CO, chi khac bed va old bed: 
		/*Tức là khách muốn chuyển twin hoặc double HOẶC từ twin / double sang allbed
		 * lấy ra list phòng đang giữ của booking này	 
		 * allroom.add cái list con này
		 * tiếp tục cho allroom chạy, lấy ra list phòng có bed giống bed theo yêu
		 * 
		 * */
		if((new SimpleDateFormat("dd-MM-yyyy").format(reservation.getCheckin()).equalsIgnoreCase(checkin)
				&& new SimpleDateFormat("dd-MM-yyyy").format(reservation.getCheckout())
				.equalsIgnoreCase(checkout))
		&& roomtypeid == reservation.getRoomtype().getRoomstypeid()) {
			List<Reservationroomdetails> listRoomofReservation = reservationroomdetailsService.listroomwithstt(reservation.getReservationid(),reservation.getReservationstt());
			List<Rooms> rooms2 = new ArrayList<Rooms>();
			listRoomofReservation.forEach(rb -> {
				Rooms r = new Rooms();
				r.setRoomid(rb.getRooms().getRoomid());
				r.setRoomname(rb.getRooms().getRoomname());
				r.setRoomtype(rb.getRooms().getRoomtype());
				r.setRoomtypecontent(rb.getRooms().getRoomtypecontent());
				rooms2.add(r);
			});
			rooms2.forEach(r->{
				allRoom.add(r);
			});
		}
		
		
		
		return allRoom;
	}

	@Override
	public List<Rooms> availableRoom(Date checkindate, Date checkoutDate, int roomtypeid) {
		allRoom=new ArrayList<Rooms>();
		 allRoom = listroombyroomtypeinhotel(roomtypeid);
		List<Reservationroomdetails> busyroom = reservationroomdetailsService.listroombusy(roomtypeid, checkindate,
				checkoutDate);
		busyroom.forEach(r->{
			System.out.println(r.getRooms().getRoomname());
		});
		List<Rooms> rooms = new ArrayList<Rooms>();
		busyroom.forEach(rb -> {
			Rooms r = new Rooms();
			r.setRoomid(rb.getRooms().getRoomid());
			r.setRoomname(rb.getRooms().getRoomname());
			r.setRoomtype(rb.getRooms().getRoomtype());
			r.setRoomtypecontent(rb.getRooms().getRoomtypecontent());
			rooms.add(r);
		});
		
		if (allRoom.size() > rooms.size()) {
			for (var i = 0; i < allRoom.size(); i++) {
				for (var j = 0; j < rooms.size(); j++) {
					if (allRoom.get(i).getRoomid() == rooms.get(j).getRoomid()) {
						allRoom.remove(allRoom.get(i));
					}
				}
			}
		} else {
			allRoom= new ArrayList<Rooms>();
		}
	
		
		
		
		return allRoom;
	}

	@Override
	public List<Rooms> listroombyroomtypeinhotelnothavestatus(int roomstypeid) {
		return roomRepository.listroombyroomtypeinhotelnothavestatus(roomstypeid);
	}

	@Override
	public int countAllRoom(int roomtypeid) {
		return roomRepository.counttotalroombyroomtypeinhotelnothavestatus(roomtypeid);
	}
	
	@Override
	public List<Rooms> listroombyroomtypeactive(int roomstypeid){
		return roomRepository.listroombyroomtypeactive(roomstypeid);
	};
}
