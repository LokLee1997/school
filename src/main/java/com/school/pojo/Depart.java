package com.school.pojo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("depart")
public class Depart {
	private int did;
	private String dname;
	private List<Teachers> teachers;
	
	public List<Teachers> getTeachers() {
		return teachers;
	}
	public void setTeachers(List<Teachers> teachers) {
		this.teachers = teachers;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	
}
