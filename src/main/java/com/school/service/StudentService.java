package com.school.service;

import java.util.List;

import com.school.pojo.Attendance;
import com.school.pojo.Charge;
import com.school.pojo.Student;

public interface StudentService {
	public void addStu(Student student);
	public void delStu(String sid);
	public void updateStu(Student student);
	public Student getStudentById(String sid);
	public List<Student> getStu();
	public int getStuNum();
	public List<Student> getStudentsByClass(int id);
	public List<Charge> getChargesBySid(String sid);
	public List<Attendance> getAttendancesBySid(String sid);
}
