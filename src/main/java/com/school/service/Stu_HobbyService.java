package com.school.service;

import java.util.List;

import com.school.pojo.Hobby;

public interface Stu_HobbyService {
	void addStu_Hobby(Hobby hobby);
	void deleteStu_Hobby(int id);
	void updateStu_Hobby(Hobby hobby);
	List<Hobby> getHobbiesBySid(String sid);
	Hobby getHobby(int id);
}
