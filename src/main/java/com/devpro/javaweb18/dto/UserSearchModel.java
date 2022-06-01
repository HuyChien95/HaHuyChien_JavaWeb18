package com.devpro.javaweb18.dto;

public class UserSearchModel extends BaseSearchModel{
	// tìm theo keyword
		public String keyword;
		public Integer userRoleId;

		public Integer getUserRoleId() {
			return userRoleId;
		}

		public void setUserRoleId(Integer userRoleId) {
			this.userRoleId = userRoleId;
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
