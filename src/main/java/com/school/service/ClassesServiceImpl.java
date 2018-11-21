package com.school.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.ClassesMapper;
import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Student;
import com.school.pojo.Teachers;
@Transactional
@Service("clsService")
public class ClassesServiceImpl implements ClassesService {
	@Resource
	private ClassesMapper classesMapper;
	@Override
	public void addCls(Classes classes) {
		// TODO Auto-generated method stub
		classesMapper.addClasses(classes);
	}

	@Override
	public void delCls(int id) {
		// TODO Auto-generated method stub
		classesMapper.deleteClasses(id);
	}

	@Override
	public void updateCls(Classes classes) {
		// TODO Auto-generated method stub
		classesMapper.updateClasses(classes);
	}

	@Override
	public Classes getClsById(int id) {
		// TODO Auto-generated method stub
		return classesMapper.getClassesById(id);
	}

	@Override
	public List<Classes> getCls() {
		// TODO Auto-generated method stub
		List<Classes> list = classesMapper.getClassesList();
		return list;
	}

	@Override
	public int countstu(int id) {
		// TODO Auto-generated method stub
		return classesMapper.countClassesStudent(id);
	}

	@Override
	public List<Student> getStudents(int id) {
		// TODO Auto-generated method stub
		List<Student> sList = classesMapper.getClassesStudents(id);
		return sList;
	}

	@Override
	public List<Course> getCourses(int id) {
		// TODO Auto-generated method stub
		List<Course> cList = classesMapper.getclassesCourses(id);
		return cList;
	}

	@Override
	public List<Teachers> getTeachers(int id) {
		// TODO Auto-generated method stub
		List<Teachers> list = classesMapper.getClassTeachers(id);
		return list;
	}

}
