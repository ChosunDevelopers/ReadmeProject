package com.readme.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.MemberDetailDAO;
import com.readme.dto.MemberDetailVO;
import com.readme.dto.MemberVO;

@Service
public class MemberDetailServiceImpl implements MemberDetailService {

	 @Inject
	 private MemberDetailDAO dao;
	
	
	
	@Override
	public int updateMemberDetail(MemberDetailVO memberDetailVO) {
		// TODO Auto-generated method stub
		return dao.updateMemberDetail(memberDetailVO);
	}
	

	
}
