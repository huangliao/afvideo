package com.gl.app.tools;

import java.io.IOException;
import java.util.Date;

import org.apache.log4j.Logger;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class Test {
	public static void main(String[] args) throws Exception, IOException {
		
		Logger log = Logger.getLogger(Test.class);
		
		
		log.debug("This is debug msg");
		log.info("This is info msg");
		log.info("This is error msg");
		
		
		
	}

	public static void getResponse() {

		String url = "http://localhost:8080/Home2/user/isExitsName";
		// 测试提交 再来
		OkHttpClient client = new OkHttpClient();

		RequestBody body = new FormBody.Builder().add("userName", "po").build();

		Request request = new Request.Builder().url(url).post(body).build();

		client.newCall(request).enqueue(new Callback() {

			@Override
			public void onResponse(Call arg0, Response arg1) throws IOException {
				// TODO Auto-generated method stub
				System.out.println("is ==>" + arg1.body().string());
			}

			@Override
			public void onFailure(Call arg0, IOException arg1) {
				// TODO Auto-generated method stub

			}
		});

	}
}
