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
import com.school.pojo.Course;
import com.school.pojo.Lunch;
import com.school.pojo.Student;
import com.school.pojo.Teachers;
import com.school.service.AttendanceService;
import com.school.service.ChargeService;
import com.school.service.CourseService;
import com.school.service.LunchService;
import com.school.service.StudentService;
import com.school.service.TeachersService;

@Controller
@RequestMapping("/search")
//模糊查询
public class SearchController {
	@Resource
	private StudentService studentService;
	@Resource
	private TeachersService teachersService;
	@Resource
	private CourseService courseService;
	@Resource
	private AttendanceService attendanceService;
	@Resource 
	private LunchService lunchService;
	@Resource
	private ChargeService chargeService;
	
	@RequestMapping("/stuList")
	public String stuList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper .startPage(page,10);
		List<Student> list = studentService.getStudentsByKeyWord(String.valueOf(request.getParameter("keyword")));
		PageInfo<Student> p=new PageInfo<Student>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "stuList";	
	}
	
	@RequestMapping("/tesList")
	public String tesList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Teachers> list = teachersService.getTeachersByKeyword(String.valueOf(request.getParameter("keyword")));
		PageInfo<Teachers> p=new PageInfo<Teachers>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "tesList";
	}
	@RequestMapping("/couList")
	public String couList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Course> list = courseService.getCoursesByKeyword(String.valueOf(request.getParameter("keyword")));
		PageInfo<Course> p = new PageInfo<Course>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "couList";
	}
	@RequestMapping("/attList")
	public String attList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Attendance> list = attendanceService.getAttendancesByKeyword(String.valueOf(request.getParameter("keyword")));
		PageInfo<Attendance> p = new PageInfo<Attendance>(list);
		model.addAttribute("page",p);
		model.addAttribute("atts",list);
		return "attList";
	}
	
	@RequestMapping("/lunchList")
	public String lunchList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Lunch> list = lunchService.getLunchsByKeyword(String.valueOf(request.getParameter("keyword")));
		PageInfo<Lunch> p= new PageInfo<Lunch>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "lunchList";
	}
	@RequestMapping("/chargeList")
	public String chargeList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Charge> list = chargeService.getChargesBykeyword(String.valueOf(request.getParameter("keyword")));
		PageInfo<Charge> p = new PageInfo<Charge>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "chargeList";
	}
}
