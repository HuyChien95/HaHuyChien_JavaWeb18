package com.devpro.javaweb18.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb18.dto.UserSearchModel;
import com.devpro.javaweb18.entities.User;

@Service
public class UserService extends BaseService<User>{

	@Override
	protected Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		return this.getOneByNativeSQL(sql);
	}
	
	public User loadUserByEmail(String userEmail) {
		String sql = "select * from tbl_users u where u.email = '" + userEmail + "'";
		return this.getOneByNativeSQL(sql);
	}	
	
	public PagerData<User> search(UserSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_users u WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo role
			
			if (searchModel.userRoleId != null && searchModel.userRoleId > 0) {
				sql += " AND id = ANY (SELECT id FROM tbl_users_roles WHERE id = " + searchModel.userRoleId + " )";
			}

			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.title like '%" + searchModel.keyword + "%'" + " or p.detail_description like '%"
						+ searchModel.keyword + "%'" + " or p.short_description like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());

	}
}
