package com.readme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login/login";
	}
	
}
