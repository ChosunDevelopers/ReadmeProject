package com.readme.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.MemberDetailDAO;
import com.readme.dto.MemberDetailVO;

@Service
public class MemberDetailServiceImpl implements MemberDetailService {

	 @Inject
	 private MemberDetailDAO dao;
	
	
	
	@Override
	public int insertMemberDetail(MemberDetailVO memberDetailVO) {
		// TODO Auto-generated method stub
		return dao.insertMemberDetail(memberDetailVO);
	}
	
	
}
