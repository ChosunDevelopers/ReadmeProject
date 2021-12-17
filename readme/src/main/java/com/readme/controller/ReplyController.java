package com.readme.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.readme.dto.ReplyVO;
import com.readme.service.ReplyService;

import doamin.SearchCriteria;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Inject
	private ReplyService replyService;
	
	
	// ¥Ò±€ ¿€º∫
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(ReplyVO vo) throws Exception {
		
		replyService.write(vo);

		return "redirect:/detail?teamboardBno=" + vo.getBno();
	}

	// ¥Ò±€ ªË¡¶
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("rno") int rno) throws Exception {
	  
		replyService.delete(rno);  
		
		return "redirect:/teamBoard/list";
	}
}
