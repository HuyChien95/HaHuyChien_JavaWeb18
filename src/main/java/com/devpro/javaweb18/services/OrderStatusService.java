package com.devpro.javaweb18.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb18.entities.OrderStatus;

@Service
public class OrderStatusService extends BaseService<OrderStatus>{
	
	@Override
	protected Class<OrderStatus> clazz(){
		return OrderStatus.class;
	}

}
