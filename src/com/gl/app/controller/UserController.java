package com.gl.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gl.app.entity.MsgModel;
import com.gl.app.entity.User;
import com.gl.app.mapper.UserMapper;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	private UserMapper userMapper = null;

	@Autowired
	public void setMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String showForm(ModelMap model) {
		List<User> users = userMapper.getAllUser();
		model.addAttribute("users", users);
		return "hello";
	}

	@RequestMapping(value = "/isExitsName")
	@ResponseBody
	public String isExitsName(HttpServletRequest request) {

		String userName = request.getParameter("userName");

		int count = userMapper.isExitsName(userName);

		MsgModel msg = null;
		
		if (count > 0) {
			msg = new MsgModel(false, "用户名已存在");
		} else {
			msg = new MsgModel(true, "用户名可以使用");
		}

		return msg.toJson();
	}

	@RequestMapping(value = "/update")
	@ResponseBody
	public String update(HttpServletRequest request) {
		// 更改数据
		int id = Integer.parseInt(request.getParameter("id"));
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = new User();
		user.setId(id);
		user.setUserName(userName);
		user.setPassword(password);
		// 获取影响行数

		int infRow = userMapper.update(user);
		System.out.println("行数->" + infRow);
		MsgModel msg = null;
		if (infRow > 0) {
			msg = new MsgModel(true, "修改成功");
			System.out.println("修改成功");
		} else {
			msg = new MsgModel(false, "修改失败");
			System.out.println("修改失败");
		}

		return msg.toJson();
	}

	@RequestMapping(value = "getByPage")
	@ResponseBody
	public String getByPage(HttpServletRequest request) {
		// 获取查询页数和每页大小
		int page = Integer.parseInt(request.getParameter("page"));
		int size = Integer.parseInt(request.getParameter("size"));

		List<User> list = userMapper.getUserByPage((page - 1) * size, size);
		MsgModel msg = null;
		// 总记录数
		int countNum = userMapper.getCount();
		// 总页数
		int countPage = countNum < size ? 1 : countNum % size == 0 ? countNum
				/ size : countNum / size + 1;
		// 输出总页数
		// System.out.println("总页数:" + countPage);

		if (list != null) {
			msg = new MsgModel(true, countPage + "", list);
		} else {
			msg = new MsgModel(false, "查询失败");
		}
		return msg.toJson();
	}

	@RequestMapping(value = "/welcome")
	public ModelAndView hello() {
		ModelAndView mv = new ModelAndView("hello");
		// List<User> list = userMapper.getAllUser();
		// mv.addObject("users", list);

		return mv;
	}

	@RequestMapping(value = "/register")
	public ModelAndView register(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("hello");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = new User();
		// user.setId(UUID.randomUUID().toString());
		user.setUserName(userName);
		user.setPassword(password);
		int id = userMapper.addUser(user);

		id = user.getId();

		if (id != 0) {
			System.out.println("id:" + id);
			System.out.println("ok1 ok 1");
		} else {
			System.out.println("添加失败");
		}

		// userMapper.addUser(user);
		List<User> list = userMapper.getAllUser();
		mv.addObject("users", list);

		return mv;

	}

	// ,produces="text/html;charset=UTF-8"
	@RequestMapping(value = "/add")
	@ResponseBody
	public String add(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		int id = userMapper.addUser(user);
		MsgModel msg;
		if (id != 0) {
			System.out.println("添加成功");
			msg = new MsgModel(true, "添加成功", user);
		} else {
			System.out.println("添加失败");
			msg = new MsgModel(false, "添加失败", null);
		}
		System.out.println(52 + msg.toJson());
		return msg.toJson();
	}

	@RequestMapping(value = "/getAll")
	public String getAll() {

		List<User> list = userMapper.getAllUser();
		MsgModel msg = null;
		// 有数据
		if (list != null) {
			msg = new MsgModel(true, "查询成功", list);

		} else {
			msg = new MsgModel(false, "查询失败");
		}

		return msg.toJson();

	}

	@RequestMapping(value = "/loginGo")
	public ModelAndView loginGo(HttpServletRequest request,
			HttpServletResponse response, User user, Model model) {
		ModelAndView mv = new ModelAndView("hello");
		if (user == null || user.getUserName() == null) {
			mv.setViewName("login");
			return mv;
		}
		System.out.println(new Gson().toJson(user));
		User u = userMapper.selectUser(user);
		// 登录成功
		if (u != null) {

			request.setAttribute("userName", u.getUserName());
			System.out.println("----" + u.getUserName());
			mv.setViewName("hello");
		} else {
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping(value = "/detail")
	public String detail(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		User user = userMapper.getUserById(id);
		model.addAttribute("user", user);
		return "detail";
	}

	@RequestMapping(value = "/delete")
	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		userMapper.deleteById(id);
		ModelAndView mv = new ModelAndView("hello");
		List<User> list = userMapper.getAllUser();
		mv.addObject("users", list);
		return mv;
	}

	@RequestMapping(value = "/toupdate")
	public String toUpdate(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		User user = userMapper.getUserById(id);
		model.addAttribute("user", user);
		return "update";
	}


}
