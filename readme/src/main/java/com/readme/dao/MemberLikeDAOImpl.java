package com.readme.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberLikeDAOImpl implements MemberLikeDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.readme.mapper.memberLikeMapper";
	

	@Override
	public int memberLikeCheck(HashMap<String, Object> hm) {
		int likeResult = sqlSession.selectOne(Namespace+".memberLikeCheck2", hm);
					
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
