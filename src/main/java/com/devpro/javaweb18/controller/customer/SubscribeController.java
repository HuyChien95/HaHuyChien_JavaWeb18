package com.devpro.javaweb18.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.devpro.javaweb18.dto.Subscribe;

@Controller
public class SubscribeController {

	@RequestMapping(value = { "/subscribe"}, method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		
		return "customer/subscibe";
	}
	
	@RequestMapping(value = {"/ajax/subscribe"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_Subscribe (final Model model, 
							  							   		final HttpServletRequest request, 
							  							   		final HttpServletResponse response,
							  							   		final @RequestBody Subscribe email)
			throws IOException {
		
		System.out.println(email.getEmail());
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("message", "Cảm ơn bạn" + email.getEmail() + ", Chúng tôi sẽ liên hệ sớm nhất!");
		return ResponseEntity.ok(jsonResult);
	}
}