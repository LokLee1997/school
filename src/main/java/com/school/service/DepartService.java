package com.school.service;

import java.util.List;

import com.school.pojo.Depart;
import com.school.pojo.Teachers;

public interface DepartService {
	public void addDep(Depart depart);
	public void delDep(int did);
	public void updateDep(Depart depart);
	public Depart getDepById(int did);
	public List<Depart> getDep();
	public int countDepNum(int did);
	public List<Teachers> getDepTeachers(int id);
}
