package com.readme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.readme.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.readme.mapper.memberMapper";
    
    @Override
    public List<MemberVO> selectMember() throws Exception {
 
        return sqlSession.selectList(Namespace+".selectMember");
    }



}
