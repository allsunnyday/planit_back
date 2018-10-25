package com.planit.backend.service;

import java.sql.Date;

public class AdminReservationDTO {
	private String id;
	private String p_id;
	private String reservation_id;
	private String roomtitle;
	private String status;
	private java.sql.Date bookdate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getReservation_id() {
		return reservation_id;
	}

	public void setReservation_id(String reservation_id) {
		this.reservation_id = reservation_id;
	}

	public String getRoomtitle() {
		return roomtitle;
	}

	public void setRoomtitle(String roomtitle) {
		this.roomtitle = roomtitle;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public java.sql.Date getBookdate() {
		return bookdate;
	}

	public void setBookdate(java.sql.Date bookdate) {
		this.bookdate = bookdate;
	}

}
