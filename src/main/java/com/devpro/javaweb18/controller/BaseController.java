package com.devpro.javaweb18.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.javaweb18.entities.Categories;
import com.devpro.javaweb18.entities.Product;
import com.devpro.javaweb18.entities.User;
import com.devpro.javaweb18.services.CategoriesService;
import com.devpro.javaweb18.services.ProductService;
import com.github.slugify.Slugify;

public abstract class BaseController {

	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
	private ProductService productService;
	
	@ModelAttribute("category")
	public List<Categories> getAllCategories() {
		List<Categories> category = categoriesService.findAll();
		for (Categories categories : category) {
			if (categories.getSeo()==null) {
				categories.setSeo(new Slugify().slugify(categories.getName() + "-" + System.currentTimeMillis()));
				categoriesService.saveOrUpdate(categories);
			}
		}
		return category;
	}
	
	@ModelAttribute("categoryParent")
	public List<Categories> categoryParent (){
		List<Categories> categoryParent = new ArrayList<Categories>();
		for (int i = 0; i < getAllCategories().size(); i++) {
			if(getAllCategories().get(i).getParent() == null)
				categoryParent.add(getAllCategories().get(i));
		}
		
		return categoryParent;
	}
	
	@ModelAttribute("categoryChild")
	public List<Categories> categoryChild (){
		List<Categories> categoryChild = new ArrayList<Categories>();
		for (int i = 0; i < getAllCategories().size(); i++) {
			if(getAllCategories().get(i).getParent() != null)
				categoryChild.add(getAllCategories().get(i));
		}
		return categoryChild;
	}
	
	@ModelAttribute("productsList")
	public List<Product> p () {
		List<Product> p = productService.findAll();
		return p;
	}
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}
	
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;
		
		return new User();
	}
}
