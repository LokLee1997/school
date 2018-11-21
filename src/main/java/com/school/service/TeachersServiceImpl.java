package com.school.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.TeachersMapper;
import com.school.pojo.Course;
import com.school.pojo.Teachers;
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
	public List<Course> getCourses(int id) {
		// TODO Auto-generated method stub
		List<Course> list = teachersMapper.getTeacherCourses(id);
		return list;
	}
}
