package com.school.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.school.pojo.Student;
import com.school.service.StudentService;

@Controller
@RequestMapping("/stu")
public class StudentController {
	@Resource
	private StudentService studentService;
	

	@RequestMapping("/addStuUI")
	public String addStuUI(){
		return "addStu";
	}
	@RequestMapping("/addStu")
	public String addStu(HttpServletRequest request,Model model){
		Student student = new Student();
		student.setSid(String.valueOf(request.getParameter("sid")));
		student.setSname(String.valueOf(request.getParameter("sname")));
		student.setSsex(String.valueOf(request.getParameter("ssex")));
		student.setSbirthday(String.valueOf(request.getParameter("sbirthday")));
		student.setClassid(Integer.parseInt(request.getParameter("classid")));
		studentService.addStu(student);
		return "redirect:stuList";
	}
	
	@RequestMapping("/delStu")
	public String delStu(HttpServletRequest request){
		String id = String.valueOf(request.getParameter("sid"));
		studentService.delStu(id);
		return "redirect:stuList";
	}
	
	@RequestMapping("/updateStuUI")
	public String updateStuUI(HttpServletRequest request,Model model){
		String id = String.valueOf(request.getParameter("sid"));
		Student student = studentService.getStudentById(id);
		model.addAttribute("student",student);
		return "updateStu";
	}
	
	@RequestMapping("/updateStu")
	public String updateStu(HttpServletRequest request,Model model){
		String id =String.valueOf(request.getParameter("sid"));
		Student student = studentService.getStudentById(id);
		student.setSname(String.valueOf(request.getParameter("sname")));
		student.setSsex(String.valueOf(request.getParameter("ssex")));
		student.setSbirthday(String.valueOf(request.getParameter("sbirthday")));
		//student.setClassid(Integer.parseInt(request.getParameter("classid")));
		studentService.updateStu(student);
		return "redirect:stuList";
	}
	
	@RequestMapping("/stuInfo")
	public String showStu(HttpServletRequest request,Model model){
		String id =String.valueOf(request.getParameter("sid"));
		Student student = studentService.getStudentById(id);
		model.addAttribute("student",student);
		return "stuInfo";
	}
	
	@RequestMapping("/stuList")
	public String stuList(HttpServletRequest request,Model model){
		List<Student> list = studentService.getStu();
		model.addAttribute("list",list);
		return "stuList";
	}
}
