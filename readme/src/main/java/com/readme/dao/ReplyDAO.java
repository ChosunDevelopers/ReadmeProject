package com.readme.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.readme.dto.ReplyVO;

@Repository
public interface ReplyDAO {
	// ´ñ±Û Á¶È¸
	public List<ReplyVO> list(int bno) throws Exception;

	// ´ñ±Û Á¶È¸
	public void write(ReplyVO vo) throws Exception;
	//Æ¯Á¤ ´ñ±Û Á¶È¸
	public ReplyVO readReplySelect(int rno) throws Exception;

	// ´ñ±Û ¼öÁ¤
	public void modify(ReplyVO vo) throws Exception;

	// ´ñ±Û »èÁ¦
	public void delete(int rno) throws Exception;
}
