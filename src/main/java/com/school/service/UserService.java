package com.school.service;

import java.util.List;

import com.school.pojo.User;

public interface UserService {
	boolean checkLogin(String username,String password);
	boolean checkUsername(String username);
	void userRegist(User user);
	void userUpdate(User user);
	void userDelete(Integer id);
	List<User> getUsers();
	User getUserById(Integer id);
}
