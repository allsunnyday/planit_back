package com.planit.backend.service;

import java.sql.Date;

public class UpdateDTO {

	private String contenttype;
	private String areacode;
	private String totalCount;
	private Date up_to_date;
	
	// 
	private String typename;
	private String areaname;
	public String getContenttype() {
		return contenttype;
	}
	public void setContenttype(String contenttype) {
		this.contenttype = contenttype;
	}
	public String getAreacode() {
		return areacode;
	}
	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public Date getUp_to_date() {
		return up_to_date;
	}
	public void setUp_to_date(Date up_to_date) {
		this.up_to_date = up_to_date;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	
}
