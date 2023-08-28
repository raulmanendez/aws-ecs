package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexController {

	@GetMapping
	public String hello() {
		return "service starter_one is running";
	}
	
	@GetMapping("/greet")
	public String greet(@RequestParam(required = false) String name) {
		return "Hello E.."+name;
	}
}
