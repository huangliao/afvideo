package com.gl.app.entity;

import com.google.gson.GsonBuilder;

public class MsgModel {
	private boolean state;
	private String msg;
	private Object obj;
	
	
	public MsgModel(boolean state, String msg) {
		super();
		this.state = state;
		this.msg = msg;
	}
	public MsgModel(boolean state, String msg, Object obj) {
		super();
		this.state = state;
		this.msg = msg;
		this.obj = obj;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	
	public String toJson(){
		//转化null值
		return new GsonBuilder().serializeNulls().create().toJson(this);
	}
	
	
}
