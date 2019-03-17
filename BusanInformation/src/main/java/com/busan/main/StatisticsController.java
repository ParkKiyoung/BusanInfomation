package com.busan.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class StatisticsController {
	
	@GetMapping("/Statistics")
	public String Statistics() {	
		return "Statistics";
	}

}
