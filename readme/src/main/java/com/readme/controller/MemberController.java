package com.readme.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.readme.dto.MemberVO;
import com.readme.service.MemberService;
import com.readme.utils.UploadFileUtils;



@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService mService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(MemberVO memberVO, MultipartFile file) throws Exception
	{
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		logger.info("file�� : " + file);
		
		if(file != null) {
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		memberVO.setProfileImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		memberVO.setProfileThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		int result = mService.insertMember(memberVO);
		
		if (result == 0) {
//			model.addAttribute("message", "���� ���̵� �ֽ��ϴ�.");
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
