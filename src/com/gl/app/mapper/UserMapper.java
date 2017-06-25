package com.gl.app.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gl.app.entity.User;

public interface UserMapper {
	
	public List<User> getUserByPage(@Param("start") int start,@Param("size") int size);
	
	public int getCount();
	
	//用户名是否存在
	public int isExitsName(@Param("username")String username);
	
	public int addUser(User user);

	public List<User> getAllUser();

	
	
	public User getUserById(String id);

	public int deleteById(int id);

	public int update(User user);

	public User selectUser(User user);

	public User selectUserByUserName(String userName);

	public User selectUserById(String id);

	public List<Map<String, String>> selectMenu(String pid);

}
