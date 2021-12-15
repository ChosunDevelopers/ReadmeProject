package com.readme.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.readme.dto.ReplyVO;
import com.readme.service.ReplyService;
import com.readme.service.TeamBoardService;

import doamin.SearchCriteria;

@Controller
public class TeamBoardController {

    private static final Logger logger = LoggerFactory.getLogger(TeamBoardController.class);

	@Autowired
	TeamBoardService TeamboardService;
	
	@Autowired
	private ReplyService replyService;
	
	
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
	public ModelAndView detail(@RequestParam Map<String, Object> map) throws Exception {
		Map<String, Object> detailMap = this.TeamboardService.board_detail(map);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);

		int bno = Integer.parseInt( (String) map.get("teamboardBno"));
		String teamboardBno = map.get("teamboardBno").toString();
	
		
		mav.addObject("teamboardBno", teamboardBno);
		mav.setViewName("/teamBoard/detail");
		
		// 댓글 조회
		List<ReplyVO> reply = null;
		reply = replyService.list(bno);
		mav.addObject("reply",reply);
		
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
	
	
	//reply
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(ReplyVO vo) throws Exception {

		replyService.write(vo);

		return "redirect:/detail?teamboardBno=" + vo.getBno();
	}

	// 댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply update");
		int Bno = vo.getBno();
		replyService.modify(vo);

		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("rno",vo.getRno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/teamBoard/detail";
	}

	// 댓글 삭제 POST
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

		return "redirect:/teamBoard/detail";
	}

	
	// 댓글 수정 GET
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
	public void getReplyUpdate(@RequestParam("rno") int rno,
	      @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	 logger.info("reply update");
	 
	 ReplyVO vo = null;
	 
	 vo = replyService.readReplySelect(rno);
	 
	 model.addAttribute("readReply", vo);
	 model.addAttribute("scri", scri);
	}

	// 댓글 삭제 GET
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
