package com.school.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Depart;
import com.school.pojo.Student;
import com.school.pojo.Teachers;
import com.school.pojo.User;
import com.school.service.AttendanceService;
import com.school.service.ClassesService;
import com.school.service.CourseService;
import com.school.service.DepartService;
import com.school.service.StudentService;
import com.school.service.TeachersService;
import com.school.service.UserService;

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
	@Resource
	private UserService userService;
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
	//检查部门名是否重复
	@RequestMapping(value="checkDepName")
	@ResponseBody
	public void checkDepName(@RequestParam("dname") String dname,HttpServletResponse response){
		List<Depart> list = departService.getDep();
		boolean flag = false;//用于标记是否存在，false为不存在
		for (Depart depart : list) {
			if(depart.getDname().equals(dname)){
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
	//检查课程名称
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
	//获取课程列表
	@RequestMapping(value="getCou")
	@ResponseBody
	public List<Course> getCourses(HttpServletRequest request,HttpServletResponse response){
		List<Course> list = courseService.getCourses();
		return list;
	}
	//获取教育部教师名字
	@RequestMapping(value="getTes_edu")
	@ResponseBody
	public List<Teachers> getTes_edu(@RequestParam("dname") String dname,HttpServletResponse response){
		List<Teachers> list = teachersService.getTeachersByDepart(dname);
		return list;
	}
	//获取后勤部门教师
	@RequestMapping(value="getTes_rear")
	@ResponseBody
	public List<Teachers> getTes_rear(@RequestParam("dname") String dname,HttpServletResponse response){
		List<Teachers> list = teachersService.getTeachersByDepart(dname);
		return list;
	}
	//获取财会部门教师
	@RequestMapping(value="getTes_acc")
	@ResponseBody
	public List<Teachers> getTes_acc(@RequestParam("dname") String dname,HttpServletResponse response){
		List<Teachers> list = teachersService.getTeachersByDepart(dname);
		return list;
	}
	//检测用户
	@RequestMapping(value="checkLoginUser")
	@ResponseBody
	public void checkLoginUser(@RequestParam("username") String username,@RequestParam("password") String password,HttpServletResponse response){
		    boolean flag= userService.checkLogin(username, password);
		    System.out.println(username);
		    System.out.println(password);
			if (flag==true) {
				String result = "true";
				try {
					response.getWriter().write(result);
					System.out.println(result);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}else {
				String result = "false";
				try {
					response.getWriter().write(result);
					System.out.println(result);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		
		
	}
	//检测用户名
	@RequestMapping(value="checkusername")
	@ResponseBody
	public void checkUsername(@RequestParam("username") String username,HttpServletResponse response){
		boolean flag = userService.checkUsername(username);
		if (flag==true) {
			String result = "true";//可以使用
			try{
				response.getWriter().write(result);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else {
			String result = "false";//不可以使用
			try{
				response.getWriter().write(result);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}
