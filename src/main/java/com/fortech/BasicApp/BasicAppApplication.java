package com.fortech.BasicApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class BasicAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(BasicAppApplication.class, args);
	}

	@GetMapping
	public String greet() {
		return "Hello from spring controller";
	}
}
