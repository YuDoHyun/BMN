package com.bookshop01.customer.vo;

import java.sql.Date;

public class QnaVO {
	private int qna_id;
	private int goods_id;
	private String member_id;
	private String qna_title;
	private String qna_content;
	private Date   qna_date;
	private String startRowNum;
    private String endRowNum;
    private String fileName;
    private String member_name;
    
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
	public String getFilename() {
		return fileName;
	}
	public void setFilename(String filename) {
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
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public QnaVO() {
	}
    
	
	
	
}
