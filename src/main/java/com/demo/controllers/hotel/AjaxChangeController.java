package com.demo.controllers.hotel;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.demo.models.NewReservationInfo;

import com.demo.models.Reservation;

import com.demo.models.Rooms;

import com.demo.service.ContractinfoService;

import com.demo.service.ReservationService;

import com.demo.service.RoomsService;

@RestController
@RequestMapping("ajax")
public class AjaxChangeController {

	@Autowired
	ContractinfoService contractinfoService;

	@Autowired
	private RoomsService roomsService;

	@Autowired
	private ReservationService reservationService;



	private int availableroom;
	private int checkroomkhacroomtype;

	@RequestMapping(value = "changeroomtype", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public NewReservationInfo changeroomtype(@RequestParam("roomstypeid") int roomstypeid,
			@RequestParam("hotelid") int hotelid, @RequestParam("totalroom") int totalroom,
			@RequestParam("checkindate") String checkindate, @RequestParam("checkoutdate") String checkoutdate,
			@RequestParam("reservationid") int reservationid, @RequestParam("changefee") double changefee,
			@RequestParam("bed") int bed,@RequestParam("oldbed") int oldbed) {

		try {
			System.out.println("-------------------------------------------------Start---------------------------------------------------" );
			NewReservationInfo newReservationInfo = new NewReservationInfo();
			System.out.println("bed truyen vao " + bed);
			System.out.println("roomstypeid truyen vao " + roomstypeid);
			System.out.println("oldbed truyen vao " + oldbed);
			Reservation reservation = reservationService.find(reservationid);
			int oldnight = (int) (reservation.getCheckout().getTime() - reservation.getCheckin().getTime())
					/ (24 * 3600 * 1000);
			Date checkin = new SimpleDateFormat("dd-MM-yyyy").parse(checkindate);
			Date checkout = new SimpleDateFormat("dd-MM-yyyy").parse(checkoutdate);

			int newnight = (int) (checkout.getTime() - checkin.getTime()) / (24 * 3600 * 1000);
			int ttroombyroomtype = roomsService.counttotalroombyroomtypeinhotel(roomstypeid);

			List<Rooms> listavailableRoom = roomsService.availableRoom(checkin, checkout, roomstypeid,checkindate,checkoutdate,bed,oldbed,reservation);
			availableroom = 0;
			checkroomkhacroomtype = 0;
			if(bed==0) {
				listavailableRoom.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Double")) {
						availableroom += 1;						
					}
				});
			}else if(bed==1) {
				listavailableRoom.forEach(r -> {
					if (r.getRoomtypecontent().equalsIgnoreCase("Twin")) {
						availableroom += 1;
					}
				});
			}else if(bed==2) {
				availableroom = listavailableRoom.size();
			}
			
			
			System.out.println("availableroom fianl " + availableroom);
			System.out.println("checkroomkhacroomtype " + checkroomkhacroomtype);
			System.out.println("totalavailable " + listavailableRoom.size());
			List<Rooms> listRoomByRoomtype = roomsService.listroombyroomtypeinhotel(roomstypeid);
			listRoomByRoomtype.forEach(r->{
				if(r.getRoomtypecontent().equalsIgnoreCase("Double") ||r.getRoomtypecontent().equalsIgnoreCase("Twin") ) {
					checkroomkhacroomtype=1;
				}
			});
			//nếu chọn loại giường mà ko có phòng trống cho loại giường đó
			if (bed < 2 && checkroomkhacroomtype ==0) {				
				availableroom = listavailableRoom.size();
				bed = 2;
				newReservationInfo.setWarning("This room type does not have a separate bed type as you choose.Prices shown are according to the bed type available for this room type");
			}
			NewReservationInfo newReservationInfo1 = new NewReservationInfo();
			if (reservation.getContractinfo() == null && reservation.getBookingchannels().equalsIgnoreCase("DIRECTCHANNEL")) {
					
				System.out.println("DIRECTCHANNEL ");
				double roomtypeprice = reservationService.addPrice(roomstypeid, -1, checkin, checkout);
				newReservationInfo1 = DirectChannel(reservation, oldnight, newnight, availableroom, hotelid, roomstypeid,
						checkindate, checkoutdate, totalroom, changefee, roomtypeprice, bed);
			} else {
				System.out.println("AGENTCHANNEL ");
				double roomtypeprice = reservationService.addPrice(roomstypeid,
						reservation.getContractinfo().getContractid(), checkin, checkout);

				newReservationInfo1 = OtherChannel(reservation, oldnight, checkin, checkout, newnight, ttroombyroomtype,
						availableroom, hotelid, roomstypeid, checkindate, checkoutdate, totalroom, changefee,
						roomtypeprice, bed);
			}
			
			
			newReservationInfo.setNight(newReservationInfo1.getNight());
			newReservationInfo.setRoomtypeprice(newReservationInfo1.getRoomtypeprice());
			newReservationInfo.setAvailableroom(newReservationInfo1.getAvailableroom());
			newReservationInfo.setChargefee(newReservationInfo1.getChargefee());
			newReservationInfo.setTotalamout(newReservationInfo1.getTotalamout());
			newReservationInfo.setBed(newReservationInfo1.getBed());
			newReservationInfo.setAmount(newReservationInfo1.getAmount());
			newReservationInfo.setMsg(newReservationInfo1.getMsg());
			return newReservationInfo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	private NewReservationInfo DirectChannel(Reservation reservation, int oldnight, int newnight, int availableroom,
			int hotelid, int roomstypeid, String checkindate, String checkoutdate, int totalroom, double changefee,
			double roomtypeprice, int bed) {
		NewReservationInfo newReservationInfo = new NewReservationInfo();
		System.out.println(" roomtype truyen vao " + roomstypeid);
		System.out.println(" availableroom truyen vao " + availableroom);
		System.out.println(" totalroom truyen vao " + totalroom);
		double newtotal = roomtypeprice * totalroom * newnight;
		if (reservation.getReservationstt() != 1) {
			newReservationInfo = actionNewReservationInfo(reservation, oldnight, newnight, availableroom, hotelid,
					roomstypeid, checkindate, checkoutdate, totalroom, changefee, roomtypeprice, bed);
		} else {
			if (reservation.getPrice() <= newtotal) {
				newReservationInfo = actionNewReservationInfo(reservation, oldnight, newnight, availableroom, hotelid,
						roomstypeid, checkindate, checkoutdate, totalroom, changefee, roomtypeprice, bed);
			} else {
				if(availableroom > totalroom) {
					newReservationInfo.setNight(oldnight);					
					newReservationInfo.setRoomtypeprice(roomtypeprice);
					newReservationInfo.setAvailableroom(totalroom);
					newReservationInfo.setChargefee(-1);
					newReservationInfo.setTotalamout(newtotal);
					newReservationInfo.setBed(bed);
					newReservationInfo.setAmount(newtotal - reservation.getPrice());
					newReservationInfo.setMsg("New bookings need to be of equal or greater value than the old bookings");
				}else {
					newReservationInfo.setNight(oldnight);					
					newReservationInfo.setRoomtypeprice(roomtypeprice);
					newReservationInfo.setAvailableroom(availableroom);
					newReservationInfo.setChargefee(-1);
					newReservationInfo.setTotalamout(newtotal);
					newReservationInfo.setBed(bed);
					newReservationInfo.setAmount(newtotal - reservation.getPrice());
					newReservationInfo.setMsg("according to the request, there are not enough rooms for this room type.There are " + availableroom+
										"rooms available at the moment. The total number of rooms  will be the available number of rooms now. And New bookings need to be of equal or greater value than the old bookings");
				}
			}
		}

		System.out.println(newReservationInfo.toString());
		return newReservationInfo;
	}

	private NewReservationInfo OtherChannel(Reservation reservation, int oldnight, Date checkin, Date checkout,
			int newnight, int ttroombyroomtype, int availableroom, int hotelid, int roomstypeid, String checkindate,
			String checkoutdate, int totalroom, double changefee, double roomtypeprice, int bed) {
		NewReservationInfo newReservationInfo = new NewReservationInfo();
		System.out.println(" roomtype truyen vao " + roomstypeid);
		System.out.println(" availableroom truyen vao " + availableroom);
		System.out.println(" totalroom truyen vao " + totalroom);
		double newtotal = roomtypeprice * totalroom * newnight;
		if (reservation.getReservationstt() != 1) {
			newReservationInfo = actionNewReservationInfo(reservation, oldnight, newnight, availableroom, hotelid,
					roomstypeid, checkindate, checkoutdate, totalroom, changefee, roomtypeprice, bed);
		} else {
			if (reservation.getPrice() <= newtotal) {
				newReservationInfo = actionNewReservationInfo(reservation, oldnight, newnight, availableroom, hotelid,
						roomstypeid, checkindate, checkoutdate, totalroom, changefee, roomtypeprice, bed);
			} else {
				
				if(availableroom > totalroom) {
					newReservationInfo.setNight(oldnight);					
					newReservationInfo.setRoomtypeprice(roomtypeprice);
					newReservationInfo.setAvailableroom(totalroom);
					newReservationInfo.setChargefee(-1);
					newReservationInfo.setTotalamout(newtotal);
					newReservationInfo.setBed(bed);
					newReservationInfo.setAmount(newtotal - reservation.getPrice());
					newReservationInfo.setMsg("New bookings need to be of equal or greater value than the old bookings");
				}else {
					newReservationInfo.setNight(oldnight);					
					newReservationInfo.setRoomtypeprice(roomtypeprice);
					newReservationInfo.setAvailableroom(availableroom);
					newReservationInfo.setChargefee(-1);
					newReservationInfo.setTotalamout(newtotal);
					newReservationInfo.setBed(bed);
					newReservationInfo.setAmount(newtotal - reservation.getPrice());
					newReservationInfo.setMsg("according to the request, there are not enough rooms for this room type.There are " + availableroom+
										"rooms available at the moment. The total number of rooms  will be the available number of rooms now. And New bookings need to be of equal or greater value than the old bookings");
				}
				
			}
		}
		return newReservationInfo;
	}

	// khách chọn ngày khác và số phòng trống đáp ứng được yêu cầu của khách
	private NewReservationInfo chonngaykhacbookingcusophongtrongLonhonsophongyeucau(Reservation reservation,
			int newnight, int totalroom, double roomtypeprice, double changefee, int bed) {
		System.out.println("roomtypeprice " + roomtypeprice);
		NewReservationInfo newReservationInfo = new NewReservationInfo();
		// nếu booking chưa confirm thì đổi miễn phí
		if (reservation.getReservationstt() < 2) {

			newReservationInfo.setNight(newnight);
			newReservationInfo.setRoomtypeprice(roomtypeprice);
			newReservationInfo.setAvailableroom(totalroom);
			newReservationInfo.setChargefee(-1);
			newReservationInfo.setBed(bed);

			newReservationInfo.setTotalamout((double) Math
					.round((roomtypeprice * newReservationInfo.getNight() * newReservationInfo.getAvailableroom()) * 10)
					/ 10);

			// booking chua thanh toan: so tien khach phai tra hoac tra lai cho khach deu =
			// so tien booking moi - so tien khach da tra
			if (reservation.getPayment1() > 0) {// 1
				newReservationInfo.setAmount(newReservationInfo.getTotalamout() - reservation.getPayment1());
			} else {
				newReservationInfo.setAmount(newReservationInfo.getTotalamout());
			}

		}
		// nếu đã confirm thì đổi mất phí
		else {
			System.out.println("-------------------");
			System.out.println("chon ngay khac booking cu so phong trong Lon hon so phong yeu cau vaf stt booking >=2");
			newReservationInfo.setNight(newnight);
			newReservationInfo.setRoomtypeprice(roomtypeprice);
			newReservationInfo.setAvailableroom(totalroom);
			newReservationInfo.setChargefee(changefee);
			newReservationInfo.setBed(bed);
			newReservationInfo.setTotalamout((double) Math
					.round((roomtypeprice * newReservationInfo.getNight() * newReservationInfo.getAvailableroom()) * 10)
					/ 10);
			// neu booking da thanh toan: thi ko hoan lai tien chenh lech cho khach
			// b1: kiem tra xem booking moi co nhiu tien hon booking cu hay ko
			double amount = reservation.getPrice() - newReservationInfo.getTotalamout();
			// neu booking cu co gia < booking moi-> thanh toan chenh lech
			if (amount < 0) {

				newReservationInfo.setAmount(changefee + newReservationInfo.getTotalamout() - reservation.getPrice());
			} // booking cu co gia lon hon booking moi -> khach ko phai thanh toan them tien
			else {
				newReservationInfo.setAmount(changefee);
			}
		}
		return newReservationInfo;
	}

	// khách chọn khác ngày sô phòng trống < số phòng khách yêu cầu thì set lại số
	// lượng phòng yêu cầu = số phòng có sẵn
	private NewReservationInfo chonngaykhacbookingcusophongtrongnhohonsophongyeucau(Reservation reservation,
			int newnight, int availableroom, double roomtypeprice, double changefee, int bed) {
		System.out.println("roomtypeprice " + roomtypeprice);
		System.out.println("-----------------");
	
		System.out.println(" availableroom truyen vao " + availableroom);

		NewReservationInfo newReservationInfo = new NewReservationInfo();
		// nếu booking chưa confirm thì đổi miễn phí
		if (reservation.getReservationstt() < 2) {
			System.out.println("reservation.getReservationstt() < 2");
			newReservationInfo.setMsg(
					"according to the request, there are not enough rooms for this room type.There are " + availableroom
							+ " rooms available at the moment. The total number of rooms  will be the available number of rooms now");
			newReservationInfo.setNight(newnight);
			newReservationInfo.setRoomtypeprice(roomtypeprice);
			newReservationInfo.setAvailableroom(availableroom);
			newReservationInfo.setChargefee(-1);
			newReservationInfo.setBed(bed);
			newReservationInfo.setTotalamout((double) Math.round((roomtypeprice * newReservationInfo.getNight() * newReservationInfo.getAvailableroom()) * 10)/ 10);
					
					
			if (reservation.getPayment1() > 0) {// 2
				newReservationInfo.setAmount(newReservationInfo.getTotalamout() - reservation.getPayment1());
			} else {
				newReservationInfo.setAmount(newReservationInfo.getTotalamout());
			}

		}
		// nếu đã confirm thì đổi mất phí
		else {
			newReservationInfo.setMsg(
					"according to the request, there are not enough rooms for this room type.There are " + availableroom
							+ " rooms available at the moment. The total number of rooms  will be the available number of rooms now");
			newReservationInfo.setNight(newnight);
			newReservationInfo.setRoomtypeprice(roomtypeprice);
			newReservationInfo.setAvailableroom(reservation.getTotalrooms());
			newReservationInfo.setChargefee(changefee);
			newReservationInfo.setBed(bed);
			newReservationInfo.setTotalamout((double) Math
					.round((roomtypeprice * newReservationInfo.getNight() * newReservationInfo.getAvailableroom()) * 10)
					/ 10);
			double amount = reservation.getPrice() - newReservationInfo.getTotalamout();
			// neu booking cu co gia < booking moi-> thanh toan chenh lech
			if (amount < 0) {
				newReservationInfo.setAmount(changefee + newReservationInfo.getTotalamout() - reservation.getPrice());
			} // booking cu co gia lon hon booking moi -> khach ko phai thanh toan them tien
			else {
				newReservationInfo.setAmount(changefee);
			}
		}
		return newReservationInfo;
	}

	// nếu chòn ngày giống booking ban đầu và số phòng trống < số phòng khách yêu
	// cầu thì set lại số lượng phòng yêu cầu = số phòng có sẵn
	private NewReservationInfo chonngaygiongbookingcusophongtrongnhohonsophongyeucau(Reservation reservation,
			int oldnight, int availableroom, double roomtypeprice, double changefee, int bed) {

		NewReservationInfo newReservationInfo = new NewReservationInfo();
		// nếu booking chưa confirm thì đổi miễn phí
		if (reservation.getReservationstt() < 2) {
			newReservationInfo.setMsg(
					"according to the request, there are not enough rooms for this room type.There are " + availableroom
							+ " rooms available at the moment. The total number of rooms  will be the available number of rooms now");
			newReservationInfo.setNight(oldnight);
			newReservationInfo.setRoomtypeprice(roomtypeprice);
			newReservationInfo.setAvailableroom(availableroom);
			newReservationInfo.setChargefee(-1);
			newReservationInfo.setBed(bed);
			System.out.println("availableroom "+availableroom);
			System.out.println("roomtypeprice "+roomtypeprice);
			System.out.println("newReservationInfo.getNight() "+newReservationInfo.getNight());
			System.out.println("newReservationInfo.getAvailableroom() "+newReservationInfo.getAvailableroom());
			newReservationInfo.setTotalamout((double) Math
					.round((roomtypeprice * newReservationInfo.getNight() * newReservationInfo.getAvailableroom()) * 10)
					/ 10);
			System.out.println("Totalamoutamount "+newReservationInfo.getTotalamout());
			if (reservation.getPayment1() > 0) {// 3
				newReservationInfo.setAmount(newReservationInfo.getTotalamout() - reservation.getPrice());
			} else {
				newReservationInfo.setAmount(newReservationInfo.getTotalamout());
			}

		}
		// nếu đã confirm thì đổi mất phí
		else {
			newReservationInfo.setMsg(
					"according to the request, there are not enough rooms for this room type.There are " + availableroom
							+ " rooms available at the moment. The total number of rooms  will be the available number of rooms now");
			newReservationInfo.setNight(oldnight);
			newReservationInfo.setRoomtypeprice(roomtypeprice);
			newReservationInfo.setAvailableroom(reservation.getTotalrooms());
			newReservationInfo.setChargefee(changefee);
			newReservationInfo.setBed(bed);
			newReservationInfo.setTotalamout((double) Math
					.round((roomtypeprice * newReservationInfo.getNight() * newReservationInfo.getAvailableroom()) * 10)
					/ 10);
			double amount = reservation.getPrice() - newReservationInfo.getTotalamout();
			// neu booking cu co gia < booking moi-> thanh toan chenh lech
			if (amount < 0) {
				newReservationInfo.setAmount(changefee + newReservationInfo.getTotalamout() - reservation.getPrice());
			} // booking cu co gia lon hon booking moi -> khach ko phai thanh toan them tien
			else {
				newReservationInfo.setAmount(changefee);
			}
		}
		return newReservationInfo;
	}

	// neu chọn ngày giống booking ban đầu và số lượng phòng trống lớn hơn số lượng
	// phòng yêu cầu
	private NewReservationInfo chonngaygiongbookingcusophongtrongLonhonsophongyeucau(Reservation reservation,
			int oldnight, int totalroom, double roomtypeprice, double changefee, int bed) {

		NewReservationInfo newReservationInfo = new NewReservationInfo();
		// nếu booking chưa confirm thì đổi miễn phí
		if (reservation.getReservationstt() < 2) {
			newReservationInfo.setNight(oldnight);
			newReservationInfo.setRoomtypeprice(roomtypeprice);
			newReservationInfo.setAvailableroom(totalroom);
			newReservationInfo.setChargefee(-1);
			newReservationInfo.setBed(bed);
			newReservationInfo.setTotalamout((double) Math
					.round(roomtypeprice * newReservationInfo.getNight() * newReservationInfo.getAvailableroom() * 10)
					/ 10);
			System.out.println("newReservationInfo.getTotalamout() " + newReservationInfo.getTotalamout());
			if (reservation.getPayment1() > 0) {// 4
				newReservationInfo.setAmount(newReservationInfo.getTotalamout() - reservation.getPayment1());
			} else {
				newReservationInfo.setAmount(newReservationInfo.getTotalamout());
			}

		}
		// nếu đã confirm thì đổi mất phí
		else {

			newReservationInfo.setNight(oldnight);
			newReservationInfo.setRoomtypeprice(roomtypeprice);
			newReservationInfo.setAvailableroom(totalroom);
			newReservationInfo.setChargefee(changefee);
			newReservationInfo.setBed(bed);
			newReservationInfo.setTotalamout((double) Math
					.round((roomtypeprice * newReservationInfo.getNight() * newReservationInfo.getAvailableroom()) * 10)
					/ 10);
			double amount = reservation.getPrice() - newReservationInfo.getTotalamout();
			// neu booking cu co gia < booking moi-> thanh toan chenh lech
			if (amount < 0) {
				System.out.println("booking moi  co gia lon hon booking cu, khach tra chaege fee + chenh lech gia");
				newReservationInfo.setAmount(changefee + newReservationInfo.getTotalamout() - reservation.getPrice());
			} // booking cu co gia lon hon booking moi -> khach ko phai thanh toan them tien
			else {
				newReservationInfo.setAmount(changefee);
			}
		}
		return newReservationInfo;
	}

	private NewReservationInfo actionNewReservationInfo(Reservation reservation, int oldnight, int newnight,
			int availableroom, int hotelid, int roomstypeid, String checkindate, String checkoutdate, int totalroom,
			double changefee, double roomtypeprice, int bed) {
		System.out.println("-----------------");
		System.out.println(" roomtype truyen vao " + roomstypeid);
		System.out.println(" availableroom truyen vao " + availableroom);
		System.out.println(" totalroom truyen vao " + totalroom);
		NewReservationInfo newReservationInfo = new NewReservationInfo();
		if (new SimpleDateFormat("dd-MM-yyyy").format(reservation.getCheckin()).equalsIgnoreCase(checkindate)
				&& new SimpleDateFormat("dd-MM-yyyy").format(reservation.getCheckout())
						.equalsIgnoreCase(checkoutdate)) {

			if (availableroom < totalroom) {
				System.out.println("-----------------");
				System.out.println("chonngaygiongbookingcu sophongtrong nho honsophongyeucau");
				newReservationInfo = chonngaygiongbookingcusophongtrongnhohonsophongyeucau(reservation, oldnight,
						availableroom, roomtypeprice, changefee, bed);
			} else {
				System.out.println("-----------------");
				System.out.println("chonngaygiongbookingcu sophongtrong LON honsophongyeucau");
				if (roomstypeid == reservation.getRoomtype().getRoomstypeid() && reservation.getReservationstt()==2) {
					System.out.println("-----------------");
					System.out.println("giong roomtype");
					System.out.println("bed " + bed);
					newReservationInfo.setNight(oldnight);
					newReservationInfo.setRoomtypeprice(roomtypeprice);
					newReservationInfo.setAvailableroom(totalroom);
					newReservationInfo.setChargefee(-1);
					newReservationInfo.setBed(bed);
					newReservationInfo.setTotalamout(reservation.getPrice());
					if (reservation.getReservationstt() <2) {
						System.out.println("reservation.getPayment1() != 0");
						newReservationInfo.setAmount(newReservationInfo.getTotalamout() - reservation.getPayment1());
					} else {

						newReservationInfo.setAmount(0);
					}

				} else { 
					System.out.println("-----------------");
					System.out.println("chonngay giong bookingcusophongtrong Lon honsophongyeucau");
					newReservationInfo = chonngaygiongbookingcusophongtrongLonhonsophongyeucau(reservation, oldnight,
							totalroom, roomtypeprice, changefee, bed);
				}

			}
		} else {
			if (availableroom < totalroom) {
				System.out.println("-----------------");
				System.out.println("chonngay khac bookingcusophongtrong nho honsophongyeucau");
				newReservationInfo = chonngaykhacbookingcusophongtrongnhohonsophongyeucau(reservation, newnight,
						availableroom, roomtypeprice, changefee, bed);
			} else {
				System.out.println("-----------------");
				System.out.println("chonngay khac booking cusophongtrong Lon honsophongyeucau");
				newReservationInfo = chonngaykhacbookingcusophongtrongLonhonsophongyeucau(reservation, newnight,
						totalroom, roomtypeprice, changefee, bed);
			
			}
		}

		return newReservationInfo;
	}

}
