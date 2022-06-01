package com.devpro.javaweb18.dto;

import java.io.File;

public class Products{

	private File avatar;
	private File slide;
	
	private String name;
	private String description;
	private String price;
	private String detail;
	
	public File getAvatar() {
		return avatar;
	}
	public void setAvatar(File avatar) {
		this.avatar = avatar;
	}
	public File getSlide() {
		return slide;
	}
	public void setSlide(File slide) {
		this.slide = slide;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
}
