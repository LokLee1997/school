package com.school.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Student;
import com.school.pojo.Teachers;
import com.school.service.ClassesService;

@Controller
@RequestMapping("/cls")
public class ClassesController {
	@Resource
	private ClassesService classesService;
	
	@RequestMapping("/addClsUI")
	public String addClsUI(){
		return "addCls";
	}
	@RequestMapping("/addCls")
	public String addCls(HttpServletRequest request,Model model){
		Classes classes = new Classes();
		classes.setClassname(String.valueOf(request.getParameter("classname")));
		classesService.addCls(classes);
		return "redirect:clsList";
	}
	
	@RequestMapping("/delCls")
	public String delCls(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		classesService.delCls(id);
		return "redirect:clsList";
	}
	
	@RequestMapping("/updateClsUI")
	public String updateClsUI(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("id"));
		Classes classes = classesService.getClsById(id);
		model.addAttribute("classes",classes);
		return "updateCls";
	}
	
	@RequestMapping("/updateCls")
	public String updateCls(HttpServletRequest request,Model model){
		int id=Integer.parseInt(request.getParameter("id"));
		Classes classes = classesService.getClsById(id);
		classes.setClassname(String.valueOf(request.getParameter("classname")));
		classesService.updateCls(classes);
		return "redirect:clsList";
	}
	
	
	@RequestMapping("/clsList")
	public String stuList(HttpServletRequest request,Model model){
		List<Classes> list = classesService.getCls();
		model.addAttribute("list",list);
		return "clsList";
	}
	@RequestMapping("/clsInfo")
	public String clsInfo(HttpServletRequest request,Model model){
		int id=Integer.parseInt(request.getParameter("id"));
		Classes classes = classesService.getClsById(id);
		int num = classesService.countstu(id);
		List<Student> sList = classesService.getStudents(id);//得到班级学生列表
		List<Course> cList = classesService.getCourses(id);
		List<Teachers> tList = classesService.getTeachers(id);
		model.addAttribute("classes",classes);
		model.addAttribute("num",num);
		model.addAttribute("sList",sList);
		model.addAttribute("cList",cList);
		model.addAttribute("tList",tList);
		return "clsInfo";
	}
}
