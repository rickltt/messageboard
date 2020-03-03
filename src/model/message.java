package model;

import java.sql.Timestamp;

public class message {
	private int id; //ÁôÑÔĞÅÏ¢±àºÅ

	private String title; //ÁôÑÔ±êÌâ

	private String content; //ÁôÑÔÄÚÈİ
 
	private Timestamp publishtime; //ÁôÑÔÊ±¼ä

	private int userId;  //ÁôÑÔÓÃ»§±àºÅ£¬Íâ¼ü
	
	private int mb_id;  //ÁôÑÔ°å¿é±àºÅ£¬Íâ¼ü

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getPublishtime() {
		return publishtime;
	}

	public void setPublishtime(Timestamp publishtime) {
		this.publishtime = publishtime;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getMb_id() {
		return mb_id;
	}

	public void setMb_id(int mb_id) {
		this.mb_id = mb_id;
	}
	



}
