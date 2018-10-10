package com.planit.backend.service;

import java.sql.Date;

public class UserAskDTO {

	private String ask_no;
	private String id;
	private String content;
	private String title;
	private String refer;
	private String step;
	private String depth;
	private String status;
	private Date askdate;
	// 사용자 이름 
	private String name;
	public String getAsk_no() {
		return ask_no;
	}
	public void setAsk_no(String ask_no) {
		this.ask_no = ask_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRefer() {
		return refer;
	}
	public void setRefer(String refer) {
		this.refer = refer;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getAskdate() {
		return askdate;
	}
	public void setAskdate(Date askdate) {
		this.askdate = askdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
