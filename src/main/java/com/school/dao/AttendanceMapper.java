package com.school.dao;

import java.util.List;

import com.school.pojo.Attendance;

public interface AttendanceMapper {
	public void addAtt(Attendance attendance);
	public void delAtt(int id);
	public void updateAtt(Attendance attendance);
	public Attendance getAttendanceById(int id);
	public List<Attendance> getAttendances();
	public List<Attendance> getAttendancesByKeyword(String keyword);
}
