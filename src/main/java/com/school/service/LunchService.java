package com.school.service;

import java.util.List;

import com.school.pojo.Lunch;

public interface LunchService {
	public void addLunch(Lunch lunch);
	public void delLunch(int id);
	public void updateLunch(Lunch lunch);
	public Lunch getLunchByid(int id);
	public List<Lunch> getLunchs();
}
