package com.fortech.BasicApp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/")
public class BasicController {
	@GetMapping("greet")
	public String greet() {
		return "Hello from spring controller";
	}
	
	@GetMapping("error")
	public String ex() throws Exception {
		throw new Exception("exception from controller");
	}
	
	@GetMapping("close")
	public void close() {
		System.exit(0);
	}

}
