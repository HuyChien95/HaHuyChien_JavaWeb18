package com.devpro.javaweb18.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb18.services.ContactService;

@Controller
public class AdminContactController {

	@Autowired
	private ContactService contactService;
	
	private int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	
	@RequestMapping(value = { "/admin/contact" }, method = RequestMethod.GET)
	public String adminContactList(final Model model,
								  final HttpServletRequest request,
								  final HttpServletResponse response) throws IOException {
		
		model.addAttribute("contact", contactService.findAll());
		
		return "administrator/ContactManager";
	}
	
	@RequestMapping(value = { "/admin/contact/{contactId}" }, method = RequestMethod.GET)
	public String adminContactPreview(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @PathVariable("contactId") int contactId
	) throws Exception {

		model.addAttribute("contact", contactService.getById(contactId));
		return "administrator/ContactPreview";
	}
}
