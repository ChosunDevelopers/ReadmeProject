package com.readme.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.readme.dto.NoticeVO;
import com.readme.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Inject
	NoticeService service;
	
	/*
	 * @RequestMapping(value="/notice") public String notice() { return
	 * "notice/notice"; }
	 */
	
	// 공지사항 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() {
			
		}
	
	// 공지사항 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(NoticeVO NoticeVO) {
			int result = 0;
			result = service.write(NoticeVO);
			if(result == 1) {
				return "redirect:/";
			}
			
			return "redirect:notice/notice";
		}
	
	// 공지사항 목록 조회
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model) {
		
		model.addAttribute("list",service.list());
		
		
		return "notice/list";
		
	}
	
// 공지사항 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		model.addAttribute("list",service.list());
		
		
		return "notice/list";
		
	}
	
	//공지사항 상세페이지
	@RequestMapping(value = "/noticedetail", method = RequestMethod.GET)
	public String read(NoticeVO noticeVO, Model model) {
	
		model.addAttribute("read", service.read(noticeVO.getBno()));
		
		return "notice/noticedetail";
	}
	
	/*
	 * //공지사항 수정 페이지
	 * 
	 * @RequestMapping(value = "/updateView", method = RequestMethod.GET) public
	 * String updateView(NoticeVO noticeVO, Model model) {
	 * 
	 * model.addAttribute("update", service.read(noticeVO.getBno()));
	 * 
	 * return "notice/updateView"; }
	 */
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(NoticeVO noticeVO) {
		
		service.update(noticeVO);
		
		return "redirect:/notice/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(NoticeVO noticeVO) {
		
		service.delete(noticeVO.getBno());
		
		return "redirect:/notice/list";
	}
}
