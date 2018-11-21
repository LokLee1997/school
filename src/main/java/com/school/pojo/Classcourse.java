package com.school.pojo;

import org.apache.ibatis.type.Alias;

@Alias("classcourse")
public class Classcourse {
	private Classes classes;
	private Course course;
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
