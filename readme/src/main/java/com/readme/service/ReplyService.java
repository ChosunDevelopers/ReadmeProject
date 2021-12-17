package com.readme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.readme.dto.ReplyVO;

@Service
public interface ReplyService {

	// ´ñ±Û Á¶È¸
	public List<ReplyVO> list(int bno) throws Exception;

	// ´ñ±Û Á¶È¸
	public void write(ReplyVO vo) throws Exception;
	
	// Æ¯Á¤ ´ñ±Û Á¶È¸
	public ReplyVO readReplySelect(int rno) throws Exception;

	// ´ñ±Û ¼öÁ¤
	public void modify(ReplyVO vo) throws Exception;

	// ´ñ±Û »èÁ¦
	public void delete(int rno) throws Exception;
}
