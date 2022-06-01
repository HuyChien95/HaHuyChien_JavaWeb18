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

import com.devpro.javaweb18.controller.BaseController;
import com.devpro.javaweb18.dto.OrderSearchModel;
import com.devpro.javaweb18.services.OrderStatusService;
import com.devpro.javaweb18.services.PaymentStatusService;
import com.devpro.javaweb18.services.ProductService;
import com.devpro.javaweb18.services.SaleOrderService;
import com.devpro.javaweb18.services.SaleOrder_Products_Service;
import com.devpro.javaweb18.services.UserService;

@Controller
public class OrderManagerController extends BaseController{
	
	@Autowired
	private SaleOrderService saleOrderService;
	@Autowired
	private UserService userService;
	@Autowired
	private PaymentStatusService paymentStatusService;
	@Autowired
	private OrderStatusService orderStatusService;
	@Autowired
	private SaleOrder_Products_Service saleOrder_Products_Service;
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

	@RequestMapping(value = { "/admin/ordermanager" }, method = RequestMethod.GET)
	public String home(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response)
			throws IOException {
		
		OrderSearchModel searchModel = new OrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.orderStatustId = getInteger(request, "orderStatustId");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("user", userService.findAll());
		model.addAttribute("order", saleOrderService.search(searchModel));
		model.addAttribute("paymentStatus", paymentStatusService.findAll());
		model.addAttribute("orderStatus", orderStatusService.findAll());
		return "administrator/OrderManager";
	}
	
	@RequestMapping(value = { "/admin/detailorder/{orderId}" }, method = RequestMethod.GET)
	public String detailorder(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @PathVariable("orderId") int orderId
	) throws Exception {

		model.addAttribute("order", saleOrderService.getById(orderId));
		model.addAttribute("order_product", saleOrder_Products_Service.findAll());
		model.addAttribute("product", productService.findAll());
		model.addAttribute("paymentStatus", paymentStatusService.findAll());
		model.addAttribute("orderStatus", orderStatusService.findAll());

		return "administrator/OrderDetail";
	}
}
