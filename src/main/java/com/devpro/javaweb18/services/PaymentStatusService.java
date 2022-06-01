package com.devpro.javaweb18.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb18.entities.PaymentStatus;

@Service
public class PaymentStatusService extends BaseService<PaymentStatus>{

	@Override
	protected Class<PaymentStatus> clazz(){
		return PaymentStatus.class;
	}
}
