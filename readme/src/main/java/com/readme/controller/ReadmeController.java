package com.readme.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.readme.dto.MemberVO;
import com.readme.service.MemberService;

@Controller
@RequestMapping("/readme")
public class ReadmeController {
	
	
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Inject
    private MemberService service;
    
    @RequestMapping("/home")
    public String home() {
    	return "check";
    }

    @RequestMapping(value = "/home2", method = RequestMethod.GET)
    public String home(Model model) throws Exception{
 
        logger.info("home");
        
        List<MemberVO> memberList = service.selectMember();
        
        model.addAttribute("memberList", memberList);
 
        return "home2";
    }



}
