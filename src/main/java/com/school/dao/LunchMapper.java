package com.school.dao;

import java.util.List;

import com.school.pojo.Lunch;

public interface LunchMapper {
	public void addLunch(Lunch lunch);
	public void delLunch(int id);
	public void updateLunch(Lunch lunch);
	public Lunch getLunchById(int id);
	public List<Lunch> getLunchs();
	public List<Lunch> getLunchsBykeyword(String keyword);
}
