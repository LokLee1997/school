package com.school.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.CourseMapper;
import com.school.pojo.Course;
import com.school.pojo.Teachers;
@Transactional
@Service("couService")
public class CourseServiceImpl implements CourseService {
	@Resource
	private CourseMapper courseMapper;
	@Override
	public void addCou(Course course) {
		// TODO Auto-generated method stub
		courseMapper.addCourse(course);
	}

	@Override
	public void updateCou(Course course) {
		// TODO Auto-generated method stub
		courseMapper.updateCourse(course);
	}

	@Override
	public void delCou(String cname) {
		// TODO Auto-generated method stub
		courseMapper.deleteCourse(cname);
	}

	@Override
	public List<Course> getCourseByCname(String cname) {
		// TODO Auto-generated method stub
		List<Course> list = courseMapper.getCourseByCname(cname);
		return list;
	}

	@Override
	public List<Course> getCourses() {
		// TODO Auto-generated method stub
		List<Course> list = courseMapper.getCourses();
		return list;
	}

	@Override
	public Course getCourseById(int id) {
		// TODO Auto-generated method stub
		return courseMapper.getCourseById(id);
	}

	@Override
	public List<Teachers> getTeachers(int id) {
		// TODO Auto-generated method stub
		List<Teachers> list = courseMapper.getCourseTeachers(id);
		return list;
	}

}
