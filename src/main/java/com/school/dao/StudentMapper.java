package com.school.dao;

import java.util.List;

import com.school.pojo.Student;

public interface StudentMapper {
	public void addStudent(Student student);
	
	public void deleteStudent(String sid);
	
	public void updateStudent(Student student);
	
	public Student getStudentById(String sid);
	
	public List<Student> getStudentList();
	
	public List<Student> getStudentsByClass(int id);
}
