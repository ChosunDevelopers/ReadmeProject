package com.readme.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.readme.dto.MemberDetailVO;
import com.readme.dto.MemberVO;

@Repository
public class MemberDetailDAOImpl implements MemberDetailDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.readme.mapper.memberDetailMapper";

	@Override
	public int updateMemberDetail(MemberDetailVO memberDetailVO) {
		
		return sqlSession.update(Namespace+".updateMemberDetail", memberDetailVO);
	}
	

}
