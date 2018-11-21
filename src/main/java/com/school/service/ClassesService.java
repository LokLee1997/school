package com.school.service;

import java.util.List;

import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Student;
import com.school.pojo.Teachers;

public interface ClassesService {
	public void addCls(Classes classes);
	public void delCls(int id);
	public void updateCls(Classes classes);
	public Classes getClsById(int id);
	public List<Classes> getCls();
	public int countstu(int id);
	public List<Student> getStudents(int id);
	public List<Course> getCourses(int id);
	public List<Teachers> getTeachers(int id);
}
