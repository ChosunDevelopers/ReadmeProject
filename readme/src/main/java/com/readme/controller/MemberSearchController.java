package com.readme.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String memberDetail(@PathVariable String id, Model model) throws Exception{
		logger.info("memberDetailPage");
		logger.info("id´Â" + id);
		model.addAttribute("id", id);
		
		String memberSkill = rService.getUserSkillList(id);
		model.addAttribute("memberSkill", memberSkill);
		
		return "memberSearch/memberDetail";
	}
	
	
}
