package com.school.pojo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias(value="student")
public class Student {
	private String sid;
	private String sname;
	private String ssex;
	private String sbirthday;
	private int classid;
	private Classes classes;
	private List<Charge> charge;
	private List<Attendance> attendances;
	private List<Hobby> hobbies;
	private String keyword;
	public List<Hobby> getHobbies() {
		return hobbies;
	}
	public void setHobbies(List<Hobby> hobbies) {
		this.hobbies = hobbies;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public List<Attendance> getAttendances() {
		return attendances;
	}
	public void setAttendances(List<Attendance> attendances) {
		this.attendances = attendances;
	}
	public List<Charge> getCharge() {
		return charge;
	}
	public void setCharge(List<Charge> charge) {
		this.charge = charge;
	}
	public int getClassid() {
		return classid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public String getSbirthday() {
		return sbirthday;
	}
	public void setSbirthday(String sbirthday) {
		this.sbirthday = sbirthday;
	}
	
}
