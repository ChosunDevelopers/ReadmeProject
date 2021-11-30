package com.readme.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.readme.dto.MemberVO;
import com.readme.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService mService;
	
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(MemberVO memberVO, Model model, MultipartHttpServletRequest mtfRequest)
//	public String insertMember(MemberVO memberVO, Model model, MultipartFile mf)
	{
		
		
		String path = "C:\\image\\";

		MultipartFile mf = mtfRequest.getFile("profileImg");
		String originFileName = mf.getOriginalFilename(); // 원본 파일 명

		System.out.println("originFileName : " + originFileName);
		
//		String safeFile = path + System.currentTimeMillis() + originFileName;
//		String safeFile = path + originFileName;
		File saveFile = new File(path, originFileName);
		
		try {
			mf.transferTo(saveFile);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		memberVO.setProfileImg(path + originFileName);
		
		int reuslt = mService.insertMember(memberVO);
		
		if (reuslt == 0) {
			model.addAttribute("message", "같은 아이디가 있습니다.");
			return "/login/login";
		}
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/loginMember", method = RequestMethod.POST)
	public String loginMember(MemberVO memberVO, Model model, HttpSession session) {
		
		MemberVO result = mService.loginMember(memberVO);
		
		if(result == null) {
			model.addAttribute("message", "ID혹은 PW가 틀립니다.");
			return "/login/login";
		}
		session.setAttribute("loginID", result.getId());
		
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(MemberVO memberVO, Model model, HttpSession session) {
	//로그인 값을 계속 가지고 있는 Session TEST
		
		System.out.println((String)session.getAttribute("loginID"));
		return "index";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(MemberVO memberVO, Model model, HttpSession session) {
		session.invalidate();
	//session.setAttrivute("loginID",null);으로 해줘도 된다.
		return "redirect:/index";
	}
	
	
	
	
	
}
