package com.school.pojo;

import org.apache.ibatis.type.Alias;

@Alias("charge")
public class Charge {
	private int id;
	private String chargeitem;
	private int price;
	private int ispay;
	private String studentid;
	private Student student;
	private String keyword;
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getChargeitem() {
		return chargeitem;
	}
	public void setChargeitem(String chargeitem) {
		this.chargeitem = chargeitem;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getIspay() {
		return ispay;
	}
	public void setIspay(int ispay) {
		this.ispay = ispay;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	
}
