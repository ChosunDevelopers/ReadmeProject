package com.readme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/memberSearch")

public class MemberSearchController {

	@RequestMapping(value = "/memberSearch")
	public String memberSearch() {
		return "memberSearch/memberSearch";
	}
	
}
