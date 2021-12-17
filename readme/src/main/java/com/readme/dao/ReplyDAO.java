package com.readme.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.readme.dto.ReplyVO;

@Repository
public interface ReplyDAO {
	// ��� ��ȸ
	public List<ReplyVO> list(int bno) throws Exception;

	// ��� ��ȸ
	public void write(ReplyVO vo) throws Exception;
	//Ư�� ��� ��ȸ
	public ReplyVO readReplySelect(int rno) throws Exception;

	// ��� ����
	public void modify(ReplyVO vo) throws Exception;

	// ��� ����
	public void delete(int rno) throws Exception;
}
