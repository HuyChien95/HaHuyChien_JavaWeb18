package com.devpro.javaweb18.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb18.entities.Contact;


@Service
public class ContactService extends BaseService<Contact>{

	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}

}
