package com.readme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.MemberDetailDAO;
import com.readme.dto.BoardLikeVO;
import com.readme.dto.MemberDetailVO;
import com.readme.dto.MemberLikeVO;
import com.readme.dto.MemberProfileVO;

@Service
public class MemberDetailServiceImpl implements MemberDetailService {

	 @Inject
	 private MemberDetailDAO dao;
	
	
	
	@Override
	public int updateMemberDetail(MemberDetailVO memberDetailVO) {
		// TODO Auto-generated method stub
		return dao.updateMemberDetail(memberDetailVO);
	}



	@Override
	public List<MemberLikeVO> pickTeammate(String id) {
		// TODO Auto-generated method stub
		return dao.pickTeammate(id);
	}



	@Override
	public List<BoardLikeVO> pickBoard(String id) {
		// TODO Auto-generated method stub
		return dao.pickBoard(id);
	}



	@Override
	public List<MemberProfileVO> pickBoardAll() {
		// TODO Auto-generated method stub
		return dao.pickBoardAll();
	}




	
}
