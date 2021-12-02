package com.readme.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.readme.dto.MemberDetailVO;

@Repository
public class MemberDetailDAOImpl implements MemberDetailDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.readme.mapper.memberDetailMapper";

	@Override
	public int insertMemberDetail(MemberDetailVO memberDetailVO) {
		
		return sqlSession.update(Namespace+".insertMemberDetail", memberDetailVO);
	}
	
	
}
