package com.demo.controllers.hotel;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

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
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping({ "hotel/roomtype" })

public class RoomtypeController {
	@Autowired
	private AccountService accountService;


	@Autowired
	private RoomsService roomsService;

	@Autowired
	private RoomTypeService roomTypeService;

	@Autowired
	private RoomtypeimageService roomtypeimageService;

	@RequestMapping(value = { "showroomtype" }, method = RequestMethod.GET)

	public String showroomtype(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());

				Hotel hotel = account.getHotel();
				List<Roomtype> roomtypeList = roomTypeService.findListAllRoomtypeByHotelid(hotel.getHotelid());
				modelMap.addAttribute("roomtypeList", roomtypeList);
				return "hotel/myhotel/roomtype";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "changestatus" }, method = RequestMethod.POST)
	public ResponseEntity<String> changeStatus(@RequestParam("id") Integer id, @RequestParam("status") int statusId,
			ModelMap modelMap) {
		Roomtype roomtype = roomTypeService.find(id);
		// Validate
		if (roomtype.getRoomtypestt() == 0 && statusId == 1) {
			List<Roomtypeimage> lsImage = roomtypeimageService.findNameImageofRoomtype(id);
			if (lsImage.size() < 1) {
				return new ResponseEntity<>("Need image to change status", HttpStatus.BAD_REQUEST);
			}
			List<Rooms> lsRoom = roomsService.listroombyroomtypeinhotel(id);
			if (lsRoom.size() < 1) {
				return new ResponseEntity<>("Need rooms to change status", HttpStatus.BAD_REQUEST);
			}
		}
		if (roomtype.getRoomtypestt() == 1 || roomtype.getRoomtypestt() == 2) {
			List<Rooms> lsRoom = roomsService.listroombyroomtypeinhotel(id);
			for (Rooms item : lsRoom) {
				item.setHotelroomstatus(statusId);
				roomsService.save(item);
			}
		}
		roomtype.setRoomtypestt(statusId);

		roomTypeService.save(roomtype);
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}

	@RequestMapping(value = { "createroomtype" }, method = RequestMethod.GET)
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
				return "hotel/addnew/roomtype";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "createroomtype" }, method = RequestMethod.POST)
	public String createRoomType(@ModelAttribute("roomtype") @Valid Roomtype roomtype,
			@RequestParam("editor1") String editor1, @RequestParam("photos") MultipartFile[] photos,
			HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			// Room save
			Roomtype roomSave = roomtype;
			roomSave.setDescription(editor1);
			roomSave.setRoomtypestt(0);
			roomSave.setHotel(account.getHotel());
			roomSave = roomTypeService.save(roomSave);
			// Image save
			if (photos != null && photos.length > 0) {

				for (MultipartFile hinh : photos) {

					String tenhinhmoi = upload(hinh);
					Roomtypeimage roomtypeimage = new Roomtypeimage();
					roomtypeimage.setRoomtypeimagename(tenhinhmoi);
					roomtypeimage.setRoomtype(roomSave);
					roomtypeimageService.save(roomtypeimage);
				}

			}
			return "redirect:/hotel/roomtype/roomtypedetails?roomtypeid="+roomSave.getRoomstypeid();
		} else

		{
			return "redirect:/account/login";
		}
	}

	private String upload(MultipartFile file) {
		try {
			String name = UUID.randomUUID().toString().replace("-", "");
			int lastIndex = file.getOriginalFilename().lastIndexOf(".");
			String fileName = name + file.getOriginalFilename().substring(lastIndex);
			byte[] bytes = file.getBytes();
			Path path = Paths.get(System.getProperty("user.dir") + "/src/main/uploads/room/" + fileName);
			Files.write(path, bytes);
			return fileName;
		} catch (Exception e) {
			return null;
		}
	}

	@RequestMapping(value = { "editroomtype/{roomtype}" }, method = RequestMethod.GET)
	public String editRoomType(@PathVariable("roomtype") int roomtypeId, HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				Roomtype roomtypeResult = roomTypeService.find(roomtypeId);
				List<Roomtypeimage> images = roomtypeimageService.findNameImageofRoomtype(roomtypeId);
				modelMap.put("images", images);
				
				modelMap.put("roomtype", roomtypeResult);
				return "hotel/myhotel/editroomtype";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}

	@RequestMapping(value = { "editroomtype1/{roomtype}" }, method = RequestMethod.GET)
	public String editRoomType1(@PathVariable("roomtype") int roomtypeId, HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				Roomtype roomtypeResult = roomTypeService.find(roomtypeId);
				List<Roomtypeimage> images = roomtypeimageService.findNameImageofRoomtype(roomtypeId);
				modelMap.put("images", images);
				
				modelMap.put("roomtype", roomtypeResult);
				return "hotel/myhotel/editroomtype1";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	@RequestMapping(value = { "editroomtype/{roomtype}" }, method = RequestMethod.POST)
	public String editRoomType(@PathVariable("roomtype") int roomtypeId,
			@ModelAttribute("roomtype") @Valid Roomtype roomtype, @RequestParam("editor1") String editor1,
			@RequestParam("photos") MultipartFile[] photos, HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			// Room save
			Roomtype roomSave = roomTypeService.find(roomtypeId);
			roomSave.setRoomstypename(roomtype.getRoomstypename());
			roomSave.setNumcusdefault(roomtype.getNumcusdefault());
			roomSave.setMaxcus(roomtype.getMaxcus());
			roomSave.setViews(roomtype.getViews());
			roomSave.setDescription(editor1);
			roomSave.setMinibar(roomtype.getMinibar());
			roomSave.setSmoking(roomtype.getSmoking());
			roomSave.setShower(roomtype.getShower());
			roomSave.setBreakfast(roomtype.getBreakfast());
			roomSave.setRoomsize(roomtype.getRoomsize());
			roomSave.setNetprice(roomtype.getNetprice());
			roomSave.setPublicprice(roomtype.getPublicprice());
			roomSave.setHotel(account.getHotel());
			roomSave=roomTypeService.save(roomSave);
			// Image save
						if (photos != null && photos.length > 0) {

							for (MultipartFile hinh : photos) {

								String tenhinhmoi = upload(hinh);
								Roomtypeimage roomtypeimage = new Roomtypeimage();
								roomtypeimage.setRoomtypeimagename(tenhinhmoi);
								roomtypeimage.setRoomtype(roomSave);
								roomtypeimageService.save(roomtypeimage);
							}

						}
			return "redirect:/hotel/roomtype/showroomtype";
		} else {
			return "redirect:/account/login";
		}
	}
	
	
	
	@RequestMapping(value = { "editroomtype1/{roomtype}" }, method = RequestMethod.POST)
	public String editRoomType1(@PathVariable("roomtype") int roomtypeId,
			@RequestParam("photos") MultipartFile[] photos) {
		
			Roomtype roomSave=roomTypeService.find(roomtypeId);
			// Image save
						if (photos != null && photos.length > 0) {

							for (MultipartFile hinh : photos) {

								String tenhinhmoi = upload(hinh);
								Roomtypeimage roomtypeimage = new Roomtypeimage();
								roomtypeimage.setRoomtypeimagename(tenhinhmoi);
								roomtypeimage.setRoomtype(roomSave);
								roomtypeimageService.save(roomtypeimage);
							}

						}
			return "redirect:/hotel/roomtype/roomtypedetails?roomtypeid="+roomtypeId;
		
	}

	@RequestMapping(value = { "roomtypedetails" }, method = RequestMethod.GET)
	public String showRoomtypeDetails(HttpSession session, ModelMap modelMap,
			@RequestParam("roomtypeid") int roomtypeid) {
		if (session.getAttribute("id") != null) {
			int id = Integer.parseInt(session.getAttribute("id").toString());
			Account account = accountService.find(id);
			if (account != null) {
				String role = account.getAccounttype().getAccounttypename().substring(5);
				modelMap.put("accountname", account.getAccountname());
				modelMap.put("role", role);
				modelMap.put("logo", account.getHotel().getLogo());
				modelMap.put("avatar", account.getAvatar());
				modelMap.put("roomtype", roomTypeService.find(roomtypeid));
				List<Roomtypeimage> images = roomtypeimageService.findNameImageofRoomtype(roomtypeid);
				modelMap.put("images", images);
				return "hotel/myhotel/roomtypedetails";
			} else {
				return "redirect:/account/login";
			}
		} else {
			return "redirect:/account/login";
		}
	}
	
	
	@RequestMapping(value = { "deleteimage" }, method = RequestMethod.GET)
	public String deleteimage(@RequestParam("imageid") int imageid,@RequestParam("roomtypeid") int roomtypeid ) {
			roomtypeimageService.delete(imageid);
			Roomtype roomSave = roomTypeService.find(roomtypeid);
			if(roomSave.getRoomtypestt()==0) {
				return "redirect:/hotel/roomtype/editroomtype/"+roomtypeid;
			}else {
				return "redirect:/hotel/roomtype/editroomtype1/"+roomtypeid;
			}
			
		
	}
}
