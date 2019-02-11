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
import com.school.pojo.Attendance;
import com.school.pojo.Charge;
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
		student.setClassid(Integer.parseInt(request.getParameter("classid")));
		studentService.updateStu(student);
		return "redirect:stuList";
	}
	
	@RequestMapping("/stuInfo")
	public String showStu(HttpServletRequest request,Model model){
		String id =String.valueOf(request.getParameter("sid"));
		Student student = studentService.getStudentById(id);
		List<Charge> cList = studentService.getChargesBySid(id);
		List<Attendance> aList = studentService.getAttendancesBySid(id);
		model.addAttribute("student",student);
		model.addAttribute("cList",cList);
		model.addAttribute("aList",aList);
		return "stuInfo";
	}
	
	@RequestMapping("/stuList")
	public String stuList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Student> list = studentService.getStu();
		PageInfo<Student> p=new PageInfo<Student>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "stuList";
	}
}
