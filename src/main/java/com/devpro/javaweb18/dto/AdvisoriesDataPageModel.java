package com.devpro.javaweb18.dto;

public class AdvisoriesDataPageModel extends BaseSearchModel{

	public Integer categoryId;
	public Integer categoryParentId;
	
	public void getPage(int i) {
		
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getCategoryParentId() {
		return categoryParentId;
	}

	public void setCategoryParentId(Integer categoryParentId) {
		this.categoryParentId = categoryParentId;
	}
}
