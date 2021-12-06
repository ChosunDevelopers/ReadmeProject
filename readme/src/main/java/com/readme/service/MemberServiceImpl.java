package com.readme.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.MemberDAO;
import com.readme.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

    @Inject
    private MemberDAO dao;
    
    @Override
    public List<MemberVO> selectMember() throws Exception {
 
        return dao.selectMember();
    }
    

	@Override
	public int insertMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return dao.insertMember(memberVO);
	}


	@Override
	public MemberVO loginMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return dao.loginMember(memberVO);
	}

	@Override
	public int memberUpdate(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(memberVO);
	}



}
