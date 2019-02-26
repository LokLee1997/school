package com.school.dao;

import java.util.List;

import com.school.pojo.User;

public interface UserMapper {
	
	void userRegist(User user);
	void userUpdate(User user);
	void userDelete(Integer id);
	List<User> getUsers();
	User getUserByUsername(String username);
	User getUserById(Integer id);
	
}
