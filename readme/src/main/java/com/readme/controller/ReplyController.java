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

	// ´ñ±Û ÀÛ¼º
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(ReplyVO vo) throws Exception {

		replyService.write(vo);

		return "redirect:/detail?teamboardBno=" + vo.getBno();
	}

	// ´ñ±Û ¼öÁ¤ POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply update");
		int Bno = vo.getBno();
		replyService.modify(vo);

		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/teamboard/replyUpdate";
	}

	// ´ñ±Û »èÁ¦ POST
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply delete");
		int Bno = vo.getBno();

		replyService.delete(vo);

		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/teamboard/replyDelete";
	}

	
	// ´ñ±Û ¼öÁ¤ GET
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
	public void getReplyUpdate(@RequestParam("rno") int rno,
	      @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	 logger.info("reply update");
	 
	 ReplyVO vo = null;
	 
	 vo = replyService.readReplySelect(rno);
	 
	 model.addAttribute("readReply", vo);
	 model.addAttribute("scri", scri);
	}

	// ´ñ±Û ¼öÁ¤ GET
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public void getReplyDelete(@RequestParam("rno") int rno,
	      @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	 logger.info("reply delete");
	 
	 ReplyVO vo = null;
	 
	 vo = replyService.readReplySelect(rno);
	 
	 model.addAttribute("readReply", vo);
	 model.addAttribute("scri", scri);
	}
}
