package com.smhrd.entity;

import java.util.Date;

public class Message {

	private int msg_seq;
	private String sender_id;
	private String receiver_id;
	private String msg_content;
	private Date msg_dt;
	private int prj_seq;
	private String msg_status;
	
	public Message() {
		
	}
	
	public Message(int msg_seq, String sender_id, String receiver_id, String msg_content, Date msg_dt, int prj_seq,
			String msg_status) {
		this.msg_seq = msg_seq;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.msg_content = msg_content;
		this.msg_dt = msg_dt;
		this.prj_seq = prj_seq;
		this.msg_status = msg_status;
	}

	public int getMsg_seq() {
		return msg_seq;
	}
	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}
	public String getSender_id() {
		return sender_id;
	}
	
	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}
	public String getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Date getMsg_dt() {
		return msg_dt;
	}
	public void setMsg_dt(Date msg_dt) {
		this.msg_dt = msg_dt;
	}
	public int getPrj_seq() {
		return prj_seq;
	}
	public void setPrj_seq(int prj_seq) {
		this.prj_seq = prj_seq;
	}
	public String getMsg_status() {
		return msg_status;
	}
	public void setMsg_status(String msg_status) {
		this.msg_status = msg_status;
	}




	}