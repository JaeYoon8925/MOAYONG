package com.smhrd.entity;

public class Project {
	private int prj_seq;
	private String t_id; 
	private String prj_category;
	private String prj_name;
	private String post;
	private String status;
	private String deadlind_dt;
	private String start_dt;
	private String end_dt;
	private int recruit_count;
	private int join_count;
	private String prj_comment;
	
	public Project() {
		
	}

	public Project(int prj_seq, String t_id, String prj_category, String prj_name, String post, String status,
			String deadlind_dt, String start_dt, String end_dt, int recruit_count, int join_count, String prj_comment) {
		this.prj_seq = prj_seq;
		this.t_id = t_id;
		this.prj_category = prj_category;
		this.prj_name = prj_name;
		this.post = post;
		this.status = status;
		this.deadlind_dt = deadlind_dt;
		this.start_dt = start_dt;
		this.end_dt = end_dt;
		this.recruit_count = recruit_count;
		this.join_count = join_count;
		this.prj_comment = prj_comment;
	}

	public int getPrj_seq() {
		return prj_seq;
	}

	public void setPrj_seq(int prj_seq) {
		this.prj_seq = prj_seq;
	}

	public String gett_Id() {
		return t_id;
	}

	public void sett_Id(String t_id) {
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

	public String getDeadlind_dt() {
		return deadlind_dt;
	}

	public void setDeadlind_dt(String deadlind_dt) {
		this.deadlind_dt = deadlind_dt;
	}

	public String getStart_dt() {
		return start_dt;
	}

	public void setStart_dt(String start_dt) {
		this.start_dt = start_dt;
	}

	public String getEnd_dt() {
		return end_dt;
	}

	public void setEnd_dt(String end_dt) {
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

	public String getPrj_comment() {
		return prj_comment;
	}

	public void setPrj_comment(String prj_comment) {
		this.prj_comment = prj_comment;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	}
