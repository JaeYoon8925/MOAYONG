package com.smhrd.entity;

import java.util.Date;

public class Evaluation {

	private int ev_seq;
	private String t_id;
	private int ev_rating;
	private Date ev_date;
	private int prj_seq;
	private String leader_id;
	private double leader_avg_rating;
	private double leader_prj_seq_avg_rating;
	private double participant_prj_seq_avg_rating;
	private double participant_avg_rating;
	
	public Evaluation() {}
	
	public Evaluation(int ev_seq, String t_id, int ev_rating, Date ev_date, int prj_seq, String leader_id,
			double leader_avg_rating, double leader_prj_seq_avg_rating, double participant_prj_seq_avg_rating,
			double participant_avg_rating) {
		this.ev_seq = ev_seq;
		this.t_id = t_id;
		this.ev_rating = ev_rating;
		this.ev_date = ev_date;
		this.prj_seq = prj_seq;
		this.leader_id = leader_id;
		this.leader_avg_rating = leader_avg_rating;
		this.leader_prj_seq_avg_rating = leader_prj_seq_avg_rating;
		this.participant_prj_seq_avg_rating = participant_prj_seq_avg_rating;
		this.participant_avg_rating = participant_avg_rating;
	}

	public int getEv_seq() {
		return ev_seq;
	}

	public void setEv_seq(int ev_seq) {
		this.ev_seq = ev_seq;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public int getEv_rating() {
		return ev_rating;
	}

	public void setEv_rating(int ev_rating) {
		this.ev_rating = ev_rating;
	}

	public Date getEv_date() {
		return ev_date;
	}

	public void setEv_date(Date ev_date) {
		this.ev_date = ev_date;
	}

	public int getPrj_seq() {
		return prj_seq;
	}

	public void setPrj_seq(int prj_seq) {
		this.prj_seq = prj_seq;
	}

	public String getLeader_id() {
		return leader_id;
	}

	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
	}

	public double getLeader_avg_rating() {
		return leader_avg_rating;
	}

	public void setLeader_avg_rating(double leader_avg_rating) {
		this.leader_avg_rating = leader_avg_rating;
	}

	public double getLeader_prj_seq_avg_rating() {
		return leader_prj_seq_avg_rating;
	}

	public void setLeader_prj_seq_avg_rating(double leader_prj_seq_avg_rating) {
		this.leader_prj_seq_avg_rating = leader_prj_seq_avg_rating;
	}

	public double getParticipant_prj_seq_avg_rating() {
		return participant_prj_seq_avg_rating;
	}

	public void setParticipant_prj_seq_avg_rating(double participant_prj_seq_avg_rating) {
		this.participant_prj_seq_avg_rating = participant_prj_seq_avg_rating;
	}

	public double getParticipant_avg_rating() {
		return participant_avg_rating;
	}

	public void setParticipant_avg_rating(double participant_avg_rating) {
		this.participant_avg_rating = participant_avg_rating;
	}
	
	
	
}
