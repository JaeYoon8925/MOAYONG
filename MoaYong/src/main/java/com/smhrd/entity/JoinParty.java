package com.smhrd.entity;

public class JoinParty {
	
	private int p_seq;
	private int prj_seq;
	private String t_id;
	private int prj_rating;
	private String join_ok;
	
	public JoinParty() {}
	
	public JoinParty(int p_seq, int prj_seq, String t_id, int prj_rating, String join_ok) {
		this.p_seq = p_seq;
		this.prj_seq = prj_seq;
		this.t_id = t_id;
		this.prj_rating = prj_rating;
		this.join_ok = join_ok;
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
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

	public int getPrj_rating() {
		return prj_rating;
	}

	public void setPrj_rating(int prj_rating) {
		this.prj_rating = prj_rating;
	}

	public String getJoin_ok() {
		return join_ok;
	}

	public void setJoin_ok(String join_ok) {
		this.join_ok = join_ok;
	}
	
	
	

}
