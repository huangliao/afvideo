package com.gl.app.tools;

import java.util.UUID;

import com.gl.app.entity.MsgModel;
import com.google.gson.GsonBuilder;

public class Test {
public static void main(String[] args){
	
	System.out.println(UUID.randomUUID());
	
	System.out.println(UUID.randomUUID());
	MsgModel m = new MsgModel(false, "fd", null);
	
	String g = new GsonBuilder().serializeNulls().create().toJson(m);
	

	//	System.out.println(new ObjectMapper().writeValueAsString(m));
	//这是在浏览器上改的
	//修改提交 再改一次 //浏览器来一发
	
}
}
