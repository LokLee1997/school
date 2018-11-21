package com.school.pojo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("course")
public class Course {
	private int cno;
	private String cname;
	private List<Teachers> teachers;
	private List<Classes> classes;
	
	
	public List<Classes> getClasses() {
		return classes;
	}
	public void setClasses(List<Classes> classes) {
		this.classes = classes;
	}
	public List<Teachers> getTeachers() {
		return teachers;
	}
	public void setTeachers(List<Teachers> teachers) {
		this.teachers = teachers;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
}
