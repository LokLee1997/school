package com.school.dao;

import org.apache.ibatis.annotations.Param;

import com.school.pojo.Classcourse;

public interface ClassCourseMapper {
	public void addClass_Course(Classcourse classcourse);
	public void deleteClass_Course(@Param("classid")int classid,@Param("courseno")int courseno);
	public void updateClass_Course(Classcourse classcourse);
}
