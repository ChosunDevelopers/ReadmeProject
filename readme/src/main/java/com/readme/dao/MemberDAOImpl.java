package com.readme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.readme.dto.MemberProfileVO;
import com.readme.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.readme.mapper.memberMapper";

	@Override
	public List<MemberVO> selectMember() throws Exception {

		return sqlSession.selectList(Namespace + ".selectMember");
	}

	@Override
	public int insertMember(MemberVO memberVO) {

		// TODO Auto-generated method stub

//		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);

		int result = 0;

		try {
			result = sqlSession.insert(Namespace + ".insertMember", memberVO);
//			
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}

		return result;
	}

	@Override
	public MemberVO loginMember(MemberVO memberVO) {
		MemberVO result = null;

		try {
			result = sqlSession.selectOne(Namespace + ".loginMember", memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int memberUpdate(MemberVO memberVO) {

		return sqlSession.update(Namespace + ".memberUpdate", memberVO);

	}

	@Override
	public MemberProfileVO myProfile(MemberProfileVO memberProfileVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".myProfile", memberProfileVO);
	}

	@Override
	public List<MemberVO> listMember() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".listMember");
	}
	
	
	@Override
	public List<MemberVO> specificMember(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".specificMember", id);
	}

	@Override
	public List<MemberProfileVO> allMemberProfile() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".allMemberProfile");
	}

	@Override
	public int idcheck(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".idcheck", email );
	}
		
	

}
