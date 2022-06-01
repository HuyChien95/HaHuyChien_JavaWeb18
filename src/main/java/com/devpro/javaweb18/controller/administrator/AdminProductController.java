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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb18.controller.BaseController;
import com.devpro.javaweb18.dto.ProductSearchModel;
import com.devpro.javaweb18.entities.Product;
import com.devpro.javaweb18.services.CategoriesService;
import com.devpro.javaweb18.services.ProductService;

@Controller
public class AdminProductController extends BaseController{

	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
	private ProductService productService;
	
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
	
	@RequestMapping(value = { "/admin/addproduct" }, method = RequestMethod.GET)
	public String adminProductAdd(final Model model,
								  final HttpServletRequest request,
								  final HttpServletResponse response) throws IOException {
		
		model.addAttribute("product", new Product());
		
		return "administrator/AddUpdateProduct";
	}
	
	@RequestMapping(value = { "/admin/addproduct" }, method = RequestMethod.POST)
	public String adminProductAdd(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @ModelAttribute("product") Product product,
										  @RequestParam("productAvatar") MultipartFile productAvatar,
										  @RequestParam("productPictures") MultipartFile[] productPictures
	) throws Exception {

		if (product.getId() == null || product.getId() <= 0) { // thêm mới
			productService.add(product, productAvatar, productPictures);
		}
		else
		{ // chỉnh sửa
			productService.update(product, productAvatar, productPictures);
		}

		return "redirect:/admin/productlist";
	}
	
	@RequestMapping(value = { "/admin/editproduct/{productId}" }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @PathVariable("productId") int productId
	) throws Exception {

		model.addAttribute("product", productService.getById(productId));

		return "administrator/AddUpdateProduct";
	}
	
	@RequestMapping(value = { "/admin/productlist" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response 
	) throws Exception {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.categoryId = getInteger(request, "categoryId");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("products", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		model.addAttribute("categories", categoriesService.findAll());
		
		return "administrator/ProductManager";
	}
	
	@RequestMapping(value = { "/admin/productlist/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> adminProductDelete(final Model model, 
										  						  final HttpServletRequest request,
										  						  final HttpServletResponse response,
										  						  final @RequestBody Product product
										  						  ) throws Exception {
		Product productInDb = productService.getById(product.getId());
		
		if(productInDb.getStatus()==true) {
			productInDb.setStatus(false);
			productService.saveOrUpdate(productInDb);
		}else {
			productInDb.setStatus(true);
			productService.saveOrUpdate(productInDb);
		}
		
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("message", "Cập nhật trạng thái sản phẩm thành công");
		return ResponseEntity.ok(jsonResult);
	}
	
}
