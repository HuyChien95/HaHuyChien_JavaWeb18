package com.devpro.javaweb18;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class StartServer extends SpringBootServletInitializer{
	
	@Override  
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application)   
	{  
	return application.sources(StartServer.class);  
	}   
	
	public static void main(String[] args) {
		SpringApplication.run(StartServer.class, args);
	}

}
