package com.demo.models;
// Generated Dec 15, 2022, 9:46:37 PM by Hibernate Tools 4.3.6.Final

import java.math.BigDecimal;
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

/**
 * Hotel generated by hbm2java
 */
@Entity
@Table(name = "hotel", catalog = "doanky4")
public class Hotel implements java.io.Serializable {

	private Integer hotelid;
	private Ward ward;
	private String hotelname;
	private String description;
	private int star;
	private String street;
	private int spa;
	private int pool;
	private int beach;
	private int bar;
	private int restaurants;
	private int frontdesk;
	private int transport;
	private int shuttle;
	private int parking;
	private int fitnesscenter;
	private String bankInfo1;
	private String bankInfo2;
	private String bankInfo3;
	private BigDecimal totalrating;
	private String logo;
	private int hotelstatus;
	private Set<Account> accounts = new HashSet<Account>(0);
	private Set<Hotelseason> hotelseasons = new HashSet<Hotelseason>(0);
	private Set<Contractinfo> contractinfos = new HashSet<Contractinfo>(0);
	private Set<Roomtype> roomtypes = new HashSet<Roomtype>(0);
	private Set<Addonservice> addonservices = new HashSet<Addonservice>(0);
	private Set<Hotelimage> hotelimages = new HashSet<Hotelimage>(0);

	public Hotel() {
	}

	public Hotel(Ward ward, String hotelname, String description, int star, String street, int spa, int pool, int beach,
			int bar, int restaurants, int frontdesk, int transport, int shuttle, int parking, int fitnesscenter,
			String logo, int hotelstatus) {
		this.ward = ward;
		this.hotelname = hotelname;
		this.description = description;
		this.star = star;
		this.street = street;
		this.spa = spa;
		this.pool = pool;
		this.beach = beach;
		this.bar = bar;
		this.restaurants = restaurants;
		this.frontdesk = frontdesk;
		this.transport = transport;
		this.shuttle = shuttle;
		this.parking = parking;
		this.fitnesscenter = fitnesscenter;
		this.logo = logo;
		this.hotelstatus = hotelstatus;
	}

	public Hotel(Ward ward, String hotelname, String description, int star, String street, int spa, int pool, int beach,
			int bar, int restaurants, int frontdesk, int transport, int shuttle, int parking, int fitnesscenter,
			String bankInfo1, String bankInfo2, String bankInfo3, BigDecimal totalrating, String logo, int hotelstatus,
			Set<Account> accounts, Set<Hotelseason> hotelseasons, Set<Contractinfo> contractinfos,
			Set<Roomtype> roomtypes, Set<Addonservice> addonservices, Set<Hotelimage> hotelimages) {
		this.ward = ward;
		this.hotelname = hotelname;
		this.description = description;
		this.star = star;
		this.street = street;
		this.spa = spa;
		this.pool = pool;
		this.beach = beach;
		this.bar = bar;
		this.restaurants = restaurants;
		this.frontdesk = frontdesk;
		this.transport = transport;
		this.shuttle = shuttle;
		this.parking = parking;
		this.fitnesscenter = fitnesscenter;
		this.bankInfo1 = bankInfo1;
		this.bankInfo2 = bankInfo2;
		this.bankInfo3 = bankInfo3;
		this.totalrating = totalrating;
		this.logo = logo;
		this.hotelstatus = hotelstatus;
		this.accounts = accounts;
		this.hotelseasons = hotelseasons;
		this.contractinfos = contractinfos;
		this.roomtypes = roomtypes;
		this.addonservices = addonservices;
		this.hotelimages = hotelimages;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "hotelid", unique = true, nullable = false)
	public Integer getHotelid() {
		return this.hotelid;
	}

	public void setHotelid(Integer hotelid) {
		this.hotelid = hotelid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "address", nullable = false)
	public Ward getWard() {
		return this.ward;
	}

	public void setWard(Ward ward) {
		this.ward = ward;
	}

	@Column(name = "hotelname", nullable = false, length = 50)
	public String getHotelname() {
		return this.hotelname;
	}

	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}

	@Column(name = "description", nullable = false, length = 500)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "star", nullable = false)
	public int getStar() {
		return this.star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	@Column(name = "street", nullable = false, length = 100)
	public String getStreet() {
		return this.street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	@Column(name = "spa", nullable = false)
	public int getSpa() {
		return this.spa;
	}

	public void setSpa(int spa) {
		this.spa = spa;
	}

	@Column(name = "pool", nullable = false)
	public int getPool() {
		return this.pool;
	}

	public void setPool(int pool) {
		this.pool = pool;
	}

	@Column(name = "beach", nullable = false)
	public int getBeach() {
		return this.beach;
	}

	public void setBeach(int beach) {
		this.beach = beach;
	}

	@Column(name = "bar", nullable = false)
	public int getBar() {
		return this.bar;
	}

	public void setBar(int bar) {
		this.bar = bar;
	}

	@Column(name = "restaurants", nullable = false)
	public int getRestaurants() {
		return this.restaurants;
	}

	public void setRestaurants(int restaurants) {
		this.restaurants = restaurants;
	}

	@Column(name = "frontdesk", nullable = false)
	public int getFrontdesk() {
		return this.frontdesk;
	}

	public void setFrontdesk(int frontdesk) {
		this.frontdesk = frontdesk;
	}

	@Column(name = "transport", nullable = false)
	public int getTransport() {
		return this.transport;
	}

	public void setTransport(int transport) {
		this.transport = transport;
	}

	@Column(name = "shuttle", nullable = false)
	public int getShuttle() {
		return this.shuttle;
	}

	public void setShuttle(int shuttle) {
		this.shuttle = shuttle;
	}

	@Column(name = "parking", nullable = false)
	public int getParking() {
		return this.parking;
	}

	public void setParking(int parking) {
		this.parking = parking;
	}

	@Column(name = "fitnesscenter", nullable = false)
	public int getFitnesscenter() {
		return this.fitnesscenter;
	}

	public void setFitnesscenter(int fitnesscenter) {
		this.fitnesscenter = fitnesscenter;
	}

	@Column(name = "bank_Info1", length = 200)
	public String getBankInfo1() {
		return this.bankInfo1;
	}

	public void setBankInfo1(String bankInfo1) {
		this.bankInfo1 = bankInfo1;
	}

	@Column(name = "bank_Info2", length = 200)
	public String getBankInfo2() {
		return this.bankInfo2;
	}

	public void setBankInfo2(String bankInfo2) {
		this.bankInfo2 = bankInfo2;
	}

	@Column(name = "bank_Info3", length = 200)
	public String getBankInfo3() {
		return this.bankInfo3;
	}

	public void setBankInfo3(String bankInfo3) {
		this.bankInfo3 = bankInfo3;
	}

	@Column(name = "totalrating", precision = 2, scale = 1)
	public BigDecimal getTotalrating() {
		return this.totalrating;
	}

	public void setTotalrating(BigDecimal totalrating) {
		this.totalrating = totalrating;
	}

	@Column(name = "logo", nullable = false, length = 250)
	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@Column(name = "hotelstatus", nullable = false)
	public int getHotelstatus() {
		return this.hotelstatus;
	}

	public void setHotelstatus(int hotelstatus) {
		this.hotelstatus = hotelstatus;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "hotel")
	public Set<Account> getAccounts() {
		return this.accounts;
	}

	public void setAccounts(Set<Account> accounts) {
		this.accounts = accounts;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "hotel")
	public Set<Hotelseason> getHotelseasons() {
		return this.hotelseasons;
	}

	public void setHotelseasons(Set<Hotelseason> hotelseasons) {
		this.hotelseasons = hotelseasons;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "hotel")
	public Set<Contractinfo> getContractinfos() {
		return this.contractinfos;
	}

	public void setContractinfos(Set<Contractinfo> contractinfos) {
		this.contractinfos = contractinfos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "hotel")
	public Set<Roomtype> getRoomtypes() {
		return this.roomtypes;
	}

	public void setRoomtypes(Set<Roomtype> roomtypes) {
		this.roomtypes = roomtypes;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "hotel")
	public Set<Addonservice> getAddonservices() {
		return this.addonservices;
	}

	public void setAddonservices(Set<Addonservice> addonservices) {
		this.addonservices = addonservices;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "hotel")
	public Set<Hotelimage> getHotelimages() {
		return this.hotelimages;
	}

	public void setHotelimages(Set<Hotelimage> hotelimages) {
		this.hotelimages = hotelimages;
	}

}
