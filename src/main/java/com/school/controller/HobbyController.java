package com.school.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.school.pojo.Hobby;
import com.school.pojo.Student;
import com.school.service.Stu_HobbyService;
import com.school.service.StudentService;


@Controller
@RequestMapping("/hobby")
public class HobbyController {
	@Resource
	private StudentService studentService;
	@Resource
	private Stu_HobbyService stu_HobbyService;
	
	
	@RequestMapping("/hobbyList")
	public String hobbyList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		String sid=String.valueOf(request.getParameter("sid"));
		Student student = studentService.getStudentById(sid);
		System.out.println(student);
		List<Hobby> list = stu_HobbyService.getHobbiesBySid(sid);
		PageInfo<Hobby> p=new PageInfo<Hobby>(list);
		model.addAttribute("student",student);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "hobbyList";
	}
	@RequestMapping("/addhobbyUI")
	public String addhobbyUI(HttpServletRequest request,Model model){
		String id =String.valueOf(request.getParameter("sid"));
		Student student = studentService.getStudentById(id);
		System.out.println(student);
		model.addAttribute("student",student);
		return "addhobby";
	}
	@RequestMapping("/addhobby")
	public String addhobby(HttpServletRequest request,Model model){
		String sid=String.valueOf(request.getParameter("sid"));
		Student student = studentService.getStudentById(sid);
		Hobby hobby = new Hobby();
		hobby.setHobby(String.valueOf(request.getParameter("hobby")));
		hobby.setStudentid(String.valueOf(request.getParameter("sid")));
		stu_HobbyService.addStu_Hobby(hobby);
		return "redirect:../stu/stuInfo?sid="+sid;
	}
	@RequestMapping("/deletehobby")
	public String deletehobby(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		String sid = String.valueOf(request.getParameter("sid"));
		stu_HobbyService.deleteStu_Hobby(id);
		return "redirect:hobbyList?sid="+sid;
	}
	
	@RequestMapping("/updatehobbyUI")
	public String updatehobbyUI(HttpServletRequest request,Model model){
		String id =String.valueOf(request.getParameter("sid"));
		Student student = studentService.getStudentById(id);
		Hobby hobby = stu_HobbyService.getHobby(Integer.parseInt(request.getParameter("id")));
		System.out.println(student);
		model.addAttribute("student",student);
		model.addAttribute("hobby",hobby);
		return "updatehobby";
	}
	@RequestMapping("/updatehobby")
	public String updatehobby(HttpServletRequest request,Model model){
		String sid=String.valueOf(request.getParameter("sid"));
		int id = Integer.valueOf(request.getParameter("id"));
		Student student = studentService.getStudentById(sid);
		Hobby hobby = stu_HobbyService.getHobby(id);
		hobby.setHobby(String.valueOf(request.getParameter("hobby")));
		hobby.setStudentid(String.valueOf(request.getParameter("sid")));
		stu_HobbyService.updateStu_Hobby(hobby);
		return "redirect:hobbyList?sid="+sid;
	}
}
