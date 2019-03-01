package com.school.dao;

import java.util.List;

import com.school.pojo.Hobby;

public interface Stu_HobbyMapper {
	void addStu_Hobby(Hobby hobby);
	void deleteStu_Hobby(int id);
	void updateStu_Hobby(Hobby hobby);
	List<Hobby> getHobbiesByStudentid(String sid);
	Hobby getHobbyById(int id);
}
