package com.school.dao;

import java.util.List;

import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Student;
import com.school.pojo.Teachers;
public interface ClassesMapper {
	public void addClasses(Classes classes);
	public void deleteClasses(int id);
	public void updateClasses(Classes classes);
	public Classes getClassesById(int id);
	public List<Classes> getClassesList();
	public int countClassesStudent(int id);
	public List<Student> getClassesStudents(int id);
	public List<Course> getclassesCourses(int id);
	public List<Teachers> getClassTeachers(int id);
}
