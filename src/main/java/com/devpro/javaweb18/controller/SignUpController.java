package com.devpro.javaweb18.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb18.entities.Role;
import com.devpro.javaweb18.entities.User;
import com.devpro.javaweb18.services.RoleService;
import com.devpro.javaweb18.services.UserService;

@Controller
public class SignUpController extends BaseController  {
	
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = { "/signup" }, method = RequestMethod.GET)
	public String signUp(final Model model, 
						final HttpServletRequest request, 
						final HttpServletResponse response
						)
			throws IOException {
		
		model.addAttribute("user", new User());
		return "SignUp";
	}
	
	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST)
	public String signUpAdd(final Model model, 
						final HttpServletRequest request, 
						final HttpServletResponse response,
						@ModelAttribute("user") User user)
			throws IOException {
		
			List<User> allUser = userService.findAll();
			ArrayList<String> userName= new ArrayList<String>();
			ArrayList<String> userEmail= new ArrayList<String>();
			for (User userInDb : allUser) {
				userName.add(userInDb.getUsername());
				userEmail.add(userInDb.getEmail());
			}
			String finalForm = new String();
			if (userName.contains(user.getUsername())==false && userEmail.contains(user.getEmail())==false) {
				user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
				Role guest = roleService.getGuestRole();
				user.addRoles(guest);
				userService.saveOrUpdate(user);
				finalForm = "redirect:/login";
			} else if (userName.contains(user.getUsername()) && userEmail.contains(user.getEmail())){
				model.addAttribute("emailFalse", "**Email đã được sử dụng**");
				model.addAttribute("userFalse", "**Tên đăng nhập đã tồn tại**");
				finalForm = "SignUp";
			} else if (userName.contains(user.getUsername())){
				model.addAttribute("userFalse", "**Tên đăng nhập đã tồn tại**");
				finalForm = "SignUp";
			} else if(userEmail.contains(user.getEmail())){
				model.addAttribute("emailFalse", "**Email đã được sử dụng**");
				finalForm = "SignUp";
			}
			
		return finalForm;
	}
}
