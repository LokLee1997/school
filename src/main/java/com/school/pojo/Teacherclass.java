package com.school.pojo;

import org.apache.ibatis.type.Alias;

@Alias("teacherclass")
public class Teacherclass {
	private int id;
	private Teachers teachers;
	private Classes classes;
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
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	
}
