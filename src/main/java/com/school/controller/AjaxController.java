package com.school.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Depart;
import com.school.pojo.Student;
import com.school.service.AttendanceService;
import com.school.service.ClassesService;
import com.school.service.CourseService;
import com.school.service.DepartService;
import com.school.service.StudentService;
import com.school.service.TeachersService;

@Controller
@RequestMapping("/ajax")
public class AjaxController {
	@Resource 
	private ClassesService classesService;
	@Resource
	private DepartService departService;
	@Resource
	private StudentService studentService;
	@Resource
	private TeachersService teachersService;
	@Resource
	private CourseService courseService;
	//获取班级列表
	@RequestMapping(value="getCls")
	@ResponseBody
	public List<Classes> getCls(HttpServletRequest request,HttpServletResponse response){
		List<Classes> list = classesService.getCls();
		return list;
	}
	//检查班级名是否重复
	@RequestMapping(value="checkClsName")
	@ResponseBody
	public void checkClsName(@RequestParam("classname") String classname,HttpServletResponse response){
		List<Classes> list = classesService.getCls();
		boolean flag = false;//用于标记是否存在，false为不存在
		for (Classes classes : list) {
			if(classes.getClassname().equals(classname)){
				flag = true;
			}
		}
		if (flag==true) {
			System.out.println(flag);
			String result = "true";
			try {
				response.getWriter().write(result);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			System.out.println(flag);
			String result = "false";
			try {
				response.getWriter().write(result);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
	}
	//获取部门列表
	@RequestMapping(value="getDep")
	@ResponseBody
	public List<Depart> getDeparts(HttpServletRequest request,HttpServletResponse response){
		List<Depart> list = departService.getDep();
		return list;
	}
	//获取学生列表
	@RequestMapping(value="getStu")
	@ResponseBody
	public List<Student> getStudents(HttpServletRequest request,HttpServletResponse response){
		List<Student> list = studentService.getStu();
		return list;
	}
	//检查学生id是否重复
	@RequestMapping(value="checksid")
	@ResponseBody
	public void checksid(@RequestParam("sid") String sid,HttpServletResponse response){
		boolean flag= studentService.checksid(sid);
		if (flag==false) {
			String result = "false";
			try {
				response.getWriter().write(result);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else {
			String result = "true";
			try {
				response.getWriter().write(result);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	@RequestMapping(value="checkCouName")
	@ResponseBody
	public void checkCouName(@RequestParam("cname") String cname,HttpServletResponse response){
		List<Course> list = courseService.getCourses();
		boolean flag = false;//用于标记是否存在，false为不存在
		for (Course course : list) {
			if(course.getCname().equals(cname)){
				flag = true;
			}
		}
		if (flag==true) {
			System.out.println(flag);
			String result = "true";
			try {
				response.getWriter().write(result);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			System.out.println(flag);
			String result = "false";
			try {
				response.getWriter().write(result);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
	}
	
}
