package com.school.pojo;

public class Lunch {
	private int id;
	private String date;
	private String caipin;
	private int cookerid;
	private Teachers cooker;
	
	public Teachers getCooker() {
		return cooker;
	}
	public void setCooker(Teachers cooker) {
		this.cooker = cooker;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCaipin() {
		return caipin;
	}
	public void setCaipin(String caipin) {
		this.caipin = caipin;
	}
	public int getCookerid() {
		return cookerid;
	}
	public void setCookerid(int cookerid) {
		this.cookerid = cookerid;
	}
	
}
