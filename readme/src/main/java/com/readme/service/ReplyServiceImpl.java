package com.readme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.ReplyDAO;
import com.readme.dto.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO dao;

	// ´ñ±Û Á¶È¸
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return dao.list(bno);
	}

	@Override
	public void write(ReplyVO vo) throws Exception {
		dao.write(vo);
	}

	@Override
	public void modify(ReplyVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	public void delete(ReplyVO vo) throws Exception {
		dao.delete(vo);
	}

	@Override
	public ReplyVO readReplySelect(int rno) throws Exception {
		return dao.readReplySelect(rno);
	}
}
