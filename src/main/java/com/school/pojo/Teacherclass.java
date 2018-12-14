package com.school.pojo;

import org.apache.ibatis.type.Alias;

@Alias("teacherclass")
public class Teacherclass {
	private int classid;
	private int teachertno;
	private Teachers teachers;
	private Classes classes;
	public int getClassid() {
		return classid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public int getTeachertno() {
		return teachertno;
	}
	public void setTeachertno(int teachertno) {
		this.teachertno = teachertno;
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
