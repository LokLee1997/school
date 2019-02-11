package com.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.AttendanceMapper;
import com.school.pojo.Attendance;
import com.school.service.AttendanceService;
@Transactional
@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService{
	@Resource
	private AttendanceMapper attendanceMapper;
	@Override
	public void addAtt(Attendance attendance) {
		// TODO Auto-generated method stub
		attendanceMapper.addAtt(attendance);
	}

	@Override
	public void delAtt(int id) {
		// TODO Auto-generated method stub
		attendanceMapper.delAtt(id);
	}

	@Override
	public void updateAtt(Attendance attendance) {
		// TODO Auto-generated method stub
		attendanceMapper.updateAtt(attendance);
	}

	@Override
	public List<Attendance> getAttendances() {
		// TODO Auto-generated method stub
		List<Attendance> list = attendanceMapper.getAttendances();
		return list;
	}
	@Override
	public Attendance getAttendanceById(int id) {
		// TODO Auto-generated method stub
		return attendanceMapper.getAttendanceById(id);
	}

	@Override
	public List<Attendance> getAttendancesByKeyword(String keyword) {
		// TODO Auto-generated method stub
		List<Attendance> list = attendanceMapper.getAttendancesByKeyword(keyword);
		return list;
	}
	
}
