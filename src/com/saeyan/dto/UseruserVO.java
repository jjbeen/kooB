package com.saeyan.dto;

public class UseruserVO {
	private String name;
	private String userid;
	private String pwd;
	private String gender;
	private int age;
	private String phone;
	private String email;
	private String books;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBooks() {
		return books;
	}
	public void setBooks(String books) {
		this.books = books;
	}
	
	@Override
	public String toString() {
		return "UseruserVO [name=" + name + ", userid=" + userid + ", pwd=" + pwd + ", gender=" + gender + ", age="
				+ age + ", phone=" + phone + ", email=" + email + ", books=" + books + "]";
	}
}