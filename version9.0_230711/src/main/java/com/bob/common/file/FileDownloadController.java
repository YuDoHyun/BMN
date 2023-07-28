package com.bob.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;


@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_repo";
	private static String CURR_QNA_IMAGE_REPO_PATH = "C:\\shopping\\qna_file_repo";
	private static String CURR_REVIEW_IMAGE_REPO_PATH= "C:\\shopping\\review_file_repo";
	
	@RequestMapping("/download")
	protected void download(@RequestParam("fileName") String fileName,
		                 	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); //버퍼에 읽어들인 문자개수
			if(count==-1)  //버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	//Q&A
	@RequestMapping("/qnadownload")
	protected void qnadownload(@RequestParam("fileName") String fileName,
		                 	@RequestParam("qna_id") String qna_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_QNA_IMAGE_REPO_PATH + "\\" + qna_id + "\\" + fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); //버퍼에 읽어들인 문자개수
			if(count==-1)  //버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/qnathumbnails.do")
	protected void qnathumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("qna_id") String qna_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_QNA_IMAGE_REPO_PATH + "\\" + qna_id + "\\" + fileName;
		File image=new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/qnaOriginalthumbnails.do")
	protected void qnaOriginalthumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("qna_id") String qna_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_QNA_IMAGE_REPO_PATH + "\\" + qna_id + "\\" + fileName;
		File image=new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).scale(1).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	//REVIEW
	@RequestMapping("/reviewdownload")
	protected void reviewdownload(@RequestParam("fileName") String fileName,
		                 	@RequestParam("review_id") String review_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_REVIEW_IMAGE_REPO_PATH + "\\" + review_id + "\\" + fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); //버퍼에 읽어들인 문자개수
			if(count==-1)  //버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/reviewthumbnails.do")
	protected void reviewthumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("review_id") String review_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_REVIEW_IMAGE_REPO_PATH + "\\" + review_id + "\\" + fileName;
		File image=new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/reviewOriginalthumbnails.do")
	protected void reviewOriginalthumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("review_id") String review_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_REVIEW_IMAGE_REPO_PATH + "\\" + review_id + "\\" + fileName;
		File image=new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).scale(1).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
}
