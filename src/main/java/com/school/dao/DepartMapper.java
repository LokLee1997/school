package com.school.dao;

import java.util.List;

import com.school.pojo.Depart;
import com.school.pojo.Teachers;

public interface DepartMapper {
	public void addDep(Depart depart);
	public void updateDep(Depart depart);
	public void deleteDep(int did);
	public Depart getDepartById(int did);
	public List<Depart> getDeparts();
	public int countDepartnum(int id);
	public List<Teachers> getDeparTeachers(int id);
}
