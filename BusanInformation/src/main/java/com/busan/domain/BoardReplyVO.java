package com.busan.domain;

public class BoardReplyVO {
	private Long num;
	private String replycontent;
	private String replyid;
	private String replypass;
	private Long bnum;
	private String replydate;
	
	
	
	public String getReplydate() {
		return replydate;
	}
	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}
	public Long getBnum() {
		return bnum;
	}
	public void setBnum(Long bnum) {
		this.bnum = bnum;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public String getReplyid() {
		return replyid;
	}
	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}
	public String getReplypass() {
		return replypass;
	}
	public void setReplypass(String replypass) {
		this.replypass = replypass;
	}
	

}
