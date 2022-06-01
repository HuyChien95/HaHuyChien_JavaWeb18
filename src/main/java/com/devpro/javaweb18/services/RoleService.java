package com.devpro.javaweb18.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb18.entities.Role;

@Service
public class RoleService extends BaseService<Role>{

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}

	public Role getGuestRole() {
		
		return getOneByNativeSQL("SELECT * FROM tbl_roles where name='GUEST';");
	}
	
	public Role getAdminRole() {
		
		return getOneByNativeSQL("SELECT * FROM tbl_roles where name='ADMIN';");
	}

}
