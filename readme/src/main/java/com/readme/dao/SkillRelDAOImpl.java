package com.readme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.readme.dto.SkillRelVO;

@Repository
public class SkillRelDAOImpl implements SkillRelDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.readme.mapper.skillRelMapper";
	
	@Override
	public List<SkillRelVO> listSkillRel() throws Exception {
		
		return sqlSession.selectList(Namespace+".listSkillRel");
	}

	@Override
	public List<SkillRelVO> getSkillList(String skill) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".getSkillList", skill);
	}

	@Override
	public List<SkillRelVO> getSkillListForName(String name) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".getSkillListForName", name);
	}

	@Override
	public String getUserSkillList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".getUserSkillList", id);
	}

}
