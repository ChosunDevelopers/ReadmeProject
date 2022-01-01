package com.readme.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.readme.dto.MemberProfileVO;
import com.readme.service.MemberDetailService;
import com.readme.service.TeamBoardLikeService;

@Controller
@RequestMapping("/teamBoardRest")
public class TeamBoardRestController {

	private static final Logger logger = LoggerFactory.getLogger(TeamBoardRestController.class);
	
	@Inject
	private TeamBoardLikeService tService;
	@Inject
	private MemberDetailService mService;
	
	
	@RequestMapping(value = "/boardLike", produces = "application/json")
	@ResponseBody
	public int boardLike(@RequestParam("id")String id, @RequestParam("bno")String bno) throws Exception{
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("id", id);
		hm.put("bno", bno);
		
		int likeResult = tService.boardLikeCheck(hm);
		
		int likeResultForView = 0;
		
		if(likeResult != 0) {
			likeResultForView = 1;
		} else {
			likeResultForView = 0;
		}
		
		return likeResultForView;
	}
	
	@RequestMapping(value= "/nowDislike", produces = "application/json")
	@ResponseBody
	public int nowDislike(@RequestParam("id")String id, @RequestParam("bno")String bno) throws Exception {

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("id", id);
		hm.put("bno", bno);		
		
		int rs = tService.nowDislike(hm);
		
		return rs;
	}

	@RequestMapping(value= "/nowLike", produces = "application/json")
	@ResponseBody
	public int nowLike(@RequestParam("id")String id, @RequestParam("bno")String bno) throws Exception {

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("id", id);
		hm.put("bno", bno);		
		
		int rs = tService.nowLike(hm);
		
		return rs;
	}
	
	@RequestMapping(value = "/boardSearch", produces = "application/json")
	@ResponseBody
	public List<MemberProfileVO> boardList() throws Exception{
		List<MemberProfileVO> boardList = mService.pickBoardAll();
		
		return boardList;
	}
}
