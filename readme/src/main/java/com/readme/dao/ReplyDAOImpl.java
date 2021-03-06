package com.readme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.readme.dto.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	private SqlSession sql;

	private static String namespace = "com.readme.mapper.reply";
	
	// ???? ??ȸ
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return sql.selectList(namespace + ".replyList", bno);
	}

	// ???? ?ۼ?
	@Override
	public void write(ReplyVO vo) throws Exception {
		sql.insert(namespace + ".replyWrite", vo);
	}

	// ???? ????
	@Override
	public void modify(ReplyVO vo) throws Exception {
		sql.update(namespace + ".replyModify", vo);
	}

	// ???? ????
	@Override
	public void delete(int rno) throws Exception {
		sql.delete(namespace + ".replyDelete", rno);
	}

	@Override
	public ReplyVO readReplySelect(int rno) throws Exception {
		return sql.selectOne(namespace + ".readReplySelect", rno);
	}
}
