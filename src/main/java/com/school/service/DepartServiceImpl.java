package com.school.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.DepartMapper;
import com.school.pojo.Depart;
import com.school.pojo.Teachers;
@Transactional
@Service("depService")
public class DepartServiceImpl implements DepartService {
	@Resource
	private DepartMapper departMapper;
	@Override
	public void addDep(Depart depart) {
		// TODO Auto-generated method stub
		departMapper.addDep(depart);
	}

	@Override
	public void delDep(int did) {
		// TODO Auto-generated method stub
		departMapper.deleteDep(did);
	}

	@Override
	public void updateDep(Depart depart) {
		// TODO Auto-generated method stub
		departMapper.updateDep(depart);
	}

	@Override
	public Depart getDepById(int did) {
		// TODO Auto-generated method stub
		return departMapper.getDepartById(did);
	}

	@Override
	public List<Depart> getDep() {
		// TODO Auto-generated method stub
		return departMapper.getDeparts();
	}

	@Override
	public int countDepNum(int did) {
		// TODO Auto-generated method stub
		return departMapper.countDepartnum(did);
	}

	@Override
	public List<Teachers> getDepTeachers(int id) {
		// TODO Auto-generated method stub
		List<Teachers> list = departMapper.getDeparTeachers(id);
		return list;
	}

}
