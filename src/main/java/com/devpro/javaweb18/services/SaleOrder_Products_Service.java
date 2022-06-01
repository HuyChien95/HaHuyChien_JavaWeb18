package com.devpro.javaweb18.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb18.entities.SaleOrderProducts;


@Service
public class SaleOrder_Products_Service extends BaseService<SaleOrderProducts>{

	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
	}
	
}
