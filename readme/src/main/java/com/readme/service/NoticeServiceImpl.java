package com.readme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.NoticeDAO;
import com.readme.dto.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;
	
	// 게시글 작성
	@Override
	public int write(NoticeVO noticeVO) {
		return dao.write(noticeVO);
	}

	@Override
	public List<NoticeVO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public NoticeVO read(int bno) {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public void update(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		dao.update(noticeVO);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

}