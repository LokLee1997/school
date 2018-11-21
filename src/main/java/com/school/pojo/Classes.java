package com.school.pojo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("classes")
public class Classes {
	private int id;
	private String classname;
	private List<Student> student;
	private List<Course> course;
	private List<Teachers> teachers;
	public List<Teachers> getTeachers() {
		return teachers;
	}
	public void setTeachers(List<Teachers> teachers) {
		this.teachers = teachers;
	}
	
	public List<Course> getCourse() {
		return course;
	}

	public void setCourse(List<Course> course) {
		this.course = course;
	}

	public List<Student> getStudent() {
		return student;
	}
	
	public void setStudent(List<Student> student) {
		this.student = student;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	
	
	
}
