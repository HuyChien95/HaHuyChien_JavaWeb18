package com.devpro.javaweb18.controller.customer;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb18.dto.Contact;

@Controller
public class ContactController {

	@RequestMapping(value = { "/contact", "/lienhe"}, method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		model.addAttribute("model_contact", new Contact());
		return "customer/contact";
	}
	
//	@RequestMapping(value = { "/contact", "/lienhe"}, method = RequestMethod.POST)
//	public String postContact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
//			throws IOException {
//		
//		String fullname = request.getParameter("fullname"); 
//		String email = request.getParameter("email");
//		String phoneNumber = request.getParameter("phoneNumber");
//		String message = request.getParameter("message");
//		
//		System.out.println(fullname);
//		System.out.println(email);
//		System.out.println(phoneNumber);
//		System.out.println(message);
//		
//		return "customer/contact";
		
//	}
	
	@RequestMapping(value = { "/contact", "/lienhe"}, method = RequestMethod.POST)
	public String postContact(final Model model, 
							  final HttpServletRequest request, 
							  final HttpServletResponse response,
							  final @ModelAttribute("model_contact") Contact contact,
							  final @RequestParam("attachment") MultipartFile attachmentFile)
			throws IOException {
		
		
		System.out.println(contact.getFullname());
		System.out.println(contact.getEmail());
		System.out.println(contact.getPhoneNumber());
		System.out.println(contact.getMessage());
		
		attachmentFile.transferTo(new File("C:/upload/" + attachmentFile.getOriginalFilename()));
		
		//reset contact form
		
		model.addAttribute("model_contact", new Contact());
		
		return "customer/contact";
		
	}
	
//	@RequestMapping(value = { "/contact", "/lienhe"}, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model, 
//							     							final HttpServletRequest request, 
//															final HttpServletResponse response,
//															final @RequestBody Contact contact){
//		System.out.println(contact.getFullname());
//		System.out.println(contact.getEmail());
//		System.out.println(contact.getPhoneNumber());
//		System.out.println(contact.getMessage());
//				
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("message", "Cảm ơn bạn" + contact.getEmail() + ", Chúng tôi sẽ liên hệ sớm nhất!");
//		return ResponseEntity.ok(jsonResult);
//	}
}
