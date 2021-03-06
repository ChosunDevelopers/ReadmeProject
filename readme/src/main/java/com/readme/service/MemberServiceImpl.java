package com.readme.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.MemberDAO;
import com.readme.dto.MemberProfileVO;
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


	@Override
	public MemberProfileVO myProfile(MemberProfileVO memberProfileVO) {
		// TODO Auto-generated method stub
		return dao.myProfile(memberProfileVO);
	}


	@Override
	public List<MemberVO> listMember() throws Exception {
		// TODO Auto-generated method stub
		return dao.listMember();
	}

	@Override
	public List<MemberVO> specificMember(String id) {
		// TODO Auto-generated method stub
		return dao.specificMember(id);
	}


	@Override
	public List<MemberProfileVO> allMemberProfile() {
		// TODO Auto-generated method stub
		return dao.allMemberProfile();
	}

	@Override
	public int idcheck(String email) {
		// TODO Auto-generated method stub
		return dao.idcheck(email);
	}
}
