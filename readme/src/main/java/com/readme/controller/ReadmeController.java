package com.readme.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.readme.dto.MemberVO;
import com.readme.service.MemberService;
import com.readme.service.TeamBoardService;

@Controller
@RequestMapping("/")
public class ReadmeController {
	
	
    private static final Logger logger = LoggerFactory.getLogger(ReadmeController.class);
    
    @Inject
    private MemberService service;
	@Autowired
	TeamBoardService TeamboardService;
	
    @RequestMapping(value = "/home2", method = RequestMethod.GET)
    public String home(Model model) throws Exception{
 
        logger.info("home");
        
        List<MemberVO> memberList = service.selectMember();
        
        model.addAttribute("memberList", memberList);
 
        return "home2";
    
    }
 
    /*
    @RequestMapping(value = "/index")
    public String index(Model model) {
    	return "/index";
    }
    */

	@RequestMapping(value = "/index")  
	public ModelAndView list(@RequestParam Map<String, Object> map) {  

		List<Map<String, Object>> list = this.TeamboardService.list(map); 
		
		ModelAndView mav = new ModelAndView();  
		mav.addObject("data", list);  

		mav.setViewName("/index");  
		return mav;  
	}  


}
