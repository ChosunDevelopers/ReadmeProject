package com.readme.service;

import java.util.List;

import com.readme.dto.BoardLikeVO;
import com.readme.dto.MemberDetailVO;
import com.readme.dto.MemberLikeVO;
import com.readme.dto.MemberProfileVO;

public interface MemberDetailService{

	public int updateMemberDetail(MemberDetailVO memberDetailVO);

	public List<MemberLikeVO> pickTeammate(String id) throws Exception;

	public List<BoardLikeVO> pickBoard(String id);

	public List<MemberProfileVO> pickBoardAll();
	
	
}
