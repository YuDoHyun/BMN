package com.bob.customer.vo;

import java.sql.Date;

public class ReviewVO {
	private int review_id;
	private int goods_id;
	private int order_id;
	private String member_id;
	private String review_content;
	private String review_comment;
	private int review_star;
	private Date   review_date;
	private String startRowNum;
    private String endRowNum;
    private String fileName;
    private String member_name;
    

	public ReviewVO() {
	}


	public int getOrder_id() {
		return order_id;
	}


	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public int getReview_id() {
		return review_id;
	}


	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}


	public int getGoods_id() {
		return goods_id;
	}


	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getReview_content() {
		return review_content;
	}


	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}


	public String getReview_comment() {
		return review_comment;
	}


	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}


	public int getReview_star() {
		return review_star;
	}


	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}


	public Date getReview_date() {
		return review_date;
	}


	public void setReview_date(Date review_date) {
		this.review_date = review_date;
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


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	
	

    
	
	
	
}
