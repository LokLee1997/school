package com.school.dao;

import java.util.List;

import com.school.pojo.Attendance;
import com.school.pojo.Charge;
import com.school.pojo.Student;

public interface StudentMapper {
	public void addStudent(Student student);
	public void deleteStudent(String sid);
	public void updateStudent(Student student);
	public void setStudentClass(Student student);
	public Student getStudentById(String sid);
	public List<Student> getStudentList();
	public List<Student> getStudentsByClass(int id);
	public List<Charge> getChargesBySId(String sid);
	public List<Attendance> getAttendancesBySid(String sid);
	public List<Student> getStudentsByKeyWord(String keyword);
}
