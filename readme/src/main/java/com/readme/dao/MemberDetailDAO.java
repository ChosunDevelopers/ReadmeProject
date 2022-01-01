package com.readme.dao;

import java.util.List;

import com.readme.dto.BoardLikeVO;
import com.readme.dto.MemberDetailVO;
import com.readme.dto.MemberLikeVO;
import com.readme.dto.MemberProfileVO;

public interface MemberDetailDAO {

	
	public int updateMemberDetail(MemberDetailVO memberDetailVO);

	public List<MemberLikeVO> pickTeammate(String id);

	public List<BoardLikeVO> pickBoard(String id);

	public List<MemberProfileVO> pickBoardAll();
	
	
}
