package com.school.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.ClassCourseMapper;
import com.school.pojo.Classcourse;
import com.school.service.ClassCourseService;
@Transactional
@Service("classCourseService")
public class ClassCourseServiceImpl implements ClassCourseService {
	@Resource
	private ClassCourseMapper classCourseMapper;
	@Override
	public void addClass_Course(Classcourse classcourse) {
		// TODO Auto-generated method stub
		classCourseMapper.addClass_Course(classcourse);
	}

	@Override
	public void delClass_Course(int classid, int courseno) {
		// TODO Auto-generated method stub
		classCourseMapper.deleteClass_Course(classid, courseno);
	}

	@Override
	public void updateClass_Course(Classcourse classcourse) {
		// TODO Auto-generated method stub
		classCourseMapper.updateClass_Course(classcourse);
	}

}
