package com.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.Stu_HobbyMapper;
import com.school.pojo.Hobby;
import com.school.service.Stu_HobbyService;
@Transactional
@Service("Stu_HobbyService")
public class Stu_HobbyServiceImpl implements Stu_HobbyService {
	@Resource
	private Stu_HobbyMapper stu_HobbyMapper;
	@Override
	public void addStu_Hobby(Hobby hobby) {
		// TODO Auto-generated method stub
		stu_HobbyMapper.addStu_Hobby(hobby);
	}

	@Override
	public void deleteStu_Hobby(int id) {
		// TODO Auto-generated method stub
		stu_HobbyMapper.deleteStu_Hobby(id);
	}

	@Override
	public void updateStu_Hobby(Hobby hobby) {
		// TODO Auto-generated method stub
		stu_HobbyMapper.updateStu_Hobby(hobby);
	}

	@Override
	public List<Hobby> getHobbiesBySid(String sid) {
		// TODO Auto-generated method stub
		List<Hobby> list = stu_HobbyMapper.getHobbiesByStudentid(sid);
		return list;
	}

	@Override
	public Hobby getHobby(int id) {
		// TODO Auto-generated method stub
		Hobby hobby = stu_HobbyMapper.getHobbyById(id);
		return hobby;
	}

}
