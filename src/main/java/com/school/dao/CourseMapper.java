package com.school.dao;

import java.util.List;

import com.school.pojo.Course;
import com.school.pojo.Teachers;

public interface CourseMapper {
	public void addCourse(Course course);
	public void deleteCourse(int id);
	public void updateCourse(Course course);
	public List<Course> getCourses();
	public Course getCourseById(int id);
	public List<Course> getCoursesByKeyword(String keyword);
}
