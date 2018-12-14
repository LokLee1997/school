package com.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.ChargeMapper;
import com.school.pojo.Charge;
import com.school.service.ChargeService;
@Transactional
@Service("chargeService")
public class ChargeServiceImpl implements ChargeService {
	@Resource
	private ChargeMapper chargeMapper;
	@Override
	public void addCharge(Charge charge) {
		// TODO Auto-generated method stub
		chargeMapper.addCharge(charge);
	}

	@Override
	public void updateCharge(Charge charge) {
		// TODO Auto-generated method stub
		chargeMapper.updateCharge(charge);
	}

	@Override
	public void updateChargeState(Charge charge) {
		// TODO Auto-generated method stub
		chargeMapper.updateChargeState(charge);
	}

	@Override
	public void deleteCharge(int id) {
		// TODO Auto-generated method stub
		chargeMapper.deleteCharge(id);
	}

	@Override
	public List<Charge> getCharges() {
		// TODO Auto-generated method stub
		List<Charge> list = chargeMapper.getCharges();
		return list;
	}

	@Override
	public Charge getChargeById(int id) {
		// TODO Auto-generated method stub
		Charge charge = chargeMapper.getChargeById(id);
		return charge;
	}

}
