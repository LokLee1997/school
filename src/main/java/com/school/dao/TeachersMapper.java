package com.school.dao;

import java.util.List;

import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Teachers;

public interface TeachersMapper {
	public void addTeachers(Teachers teachers);
	
	public void deleteTeachers(int id);
	
	public void updateTeachers(Teachers teachers);
	
	public Teachers getTeachersById(int id);
	
	public List<Teachers> getTeachersList();
	public List<Classes> getTeacherClasses(int id);
}
