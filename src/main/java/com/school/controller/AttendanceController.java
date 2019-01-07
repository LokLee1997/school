package com.school.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.school.pojo.Attendance;
import com.school.pojo.Student;
import com.school.service.AttendanceService;
import com.school.service.StudentService;

@Controller
@RequestMapping("/att")
public class AttendanceController {
	@Resource
	private AttendanceService attendanceService;
	@Resource
	private StudentService studentService;
	
	@RequestMapping("/addAttUI")
	public String addAttUI(HttpServletRequest request,Model model){
		String id = String.valueOf(request.getParameter("id"));
		Student student = studentService.getStudentById(id);
		model.addAttribute("student",student);
		return "addAtt";
	}
	@RequestMapping("/addAtt")
	public String addAtt(HttpServletRequest request,Model model){
		Attendance attendance = new Attendance();
		attendance.setDate(String.valueOf(request.getParameter("date")));
		attendance.setState(Integer.parseInt(request.getParameter("state")));
		attendance.setStudentid(String.valueOf(request.getParameter("studentid")));
		attendanceService.addAtt(attendance);
		return "redirect:attList";
	}
	@RequestMapping("/updateAttUI")
	public String updateAttUI(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("id"));
		Attendance attendance = attendanceService.getAttendanceById(id);
		model.addAttribute("att",attendance);
		return "updateAtt";
		
	}
	
	@RequestMapping("/updateAtt")
	public String updateAtt(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("id"));
		Attendance attendance = attendanceService.getAttendanceById(id);
		attendance.setState(Integer.parseInt(request.getParameter("state")));
		attendance.setDate(String.valueOf(request.getParameter("date")));
		attendanceService.updateAtt(attendance);
		return "redirect:attList";
	}
	
	@RequestMapping("/delAtt")
	public String delAtt(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		attendanceService.delAtt(id);
		return "redirect:attList";
	}
	
	@RequestMapping("/attList")
	public String attList(HttpServletRequest request,Model model){
		List<Attendance> list = attendanceService.getAttendances();
		model.addAttribute("atts",list);
		return "attList";
	}
}
