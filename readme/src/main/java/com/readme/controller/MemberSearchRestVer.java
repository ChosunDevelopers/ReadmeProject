package com.readme.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.readme.dto.MemberProfileVO;
import com.readme.dto.MemberVO;
import com.readme.dto.SkillRelVO;
import com.readme.service.MemberLikeService;
import com.readme.service.MemberService;
import com.readme.service.SkillRelService;

@RestController
@RequestMapping("/memberSearchRest")
public class MemberSearchRestVer {

	private static final Logger logger = LoggerFactory.getLogger(MemberSearchRestVer.class);
	
	@Inject
	private MemberService mService;
	@Inject
	private SkillRelService rService;
	@Inject
	private MemberLikeService lService; 
	
	/*
	 * @RequestMapping(value = "/memberSearch", produces="application/json")
	 * 
	 * @ResponseBody public List<MemberVO> memberList() throws Exception{
	 * logger.info("memberSearchPage");
	 * 
	 * List<MemberVO> memberList = mService.listMember();
	 * 
	 * return memberList; }
	 */	
	
	@RequestMapping(value = "/skillSearch", produces="application/json")
	@ResponseBody
	public List<MemberProfileVO> memberSkillList() throws Exception{
		logger.info("SkillSearchPage");
		//MemberProfileVO
		//List<SkillRelVO> skillRelList = rService.listSkillRel();
		List<MemberProfileVO> result = mService.allMemberProfile();
		return result;
	}
	
	@RequestMapping(value = "/skillList", produces="application/json")
	@ResponseBody
	public List<MemberProfileVO> memberSkillList2(@RequestParam("skill") String skill) throws Exception{
		logger.info("SkillList2");
		
		List<MemberProfileVO> skillRelList = rService.getSkillList(skill);

		return skillRelList;
	}
	
	@RequestMapping(value = "/userName", produces="application/json")
	@ResponseBody
	public List<MemberProfileVO> userName(@RequestParam("name") String name) throws Exception {
		logger.info("userNameSearch");
		
		List<MemberProfileVO> skillRelList = rService.getSkillListForName(name);
		
		return skillRelList;
	}
	

	@RequestMapping(value="/memberLike", produces="application/json")
	@ResponseBody
	public int memberLike(@RequestParam("id")String id, HttpSession session) throws Exception{
		String myId = (String)session.getAttribute("loginID");
		String currentMemberId = id;
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("yourId", myId);
		hm.put("wish_id", currentMemberId);
		
		int likeResult = lService.memberLikeCheck(hm);
		
		int likeResultForView = 0;
		
		if(likeResult != 0) {
			likeResultForView = 1;
		} else {
			likeResultForView = 0;
		}
		
		
		return likeResultForView;
	}

	@RequestMapping(value="/nowDislike", produces="application/json")
	@ResponseBody
	public int nowDislike(@RequestParam("id") String id, HttpSession session) throws Exception{
		String myId = (String)session.getAttribute("loginID");
		String currentMemberId = id;
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("yourId", myId);
		hm.put("wish_id", currentMemberId);
		
		int rs = lService.nowDislike(hm);
		
		return rs;
	}
	
	@RequestMapping(value="/nowLike", produces="application/json")
	@ResponseBody
	public int nowLike(@RequestParam("id") String id, HttpSession session) throws Exception{
		String myId = (String)session.getAttribute("loginID");
		String currentMemberId = id;
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("yourId", myId);
		hm.put("wish_id", currentMemberId);
		
		int rs = lService.nowLike(hm);
		
		return rs;		
	}
}
