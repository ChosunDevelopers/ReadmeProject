package com.readme.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.readme.dto.MemberProfileVO;
import com.readme.dto.MemberVO;
import com.readme.dto.SkillRelVO;
import com.readme.service.MemberService;
import com.readme.service.SkillRelService;

@Controller
@RequestMapping("/memberSearch")
public class MemberSearchController {

	private static final Logger logger = LoggerFactory.getLogger(MemberSearchController.class);
	
	@Inject
	private MemberService mService;
	@Inject
	private SkillRelService rService;
	
	@RequestMapping(value = "/memberSearch")
	public String memberSearch(Model model) throws Exception{
		logger.info("memberSearchPage");
		
		List<MemberVO> memberList = mService.listMember();
		
		List<SkillRelVO> skillRelList = rService.listSkillRel();
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("skillRelList", skillRelList);
		
		return "memberSearch/memberSearch";
	}
	
	
	@RequestMapping(value = "/memberDetail/{id:.+}")
	public String memberDetail(@PathVariable String id, Model model, HttpSession session, MemberProfileVO memberProfileVO) throws Exception{
		String myId = (String)session.getAttribute("loginID");
		String currentMemberId = id;

		model.addAttribute("yourId", myId);
		model.addAttribute("wish_id", currentMemberId);

		String memberSkill = rService.getUserSkillList(id);
		
		List<MemberVO> specificMember = mService.specificMember(id);
		
		int yymmdd = specificMember.get(0).getJumin();
		logger.info("±×°Å + " + yymmdd);
		LocalDate now = LocalDate.now();
		int year = now.getYear() - 2000;		
		int age = year - (yymmdd / 10000) + 100;
		
		MemberProfileVO result = mService.myProfile(memberProfileVO);
		
		model.addAttribute("memberSkill", memberSkill);
		model.addAttribute("specificMember", specificMember);
		model.addAttribute("age", age);
		model.addAttribute("myProfile", result);
		
		return "memberSearch/memberDetail";
	}
	
	
}
