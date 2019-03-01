package com.school.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.school.dao.UserMapper;
import com.school.pojo.User;
import com.school.service.UserService;

@Controller
@RequestMapping("/user")
//使用@sessionAttributes
@SessionAttributes("user")
public class UserController {
	@Resource
	UserService userService;
	//登录
	@RequestMapping("/login")
	public String login(HttpServletRequest request,Model model){
		String username = String.valueOf(request.getParameter("username"));
		String password = String.valueOf(request.getParameter("password"));
		boolean flag=false;
		flag = userService.checkLogin(username,password);
		System.out.println(username+password);
		if (flag==true) {
			User user = new User();
			user.setId(userService.getUserIdByUsername(username));
			user.setUsername(username);
			user.setPassword(password);
			model.addAttribute("user",user);
			return "index";
		}else {
			return "redirect:/login.jsp";
		}
		
	}
	//注销
	@RequestMapping("/loginout")
	public String loginou(HttpSession session,SessionStatus sessionStatus){
		session.removeAttribute("user");
		session.invalidate();
		sessionStatus.setComplete();
		return "redirect:/login.jsp";
	}
	//注册页面
	@RequestMapping("/addUserUI")
	public String addUserUI(){
		return "adduser";
	}
	//注册
	@RequestMapping("/adduser")
	public String adduser(HttpServletRequest request,Model model){
		User user = new User();
		user.setUsername(String.valueOf(request.getParameter("username")));
		user.setPassword(String.valueOf(request.getParameter("password")));
		userService.userRegist(user);
		return "redirect:userList";
	}
	//删除
	@RequestMapping("/deluser")
	public String deluser(HttpServletRequest request){
		Integer id = Integer.parseInt(request.getParameter("id"));
		userService.userDelete(id);
		return "redirect:userList";
	}
	//更新页面
	@RequestMapping("/updateUserUI")
	public String updateUserUI(HttpServletRequest request,Model model){
		Integer id = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUserById(id);
		model.addAttribute("user",user);
		return "updateuser";
	}
	//更新
	@RequestMapping("/updateuser")
	public String updateuser(HttpServletRequest request,Model model){
		Integer id = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUserById(id);
		user.setPassword(String.valueOf(request.getParameter("password")));
		userService.userUpdate(user);
		return "redirect:userList";
	}
	//管理员列表
	@RequestMapping("/userList")
	public String userList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<User> list = userService.getUsers();
		PageInfo<User> p = new PageInfo<User>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "userList";
	}
}
