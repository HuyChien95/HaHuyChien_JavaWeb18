package com.devpro.javaweb18.dto;

public class OrderSearchModel extends BaseSearchModel{
	// tìm theo keyword
		public String keyword;
		public Integer orderStatustId;

		public Integer getOrderStatustId() {
			return orderStatustId;
		}

		public void setOrderStatustId(Integer orderStatustId) {
			this.orderStatustId = orderStatustId;
		}



		public String getKeyword() {
			return keyword;
		}

		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		
		public void getPage(int i) {
			
		}
}
