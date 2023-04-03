package com.demo.controllers.hotel;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.demo.models.*;
import com.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping({ "hotel/rooms" })

public class RoomsController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private RoomsService roomsService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private HotelService hotelService;

	@Autowired
	private RoomTypeService roomTypeService;

	@Autowired
	private ReservationguestinfoService reservationguestinfoService;




	@RequestMapping(value = { "showrooms","showrooms/{typeroomId}","" }, method = RequestMethod.GET)

	public String rooms(@PathVariable(value = "typeroomId",required = false) String typeroomId,HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				int roomId = 1;
				if(typeroomId != null){
					roomId =  Integer.parseInt(typeroomId);
				}

				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				List<Rooms> lsRoom = roomsService.listroombyroomtypeinhotelnothavestatus(roomId);
				Roomtype roomtype =  roomTypeService.find(roomId);
				List<Roomtype> lsRoomType = roomTypeService.findListRoomtypeByHotelid(account.getHotel().getHotelid());
				modelMap.put("typeRoomName", roomtype.getRoomstypename() );
				modelMap.put("roomList", lsRoom);
				modelMap.put("roomTypeList", lsRoomType);
				modelMap.put("typeroomSelected", roomId);
				return "hotel/myhotel/rooms";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "changestatus","" }, method = RequestMethod.POST)
	public ResponseEntity<String> changeStatus(@RequestParam("id")Integer id, @RequestParam("status")int statusId, ModelMap modelMap) {
		Rooms room = roomsService.find(id);
		room.setHotelroomstatus(statusId);
		roomsService.save(room);
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}
	@RequestMapping(value = {"createroom",""}, method = RequestMethod.GET)
	public String createRoomType(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				modelMap.put("roomtype", new Roomtype());
				List<Roomtype> roomTypeList =roomTypeService.findListRoomtypeByHotelid(account.getHotel().getHotelid());
				modelMap.put("roomTypeList", roomTypeList);
				return "hotel/addnew/rooms";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	@RequestMapping(value = {"createroom",""}, method = RequestMethod.POST)
	public String createRoom(@ModelAttribute("room") @Valid Rooms rooms, HttpSession session, ModelMap modelMap) {
		Rooms roomSave = rooms;
		roomSave.setHotelroomstatus(0);
		roomsService.save(rooms);
		return "redirect:/hotel/rooms/showrooms";
	}


	@RequestMapping(value = {"editroom/{roomtype}",""}, method = RequestMethod.GET)
	public String editRoomType(@PathVariable("roomtype") int roomtypeId,HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				Rooms rooms = roomsService.find(roomtypeId);
				List<Roomtype> roomTypeList =roomTypeService.findListRoomtypeByHotelid(account.getHotel().getHotelid());
				modelMap.put("roomTypeList", roomTypeList);
				modelMap.put("room", rooms);
				return "hotel/myhotel/editroom";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	@RequestMapping(value = {"editroom/{roomId}",""}, method = RequestMethod.POST)
	public String editRoomType(@PathVariable("roomId") int roomId,@ModelAttribute("room") @Valid Rooms rooms,HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			//Room save
			Rooms roomResult = roomsService.find(roomId);
			roomResult.setRoomname(rooms.getRoomname());
			roomResult.setRoomtype(rooms.getRoomtype());
			roomResult.setRoomtypecontent(rooms.getRoomtypecontent());

			roomResult.setExtrabed(rooms.getExtrabed());
			roomResult.setHotelroomstatus(rooms.getHotelroomstatus());
			roomsService.save(roomResult);
			String url = "redirect:/hotel/rooms/showrooms/"+rooms.getRoomtype().getRoomstypeid();
			return url;
		}else {
			return "redirect:/account/login";
		}

	}
}
//Toan