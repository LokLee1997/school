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
import com.school.pojo.Classcourse;
import com.school.pojo.Classes;
import com.school.pojo.Course;
import com.school.pojo.Student;
import com.school.pojo.Teacherclass;
import com.school.pojo.Teachers;
import com.school.service.ClassCourseService;
import com.school.service.ClassesService;
import com.school.service.StudentService;
import com.school.service.TeacherClassService;

@Controller
@RequestMapping("/cls")
public class ClassesController {
	@Resource
	private ClassesService classesService;
	@Resource
	private ClassCourseService classCourseService;
	@Resource
	private TeacherClassService teacherClassService;
	@Resource
	private StudentService studentService;
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
	@RequestMapping("/addClsCouUI")
	public String addClsCouUI(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("id"));
		Classes classes = classesService.getClsById(id);
		model.addAttribute("classes",classes);
		return "addClsCou";
	}
	@RequestMapping("/addClsCou")
	public String addClsCou(HttpServletRequest request,Model model){
		Classcourse classcourse = new Classcourse();
		classcourse.setClassid(Integer.parseInt(request.getParameter("classid")));
		classcourse.setCourseno(Integer.parseInt(request.getParameter("courseno")));
		classCourseService.addClass_Course(classcourse);
		int id = Integer.parseInt(request.getParameter("classid"));
		return "redirect:clsInfo?id="+id;
	}
	@RequestMapping("/addClsTesUI")
	public String addClsTesUI(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("id"));
		Classes classes = classesService.getClsById(id);
		model.addAttribute("classes",classes);
		return "addClsTes";
	}
	@RequestMapping("/addClsTes")
	public String addClsTes(HttpServletRequest request,Model model){
		Teacherclass teacherclass = new Teacherclass();
		teacherclass.setClassid(Integer.parseInt(request.getParameter("classid")));
		teacherclass.setTeachertno(Integer.parseInt(request.getParameter("teachertno")));
		teacherClassService.addTeacher_Class(teacherclass);
		int id = Integer.parseInt(request.getParameter("classid"));
		return "redirect:clsInfo?id="+id;
	}
	@RequestMapping("/delCls")
	public String delCls(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		classesService.delCls(id);
		return "redirect:clsList";
	}
	@RequestMapping("/delClsCou")
	public String delClsCou(HttpServletRequest request){
		int classid=Integer.parseInt(request.getParameter("classid"));
		int courseno=Integer.parseInt(request.getParameter("courseno"));
		classCourseService.delClass_Course(classid, courseno);
		int id = Integer.parseInt(request.getParameter("classid"));
		return "redirect:clsInfo?id="+id;
	}
	@RequestMapping("/delClsTes")
	public String delClsTes(HttpServletRequest request){
		int classid=Integer.parseInt(request.getParameter("classid"));
		int teachertno=Integer.parseInt(request.getParameter("teachertno"));
		teacherClassService.delTeacher_Class(classid, teachertno);
		int id = Integer.parseInt(request.getParameter("classid"));
		return "redirect:clsInfo?id="+id;
	}
	@RequestMapping("/delClsStu")
	public String delString(HttpServletRequest request){
		String sid = String.valueOf(request.getParameter("sid"));
		Student student = studentService.getStudentById(sid);
		studentService.setStudentCls(student);
		int id = Integer.parseInt(request.getParameter("classid"));
		return "redirect:clsInfo?id="+id;
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
	public String stuList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Classes> list = classesService.getCls();
		PageInfo<Classes> p = new PageInfo<Classes>(list);
		model.addAttribute("page",p);
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
