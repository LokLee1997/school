package com.school.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.school.dao.StudentMapper;
import com.school.pojo.Attendance;
import com.school.pojo.Charge;
import com.school.pojo.Student;
import com.school.service.StudentService;
@Transactional
@Service("stuService")
public class StudentServiceImpl implements StudentService {
	@Resource
	public StudentMapper studentMapper;
	@Override
	public void addStu(Student student) {
		// TODO Auto-generated method stub
		studentMapper.addStudent(student);
	}

	@Override
	public void delStu(String sid) {
		// TODO Auto-generated method stub
		studentMapper.deleteStudent(sid);
	}

	@Override
	public void updateStu(Student student) {
		// TODO Auto-generated method stub
		studentMapper.updateStudent(student);
	}

	@Override
	public Student getStudentById(String sid) {
		// TODO Auto-generated method stub
		return studentMapper.getStudentById(sid);
	}

	@Override
	public List<Student> getStu() {
		// TODO Auto-generated method stub
		List<Student> list = studentMapper.getStudentList();
		return list;
	}

	@Override
	public int getStuNum() {
		// TODO Auto-generated method stub
		List<Student> list = studentMapper.getStudentList();
		return list.size();
	}

	@Override
	public List<Student> getStudentsByClass(int id) {
		// TODO Auto-generated method stub
		List<Student> list = studentMapper.getStudentsByClass(id);
		return list;
	}

	@Override
	public List<Charge> getChargesBySid(String sid) {
		// TODO Auto-generated method stub
		List<Charge> list = studentMapper.getChargesBySId(sid);
		return list;
	}

	@Override
	public List<Attendance> getAttendancesBySid(String sid) {
		// TODO Auto-generated method stub
		List<Attendance> list =studentMapper.getAttendancesBySid(sid);
		return list;
	}

}
