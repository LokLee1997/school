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
import com.school.pojo.Classes;
import com.school.pojo.Depart;
import com.school.pojo.Teachers;
import com.school.service.DepartService;

@Controller
@RequestMapping("/dep")
public class DepartController {
	@Resource
	private DepartService departService;
	
	@RequestMapping("/addDepUI")
	public String addDepUI(){
		return "addDep";
	}
	@RequestMapping("/addDep")
	public String addDep(HttpServletRequest request,Model model){
		Depart depart = new Depart();
		depart.setDname(String.valueOf(request.getParameter("dname")));
		departService.addDep(depart);
		return "redirect:depList";
	}
	
	@RequestMapping("/delDep")
	public String delDep(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("did"));
		departService.delDep(id);
		return "redirect:depList";
	}
	
	@RequestMapping("/updateDepUI")
	public String updateDepUI(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("did"));
		Depart depart = departService.getDepById(id);
		model.addAttribute("depart",depart);
		return "updateDep";
	}
	
	@RequestMapping("/updateDep")
	public String updateDep(HttpServletRequest request,Model model){
		int id=Integer.parseInt(request.getParameter("did"));
		Depart depart = departService.getDepById(id);
		depart.setDname(String.valueOf(request.getParameter("dname")));
		departService.updateDep(depart);
		return "redirect:depList";
	}
	
	
	@RequestMapping("/depList")
	public String stuList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Depart> list = departService.getDep();
		PageInfo<Depart> p = new PageInfo<Depart>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "depList";
	}
	@RequestMapping("/depInfo")
	public String depInfo(HttpServletRequest request,Model model){
		int did=Integer.parseInt(request.getParameter("did"));
		Depart depart = departService.getDepById(did);
		int num=departService.countDepNum(did);
		List<Teachers> tList = departService.getDepTeachers(did);
		model.addAttribute("depart",depart);
		model.addAttribute("num",num);
		model.addAttribute("tList",tList);
		return "depInfo";
	}
}
