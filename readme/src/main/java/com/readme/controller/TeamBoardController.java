package com.readme.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.readme.service.TeamBoardService;

@Controller
public class TeamBoardController {

    private static final Logger logger = LoggerFactory.getLogger(TeamBoardController.class);

	@Autowired
	TeamBoardService TeamboardService;
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String teamBoard() {
		return "teamBoard/create";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createPost(@RequestParam  Map<String, Object> map) {
	    ModelAndView mav = new ModelAndView();
	    
	    String teamboardBno = this.TeamboardService.create(map);
	    if(teamboardBno==null) {
	    	mav.setViewName("redirect:/create");
	    }else {
	    	mav.setViewName("redirect:/detail?teamboardBno=" + teamboardBno);
	    }
	    return mav;
	}
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map) {
		Map<String, Object> detailMap = this.TeamboardService.board_detail(map);
//		List<Map<String, Object>> replyList = this.TeamboardService.replyList(map); 

		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);
//		mav.addObject("replydata", replyList);

		String teamboardBno = map.get("teamboardBno").toString();
		mav.addObject("teamboardBno", teamboardBno);
		mav.setViewName("/teamBoard/detail");
		
		
		return mav;
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)  
	public ModelAndView update(@RequestParam Map<String, Object> map) {  
		Map<String, Object> detailMap = this.TeamboardService.board_detail(map);
	
		ModelAndView mav = new ModelAndView();  

		mav.addObject("data", detailMap);  
		mav.setViewName("/teamBoard/update");  
		return mav;  
	}  

	
	@RequestMapping(value = "update", method = RequestMethod.POST)  
	public ModelAndView updatePost(@RequestParam Map<String, Object> map) {  
		ModelAndView mav = new ModelAndView();  
	
		boolean isUpdateSuccess = this.TeamboardService.edit(map); 
		if (isUpdateSuccess) {  
		String teamboardBno = map.get("teamboardBno").toString();  
			mav.setViewName("redirect:/detail?teamboardBno=" + teamboardBno);  
		}else {  
			mav = this.update(map);  
		}  

		return mav;  
	}  
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)  
	public ModelAndView deletePost(@RequestParam Map<String, Object> map) {  
		ModelAndView mav = new ModelAndView();  
	
		boolean isDeleteSuccess = this.TeamboardService.remove(map);  
		if (isDeleteSuccess) {  
			mav.setViewName("redirect:/list");  
		}else {  
			String teamboardBno = map.get("teamboardBno").toString();  
			mav.setViewName("redirect:/detail?teamboardBno=" + teamboardBno);  
		}  
	
		return mav;  
	}  
	
	@RequestMapping(value = "list")  
	public ModelAndView list(@RequestParam Map<String, Object> map) {  

		List<Map<String, Object>> list = this.TeamboardService.list(map); 
		
		
		
		ModelAndView mav = new ModelAndView();  
		mav.addObject("data", list);  
		if (map.containsKey("keyword")) {  
		mav.addObject("keyword", map.get("keyword"));  
		}  
		mav.setViewName("/teamBoard/list");  
		return mav;  
	}  
}
