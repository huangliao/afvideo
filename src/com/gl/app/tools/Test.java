package com.gl.app.tools;

import java.io.IOException;
import java.util.UUID;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.gl.app.entity.MsgModel;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Test {
public static void main(String[] args){
	
	System.out.println(UUID.randomUUID());
	
	System.out.println(UUID.randomUUID());
	MsgModel m = new MsgModel(false, "fd", null);
	
	String g = new GsonBuilder().serializeNulls().create().toJson(m);
	

	//	System.out.println(new ObjectMapper().writeValueAsString(m));

	
}
}
