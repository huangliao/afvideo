package com.gl.app.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gl.app.entity.User;
import com.gl.app.mapper.UserMapper;
import com.mysql.jdbc.StringUtils;

@Controller
@RequestMapping("/Mech")
public class MechController {

	private UserMapper userMapper = null;

	@Autowired
	public void setMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@RequestMapping("/MechIndex")
	public ModelAndView MechIndex(HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView("Mech/MechIndex");
		List<User> list = userMapper.getAllUser();
		mv.addObject("user", list);
		return mv;
	}
	@RequestMapping("/MechAdd")
	public ModelAndView MechAdd(HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView("Mech/MechAdd");
		/*List<User> list = userMapper.getAllUser();*/
		mv.addObject("user", user);
		return mv;
	}
	@RequestMapping("/MechAddUser")
	public ModelAndView MechAddUser(HttpServletRequest request,
			HttpServletResponse response,User user) {
		ModelAndView mv = new ModelAndView("Mech/MechIndex");
//		user.setId(UUID.randomUUID().toString());
		User selectUser = userMapper.selectUserByUserName(user.getUserName());
		if(selectUser!=null){
			mv.setViewName("Mech/MechAdd");
			mv.addObject("msg", "该用户已存在！");
			return mv;
		}
		userMapper.addUser(user);
		List<User> list = userMapper.getAllUser();
		mv.addObject("user", list);
		mv.addObject("users", user);
		return mv;
	}
	@RequestMapping("/MechEdit")
	public ModelAndView MechEdit(HttpServletRequest request,
			HttpServletResponse response,String id) {
		User user = (User)request.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView("Mech/MechEdit");
		/*List<User> list = userMapper.getAllUser();*/
		User EditUser = userMapper.selectUserById(id);
		mv.addObject("user", EditUser);
		return mv;
	}
	@RequestMapping("/MechEditUser")
	public ModelAndView MechEditUser(HttpServletRequest request,
			HttpServletResponse response,User user) {
		User users = (User)request.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView("Mech/MechIndex");
/*		User selectUser = userMapper.selectUserByUserName(user.getUserName());
		if(selectUser!=null){
			mv.setViewName("Mech/MechEdit");
			mv.addObject("msg", "该用户已存在！");
			return mv;
		}*/
		if(user!=null){
			userMapper.update(user);
		}
		List<User> list = userMapper.getAllUser();
		mv.addObject("user", list);
		return mv;
	}
	@RequestMapping("/MechSelectUser")
	public ModelAndView MechSelectUser(HttpServletRequest request,
			HttpServletResponse response,User user) {
		User users = (User)request.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView("Mech/MechIndex");
		User selectUser = userMapper.selectUserByUserName(user.getUserName());
		List<User> list = new ArrayList<User>();
		if(selectUser!=null){
			list.add(selectUser);
		}else{
			list = userMapper.getAllUser();
		}
		mv.addObject("user", list);
		return mv;
	}
}
