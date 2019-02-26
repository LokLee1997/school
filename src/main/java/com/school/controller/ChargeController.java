package com.school.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.school.pojo.Charge;
import com.school.pojo.Classes;
import com.school.service.ChargeService;

@Controller
@RequestMapping("/charge")
public class ChargeController {
	@Resource
	private ChargeService chargeService;
	
	@RequestMapping("/addChargeUI")
	public String addChargeUI(){
		return "addCharge";
	}
	@RequestMapping("/addCharge")
	public String addCharge(HttpServletRequest request,Model model){
		Charge charge = new Charge();
		charge.setChargeitem(String.valueOf(request.getParameter("chargeitem")));
		charge.setPrice(Integer.parseInt(request.getParameter("price")));
		charge.setStudentid(String.valueOf(request.getParameter("studentid")));
		charge.setTeacherid(Integer.parseInt(request.getParameter("teachertno")));
		chargeService.addCharge(charge);
		return "redirect:chargeList";
	}
	@RequestMapping("/deleteCharge")
	public String deleteCharge(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		chargeService.deleteCharge(id);
		return "redirect:chargeList";
	}
	@RequestMapping("/updateChargeState")
	public String updateChargeState(HttpServletRequest request,Model model){
		int id=Integer.parseInt(request.getParameter("id"));
		Charge charge = chargeService.getChargeById(id);
		chargeService.updateChargeState(charge);
		return "redirect:chargeList";
	}
	@RequestMapping("/updateChargeUI")
	public String updateChargeUI(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("id"));
		Charge charge = chargeService.getChargeById(id);
		model.addAttribute("charge",charge);
		return "updateCharge";
	}
	@RequestMapping("/updateCharge")
	public String updateCharge(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("id"));
		Charge charge = chargeService.getChargeById(id);
		charge.setStudentid(String.valueOf(request.getParameter("studentid")));
		charge.setChargeitem(String.valueOf(request.getParameter("chargeitem")));
		charge.setPrice(Integer.parseInt(request.getParameter("price")));
		charge.setIspay(Integer.parseInt(request.getParameter("ispay")));
		charge.setTeacherid(Integer.parseInt(request.getParameter("teachertno")));
		chargeService.updateCharge(charge);
		return "redirect:chargeList";
	}
	@RequestMapping("/chargeList")
	public String chargeList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Charge> list = chargeService.getCharges();
		PageInfo<Charge> p = new PageInfo<Charge>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "chargeList";
	}
	@RequestMapping("/chargeInfo")
	public String chargeInfo(HttpServletRequest request,Model model){
		int id=Integer.parseInt(request.getParameter("id"));
		Charge charge = chargeService.getChargeById(id);
		model.addAttribute("charge",charge);
		return "chargeInfo";
	}
}
