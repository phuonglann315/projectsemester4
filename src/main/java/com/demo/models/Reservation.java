package com.demo.models;
// Generated Dec 22, 2022, 7:02:26 PM by Hibernate Tools 4.3.6.Final

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "reservation", catalog = "doanky4")
public class Reservation implements java.io.Serializable {

	private Integer reservationid;
	private Account account;
	private Contractinfo contractinfo;
	private Reservation reservation;
	private Roomtype roomtype;
	private String reservationidcode;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date checkin;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date checkout;
	private int totalrooms;
	private String customername;
	private String customerphone;
	private String customeremail;
	private Double payment1;
	private Date paymentdat1;
	private Double payment2;
	private Date paymentdat2;
	private Double refundamount;
	private Date refunddate;
	private int reservationstt;
	private BigDecimal rating;
	private String customercomment;
	private String replyfromhotel;
	private Double chargefee;
	private double netprice;
	private double price;
	private Double servicefee;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date createday;
	private String paymentchannel1;
	private String paymentsnote1;
	private String paymentchannel2;
	private String paymentsnote2;
	private Integer createby;
	@DateTimeFormat(pattern = "dd-MM-yyyy HH:mm:ss")
	private Date deadline;
	private String note;
	private String bookingchannels;
	private Set<Reservation> reservations = new HashSet<Reservation>(0);
	private Set<Reservationroomdetails> reservationroomdetailses = new HashSet<Reservationroomdetails>(0);

	public Reservation() {
	}

	public Reservation(Roomtype roomtype, Date checkin, Date checkout, int totalrooms, String customername,
			String customerphone, String customeremail, int reservationstt, double netprice, double price,
			Date createday, Date deadline, String bookingchannels) {
		this.roomtype = roomtype;
		this.checkin = checkin;
		this.checkout = checkout;
		this.totalrooms = totalrooms;
		this.customername = customername;
		this.customerphone = customerphone;
		this.customeremail = customeremail;
		this.reservationstt = reservationstt;
		this.netprice = netprice;
		this.price = price;
		this.createday = createday;
		this.deadline = deadline;
		this.bookingchannels = bookingchannels;
	}

	public Reservation(Account account, Contractinfo contractinfo, Reservation reservation, Roomtype roomtype,
			String reservationidcode, Date checkin, Date checkout, int totalrooms, String customername,
			String customerphone, String customeremail, Double payment1, Date paymentdat1, Double payment2,
			Date paymentdat2, Double refundamount, Date refunddate, int reservationstt, BigDecimal rating,
			String customercomment, String replyfromhotel, Double chargefee, double netprice, double price,
			Double servicefee, Date createday, String paymentchannel1, String paymentsnote1, String paymentchannel2,
			String paymentsnote2, Integer createby, Date deadline, String note, String bookingchannels,
			Set<Reservation> reservations, Set<Reservationroomdetails> reservationroomdetailses) {
		this.account = account;
		this.contractinfo = contractinfo;
		this.reservation = reservation;
		this.roomtype = roomtype;
		this.reservationidcode = reservationidcode;
		this.checkin = checkin;
		this.checkout = checkout;
		this.totalrooms = totalrooms;
		this.customername = customername;
		this.customerphone = customerphone;
		this.customeremail = customeremail;
		this.payment1 = payment1;
		this.paymentdat1 = paymentdat1;
		this.payment2 = payment2;
		this.paymentdat2 = paymentdat2;
		this.refundamount = refundamount;
		this.refunddate = refunddate;
		this.reservationstt = reservationstt;
		this.rating = rating;
		this.customercomment = customercomment;
		this.replyfromhotel = replyfromhotel;
		this.chargefee = chargefee;
		this.netprice = netprice;
		this.price = price;
		this.servicefee = servicefee;
		this.createday = createday;
		this.paymentchannel1 = paymentchannel1;
		this.paymentsnote1 = paymentsnote1;
		this.paymentchannel2 = paymentchannel2;
		this.paymentsnote2 = paymentsnote2;
		this.createby = createby;
		this.deadline = deadline;
		this.note = note;
		this.bookingchannels = bookingchannels;
		this.reservations = reservations;
		this.reservationroomdetailses = reservationroomdetailses;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "reservationid", unique = true, nullable = false)
	public Integer getReservationid() {
		return this.reservationid;
	}

	public void setReservationid(Integer reservationid) {
		this.reservationid = reservationid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "guestid")
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "contractid")
	public Contractinfo getContractinfo() {
		return this.contractinfo;
	}

	public void setContractinfo(Contractinfo contractinfo) {
		this.contractinfo = contractinfo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "related")
	public Reservation getReservation() {
		return this.reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "roomstypeid", nullable = false)
	public Roomtype getRoomtype() {
		return this.roomtype;
	}

	public void setRoomtype(Roomtype roomtype) {
		this.roomtype = roomtype;
	}

	@Column(name = "reservationidcode", length = 200)
	public String getReservationidcode() {
		return this.reservationidcode;
	}

	public void setReservationidcode(String reservationidcode) {
		this.reservationidcode = reservationidcode;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "checkin", nullable = false, length = 10)
	public Date getCheckin() {
		return this.checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "checkout", nullable = false, length = 10)
	public Date getCheckout() {
		return this.checkout;
	}

	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}

	@Column(name = "totalrooms", nullable = false)
	public int getTotalrooms() {
		return this.totalrooms;
	}

	public void setTotalrooms(int totalrooms) {
		this.totalrooms = totalrooms;
	}

	@Column(name = "customername", nullable = false, length = 50)
	public String getCustomername() {
		return this.customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	@Column(name = "customerphone", nullable = false, length = 50)
	public String getCustomerphone() {
		return this.customerphone;
	}

	public void setCustomerphone(String customerphone) {
		this.customerphone = customerphone;
	}

	@Column(name = "customeremail", nullable = false, length = 50)
	public String getCustomeremail() {
		return this.customeremail;
	}

	public void setCustomeremail(String customeremail) {
		this.customeremail = customeremail;
	}

	@Column(name = "payment1", precision = 22, scale = 0)
	public Double getPayment1() {
		return this.payment1;
	}

	public void setPayment1(Double payment1) {
		this.payment1 = payment1;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "paymentdat1", length = 10)
	public Date getPaymentdat1() {
		return this.paymentdat1;
	}

	public void setPaymentdat1(Date paymentdat1) {
		this.paymentdat1 = paymentdat1;
	}

	@Column(name = "payment2", precision = 22, scale = 0)
	public Double getPayment2() {
		return this.payment2;
	}

	public void setPayment2(Double payment2) {
		this.payment2 = payment2;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "paymentdat2", length = 10)
	public Date getPaymentdat2() {
		return this.paymentdat2;
	}

	public void setPaymentdat2(Date paymentdat2) {
		this.paymentdat2 = paymentdat2;
	}

	@Column(name = "refundamount", precision = 22, scale = 0)
	public Double getRefundamount() {
		return this.refundamount;
	}

	public void setRefundamount(Double refundamount) {
		this.refundamount = refundamount;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "refunddate", length = 10)
	public Date getRefunddate() {
		return this.refunddate;
	}

	public void setRefunddate(Date refunddate) {
		this.refunddate = refunddate;
	}

	@Column(name = "reservationstt", nullable = false)
	public int getReservationstt() {
		return this.reservationstt;
	}

	public void setReservationstt(int reservationstt) {
		this.reservationstt = reservationstt;
	}

	@Column(name = "rating", precision = 2, scale = 1)
	public BigDecimal getRating() {
		return this.rating;
	}

	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}

	@Column(name = "customercomment", length = 250)
	public String getCustomercomment() {
		return this.customercomment;
	}

	public void setCustomercomment(String customercomment) {
		this.customercomment = customercomment;
	}

	@Column(name = "replyfromhotel", length = 250)
	public String getReplyfromhotel() {
		return this.replyfromhotel;
	}

	public void setReplyfromhotel(String replyfromhotel) {
		this.replyfromhotel = replyfromhotel;
	}

	@Column(name = "chargefee", precision = 22, scale = 0)
	public Double getChargefee() {
		return this.chargefee;
	}

	public void setChargefee(Double chargefee) {
		this.chargefee = chargefee;
	}

	@Column(name = "netprice", nullable = false, precision = 22, scale = 0)
	public double getNetprice() {
		return this.netprice;
	}

	public void setNetprice(double netprice) {
		this.netprice = netprice;
	}

	@Column(name = "price", nullable = false, precision = 22, scale = 0)
	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Column(name = "servicefee", precision = 22, scale = 0)
	public Double getServicefee() {
		return this.servicefee;
	}

	public void setServicefee(Double servicefee) {
		this.servicefee = servicefee;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "createday", nullable = false, length = 10)
	public Date getCreateday() {
		return this.createday;
	}

	public void setCreateday(Date createday) {
		this.createday = createday;
	}

	@Column(name = "paymentchannel1", length = 50)
	public String getPaymentchannel1() {
		return this.paymentchannel1;
	}

	public void setPaymentchannel1(String paymentchannel1) {
		this.paymentchannel1 = paymentchannel1;
	}

	@Column(name = "paymentsnote1", length = 250)
	public String getPaymentsnote1() {
		return this.paymentsnote1;
	}

	public void setPaymentsnote1(String paymentsnote1) {
		this.paymentsnote1 = paymentsnote1;
	}

	@Column(name = "paymentchannel2", length = 50)
	public String getPaymentchannel2() {
		return this.paymentchannel2;
	}

	public void setPaymentchannel2(String paymentchannel2) {
		this.paymentchannel2 = paymentchannel2;
	}

	@Column(name = "paymentsnote2", length = 50)
	public String getPaymentsnote2() {
		return this.paymentsnote2;
	}

	public void setPaymentsnote2(String paymentsnote2) {
		this.paymentsnote2 = paymentsnote2;
	}

	@Column(name = "createby")
	public Integer getCreateby() {
		return this.createby;
	}

	public void setCreateby(Integer createby) {
		this.createby = createby;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "deadline", nullable = false, length = 19)
	public Date getDeadline() {
		return this.deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	@Column(name = "note", length = 100)
	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Column(name = "bookingchannels", nullable = false, length = 250)
	public String getBookingchannels() {
		return this.bookingchannels;
	}

	public void setBookingchannels(String bookingchannels) {
		this.bookingchannels = bookingchannels;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "reservation")
	public Set<Reservation> getReservations() {
		return this.reservations;
	}

	public void setReservations(Set<Reservation> reservations) {
		this.reservations = reservations;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "reservation")
	public Set<Reservationroomdetails> getReservationroomdetailses() {
		return this.reservationroomdetailses;
	}

	public void setReservationroomdetailses(Set<Reservationroomdetails> reservationroomdetailses) {
		this.reservationroomdetailses = reservationroomdetailses;
	}

}
