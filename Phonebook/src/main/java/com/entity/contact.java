package com.entity;

public class contact 
{
	private int id;
	private String name;
	private String email;
	private String ph;
	private String about;
	private int userid;
	public contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	public contact(String name, String email, String ph, String about, int userid) {
		super();
		this.name = name;
		this.email = email;
		this.ph = ph;
		this.about = about;
		this.userid = userid;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getPh() {
		return ph;
	}
	public String getAbout() {
		return about;
	}
	public int getUserid() {
		return userid;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	
}
