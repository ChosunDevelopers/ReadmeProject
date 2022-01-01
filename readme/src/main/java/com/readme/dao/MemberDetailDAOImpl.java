package com.readme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.readme.dto.BoardLikeVO;
import com.readme.dto.MemberDetailVO;
import com.readme.dto.MemberLikeVO;
import com.readme.dto.MemberProfileVO;

@Repository
public class MemberDetailDAOImpl implements MemberDetailDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.readme.mapper.memberDetailMapper";

	@Override
	public int updateMemberDetail(MemberDetailVO memberDetailVO) {
		
		return sqlSession.update(Namespace+".updateMemberDetail", memberDetailVO);
	}

	@Override
	public List<MemberLikeVO> pickTeammate(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".pickTeammate", id);
	}

	@Override
	public List<BoardLikeVO> pickBoard(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".pickBoard", id);
	}

	@Override
	public List<MemberProfileVO> pickBoardAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".pickBoardAll");
	}
	

}
