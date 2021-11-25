package com.readme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teamBoard")
public class TeamBoardController {

	@RequestMapping(value = "/teamBoard")
	public String teamBoard() {
		return "teamBoard/teamBoard";
	}
}
