package com.school.service;

import java.util.List;

import com.school.pojo.Course;
import com.school.pojo.Teachers;

public interface CourseService {
	public void addCou(Course course);
	public void updateCou(Course course);
	public void delCou(String cname);
	public List<Course> getCourseByCname(String cname);
	public List<Course> getCourses();
	public Course getCourseById(int id);
	public List<Teachers> getTeachers(int id);
}
