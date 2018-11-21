package com.school.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.school.pojo.Course;
import com.school.pojo.Teachers;
import com.school.service.TeachersService;


@Controller
@RequestMapping("/tes")
public class TeachersController {
	@Resource
	private TeachersService teachersService;
	
	@RequestMapping("/addtesUI")
	public String addtesUI(){
		return "addtes";
	}
	@RequestMapping("/addtes")
	public String addtes(HttpServletRequest request,Model model){
		Teachers teachers = new Teachers();
		teachers.setTname(String.valueOf(request.getParameter("tname")));
		teachers.setTsex(String.valueOf(request.getParameter("tsex")));
		teachers.setTbirthday(String.valueOf(request.getParameter("tbirthday")));
		teachers.setDepart(Integer.parseInt(request.getParameter("depart")));
		teachersService.addtes(teachers);
		return "redirect:tesList";
	}
	
	@RequestMapping("/deltes")
	public String deltes(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("tno"));
		teachersService.deltes(id);
		return "redirect:tesList";
	}
	
	@RequestMapping("/updatetesUI")
	public String updatetesUI(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("tno"));
		Teachers teachers = teachersService.gettesById(id);
		model.addAttribute("teachers",teachers);
		return "updatetes";
	}
	
	@RequestMapping("/updatetes")
	public String updatetes(HttpServletRequest request,Model model){
		int id=Integer.parseInt(request.getParameter("tno"));
		Teachers teachers = teachersService.gettesById(id);
		teachers.setTname(String.valueOf(request.getParameter("tname")));
		teachers.setTsex(String.valueOf(request.getParameter("tsex")));
		teachers.setTbirthday(String.valueOf(request.getParameter("tbirthday")));
		teachers.setDepart(Integer.parseInt(request.getParameter("depart")));
		teachersService.updatetes(teachers);
		return "redirect:tesList";
	}
	
	
	@RequestMapping("/tesList")
	public String tesList(HttpServletRequest request,Model model){
		List<Teachers> list = teachersService.gettes();
		model.addAttribute("list",list);
		return "tesList";
	}
	@RequestMapping("/tesInfo")
	public String tesInfo(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("tno"));
		Teachers teachers = teachersService.gettesById(id);
		List<Course> courses = teachersService.getCourses(id);
		model.addAttribute("teacher",teachers);
		model.addAttribute("courses",courses);
		return "tesInfo";
	}
}
