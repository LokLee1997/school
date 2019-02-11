package com.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.TeachersMapper;
import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Teachers;
import com.school.service.TeachersService;
@Transactional
@Service("tesService")
public class TeachersServiceImpl implements TeachersService {
	@Resource
	private TeachersMapper teachersMapper;
	@Override
	public void addtes(Teachers teachers) {
		// TODO Auto-generated method stub
		teachersMapper.addTeachers(teachers);
	}

	@Override
	public void deltes(int id) {
		// TODO Auto-generated method stub
		teachersMapper.deleteTeachers(id);
	}

	@Override
	public void updatetes(Teachers teachers) {
		// TODO Auto-generated method stub
		teachersMapper.updateTeachers(teachers);
	}

	@Override
	public Teachers gettesById(int id) {
		// TODO Auto-generated method stub
		return teachersMapper.getTeachersById(id);
	}

	@Override
	public List<Teachers> gettes() {
		// TODO Auto-generated method stub
		List<Teachers> list = teachersMapper.getTeachersList();
		return list;
	}

	@Override
	public List<Classes> getClasses(int id) {
		// TODO Auto-generated method stub
		List<Classes> list = teachersMapper.getTeacherClasses(id);
		return list;
	}
	
	@Override
	public List<Teachers> getTeachersByKeyword(String keyword) {
		// TODO Auto-generated method stub
		List<Teachers> list = teachersMapper.getTeachersByKeyword(keyword);
		return list;
	}
}
