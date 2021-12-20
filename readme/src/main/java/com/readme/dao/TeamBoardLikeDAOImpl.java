package com.readme.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TeamBoardLikeDAOImpl implements TeamBoardLikeDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.readme.mapper.teamBoardLikeMapper";

	@Override
	public int boardLikeCheck(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		int likeResult = sqlSession.selectOne(Namespace+".teamBoardLikeCheck", hm);
		
		if(likeResult != 0) {
			return 1;
		}
		return 0;
	}

	@Override
	public int nowDislike(HashMap<String, Object> hm) {
		int rs = sqlSession.delete(Namespace+".nowDislike", hm);
		
		return rs;
	}

	@Override
	public int nowLike(HashMap<String, Object> hm) {
		int rs = sqlSession.insert(Namespace+".nowLike", hm);
		
		return rs;	
	}

}
