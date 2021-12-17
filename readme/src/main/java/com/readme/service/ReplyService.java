package com.readme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.readme.dto.ReplyVO;

@Service
public interface ReplyService {

	// ��� ��ȸ
	public List<ReplyVO> list(int bno) throws Exception;

	// ��� ��ȸ
	public void write(ReplyVO vo) throws Exception;
	
	// Ư�� ��� ��ȸ
	public ReplyVO readReplySelect(int rno) throws Exception;

	// ��� ����
	public void modify(ReplyVO vo) throws Exception;

	// ��� ����
	public void delete(int rno) throws Exception;
}
