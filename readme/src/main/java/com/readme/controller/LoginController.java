package com.readme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.readme.dto.MemberProfileVO;
import com.readme.service.MemberService;


@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	MemberService mService;
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value = "/signUp")
	public String signUp() {
		return "login/signUp";
	}
	
	@RequestMapping(value = "/myPage")
	public String myPage() {
		return "login/myPage";
	}
	//수정 전 get
	@RequestMapping(value = "/updateMemberPage")
	public String updateMypage() {
		return "login/updateMemberPage";
	}
	//수정 get
	@RequestMapping(value = "/updateProfilePage", method = RequestMethod.GET)
	public String updateProfilePage(MemberProfileVO memberProfileVO, Model model, HttpSession session) {
	
		MemberProfileVO result = mService.myProfile(memberProfileVO);

		model.addAttribute("myProfile", result);
		return "/login/updateMemberPage";
	}
		
	@RequestMapping(value = "/insertMemberDetailPage")
	public String insertMemberDetailPage() {
		return "login/insertMemberDetailPage";
	}
	
	@RequestMapping(value = "/myProfile")
	public String myProfile() {
		return "login/myProfile";
	}
}
