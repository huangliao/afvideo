package com.gl.app.mapper;

import java.util.List;
import java.util.Map;

import com.gl.app.entity.User;

public interface UserMapper {

	public int addUser(User user);

	public List<User> getAllUser();

	public User getUserById(String id);

	public void deleteById(String id);

	public void update(User user);

	public User selectUser(User user);

	public User selectUserByUserName(String userName);

	public User selectUserById(String id);

	public List<Map<String, String>> selectMenu(String pid);

}
