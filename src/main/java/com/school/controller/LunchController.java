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
import com.school.pojo.Lunch;
import com.school.service.LunchService;

@Controller
@RequestMapping("/lunch")
public class LunchController {
	@Resource 
	private LunchService lunchService;
	
	@RequestMapping("/addLunchUI")
	public String addLunchUI(){
		return "addLunch";
	}
	@RequestMapping("/addLunch")
	public String addLunch(HttpServletRequest request,Model model){
		Lunch lunch = new Lunch();
		lunch.setDate(String.valueOf(request.getParameter("date")));
		lunch.setCaipin(String.valueOf(request.getParameter("caipin")));
		lunch.setCookerid(Integer.parseInt(request.getParameter("cookerid")));
		lunchService.addLunch(lunch);
		return "redirect:lunchList";
	}
	@RequestMapping("/delLunch")
	public String delLunch(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		lunchService.delLunch(id);
		return "redirect:lunchList";
	}
	@RequestMapping("/updateLunchUI")
	public String updateLunchUI(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("id"));
		Lunch lunch = lunchService.getLunchByid(id);
		model.addAttribute("lunch",lunch);
		return "updateLunch";
	}
	@RequestMapping("/updateLunch")
	public String updateLunch(HttpServletRequest request,Model model){
		int id = Integer.parseInt(request.getParameter("id"));
		Lunch lunch = lunchService.getLunchByid(id);
		lunch.setDate(String.valueOf(request.getParameter("date")));
		lunch.setCaipin(String.valueOf(request.getParameter("caipin")));
		lunch.setCookerid(Integer.parseInt(request.getParameter("cookerid")));
		lunchService.updateLunch(lunch);
		return "redirect:lunchList";
	}
	@RequestMapping("/lunchList")
	public String lunchList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		PageHelper.startPage(page,10);
		List<Lunch> list = lunchService.getLunchs();
		PageInfo<Lunch> p= new PageInfo<Lunch>(list);
		model.addAttribute("page",p);
		model.addAttribute("list",list);
		return "lunchList";
	}
}
