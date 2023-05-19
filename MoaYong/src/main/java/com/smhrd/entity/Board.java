package com.smhrd.entity;

import java.util.Date;

public class Board {
	private int prj_seq;
	private String t_id;
	private String prj_category;
	private String prj_name;
	private String post;
	private String status;
	private Date deadline_dt;
	private Date start_dt;
	private Date end_dt;
	private int recruit_count;
	private int join_count;
	private Date post_dt;
	private String comment;
	private String comment_join;
	
	public Board() {
		
	}

	public Board(int prj_seq, String t_id, String prj_category, String prj_name, String post, String status,
			Date deadline_dt, Date start_dt, Date end_dt, int recruit_count, int join_count, Date post_dt,
			String comment, String comment_join) {
		this.prj_seq = prj_seq;
		this.t_id = t_id;
		this.prj_category = prj_category;
		this.prj_name = prj_name;
		this.post = post;
		this.status = status;
		this.deadline_dt = deadline_dt;
		this.start_dt = start_dt;
		this.end_dt = end_dt;
		this.recruit_count = recruit_count;
		this.join_count = join_count;
		this.post_dt = post_dt;
		this.comment = comment;
		this.comment_join = comment_join;
	}

	public int getPrj_seq() {
		return prj_seq;
	}

	public void setPrj_seq(int prj_seq) {
		this.prj_seq = prj_seq;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getPrj_category() {
		return prj_category;
	}

	public void setPrj_category(String prj_category) {
		this.prj_category = prj_category;
	}

	public String getPrj_name() {
		return prj_name;
	}

	public void setPrj_name(String prj_name) {
		this.prj_name = prj_name;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDeadline_dt() {
		return deadline_dt;
	}

	public void setDeadline_dt(Date deadline_dt) {
		this.deadline_dt = deadline_dt;
	}

	public Date getStart_dt() {
		return start_dt;
	}

	public void setStart_dt(Date start_dt) {
		this.start_dt = start_dt;
	}

	public Date getEnd_dt() {
		return end_dt;
	}

	public void setEnd_dt(Date end_dt) {
		this.end_dt = end_dt;
	}

	public int getRecruit_count() {
		return recruit_count;
	}

	public void setRecruit_count(int recruit_count) {
		this.recruit_count = recruit_count;
	}

	public int getJoin_count() {
		return join_count;
	}

	public void setJoin_count(int join_count) {
		this.join_count = join_count;
	}

	public Date getPost_dt() {
		return post_dt;
	}

	public void setPost_dt(Date post_dt) {
		this.post_dt = post_dt;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getComment_join() {
		return comment_join;
	}

	public void setComment_join(String comment_join) {
		this.comment_join = comment_join;
	}
	
	
}

	
