package com.school.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.school.pojo.Course;
import com.school.pojo.Teachers;
import com.school.service.CourseService;
import com.school.service.TeachersService;

@Controller
@RequestMapping("/cou")
public class CourseController {
	@Resource
	private CourseService courseService;
	@Resource
	private TeachersService teachersService;
	
	@RequestMapping("/addCouUI")
	public String addCouUI(){
		return "addCou";
	}
	@RequestMapping("/addCou")
	public String addCou(HttpServletRequest request,Model model){
		Course course = new Course();
		int id = Integer.parseInt(request.getParameter("tno"));
		course.setCname(String.valueOf(request.getParameter("cname")));
		courseService.addCou(course);
		return "redirect:couList";
	}
	
	@RequestMapping("/delCou")
	public String delCou(HttpServletRequest request){
		String cname=String.valueOf(request.getParameter("cname"));
		courseService.delCou(cname);
		return "redirect:couList";
	}
	
	@RequestMapping("/updateCouUI")
	public String updateCouUI(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("cno"));
		Course course = courseService.getCourseById(id);
		model.addAttribute("course",course);
		return "updateCou";
	}
	
	@RequestMapping("/updateCou")
	public String updateCou(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("cno"));
		Course course = courseService.getCourseById(id);
		course.setCname(String.valueOf(request.getParameter("cname")));
		courseService.updateCou(course);
		return "redirect:couList";
	}
	
	
	@RequestMapping("/couList")
	public String stuList(HttpServletRequest request,Model model){
		List<Course> list = courseService.getCourses();
		model.addAttribute("list",list);
		return "couList";
	}
	@RequestMapping("/couInfo")
	public String couInfo(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("cno"));
		Course course = courseService.getCourseById(id);
		List<Teachers> tList = courseService.getTeachers(id);
		model.addAttribute("course",course);
		model.addAttribute("tList",tList);
		return "couInfo";
	}
}
