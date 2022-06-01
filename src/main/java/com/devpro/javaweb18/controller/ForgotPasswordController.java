package com.devpro.javaweb18.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb18.entities.User;
import com.devpro.javaweb18.services.UserService;

@Controller
public class ForgotPasswordController extends BaseController{

	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender emailSender;
	
	public String randomPassword() {
		String randomPassword = RandomStringUtils.randomAlphabetic(10);
		return randomPassword;
	}

	@RequestMapping(value = { "/forgotpassword" }, method = RequestMethod.GET)
	public String forgotPassword(final Model model, 
						final HttpServletRequest request, 
						final HttpServletResponse response
						)
			throws IOException {
		
		return "ForgotPassword";
	}
	
	@RequestMapping(value = { "/forgotpassword" }, method = RequestMethod.POST)
	public String forgotPassword_Post(final Model model, 
						final HttpServletRequest request, 
						final HttpServletResponse response
						)
			throws IOException {
		
		String uEmail = request.getParameter("email");
		List<User> allUser = userService.findAll();
		ArrayList<String> userEmail= new ArrayList<String>();
		for (User userInDb : allUser) {
			userEmail.add(userInDb.getEmail());
		}
		String message = "";
		if (userEmail.contains(uEmail)) {
			
//			created new password
			User user = userService.loadUserByEmail(uEmail);
			String newPassword = randomPassword();
			String setPassword = new BCryptPasswordEncoder().encode(newPassword);
			user.setPassword(setPassword);
			userService.saveOrUpdate(user);
			message = "Mật khẩu mới đã được gửi đến email của bạn";
			
//			send mail new password
			String content = "Xin chào "+user.getUsername()+", mật khẩu mới của bạn là: " + newPassword;
			content += "\nGhi chú: bạn có thể sửa lại mật khẩu trong phần thông tin tài khoản.";
			SimpleMailMessage passwordMail = new SimpleMailMessage();
			passwordMail.setTo(uEmail);
			passwordMail.setSubject("new Password");
			passwordMail.setText(content);
			emailSender.send(passwordMail);
		} else {
			message = "Email chưa được đăng kí!";
		}
		model.addAttribute("message", message);
		return "ForgotPassword";
	}
}
