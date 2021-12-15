package com.readme.dao;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.readme.dto.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.readme.mapper.noticeMapper";

	@Override
	public int write(NoticeVO noticeVO) {
		int result = 0;
		result = sqlSession.insert(Namespace + ".insertNotice", noticeVO);
		return result;
	}

	@Override
	public List<NoticeVO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".list");
	}

	@Override
	public NoticeVO read(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".read", bno);
	}

	@Override
	public void update(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace + ".update", noticeVO);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		sqlSession.delete(Namespace + ".delete", bno);
	}
}