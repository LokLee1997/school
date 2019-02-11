package com.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.LunchMapper;
import com.school.pojo.Lunch;
import com.school.service.LunchService;
@Transactional
@Service("lunchService")
public class LunchServiceImpl implements LunchService {
	@Resource
	private LunchMapper lunchMapper;
	@Override
	public void addLunch(Lunch lunch) {
		// TODO Auto-generated method stub
		lunchMapper.addLunch(lunch);
	}

	@Override
	public void delLunch(int id) {
		// TODO Auto-generated method stub
		lunchMapper.delLunch(id);
	}

	@Override
	public void updateLunch(Lunch lunch) {
		// TODO Auto-generated method stub
		lunchMapper.updateLunch(lunch);
	}

	@Override
	public Lunch getLunchByid(int id) {
		// TODO Auto-generated method stub
		return lunchMapper.getLunchById(id);
	}

	@Override
	public List<Lunch> getLunchs() {
		// TODO Auto-generated method stub
		List<Lunch> list = lunchMapper.getLunchs();
		return list;
	}

	@Override
	public List<Lunch> getLunchsByKeyword(String keyword) {
		// TODO Auto-generated method stub
		List<Lunch> list = lunchMapper.getLunchsBykeyword(keyword);
		return list;
	}

}
