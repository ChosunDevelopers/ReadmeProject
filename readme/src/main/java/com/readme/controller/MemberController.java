package com.readme.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.readme.dto.MemberVO;
import com.readme.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService mService;
	
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(MemberVO memberVO, Model model)
	{
		int reuslt = mService.insertMember(memberVO);
		
		if (reuslt == 0) {
			model.addAttribute("message", "���� ���̵� �ֽ��ϴ�.");
			return "/login/login";
		}
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/loginMember", method = RequestMethod.POST)
	public String loginMember(MemberVO memberVO, Model model, HttpSession session) {
		
		MemberVO result = mService.loginMember(memberVO);
		
		if(result == null) {
			model.addAttribute("message", "IDȤ�� PW�� Ʋ���ϴ�.");
			return "/login/login";
		}
		session.setAttribute("loginID", result.getId());
		
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(MemberVO memberVO, Model model, HttpSession session) {
	//�α��� ���� ��� ������ �ִ� Session TEST
		
		System.out.println((String)session.getAttribute("loginID"));
		return "index";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(MemberVO memberVO, Model model, HttpSession session) {
		session.invalidate();
	//session.setAttrivute("loginID",null);���� ���൵ �ȴ�.
		return "redirect:/index";
	}
	
	
	
	
	
}
