package com.gl.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gl.app.mapper.UserMapper;

@Controller
@RequestMapping(value = "/")
public class HomeController {

	private UserMapper userMapper = null;
	//地址为/login或者直接打项目名时 进入登录页面
	@RequestMapping(value = "/login")
	public String update(HttpServletRequest request,
			HttpServletResponse response) {
		return "login";
	}
	@RequestMapping(value = "/")
	public String login(HttpServletRequest request,
			HttpServletResponse response) {
		return "login";
	}
}
