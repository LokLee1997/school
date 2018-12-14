package com.school.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.TeacherClassMapper;
import com.school.pojo.Teacherclass;
import com.school.service.TeacherClassService;
@Transactional
@Service("teacherClassService")
public class TeacherClassServiceImpl implements TeacherClassService {
	@Resource
	private TeacherClassMapper teacherClassMapper;
	@Override
	public void addTeacher_Class(Teacherclass teacherclass) {
		// TODO Auto-generated method stub
		teacherClassMapper.addTeacher_Class(teacherclass);
	}

	@Override
	public void delTeacher_Class(int classid, int teachertno) {
		// TODO Auto-generated method stub
		teacherClassMapper.deleteTeacher_Class(classid, teachertno);
	}

}
