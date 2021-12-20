package com.readme.service;

import java.util.List;

import com.readme.dto.NoticeVO;

public interface NoticeService {

	// 공지사항 글 작성
	public int write(NoticeVO boardVO);
	
	// 공지사항 목록 조회
	public List<NoticeVO> list();
	
	//공지사항 상세 페이지
	public NoticeVO read(int bno);
	
	//공지사항 수정
	public void update(NoticeVO noticeVO);
	
	//공지사항 삭제
	public void delete(int bno);
}
