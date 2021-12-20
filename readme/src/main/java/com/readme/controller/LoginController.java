package com.readme.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.readme.dto.MemberVO;
import com.readme.utils.UploadFileUtils;


@Controller
@RequestMapping("/login")
public class LoginController {
	
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

	@RequestMapping(value = "/updateMemberPage")
	public String updateMypage() {
		return "login/updateMemberPage";
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
