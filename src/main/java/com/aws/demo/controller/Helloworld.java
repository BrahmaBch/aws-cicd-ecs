package com.aws.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class Helloworld {

	@GetMapping("/hello")
	public String getMessage() {
		return "Hello World!";
	}
}
