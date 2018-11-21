package com.school.pojo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("teachers")
public class Teachers {
	private int tno;
	private String tname;
	private String tsex;
	private String tbirthday;
	private int depart;
	private Depart departs;
	private List<Course> courses;
	public int getDepart() {
		return depart;
	}
	public void setDepart(int depart) {
		this.depart = depart;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTsex() {
		return tsex;
	}
	public void setTsex(String tsex) {
		this.tsex = tsex;
	}
	public String getTbirthday() {
		return tbirthday;
	}
	public void setTbirthday(String tbirthday) {
		this.tbirthday = tbirthday;
	}
	public Depart getDeparts() {
		return departs;
	}
	public void setDeparts(Depart departs) {
		this.departs = departs;
	}
}	
