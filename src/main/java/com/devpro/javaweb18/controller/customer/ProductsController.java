package com.devpro.javaweb18.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb18.controller.BaseController;
import com.devpro.javaweb18.dto.ProductSearchModel;
import com.devpro.javaweb18.entities.Categories;
import com.devpro.javaweb18.entities.Product;
import com.devpro.javaweb18.services.CategoriesService;
import com.devpro.javaweb18.services.PagerData;
import com.devpro.javaweb18.services.ProductService;
 
@Controller
public class ProductsController extends BaseController{
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoriesService categoriesService;
	
//	set current page
	private int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	
	@RequestMapping(value = { "/productslist/{categorySeo}"}, method = RequestMethod.GET)
	public String productsList(final Model model, 
					   		   final HttpServletRequest request, 
					   		   final HttpServletResponse response,
					   		   @PathVariable("categorySeo") String categorySeo)
			throws IOException {	
		
		List<Product> products = productService.findAll();
//		List<Product> productList = new ArrayList<Product>();
//		PagerData<Product> productView = new PagerData<Product>();
		Categories category = categoriesService.getOneByNativeSQL("SELECT * FROM tbl_category WHERE seo ='"+ categorySeo +"';");
		ProductSearchModel searchModel = new ProductSearchModel();
		
			
				for (Product product : products) {
					if (category.getParent() == null) {
						if (product.getCategories().getParent().getId() == category.getId()) {
							searchModel.categoryParentId = category.getId();
							searchModel.setPage(getCurrentPage(request));
						}
					}else {
						if (product.getCategories().getId() == category.getId()) {
							searchModel.categoryId = category.getId();
							searchModel.setPage(getCurrentPage(request));
						}
					}
				}
		model.addAttribute("productView", productService.search(searchModel));
		model.addAttribute("categorySeo", category);
		return "customer/ProductsList";
	}
	
	@RequestMapping(value = { "/productslist/search"}, method = RequestMethod.GET)
	public String productsSearch(final Model model, 
					   			 final HttpServletRequest request, 
					   			 final HttpServletResponse response)
			throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("products", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		model.addAttribute("categories", categoriesService.findAll());
		
		return "customer/ProductsSearch";
	}
	
	@RequestMapping(value = { "/detail/{productSeo}"}, method = RequestMethod.GET)
	public String detaiSeo(final Model model, 
							 final HttpServletRequest request,
							 final HttpServletResponse response,
							 @PathVariable("productSeo") String productSeo)
			throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.seo = productSeo;
		
		
		PagerData<Product> products = productService.search(searchModel);
		Product product = products.getData().get(0);
		
			model.addAttribute("product", product);
			
		return "customer/ProductDetail";
	}
	
}
