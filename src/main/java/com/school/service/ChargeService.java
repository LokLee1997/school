package com.school.service;

import java.util.List;

import com.school.pojo.Charge;

public interface ChargeService {
	public void addCharge(Charge charge);
	public void updateCharge(Charge charge);
	public void updateChargeState(Charge charge);
	public void deleteCharge(int id);
	public List<Charge> getCharges();
	public Charge getChargeById(int id);
	public List<Charge> getChargesBykeyword(String keyword);
}
