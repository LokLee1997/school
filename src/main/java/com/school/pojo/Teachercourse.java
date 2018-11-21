package com.school.pojo;

import org.apache.ibatis.type.Alias;

@Alias("teachercourse")
public class Teachercourse {
	private int id;
	private Teachers teachers;
	private Course course;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Teachers getTeachers() {
		return teachers;
	}
	public void setTeachers(Teachers teachers) {
		this.teachers = teachers;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
}
