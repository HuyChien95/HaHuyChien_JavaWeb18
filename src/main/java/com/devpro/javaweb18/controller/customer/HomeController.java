package com.devpro.javaweb18.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb18.controller.BaseController;
import com.devpro.javaweb18.entities.Categories;
import com.devpro.javaweb18.entities.Product;
import com.devpro.javaweb18.services.AdvisoriesService;
import com.devpro.javaweb18.services.CategoriesService;
import com.devpro.javaweb18.services.ProductService;



//Định nghĩa 1 Bean(dành cho Controller trong mô hình MVC)
@Controller
public class HomeController extends BaseController{

	@Autowired
	private AdvisoriesService advisoriesService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoriesService categoriesService;
	
	@RequestMapping(value = { "/",}, method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<Product> products = productService.findAll();
		List<Product> productView = new ArrayList<Product>();
		List<Categories> categoryParent = categoryParent();
		
		
		for (Categories cateParent : categoryParent) {
				for (Product product : products) {
					if (product.getCategories().getParent().getId() == cateParent.getId() && product.getStatus() == true) {
						productView.add(product);
					}
				}
		}
		
		model.addAttribute("advisories",advisoriesService.findAll());
		model.addAttribute("productSize", productView.size());
		model.addAttribute("product", productView);
		return "customer/index";
	}
}