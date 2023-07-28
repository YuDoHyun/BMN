package com.bob.customer.vo;

import java.sql.Date;

public class ReviewVO {
	private int review_id;
	private int goods_id;
	private String member_id;
	private String review_title;
	private String review_content;
	private String review_comment;
	private Date   review_date;
	private String startRowNum;
    private String endRowNum;
    private String fileName;
    private String member_name;
    

	public ReviewVO() {
	}
	
	public String getreview_comment() {
		return review_comment;
	}
	public void setreview_comment(String review_comment) {
		this.review_comment = review_comment;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(String startRowNum) {
		this.startRowNum = startRowNum;
	}
	public String getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(String endRowNum) {
		this.endRowNum = endRowNum;
	}
	public int getreview_id() {
		return review_id;
	}
	public void setreview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getreview_title() {
		return review_title;
	}
	public void setreview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getreview_content() {
		return review_content;
	}
	public void setreview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getreview_date() {
		return review_date;
	}
	public void setreview_date(Date review_date) {
		this.review_date = review_date;
	}

    
	
	
	
}
