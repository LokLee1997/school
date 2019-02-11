package com.school.service;

import java.util.List;

import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Teachers;

public interface TeachersService {
	public void addtes(Teachers teachers);
	public void deltes(int id);
	public void updatetes(Teachers teachers);
	public Teachers gettesById(int id);
	public List<Teachers> gettes();
	public List<Classes> getClasses(int id);
	public List<Teachers> getTeachersByKeyword(String keyword);
}
