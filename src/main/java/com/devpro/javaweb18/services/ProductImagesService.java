package com.devpro.javaweb18.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb18.entities.ProductImages;

@Service
public class ProductImagesService extends BaseService<ProductImages> {

	@Override
	protected Class<ProductImages> clazz() {
		return ProductImages.class;
	}

}
