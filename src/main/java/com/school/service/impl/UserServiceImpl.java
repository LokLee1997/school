package com.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.school.dao.UserMapper;
import com.school.pojo.User;
import com.school.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Resource
	UserMapper userMapper;
	//检查登录账号密码是否正确 
	@Override
	public boolean checkLogin(String username, String password) {
		// TODO Auto-generated method stub
		User user = userMapper.getUserByUsername(username);
		if (user!= null && user.getPassword().equals(password)) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public void userRegist(User user) {
		// TODO Auto-generated method stub
		userMapper.userRegist(user);
	}

	@Override
	public void userUpdate(User user) {
		// TODO Auto-generated method stub
		userMapper.userUpdate(user);
	}

	@Override
	public void userDelete(Integer id) {
		// TODO Auto-generated method stub
		userMapper.userDelete(id);
	}

	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		List<User> list = userMapper.getUsers();
		return list;
	}

	@Override
	public User getUserById(Integer id) {
		// TODO Auto-generated method stub
	
		return userMapper.getUserById(id);
	}
	//检查用户名是否可以使用
	@Override
	public boolean checkUsername(String username) {
		// TODO Auto-generated method stub
		User user = userMapper.getUserByUsername(username);
		if (user==null) {
			return true;//用户名可用
		}else{
			return false;//用户名不可用
		}
	}
	
	

}
