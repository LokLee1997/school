package com.school.pojo;

import org.apache.ibatis.type.Alias;

@Alias("classcourse")
public class Classcourse {
	private int classid;
	private int courseno;
	private Classes classes;
	private Course course;
	public int getClassid() {
		return classid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public int getCourseno() {
		return courseno;
	}
	public void setCourseno(int courseno) {
		this.courseno = courseno;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
}
