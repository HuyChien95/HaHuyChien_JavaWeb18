package com.devpro.javaweb18.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb18.dto.Employee;

//Định nghĩa 1 Bean(dành cho Controller trong mô hình MVC)
@Controller
public class VD {

	@RequestMapping(value = { "/vd"}, method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		Employee nv1 = new Employee();
		nv1.setName("Nguyen Van A");
		nv1.setAge(19);
		Employee nv2 = new Employee();
		nv2.setName("Chu Van B");
		nv2.setAge(18);
		Employee nv3 = new Employee();
		nv3.setName("Nguyen Van C");
		nv3.setAge(20);
		Employee nv4 = new Employee();
		nv4.setName("Le Hoang A");
		nv4.setAge(23);
		Employee nv5 = new Employee();
		nv5.setName("Le Van L");
		nv5.setAge(21);
		
		List<Employee> listNV = new ArrayList<Employee>();
		listNV.add(nv1);
		listNV.add(nv2);
		listNV.add(nv3);
		listNV.add(nv4);
		listNV.add(nv5);
		
		
		model.addAttribute("listNhanVien", listNV);
		return "customer/VD";
	}
}