package com.bob.customer.vo;

import java.sql.Date;

public class FaqVO {
	private int faq_id;
	private String faq_title;
	private String faq_content;
	private Date   faq_date;
	private String startRowNum;
    private String endRowNum;
    
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

	public FaqVO() {
	}

	public int getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public Date getFaq_date() {
		return faq_date;
	}

	public void setFaq_date(Date faq_date) {
		this.faq_date = faq_date;
	}
	
	
	
}
