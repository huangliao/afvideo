package com.gl.app.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Controller
@RequestMapping(value = "/upload")
public class UpLoadController {

	Logger log = Logger.getLogger(UpLoadController.class);
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String showForm(ModelMap model) {

		return "upload";
	}

	@RequestMapping("fileUpload")
	public String fileUpload(@RequestParam("file") CommonsMultipartFile file) throws IOException {
		// 用来检测程序运行时间
		long startTime = System.currentTimeMillis();
		System.out.println("fileName:" + file.getOriginalFilename());
		// 获取输出留
		OutputStream os = new FileOutputStream("E:/" + new Date().getTime() + file.getOriginalFilename());
		// 获取输入流 CommonsMultipartFile 中可以直接得到文件的流
		InputStream is = file.getInputStream();
		int temp;
		// 一个一个字节的读取并写入
		while ((temp = is.read()) != (-1)) {
			os.write(temp);
		}
		os.flush();
		os.close();
		is.close();

		long endTime = System.currentTimeMillis();
		System.out.println("方法一运行时间:" + String.valueOf(endTime - startTime) + "ms");

		return "/success";
	}

	/**
	 * 使用file.Transto 来保存上传的文件
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping("fileUpload2")
	public String fileUpload2(@RequestParam("file") CommonsMultipartFile file) throws IOException {
		long startTime = System.currentTimeMillis();
		System.out.println("fileName:" + file.getOriginalFilename());
		String path = "E:/" + new Date().getTime() + file.getOriginalFilename();

		File newFile = new File(path);
		// 通过commonsMultipartFile 方法直接写文件
		file.transferTo(newFile);

		log.error("err msg");
		log.info("info msg");
		System.out.println("err mssff");
		
		long endTime = System.currentTimeMillis();
		System.out.println("方法二运行时间:" + String.valueOf(endTime - startTime) + "ms");

		return "/success";
	}

	@RequestMapping("fileUpload3")
	public String fileUpLoad3(HttpServletRequest request)throws IOException {
		long startTime = System.currentTimeMillis();
		
		//将上下文初始化给commonMutipartResolver (多部分解析器)
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		//获取multiRequest 中所有的文件名
		Iterator iter = multipartRequest.getFileNames();
		
		while (iter.hasNext()) {
			//依次便利所有文件
			MultipartFile file = multipartRequest.getFile(iter.next().toString());
			
			if(file!=null){
				
				String path = "E:/springUpload"+file.getOriginalFilename();
				//上传
				file.transferTo(new File(path));
			}
		}
		long endTime = System.currentTimeMillis();
		
		System.out.println("方法三的运行时间:"+String.valueOf(endTime-startTime)+"ms");
		
		return "/success";
	}

}
