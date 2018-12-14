package com.school.dao;

import org.apache.ibatis.annotations.Param;

import com.school.pojo.Teacherclass;

public interface TeacherClassMapper {
	public void addTeacher_Class(Teacherclass teacherclass);
	public void deleteTeacher_Class(@Param("classid")int classid,@Param("teachertno")int teachertno);
	public void updateTeacher_Class(Teacherclass teacherclass);
}
