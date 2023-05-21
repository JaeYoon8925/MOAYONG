package com.smhrd.entity;

import java.util.Date;

public class Reply {
	
	private int reply_seq;
	private String t_id;
	private int prj_seq;
	private String reply_comment;
	private String reply_joincheck;
	private String reply_joinstatus;
	private Date comment_dt;
	
	public Reply() {}
	
	public Reply(int reply_seq, String t_id, int prj_seq, String reply_comment, String reply_joincheck,
			String reply_joinstatus, Date comment_dt) {
		this.reply_seq = reply_seq;
		this.t_id = t_id;
		this.prj_seq = prj_seq;
		this.reply_comment = reply_comment;
		this.reply_joincheck = reply_joincheck;
		this.reply_joinstatus = reply_joinstatus;
		this.comment_dt = comment_dt;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public int getPrj_seq() {
		return prj_seq;
	}

	public void setPrj_seq(int prj_seq) {
		this.prj_seq = prj_seq;
	}

	public String getReply_comment() {
		return reply_comment;
	}

	public void setReply_comment(String reply_comment) {
		this.reply_comment = reply_comment;
	}

	public String getReply_joincheck() {
		return reply_joincheck;
	}

	public void setReply_joincheck(String reply_joincheck) {
		this.reply_joincheck = reply_joincheck;
	}

	public String getReply_joinstatus() {
		return reply_joinstatus;
	}

	public void setReply_joinstatus(String reply_joinstatus) {
		this.reply_joinstatus = reply_joinstatus;
	}

	public Date getComment_dt() {
		return comment_dt;
	}

	public void setComment_dt(Date comment_dt) {
		this.comment_dt = comment_dt;
	}
	
	
}