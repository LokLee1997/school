package com.school.service;

import com.school.pojo.Classcourse;

public interface ClassCourseService {
	public void addClass_Course(Classcourse classcourse);
	public void delClass_Course(int classid,int courseno);
	public void updateClass_Course(Classcourse classcourse);
}
