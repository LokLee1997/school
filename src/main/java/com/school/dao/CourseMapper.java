package com.school.dao;

import java.util.List;

import com.school.pojo.Course;
import com.school.pojo.Teachers;

public interface CourseMapper {
	public void addCourse(Course course);
	public void deleteCourse(String cname);
	public void updateCourse(Course course);
	public List<Course> getCourseByCname(String cname);
	public List<Course> getCourses();
	public Course getCourseById(int id);
	public List<Teachers> getCourseTeachers(int id);
}
