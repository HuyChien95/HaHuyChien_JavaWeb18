package com.devpro.javaweb18.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb18.controller.BaseController;
import com.devpro.javaweb18.dto.UserSearchModel;
import com.devpro.javaweb18.entities.Role;
import com.devpro.javaweb18.entities.User;
import com.devpro.javaweb18.services.RoleService;
import com.devpro.javaweb18.services.UserService;

@Controller
public class UserManagaController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	private Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
//	set current page
	private int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	
	@RequestMapping(value = { "/admin/usermanager" }, method = RequestMethod.GET)
	public String adminProductAdd(final Model model,
								  final HttpServletRequest request,
								  final HttpServletResponse response) 
		throws IOException {
		
		UserSearchModel searchModel = new UserSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.userRoleId = getInteger(request, "userRoleId");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("user", userService.search(searchModel));
		model.addAttribute("roles", roleService.findAll());
		
		return "administrator/UserManager";
	}
	
	@RequestMapping(value = { "/ajax/rolesAdmin" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> adminProductDelete(final Model model, 
										  						  final HttpServletRequest request,
										  						  final HttpServletResponse response,
										  						  final @RequestBody User user)
	throws Exception {
		
		Role Admin = roleService.getAdminRole();
		User userById = userService.getById(user.getId());
		
		userById.addRoles(Admin);
		userService.saveOrUpdate(userById);
		
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("message", "Cập nhật trạng thái sản phẩm thành công");
		jsonResult.put("success", "Đã Cấp Quyền Admin");
		return ResponseEntity.ok(jsonResult);
	}
	
}
