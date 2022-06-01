package com.devpro.javaweb18.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb18.entities.Categories;

@Service
public class CategoriesService extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz(){
		return Categories.class;
	}
}
